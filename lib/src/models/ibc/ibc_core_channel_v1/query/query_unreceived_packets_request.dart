import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/query/query_unreceived_packets_response.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// QueryUnreceivedPacketsRequest is the request type for the Query/UnreceivedPackets RPC method
class QueryUnreceivedPacketsRequest extends CosmosMessage
    with QueryMessage<QueryUnreceivedPacketsResponse> {
  /// port unique identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  /// packet sequence
  final List<BigInt>? packetCommitmentSequences;
  QueryUnreceivedPacketsRequest(
      {this.portId, this.channelId, List<BigInt>? packetCommitmentSequences})
      : packetCommitmentSequences = packetCommitmentSequences?.nullOnEmpy;
  factory QueryUnreceivedPacketsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUnreceivedPacketsRequest(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        packetCommitmentSequences: decode
                .getResult<ProtocolBufferDecoderResult?>(3)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get queryPath => IbcTypes.unreceivedPackets.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "packet_commitment_sequences":
          packetCommitmentSequences?.map((e) => e.toString()).toList()
    };
  }

  @override
  String get typeUrl => IbcTypes.queryUnreceivedPacketsRequest.typeUrl;

  @override
  List get values => [portId, channelId, packetCommitmentSequences];
  @override
  QueryUnreceivedPacketsResponse onResponse(List<int> bytes) {
    return QueryUnreceivedPacketsResponse.deserialize(bytes);
  }
}
