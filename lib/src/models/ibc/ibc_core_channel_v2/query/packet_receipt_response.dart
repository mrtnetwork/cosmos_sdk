import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// QueryPacketReceiptResponse is the response type for the Query/PacketReceipt RPC method.
class IbcChannelV2QueryPacketReceiptResponse extends CosmosMessage {
  /// success flag for if receipt exists
  final bool? received;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  factory IbcChannelV2QueryPacketReceiptResponse.fromJson(
      Map<String, dynamic> json) {
    return IbcChannelV2QueryPacketReceiptResponse(
      received: json.as("received"),
      proof: json.asBytes("proof"),
      proofHeight: IbcClientHeight.fromJson(json.asMap("proof_height")),
    );
  }
  IbcChannelV2QueryPacketReceiptResponse(
      {this.received, List<int>? proof, required this.proofHeight})
      : proof = proof?.asImmutableBytes;
  factory IbcChannelV2QueryPacketReceiptResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2QueryPacketReceiptResponse(
        received: decode.getField(1),
        proof: decode.getField(2),
        proofHeight: IbcClientHeight.deserialize(decode.getField(3)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "received": received,
      "proof": CosmosUtils.tryToBase64(proof),
      "proof_height": proofHeight.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryPacketReceiptResponse;

  @override
  List get values => [received, proof, proofHeight];
}
