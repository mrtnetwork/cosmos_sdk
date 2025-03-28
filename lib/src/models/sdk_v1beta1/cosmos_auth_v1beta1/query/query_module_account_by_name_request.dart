import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_module_account_by_name_response.dart';

/// ModuleAccountByName returns the module account info by module name
class QueryModuleAccountByNameRequest extends CosmosMessage
    with QueryMessage<QueryModuleAccountByNameResponse> {
  final String name;
  QueryModuleAccountByNameRequest(this.name);
  factory QueryModuleAccountByNameRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryModuleAccountByNameRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"name": name};
  }

  @override
  List get values => [name];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.moduleAccountByNameRequest;

  @override
  QueryModuleAccountByNameResponse onResponse(List<int> bytes) {
    return QueryModuleAccountByNameResponse.deserialize(bytes);
  }

  @override
  QueryModuleAccountByNameResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryModuleAccountByNameResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [name];
}
