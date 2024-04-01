import 'package:cosmos_sdk/src/models/ibc/ibc_applications_transfer_v1/query/query_denom_trace_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomTraceRequest is the request type for the Query/DenomTrace RPC method
class QueryDenomTraceRequest extends CosmosMessage
    with QueryMessage<QueryDenomTraceResponse> {
  /// hash (in hex format) or denom (full denom with ibc prefix) of the denomination trace information.
  final String? hash;

  const QueryDenomTraceRequest({this.hash});
  factory QueryDenomTraceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDenomTraceRequest(hash: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => IbcTypes.queryDenomTrace.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"hash": hash};
  }

  @override
  String get typeUrl => IbcTypes.queryDenomTraceRequest.typeUrl;

  @override
  List get values => [hash];
  @override
  QueryDenomTraceResponse onResponse(List<int> bytes) {
    return QueryDenomTraceResponse.deserialize(bytes);
  }
}
