import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/query/query_consensus_states_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConsensusStatesRequest is the request type for the Query/ConsensusStates RPC method.
class QueryConsensusStatesRequest extends CosmosMessage
    with QueryMessage<QueryConsensusStatesResponse> {
  /// client identifier
  final String clientId;

  /// pagination request
  final PageRequest? pagination;
  const QueryConsensusStatesRequest({required this.clientId, this.pagination});
  factory QueryConsensusStatesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryConsensusStatesRequest(
      clientId: decode.getField(1),
      pagination: decode
          .getResult(2)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientId, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryConsensusStatesRequest;

  @override
  List get values => [clientId, pagination];

  @override
  QueryConsensusStatesResponse onResponse(List<int> bytes) {
    return QueryConsensusStatesResponse.deserialize(bytes);
  }

  @override
  QueryConsensusStatesResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryConsensusStatesResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [clientId];

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
