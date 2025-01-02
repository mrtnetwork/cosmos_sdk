import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/query/query_client_states_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryClientStatesRequest is the request type for the Query/ClientStates RPC method
class QueryClientStatesRequest extends CosmosMessage
    with QueryMessage<QueryClientStatesResponse> {
  /// pagination request
  final PageRequest? pagination;
  const QueryClientStatesRequest({this.pagination});
  factory QueryClientStatesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryClientStatesRequest(
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
  TypeUrl get typeUrl => IbcTypes.queryClientStatesRequest;

  @override
  List get values => [pagination];

  @override
  QueryClientStatesResponse onResponse(List<int> bytes) {
    return QueryClientStatesResponse.deserialize(bytes);
  }

  @override
  QueryClientStatesResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryClientStatesResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
