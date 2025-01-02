import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/query/query_counterparty_payee_response.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryCounterpartyPayeeRequest defines the request type for the CounterpartyPayee rpc
class QueryCounterpartyPayeeRequest extends CosmosMessage
    with QueryMessage<QueryCounterpartyPayeeResponse> {
  /// unique channel identifier
  final String channelId;

  /// the relayer address to which the counterparty is registered
  final String relayer;
  const QueryCounterpartyPayeeRequest(
      {required this.channelId, required this.relayer});
  factory QueryCounterpartyPayeeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryCounterpartyPayeeRequest(
        channelId: decode.getField(1), relayer: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"channel_id": channelId, "relayer": relayer};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryCounterpartyPayeeRequest;

  @override
  List get values => [channelId, relayer];

  @override
  QueryCounterpartyPayeeResponse onResponse(List<int> bytes) {
    return QueryCounterpartyPayeeResponse.deserialize(bytes);
  }

  @override
  QueryCounterpartyPayeeResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryCounterpartyPayeeResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [channelId, relayer];
}
