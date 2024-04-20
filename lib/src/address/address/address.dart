import 'package:cosmos_sdk/src/address/address/addr_utils.dart';
import 'package:cosmos_sdk/src/address/address/address_const.dart';

/// This class represents a base address in the Cosmos network.
class CosmosBaseAddress {
  /// The raw address string.
  final String address;

  /// Private constructor.
  const CosmosBaseAddress._(this.address);

  /// Factory constructor to create a CosmosBaseAddress from byte data.
  factory CosmosBaseAddress.fromBytes(List<int> addrBytes,
      {String hrp = CosmosAddrConst.accHRP}) {
    /// Create a CosmosBaseAddress instance by converting byte data to an address string.
    return CosmosBaseAddress._(CosmosAddrUtils.toAddr(addrBytes, hrp: hrp));
  }

  /// Factory constructor to create a CosmosBaseAddress from a string.
  factory CosmosBaseAddress(String addr, {String? forceHrp}) {
    /// Decode the address string and ensure it's valid.
    CosmosAddrUtils.decodeBytes(addr, hrp: forceHrp);

    /// Create a CosmosBaseAddress instance with the provided address string.
    return CosmosBaseAddress._(addr);
  }

  /// Module is a specialized version of a composed address for modules. Each module account
  /// is constructed from a module name and a sequence of derivation keys (at least one
  /// derivation key must be provided). The derivation keys must be unique
  /// in the module scope, and is usually constructed from some object id. Example, let's
  /// a x/dao module, and a new DAO object.
  factory CosmosBaseAddress.module(String moduleName,
      {List<List<int>> derivationKeys = const [],
      String hrp = CosmosAddrConst.accHRP}) {
    return CosmosBaseAddress.fromBytes(
        CosmosAddrUtils.module(moduleName, derivationKeys: derivationKeys),
        hrp: hrp);
  }

  List<int> toBytes() {
    return CosmosAddrUtils.decodeBytes(address);
  }

  String get prefix => CosmosAddrUtils.prefix(address);

  @override
  String toString() {
    return address;
  }
}
