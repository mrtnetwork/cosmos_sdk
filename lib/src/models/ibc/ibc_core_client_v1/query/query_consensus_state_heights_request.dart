import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/query/query_consensus_state_heights_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConsensusStateHeightsRequest is the request type for Query/ConsensusStateHeights RPC method.
class QueryConsensusStateHeightsRequest extends CosmosMessage
    with QueryMessage<QueryConsensusStateHeightsResponse> {
  /// client identifier
  final String clientId;

  /// pagination request
  final PageRequest? pagination;
  const QueryConsensusStateHeightsRequest(
      {required this.clientId, this.pagination});
  factory QueryConsensusStateHeightsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryConsensusStateHeightsRequest(
        clientId: decode.getField(1),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"client_id": clientId, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryConsensusStateHeightsRequest;

  @override
  List get values => [clientId, pagination];

  @override
  QueryConsensusStateHeightsResponse onResponse(List<int> bytes) {
    return QueryConsensusStateHeightsResponse.deserialize(bytes);
  }

  @override
  QueryConsensusStateHeightsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryConsensusStateHeightsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [clientId];
}
