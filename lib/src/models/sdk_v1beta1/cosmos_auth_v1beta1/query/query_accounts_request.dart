import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/query/query_accounts_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAccountsRequest is the request type for the Query/Accounts RPC method.
/// Since: cosmos-sdk 0.43
class QueryAccountsRequest extends CosmosMessage
    with QueryMessage<QueryAccountsResponse> {
  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const QueryAccountsRequest({this.pagination});
  factory QueryAccountsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAccountsRequest(
        pagination: decode
            .getResult(1)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  List get values => [pagination];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.accountsRequest;

  @override
  QueryAccountsResponse onResponse(List<int> bytes) {
    return QueryAccountsResponse.deserialize(bytes);
  }

  @override
  QueryAccountsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryAccountsResponse.fromJson(json);
  }

  @override
  Map<String, String> get queryParameters => {};
}

/// QueryAccountsRequest is the request type for the Query/Accounts RPC method.
/// Since: cosmos-sdk 0.43
class QueryTryAccountsRequest extends CosmosMessage
    with QueryMessage<QueryAccountsResponse> {
  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const QueryTryAccountsRequest({this.pagination});
  factory QueryTryAccountsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryTryAccountsRequest(
        pagination: decode
            .getResult(1)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  List get values => [pagination];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.accountsRequest;

  @override
  QueryAccountsResponse onResponse(List<int> bytes) {
    return QueryAccountsResponse.deserialize(bytes, skipOnFail: true);
  }

  @override
  QueryAccountsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryAccountsResponse.fromJson(json, skipOnFail: true);
  }

  @override
  Map<String, String> get queryParameters => {};
}
