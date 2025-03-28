import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QuerySequenceResponse is the response type for the Query/QueryNextSequenceReceiveResponse RPC method
class QueryNextSequenceReceiveResponse extends CosmosMessage {
  /// next sequence receive number
  final BigInt? nextSequenceReceive;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  QueryNextSequenceReceiveResponse(
      {this.nextSequenceReceive, List<int>? proof, required this.proofHeight})
      : proof = BytesUtils.tryToBytes(proof, unmodifiable: true);
  factory QueryNextSequenceReceiveResponse.fromJson(Map<String, dynamic> json) {
    return QueryNextSequenceReceiveResponse(
      nextSequenceReceive: BigintUtils.tryParse(json["next_sequence_receive"]),
      proof: CosmosUtils.tryToBytes(json["proof"]),
      proofHeight: IbcClientHeight.fromJson(json["proof_height"]),
    );
  }

  factory QueryNextSequenceReceiveResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNextSequenceReceiveResponse(
      nextSequenceReceive: decode.getField(1),
      proof: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "next_sequence_receive": nextSequenceReceive?.toString(),
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryNextSequenceReceiveResponse;

  @override
  List get values => [nextSequenceReceive, proof, proofHeight];
}
