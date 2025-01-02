import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/query/query_module_accounts_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';

/// QueryModuleAccountsRequest is the request type for the Query/ModuleAccounts RPC method.
/// Since: cosmos-sdk 0.46
class QueryModuleAccountsRequest extends CosmosMessage
    with QueryMessage<QueryModuleAccountsResponse> {
  /// This message has no fields.
  const QueryModuleAccountsRequest();
  factory QueryModuleAccountsRequest.deserialize(List<int> bytes) {
    return const QueryModuleAccountsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List get values => [];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.moduleAccountsRequest;

  @override
  QueryModuleAccountsResponse onResponse(List<int> bytes) {
    return QueryModuleAccountsResponse.deserialize(bytes);
  }

  @override
  QueryModuleAccountsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryModuleAccountsResponse.fromRpc(json);
  }
}
