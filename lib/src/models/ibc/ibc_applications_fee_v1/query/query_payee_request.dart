import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/query/query_payee_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryPayeeRequest defines the request type for the Payee rpc
class QueryPayeeRequest extends CosmosMessage
    with QueryMessage<QueryPayeeResponse> {
  /// unique channel identifier
  final String channelId;

  /// the relayer address to which the distribution address is registered
  final String relayer;
  const QueryPayeeRequest({required this.channelId, required this.relayer});
  factory QueryPayeeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryPayeeRequest(
      channelId: decode.getField(1),
      relayer: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"channel_id": channelId, "relayer": relayer};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryPayeeRequest;

  @override
  List get values => [channelId, relayer];
  @override
  QueryPayeeResponse onResponse(List<int> bytes) {
    return QueryPayeeResponse.deserialize(bytes);
  }

  @override
  QueryPayeeResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryPayeeResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [channelId, relayer];
}
