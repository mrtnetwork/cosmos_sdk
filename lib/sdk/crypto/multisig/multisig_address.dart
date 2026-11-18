import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/sdk/address/address/address.dart';
import 'package:cosmos_sdk/sdk/crypto/keypair/public_key.dart';
import 'package:cosmos_sdk/sdk/crypto/types/types.dart';
import 'package:cosmos_sdk/sdk/provider/chain_registery/models/models/cosmos_sdk.dart';

/// Address derivation for [CosmosMultisigSupport.legacyAminoThreshold].
///
/// A multisig address is `sha256(aminoBinary)[0:20]` bech32-encoded with the
/// chain's hrp, where `aminoBinary` is the legacy-amino encoding of
/// `tendermint/PubKeyMultisigThreshold` (SDK `crypto/keys/multisig`):
///
/// ```text
/// 22C1F7E2              prefix for tendermint/PubKeyMultisigThreshold
/// 08 <varint>           field 1: threshold as uint32 varint
/// 12 <len> <member>...  field 2, repeated: amino-encoded member pubkeys
/// ```
///
/// A member encodes as its amino prefix plus the length-prefixed raw key.
/// The SDK key types (`secp256k1.PubKey`, `ed25519.PubKey`) override
/// `MarshalAmino` to return the raw key bytes, so there is no `0A` field
/// tag: `EB5AE987 <len> <33-byte compressed secp256k1>` or
/// `1624DE64 <len> <32-byte ed25519>`. Member order is significant and kept
/// as given (reordering yields a different address).
///
/// Only amino-registered member types are encodable. The SDK legacy codec
/// (`crypto/codec`.RegisterCrypto) knows secp256k1/ed25519 (plus bls/sr
/// variants this package does not issue); eth-variant and secp256r1 pubkeys
/// have no amino registration and throw [BuError]
/// instead of producing a wrong address.
class CosmosMultisigAddress {
  const CosmosMultisigAddress._();

  static const List<int> _multisigPrefix = [0x22, 0xC1, 0xF7, 0xE2];
  static const List<int> _secp256k1Prefix = [0xEB, 0x5A, 0xE9, 0x87];
  static const List<int> _ed25519Prefix = [0x16, 0x24, 0xDE, 0x64];

  static void _writeUvarint(List<int> out, int value) {
    var v = value;
    while (v >= 0x80) {
      out.add((v & 0x7F) | 0x80);
      v >>= 7;
    }
    out.add(v);
  }

  static void _writeBytesField(List<int> out, int fieldNumber, List<int> data) {
    _writeUvarint(out, (fieldNumber << 3) | 2);
    _writeUvarint(out, data.length);
    out.addAll(data);
  }

  static void _writeUvarintField(List<int> out, int fieldNumber, int value) {
    _writeUvarint(out, (fieldNumber << 3) | 0);
    _writeUvarint(out, value);
  }

  static List<int> _encodeMember(CosmosPublicKey pubKey) {
    final List<int> prefix;
    final List<int> raw = pubKey.toBytes().toList();
    switch (pubKey.algorithm) {
      case CosmosKeysAlgs.secp256k1:
        if (raw.length != 33 || (raw[0] != 0x02 && raw[0] != 0x03)) {
          throw BuError(
            DefaultErrorType.invalidLength,
            'Multisig member must be a 33-byte compressed secp256k1 key.',
          );
        }
        prefix = _secp256k1Prefix;
      case CosmosKeysAlgs.ed25519:
        if (raw.length != 32) {
          throw BuError(
            DefaultErrorType.invalidLength,
            'Multisig member must be a 32-byte ed25519 key.',
          );
        }
        prefix = _ed25519Prefix;
      case CosmosKeysAlgs.secp256r1:
      case CosmosKeysAlgs.ethsecp256k1:
      case CosmosKeysAlgs.injectiveEthsecp256k1:
      case CosmosKeysAlgs.comosEthsecp256k1:
      case CosmosKeysAlgs.stratosEthsecp256k1:
      case CosmosKeysAlgs.intiaEthsecp256k1:
        throw BuError(
          DefaultErrorType.unsupported,
          'LegacyAmino multisig cannot encode ${pubKey.algorithm.name} '
          'members: the key type has no amino registration in the SDK legacy '
          'codec, so no canonical address exists.',
        );
    }
    final out = <int>[...prefix];
    // The member's bare amino encoding is the raw key itself: the key types
    // implement MarshalAmino() => raw bytes, and go-amino encodes that repr
    // as a length-prefixed byte slice. There is no 0x0A struct field tag.
    _writeUvarint(out, raw.length);
    out.addAll(raw);
    return out;
  }

  /// Amino binary of `tendermint/PubKeyMultisigThreshold`.
  /// This is the exact preimage of the address hash.
  static BuBytes aminoBytes({
    required int threshold,
    required List<CosmosPublicKey> pubKeys,
  }) {
    if (threshold <= 0) {
      throw BuError(
        DefaultErrorType.invalidArgument,
        'Multisig threshold must be positive, got $threshold.',
      );
    }
    if (pubKeys.length < threshold) {
      throw BuError(
        DefaultErrorType.invalidArgument,
        'Multisig needs at least $threshold keys, got ${pubKeys.length}.',
      );
    }
    final out = <int>[..._multisigPrefix];
    _writeUvarintField(out, 1, threshold);
    for (final pk in pubKeys) {
      _writeBytesField(out, 2, _encodeMember(pk));
    }
    return out.asImmutableBytes;
  }

  /// `sha256(aminoBytes)[0:20]` as a bech32 address.
  static CosmosBaseAddress address({
    required int threshold,
    required List<CosmosPublicKey> pubKeys,
    required String hrp,
  }) {
    final digest = QuickCrypto.sha256Hash(
      aminoBytes(threshold: threshold, pubKeys: pubKeys),
    );
    if (digest.length < 20) {
      throw BuError(
        DefaultErrorType.invalidLength,
        "Invalid multisig digest: expected at least 20 bytes, received ${digest.length}.",
      );
    }
    return CosmosBaseAddress.fromBytes(digest.sublist(0, 20), hrp: hrp);
  }

  /// Gated derivation from a registry snapshot entry.
  ///
  /// [CosmosMultisigSupport.none] and [CosmosMultisigSupport.unknown]
  /// refuse instead of guessing: resolve the chain's entry (builder +
  /// `multisig_supports.dart`) before deriving an address.
  ///
  /// Members are deliberately NOT filtered against
  /// `chain.supportedAlgs`. That list governs single-signer wallet accounts
  /// (which HD coin type / address prefix to derive), not multisig
  /// membership: every standard SDK chain registers secp256k1 and ed25519
  /// in its codec, so a mixed multisig (e.g. secp256k1 + ed25519 on a
  /// secp256k1-only chain, or the reverse on stride) derives and verifies
  /// fine. Filtering here would reject valid multisigs.
  static CosmosBaseAddress addressForChain({
    required CosmosSdkChain chain,
    required int threshold,
    required List<CosmosPublicKey> pubKeys,
  }) {
    if (!chain.multisigSupports.contains(
      CosmosMultisigSupport.legacyAminoThreshold,
    )) {
      throw BuError(
        DefaultErrorType.unsupported,
        'Chain ${chain.chainId} does not declare '
        'LegacyAmino multisig support (${chain.multisigSupports.map((e) => e.name).join(",")}).',
      );
    }
    return address(
      threshold: threshold,
      pubKeys: pubKeys,
      hrp: chain.bech32Prefix,
    );
  }
}
