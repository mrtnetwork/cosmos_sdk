import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/messages/module_version.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryModuleVersionsResponse is the response type for the Query/ModuleVersions RPC method.
///
/// Since: cosmos-sdk 0.43
class QueryModuleVersionsResponse extends CosmosMessage {
  /// module_versions is a list of module names with their consensus versions.
  final List<ModuleVersion> moduleVersions;
  QueryModuleVersionsResponse({required List<ModuleVersion> moduleVersions})
      : moduleVersions = moduleVersions.immutable;
  factory QueryModuleVersionsResponse.fromJson(Map<String, dynamic> json) {
    return QueryModuleVersionsResponse(
        moduleVersions: (json["module_versions"] as List?)
                ?.map((e) => ModuleVersion.fromJson(e))
                .toList() ??
            []);
  }
  factory QueryModuleVersionsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryModuleVersionsResponse(
        moduleVersions: decode
            .getFields<List<int>>(1)
            .map((e) => ModuleVersion.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"module_versions": moduleVersions.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => UpgradeV1beta1Types.queryModuleVersionsResponse;

  @override
  List get values => [moduleVersions];
}
