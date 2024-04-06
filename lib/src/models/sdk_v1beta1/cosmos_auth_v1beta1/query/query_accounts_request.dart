import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/query/query_accounts_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';

/// QueryAccountsRequest is the request type for the Query/Accounts RPC method.
/// Since: cosmos-sdk 0.43
class QueryAccountsRequest extends CosmosMessage
    with
        QueryMessage<QueryAccountsResponse>,
        RPCMessage<QueryAccountsResponse> {
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
  String get queryPath => AuthV1beta1Types.accounts.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  List get values => [pagination];

  @override
  String get typeUrl => AuthV1beta1Types.accountsRequest.typeUrl;

  @override
  QueryAccountsResponse onResponse(List<int> bytes) {
    throw QueryAccountsResponse.deserialize(bytes);
  }

  @override
  QueryAccountsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryAccountsResponse.fromRpc(json);
  }

  @override
  String get rpcPath => AuthV1beta1Types.accounts.rpcUrl();
  @override
  Map<String, String> get queryParameters => {};
}
