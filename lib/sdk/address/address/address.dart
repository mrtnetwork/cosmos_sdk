import 'package:blockchain_utils/bip/address/atom_addr.dart';
import 'package:blockchain_utils/cbor/cbor.dart';
import 'package:blockchain_utils/networks/types/address.dart';
import 'package:blockchain_utils/networks/types/network.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/sdk/address/address/address_const.dart';
import 'package:cosmos_sdk/sdk/crypto/crypto.dart';

/// This class represents a base address in the Cosmos network.
class CosmosBaseAddress with Equality, CborTagSerializable implements IAddress {
  /// The raw address string.
  @override
  final String address;

  final String hrp;

  /// Private constructor.
  const CosmosBaseAddress._(this.address, this.hrp);
  factory CosmosBaseAddress.deserializeIAddress({
    List<int>? bytes,
    CborObject? object,
  }) {
    final values = CborTagSerializable.decodeTaggedValue(
      identifier: BlockchainNetwork.cosmosAndRelated.identifier,
      cborBytes: bytes,
      cborObject: object,
    );
    return CosmosBaseAddress.fromBytes(
      values.rawValueAt(0),
      hrp: values.rawValueAt(1),
    );
  }

  /// Factory constructor to create a CosmosBaseAddress from byte data.
  factory CosmosBaseAddress.fromBytes(
    List<int> addrBytes, {
    String hrp = CosmosAddrConst.accHRP,
  }) {
    /// Create a CosmosBaseAddress instance by converting byte data to an address string.
    return CosmosBaseAddress._(
      AtomAddressUtils.encodeAddressBytes(addressBytes: addrBytes, hrp: hrp),
      hrp,
    );
  }

  /// Factory constructor to create a CosmosBaseAddress from public key and algorithm.
  factory CosmosBaseAddress.fromPublicKey({
    required List<int> pubkeyBytes,
    required CosmosKeysAlgs algorithm,
    String hrp = CosmosAddrConst.accHRP,
  }) {
    final addressBytes = switch (algorithm) {
      CosmosKeysAlgs.ed25519 => AtomAddressUtils.ed25519PubkeyToAddress(
        pubkeyBytes,
      ),
      CosmosKeysAlgs.secp256k1 => AtomAddressUtils.secp256k1PubKeyToAddress(
        pubkeyBytes,
      ),
      CosmosKeysAlgs.secp256r1 => AtomAddressUtils.secp256r1PubKeyToAddress(
        pubkeyBytes,
      ),
      CosmosKeysAlgs.stratosEthsecp256k1 ||
      CosmosKeysAlgs.intiaEthsecp256k1 ||
      CosmosKeysAlgs.ethsecp256k1 ||
      CosmosKeysAlgs.injectiveEthsecp256k1 ||
      CosmosKeysAlgs.comosEthsecp256k1 =>
        AtomAddressUtils.ethSecp256k1PubKeyToAddress(pubkeyBytes),
    };

    /// Create a CosmosBaseAddress instance by converting byte data to an address string.
    return CosmosBaseAddress._(
      AtomAddressUtils.encodeAddressBytes(addressBytes: addressBytes, hrp: hrp),
      hrp,
    );
  }

  /// Factory constructor to create a CosmosBaseAddress from a string.
  factory CosmosBaseAddress(String addr, {String? forceHrp}) {
    /// Decode the address string and ensure it's valid.
    final decode = AtomAddressUtils.decode(addr, hrp: forceHrp);

    /// Create a CosmosBaseAddress instance with the provided address string.
    return CosmosBaseAddress._(addr, decode.hrp);
  }

  /// Module is a specialized version of a composed address for modules. Each module account
  /// is constructed from a module name and a sequence of derivation keys (at least one
  /// derivation key must be provided). The derivation keys must be unique
  /// in the module scope, and is usually constructed from some object id. Example, let's
  /// a x/dao module, and a new DAO object.
  factory CosmosBaseAddress.module(
    String moduleName, {
    List<List<int>> derivationKeys = const [],
    String hrp = CosmosAddrConst.accHRP,
  }) {
    return CosmosBaseAddress.fromBytes(
      AtomAddressUtils.module(moduleName, derivationKeys: derivationKeys),
      hrp: hrp,
    );
  }

  List<int> toBytes() {
    final encode = AtomAddressUtils.decode(address);
    return encode.bytes;
  }

  @override
  String toString() {
    return address;
  }

  @override
  BlockchainNetwork get blockchainNetwork => BlockchainNetwork.cosmosAndRelated;

  @override
  List<int> encodeAsIAddress() {
    return toCbor().encode();
  }

  @override
  SerializationIdentifier get serializationIdentifier =>
      blockchainNetwork.identifier;

  @override
  List<CborObject?> get serializationItems => [
    CborBytesValue(toBytes()),
    hrp.toCbor(),
  ];

  @override
  List<dynamic> get variables => [address, hrp];

  @override
  String? get viewType => null;
}
