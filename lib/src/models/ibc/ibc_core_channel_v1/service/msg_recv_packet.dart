import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'msg_recv_packet_response.dart';

/// MsgRecvPacket receives incoming IBC packet
class MsgRecvPacket extends CosmosMessage
    with ServiceMessage<MsgRecvPacketResponse> {
  final IbcChannelPacket packet;
  final List<int>? proofCommitment;
  final IbcClientHeight proofHeight;
  final String? signer;
  MsgRecvPacket(
      {required this.packet,
      List<int>? proofCommitment,
      required this.proofHeight,
      this.signer})
      : proofCommitment =
            BytesUtils.tryToBytes(proofCommitment, unmodifiable: true);
  factory MsgRecvPacket.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgRecvPacket(
        proofCommitment: decode.getField(2),
        packet: IbcChannelPacket.deserialize(decode.getField(1)),
        proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
        signer: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  TypeUrl get service => IbcTypes.recvPacket;

  @override
  Map<String, dynamic> toJson() {
    return {
      "packet": packet.toJson(),
      "proof_commitment": BytesUtils.tryToHexString(proofCommitment),
      "proof_height": proofHeight.toJson(),
      "signer": signer
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgRecvPacket;

  @override
  List get values => [packet, proofCommitment, proofHeight, signer];
  @override
  List<String?> get signers => [signer];
  @override
  MsgRecvPacketResponse onResponse(List<int> bytes) {
    return MsgRecvPacketResponse.deserialize(bytes);
  }
}
