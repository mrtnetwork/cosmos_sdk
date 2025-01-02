import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/utils/utils.dart';

/// ModuleCredential represents a unclaimable pubkey for base accounts controlled by modules.
/// Since: cosmos-sdk 0.47
class ModuleCredential extends CosmosMessage {
  /// module_name is the name of the module used for address derivation (passed into address.Module)
  final String moduleName;

  /// derivation_keys is for deriving a module account address (passed into address.Module)
  /// adding more keys creates sub-account addresses (passed into address.Derive)
  final List<List<int>> derivationKeys;

  ModuleCredential(
      {required this.moduleName, required List<List<int>> derivationKeys})
      : derivationKeys = List<List<int>>.unmodifiable(derivationKeys
            .map((e) => BytesUtils.toBytes(e, unmodifiable: true))
            .toList());
  factory ModuleCredential.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ModuleCredential(
        moduleName: decode.getField(1),
        derivationKeys: decode.getFields<List<int>>(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "module_name": moduleName,
      "derivation_keys":
          derivationKeys.map((e) => BytesUtils.toHexString(e)).toList(),
    };
  }

  @override
  List get values => [moduleName, derivationKeys];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.moduleCredential;
}
