import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v1/query/query_denom_traces_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryConnectionsRequest is the request type for the Query/DenomTraces RPC method
class QueryDenomTracesRequest extends CosmosMessage
    with QueryMessage<QueryDenomTracesResponse> {
  /// pagination defines an optional pagination for the request
  final PageRequest? pagination;
  const QueryDenomTracesRequest({this.pagination});
  factory QueryDenomTracesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDenomTracesRequest(
        pagination: decode
            .getResult(1)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => IbcTypes.denomTraces.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  String get typeUrl => IbcTypes.queryDenomTracesRequest.typeUrl;

  @override
  List get values => [pagination];

  @override
  QueryDenomTracesResponse onResponse(List<int> bytes) {
    return QueryDenomTracesResponse.deserialize(bytes);
  }
}
