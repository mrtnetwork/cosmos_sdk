import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgChannelOpenConfirm defines a msg sent by a Relayer to Chain
/// B to acknowledge the change of channel state to OPEN on Chain A.
class MsgChannelOpenConfirm extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final String? portId;
  final String? channelId;
  final List<int>? proofAck;
  final IbcClientHeight proofHeight;
  final String? signer;
  MsgChannelOpenConfirm(
      {this.portId,
      this.channelId,
      List<int>? proofAck,
      required this.proofHeight,
      this.signer})
      : proofAck = BytesUtils.tryToBytes(proofAck, unmodifiable: true);
  factory MsgChannelOpenConfirm.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelOpenConfirm(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        proofAck: decode.getField(3),
        proofHeight: IbcClientHeight.deserialize(decode.getField(4)),
        signer: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  String get service => IbcTypes.channelOpenConfirm.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "proof_ack": BytesUtils.tryToHexString(proofAck),
      "proof_height": proofHeight.toJson(),
      "signer": signer
    };
  }

  @override
  String get typeUrl => IbcTypes.msgChannelOpenConfirm.typeUrl;

  @override
  List get values => [portId, channelId, proofAck, proofHeight, signer];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.msgChannelOpenConfirmResponse.typeUrl);
  }
}
