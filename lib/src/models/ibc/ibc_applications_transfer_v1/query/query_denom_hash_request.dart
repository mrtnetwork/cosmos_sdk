import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v1/query/query_denom_hash_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomHashRequest is the request type for the Query/DenomHash RPC method
class QueryDenomHashRequest extends CosmosMessage
    with QueryMessage<QueryDenomHashResponse> {
  final String trace;
  const QueryDenomHashRequest({required this.trace});
  factory QueryDenomHashRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDenomHashRequest(trace: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"trace": trace};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryDenomHashRequest;

  @override
  List get values => [trace];

  @override
  QueryDenomHashResponse onResponse(List<int> bytes) {
    return QueryDenomHashResponse.deserialize(bytes);
  }

  @override
  QueryDenomHashResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryDenomHashResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [trace];
}
