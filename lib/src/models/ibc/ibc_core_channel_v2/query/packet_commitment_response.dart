import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryPacketCommitmentResponse is the response type for the Query/PacketCommitment RPC method.
class IbcChannelV2QueryPacketCommitmentResponse extends CosmosMessage {
  /// packet associated with the request fields
  final List<int>? commitment;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  factory IbcChannelV2QueryPacketCommitmentResponse.fromJson(
      Map<String, dynamic> json) {
    return IbcChannelV2QueryPacketCommitmentResponse(
      commitment: json.asBytes("commitment"),
      proof: json.asBytes("proof"),
      proofHeight: IbcClientHeight.fromJson(json.asMap("proof_height")),
    );
  }
  IbcChannelV2QueryPacketCommitmentResponse(
      {List<int>? commitment, List<int>? proof, required this.proofHeight})
      : proof = proof?.asImmutableBytes,
        commitment = commitment?.asImmutableBytes;
  factory IbcChannelV2QueryPacketCommitmentResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2QueryPacketCommitmentResponse(
        commitment: decode.getField(1),
        proof: decode.getField(2),
        proofHeight: IbcClientHeight.deserialize(decode.getField(3)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "commitment": CosmosUtils.tryToBase64(commitment),
      "proof": CosmosUtils.tryToBase64(proof),
      "proof_height": proofHeight.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryPacketCommitmentResponse;

  @override
  List get values => [commitment, proof, proofHeight];
}
