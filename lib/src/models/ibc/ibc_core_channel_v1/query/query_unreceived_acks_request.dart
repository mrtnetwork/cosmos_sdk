import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_unreceived_acks_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// QueryUnreceivedAcks is the request type for the Query/UnreceivedAcks RPC method
class QueryUnreceivedAcksRequest extends CosmosMessage
    with QueryMessage<QueryUnreceivedAcksResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  // list of acknowledgement sequences
  final List<BigInt>? packetAckSequences;
  QueryUnreceivedAcksRequest(
      {this.portId, this.channelId, List<BigInt>? packetAckSequences})
      : packetAckSequences = packetAckSequences?.nullOnEmpy;
  factory QueryUnreceivedAcksRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUnreceivedAcksRequest(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        packetAckSequences: decode
                .getResult<ProtocolBufferDecoderResult?>(3)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get queryPath => IbcTypes.unreceivedAcks.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "packet_ack_sequences":
          packetAckSequences?.map((e) => e.toString()).toList()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryUnreceivedAcksRequest.typeUrl;

  @override
  List get values => [portId, channelId, packetAckSequences];
  @override
  QueryUnreceivedAcksResponse onResponse(List<int> bytes) {
    return QueryUnreceivedAcksResponse.deserialize(bytes);
  }
}
