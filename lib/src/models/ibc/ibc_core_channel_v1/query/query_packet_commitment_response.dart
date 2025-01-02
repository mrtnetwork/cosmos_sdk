import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryPacketCommitmentResponse defines the client query response for a packet which also includes
/// a proof and the height from which the proof was retrieved
class QueryPacketCommitmentResponse extends CosmosMessage {
  /// packet associated with the request fields
  final List<int>? commitment;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;

  factory QueryPacketCommitmentResponse.fromRpc(Map<String, dynamic> json) {
    return QueryPacketCommitmentResponse(
        commitment: CosmosUtils.tryToBytes(json["commitment"]),
        proof: CosmosUtils.tryToBytes(json["proof"]),
        proofHeight: IbcClientHeight.fromRpc(json["proof_height"]));
  }
  QueryPacketCommitmentResponse(
      {List<int>? commitment, List<int>? proof, required this.proofHeight})
      : commitment = BytesUtils.tryToBytes(commitment, unmodifiable: true),
        proof = BytesUtils.tryToBytes(proof, unmodifiable: true);

  factory QueryPacketCommitmentResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryPacketCommitmentResponse(
      commitment: decode.getField(1),
      proof: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "commitment": BytesUtils.tryToHexString(commitment),
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryPacketCommitmentResponse;

  @override
  List get values => [commitment, proof, proofHeight];
}
