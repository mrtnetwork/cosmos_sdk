import 'package:cosmos_sdk/src/address/address/addr_utils.dart';
import 'package:cosmos_sdk/src/address/address/address_const.dart';

/// This class represents a base address in the Cosmos network.
class BaseAddress {
  /// The raw address string.
  final String address;

  /// Private constructor.
  const BaseAddress._(this.address);

  /// Factory constructor to create a BaseAddress from byte data.
  factory BaseAddress.fromBytes(List<int> addrBytes,
      {String hrp = CosmosAddrConst.accHRP}) {
    /// Create a BaseAddress instance by converting byte data to an address string.
    return BaseAddress._(CosmosAddrUtils.toAddr(addrBytes, hrp: hrp));
  }

  /// Factory constructor to create a BaseAddress from a string.
  factory BaseAddress(String addr, {String? forceHrp}) {
    /// Decode the address string and ensure it's valid.
    CosmosAddrUtils.decodeBytes(addr, hrp: forceHrp);

    /// Create a BaseAddress instance with the provided address string.
    return BaseAddress._(addr);
  }

  /// Module is a specialized version of a composed address for modules. Each module account
  /// is constructed from a module name and a sequence of derivation keys (at least one
  /// derivation key must be provided). The derivation keys must be unique
  /// in the module scope, and is usually constructed from some object id. Example, let's
  /// a x/dao module, and a new DAO object.
  factory BaseAddress.module(String moduleName,
      {List<List<int>> derivationKeys = const [],
      String hrp = CosmosAddrConst.accHRP}) {
    return BaseAddress.fromBytes(
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
