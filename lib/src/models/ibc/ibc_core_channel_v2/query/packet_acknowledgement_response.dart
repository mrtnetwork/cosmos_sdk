import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryPacketAcknowledgementResponse is the response type for the Query/PacketAcknowledgement RPC method.
class IbcChannelV2QueryPacketAcknowledgementResponse extends CosmosMessage {
  /// packet associated with the request fields
  final List<int>? acknowledgement;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  factory IbcChannelV2QueryPacketAcknowledgementResponse.fromJson(
      Map<String, dynamic> json) {
    return IbcChannelV2QueryPacketAcknowledgementResponse(
      acknowledgement: json.asBytes("acknowledgement"),
      proof: json.asBytes("proof"),
      proofHeight: IbcClientHeight.fromJson(json.asMap("proof_height")),
    );
  }
  IbcChannelV2QueryPacketAcknowledgementResponse(
      {List<int>? acknowledgement, List<int>? proof, required this.proofHeight})
      : proof = proof?.asImmutableBytes,
        acknowledgement = acknowledgement?.asImmutableBytes;
  factory IbcChannelV2QueryPacketAcknowledgementResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2QueryPacketAcknowledgementResponse(
        acknowledgement: decode.getField(1),
        proof: decode.getField(2),
        proofHeight: IbcClientHeight.deserialize(decode.getField(3)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "acknowledgement": CosmosUtils.tryToBase64(acknowledgement),
      "proof": CosmosUtils.tryToBase64(proof),
      "proof_height": proofHeight.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryPacketAcknowledgementResponse;

  @override
  List get values => [acknowledgement, proof, proofHeight];
}
