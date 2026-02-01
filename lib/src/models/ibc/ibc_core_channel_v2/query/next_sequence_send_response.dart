import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryNextSequenceSendResponse is the response type for the Query/QueryNextSequenceSend RPC method
class IbcChannelV2QueryNextSequenceSendResponse extends CosmosMessage {
  /// next sequence send number
  final BigInt nextSequenceSend;

  /// merkle proof of existence
  final List<int>? proof;

  /// height at which the proof was retrieved
  final IbcClientHeight proofHeight;
  factory IbcChannelV2QueryNextSequenceSendResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return IbcChannelV2QueryNextSequenceSendResponse(
      nextSequenceSend: json.asBigInt("next_sequence_send"),
      proof: json.asBytes("proof"),
      proofHeight: IbcClientHeight.fromJson(json.asMap("proof_height")),
    );
  }
  IbcChannelV2QueryNextSequenceSendResponse({
    required this.nextSequenceSend,
    List<int>? proof,
    required this.proofHeight,
  }) : proof = BytesUtils.tryToBytes(proof, unmodifiable: true);
  factory IbcChannelV2QueryNextSequenceSendResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2QueryNextSequenceSendResponse(
      nextSequenceSend: decode.getField(1),
      proof: decode.getField(2),
      proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "next_sequence_send": nextSequenceSend.toString(),
      "proof": BytesUtils.tryToHexString(proof),
      "proof_height": proofHeight.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2QueryNextSequenceSendResponse;

  @override
  List get values => [nextSequenceSend, proof, proofHeight];
}
