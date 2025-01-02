import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/messages/mode_info.dart';
import 'package:cosmos_sdk/src/crypto/keypair/public_key.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// SignerInfo describes the public key and signing mode of a single top-level signer.
class SignerInfo extends CosmosMessage {
  /// public_key is the public key of the signer. It is optional for accounts
  /// that already exist in state. If unset, the verifier can use the required
  /// signer address for this position and lookup the public key.
  final CosmosPublicKey publicKey;

  /// mode_info describes the signing mode of the signer and is a nested
  /// structure to support nested multisig pubkey's
  final ModeInfo modeInfo;

  /// sequence is the sequence of the account, which describes the
  /// number of committed transactions signed by a given address. It is used to
  /// prevent replay attacks.
  final BigInt sequence;
  SignerInfo(
      {required this.publicKey,
      required this.modeInfo,
      required this.sequence});
  factory SignerInfo.fromRpc(Map<String, dynamic> json) {
    return SignerInfo(
        publicKey: CosmosPublicKey.fromRpc(json["public_key"]),
        modeInfo: ModeInfo.fromRpc(json["mode_info"]),
        sequence: BigintUtils.parse(json["sequence"]));
  }

  factory SignerInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return SignerInfo(
        publicKey: CosmosPublicKey.fromAnyBytes(decode.getField(1)),
        modeInfo: ModeInfo.deserialize(decode.getField(2)),
        sequence: decode.getField<BigInt?>(3) ?? BigInt.zero);
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "public_key": publicKey.toJson(),
      "mode_info": modeInfo.toJson(),
      "sequence": sequence.toString()
    };
  }

  @override
  List get values =>
      [publicKey.toAny(), modeInfo, sequence == BigInt.zero ? null : sequence];
  @override
  TypeUrl get typeUrl => TxV1beta1Types.signerInfo;

  SignerInfo copyWith({
    CosmosPublicKey? publicKey,
    ModeInfo? modeInfo,
    BigInt? sequence,
  }) {
    return SignerInfo(
      publicKey: publicKey ?? this.publicKey,
      modeInfo: modeInfo ?? this.modeInfo,
      sequence: sequence ?? this.sequence,
    );
  }
}
