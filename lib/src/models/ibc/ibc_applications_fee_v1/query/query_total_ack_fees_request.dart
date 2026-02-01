import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/query/query_total_ack_fees_response.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet_id.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryTotalAckFeesRequest defines the request type for the TotalAckFees rpc
class QueryTotalAckFeesRequest extends CosmosMessage
    with QueryMessage<QueryTotalAckFeesResponse> {
  /// the packet identifier for the associated fees
  final IbcChannelPacketId packetId;
  const QueryTotalAckFeesRequest({required this.packetId});
  factory QueryTotalAckFeesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryTotalAckFeesRequest(
      packetId: IbcChannelPacketId.deserialize(decode.getField(1)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"packet_id": packetId.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryTotalAckFeesRequest;

  @override
  List get values => [packetId];

  @override
  QueryTotalAckFeesResponse onResponse(List<int> bytes) {
    return QueryTotalAckFeesResponse.deserialize(bytes);
  }

  @override
  QueryTotalAckFeesResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryTotalAckFeesResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [
    packetId.channelId,
    packetId.portId,
    packetId.sequence.toString(),
  ];
}
