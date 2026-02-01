import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_packet_commitment_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryPacketCommitmentRequest is the request type for the Query/PacketCommitment RPC method
class QueryPacketCommitmentRequest extends CosmosMessage
    with QueryMessage<QueryPacketCommitmentResponse> {
  /// port unique identifier
  final String portId;

  /// channel unique identifier
  final String channelId;

  /// packet sequence
  final BigInt sequence;
  const QueryPacketCommitmentRequest({
    required this.portId,
    required this.channelId,
    required this.sequence,
  });
  factory QueryPacketCommitmentRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryPacketCommitmentRequest(
      portId: decode.getField(1),
      channelId: decode.getField(2),
      sequence: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "sequence": sequence.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryPacketCommitmentRequest;

  @override
  List get values => [portId, channelId, sequence];

  @override
  QueryPacketCommitmentResponse onResponse(List<int> bytes) {
    return QueryPacketCommitmentResponse.deserialize(bytes);
  }

  @override
  QueryPacketCommitmentResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryPacketCommitmentResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [channelId, portId, sequence.toString()];
}
