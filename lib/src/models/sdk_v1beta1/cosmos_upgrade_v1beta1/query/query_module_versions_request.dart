import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/query/query_module_versions_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_upgrade_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryModuleVersionsRequest is the request type for the Query/ModuleVersions RPC method
/// Since: cosmos-sdk 0.43
class QueryModuleVersionsRequest extends CosmosMessage
    with QueryMessage<QueryModuleVersionsResponse> {
  /// module_name is a field to query a specific module
  /// consensus version from state. Leaving this empty will
  /// fetch the full list of module versions from state
  final String moduleName;
  const QueryModuleVersionsRequest({required this.moduleName});
  factory QueryModuleVersionsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryModuleVersionsRequest(moduleName: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"module_name": moduleName};
  }

  @override
  TypeUrl get typeUrl => UpgradeV1beta1Types.queryModuleVersionsRequest;

  @override
  List get values => [moduleName];

  @override
  QueryModuleVersionsResponse onResponse(List<int> bytes) {
    return QueryModuleVersionsResponse.deserialize(bytes);
  }

  @override
  QueryModuleVersionsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryModuleVersionsResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {"module_name": moduleName};
}
