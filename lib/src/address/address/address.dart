import 'package:blockchain_utils/bip/address/atom_addr.dart';
import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/address/address/address_const.dart';
import 'package:cosmos_sdk/src/crypto/crypto.dart';
import 'package:cosmos_sdk/src/exception/exception.dart';

/// This class represents a base address in the Cosmos network.
class CosmosBaseAddress {
  /// The raw address string.
  final String address;

  final String hrp;

  /// Private constructor.
  const CosmosBaseAddress._(this.address, this.hrp);

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
      CosmosKeysAlgs.ethsecp256k1 ||
      CosmosKeysAlgs.injectiveEthsecp256k1 ||
      CosmosKeysAlgs.comosEthsecp256k1 =>
        AtomAddressUtils.ethSecp256k1PubKeyToAddress(pubkeyBytes),
      _ =>
        throw DartCosmosSdkPluginException(
          "Unsuported key algorithm.",
          details: {"algorithm": algorithm.name},
        ),
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
  operator ==(other) {
    if (other is! CosmosBaseAddress) return false;
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            address == other.address &&
            hrp == other.hrp);
  }

  @override
  int get hashCode => HashCodeGenerator.generateHashCode([address, hrp]);

  @override
  String toString() {
    return address;
  }
}
