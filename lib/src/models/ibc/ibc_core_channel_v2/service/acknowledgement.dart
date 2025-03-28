import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v2/messages/acknowledgement.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v2/messages/packet.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/ibc_core_client_v1.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';
import 'acknowledgement_response.dart';

/// MsgAcknowledgement receives incoming IBC acknowledgement.
class IbcChannelV2MsgAcknowledgement
    extends IbcService<IbcChannelV2MsgAcknowledgementResponse> {
  final IbcChannelV2Packet? packet;
  final IbcChannelV2Acknowledgement? acknowledgement;
  final List<int>? proofAcked;
  final IbcClientHeight? proofHeight;
  final String? signer;
  IbcChannelV2MsgAcknowledgement(
      {required this.packet,
      required this.acknowledgement,
      List<int>? proofAcked,
      required this.proofHeight,
      this.signer})
      : proofAcked = proofAcked?.asImmutableBytes;
  factory IbcChannelV2MsgAcknowledgement.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2MsgAcknowledgement(
        packet: decode
            .getResult(1)
            ?.to<IbcChannelV2Packet, List<int>>(IbcChannelV2Packet.deserialize),
        acknowledgement: decode
            .getResult(2)
            ?.to<IbcChannelV2Acknowledgement, List<int>>(
                IbcChannelV2Acknowledgement.deserialize),
        proofAcked: decode.getField(3),
        proofHeight: decode
            .getResult(4)
            ?.to<IbcClientHeight, List<int>>(IbcClientHeight.deserialize),
        signer: decode.getField(5));
  }
  factory IbcChannelV2MsgAcknowledgement.fromJson(Map<String, dynamic> json) {
    return IbcChannelV2MsgAcknowledgement(
        packet: json.maybeAs<IbcChannelV2Packet, Map<String, dynamic>>(
            key: "packet", onValue: IbcChannelV2Packet.fromJson),
        proofAcked: json.asBytes("proof_acked"),
        acknowledgement:
            json.maybeAs<IbcChannelV2Acknowledgement, Map<String, dynamic>>(
                key: "acknowledgement",
                onValue: IbcChannelV2Acknowledgement.fromJson),
        proofHeight: json.maybeAs<IbcClientHeight, Map<String, dynamic>>(
            key: "proof_height", onValue: IbcClientHeight.fromJson),
        signer: json.as("signer"));
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "packet": packet?.toJson(),
      "acknowledgement": acknowledgement?.toJson(),
      "proof_acked": CosmosUtils.tryToBase64(proofAcked),
      "proof_height": proofHeight?.toJson(),
      "signer": signer
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2MsgAcknowledgement;

  @override
  List get values => [packet, acknowledgement, proofAcked, proofHeight, signer];
  @override
  List<String?> get signers => [signer];

  @override
  IbcChannelV2MsgAcknowledgementResponse onResponse(List<int> bytes) {
    return IbcChannelV2MsgAcknowledgementResponse.deserialize(bytes);
  }
}
