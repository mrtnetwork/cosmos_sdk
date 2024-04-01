import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'msg_acknowledgement_response.dart';

/// MsgAcknowledgement receives incoming IBC acknowledgement
class MsgAcknowledgement extends CosmosMessage
    with ServiceMessage<MsgAcknowledgementResponse> {
  final IbcChannelPacket packet;
  final List<int>? acknowledgement;
  final List<int>? proofAcked;
  final IbcClientHeight proofHeight;
  final String? signer;
  MsgAcknowledgement(
      {required this.packet,
      List<int>? acknowledgement,
      List<int>? proofAcked,
      required this.proofHeight,
      this.signer})
      : acknowledgement =
            BytesUtils.tryToBytes(acknowledgement, unmodifiable: true),
        proofAcked = BytesUtils.tryToBytes(proofAcked, unmodifiable: true);
  factory MsgAcknowledgement.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgAcknowledgement(
        packet: IbcChannelPacket.deserialize(decode.getField(1)),
        acknowledgement: decode.getField(2),
        proofAcked: decode.getField(3),
        proofHeight: IbcClientHeight.deserialize(decode.getField(4)),
        signer: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  String get service => IbcTypes.acknowledgement.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "packet": packet.toJson(),
      "acknowledgement": BytesUtils.tryToHexString(acknowledgement),
      "proof_acked": BytesUtils.tryToHexString(proofAcked),
      "proof_height": proofHeight.toJson(),
      "signer": signer
    };
  }

  @override
  String get typeUrl => IbcTypes.msgAcknowledgement.typeUrl;

  @override
  List get values => [packet, acknowledgement, proofAcked, proofHeight, signer];

  @override
  List<String?> get signers => [signer];

  @override
  MsgAcknowledgementResponse onResponse(List<int> bytes) {
    return MsgAcknowledgementResponse.deserialize(bytes);
  }
}
