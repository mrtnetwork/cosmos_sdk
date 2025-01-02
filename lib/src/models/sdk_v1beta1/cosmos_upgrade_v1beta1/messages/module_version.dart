import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ModuleVersion specifies a module and its consensus version.
///
/// Since: cosmos-sdk 0.43
class ModuleVersion extends CosmosMessage {
  /// name of the app module
  final String? name;

  /// consensus version of the app module
  final BigInt? version;
  factory ModuleVersion.fromRpc(Map<String, dynamic> json) {
    return ModuleVersion(
        name: json["name"], version: BigintUtils.tryParse(json["version"]));
  }
  const ModuleVersion({this.name, this.version});
  factory ModuleVersion.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ModuleVersion(name: decode.getField(1), version: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"name": name, "version": version?.toString()};
  }

  @override
  TypeUrl get typeUrl => UpgradeV1beta1Types.moduleVersion;

  @override
  List get values => [name, version];
}
