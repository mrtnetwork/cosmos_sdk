import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_packet_receipt_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryPacketReceiptRequest is the request type for the Query/PacketReceipt RPC method
class QueryPacketReceiptRequest extends CosmosMessage
    with QueryMessage<QueryPacketReceiptResponse> {
  /// port unique identifier
  final String portId;

  /// channel unique identifier
  final String channelId;

  /// packet sequence
  final BigInt sequence;
  QueryPacketReceiptRequest(
      {required this.portId, required this.channelId, required this.sequence});
  factory QueryPacketReceiptRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryPacketReceiptRequest(
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
  TypeUrl get typeUrl => IbcTypes.queryPacketReceiptRequest;

  @override
  List get values => [portId, channelId, sequence];
  @override
  QueryPacketReceiptResponse onResponse(List<int> bytes) {
    return QueryPacketReceiptResponse.deserialize(bytes);
  }

  @override
  QueryPacketReceiptResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryPacketReceiptResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [channelId, portId, sequence.toString()];
}
