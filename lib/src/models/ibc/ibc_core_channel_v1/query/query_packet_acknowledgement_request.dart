import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_packet_acknowledgement_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryPacketAcknowledgementRequest is the request type for the Query/PacketAcknowledgement RPC method
class QueryPacketAcknowledgementRequest extends CosmosMessage
    with QueryMessage<QueryPacketAcknowledgementResponse> {
  /// port unique identifier
  final String portId;

  /// channel unique identifier
  final String channelId;

  /// packet sequence
  final BigInt sequence;
  const QueryPacketAcknowledgementRequest(
      {required this.portId, required this.channelId, required this.sequence});
  factory QueryPacketAcknowledgementRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryPacketAcknowledgementRequest(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        sequence: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "sequence": sequence.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryPacketAcknowledgementRequest;

  @override
  List get values => [portId, channelId, sequence];
  @override
  QueryPacketAcknowledgementResponse onResponse(List<int> bytes) {
    return QueryPacketAcknowledgementResponse.deserialize(bytes);
  }

  @override
  QueryPacketAcknowledgementResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryPacketAcknowledgementResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [channelId, portId, sequence.toString()];
}
