import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgPruneAcknowledgementsResponse defines the response type for the PruneAcknowledgements rpc.
class MsgPruneAcknowledgementsResponse extends CosmosMessage {
  /// Number of sequences pruned (includes both packet
  /// acknowledgements and packet receipts where appropriate).
  final BigInt? totalPrunedSequences;

  /// Number of sequences left after pruning.
  final BigInt? totalRemainingSequences;
  const MsgPruneAcknowledgementsResponse(
      {this.totalPrunedSequences, this.totalRemainingSequences});
  factory MsgPruneAcknowledgementsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgPruneAcknowledgementsResponse(
        totalPrunedSequences: decode.getField(1),
        totalRemainingSequences: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "total_pruned_sequences": totalPrunedSequences?.toString(),
      "total_remaining_sequences": totalRemainingSequences?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgPruneAcknowledgementsResponse;

  @override
  List get values => [totalPrunedSequences, totalRemainingSequences];
}
