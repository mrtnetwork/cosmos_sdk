import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v2/messages/packet.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/ibc_core_client_v1.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';
import 'recv_packet_response.dart';

/// MsgRecvPacket receives an incoming IBC packet.
class IbcChannelV2MsgRecvPacket
    extends IbcService<IbcChannelV2MsgRecvPacketResponse> {
  final IbcChannelV2Packet? packet;
  final List<int>? proofCommitment;
  final IbcClientHeight? proofHeight;
  final String? signer;
  IbcChannelV2MsgRecvPacket({
    required this.packet,
    List<int>? proofCommitment,
    required this.proofHeight,
    this.signer,
  }) : proofCommitment = proofCommitment?.asImmutableBytes;
  factory IbcChannelV2MsgRecvPacket.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2MsgRecvPacket(
      packet: decode
          .getResult(1)
          ?.to<IbcChannelV2Packet, List<int>>(IbcChannelV2Packet.deserialize),
      proofCommitment: decode.getField(2),
      proofHeight: decode
          .getResult(3)
          ?.to<IbcClientHeight, List<int>>(IbcClientHeight.deserialize),
      signer: decode.getField(4),
    );
  }
  factory IbcChannelV2MsgRecvPacket.fromJson(Map<String, dynamic> json) {
    return IbcChannelV2MsgRecvPacket(
      packet: json.maybeAs<IbcChannelV2Packet, Map<String, dynamic>>(
        key: "packet",
        onValue: IbcChannelV2Packet.fromJson,
      ),
      proofCommitment: json.asBytes("proof_commitment"),
      proofHeight: json.maybeAs<IbcClientHeight, Map<String, dynamic>>(
        key: "proof_height",
        onValue: IbcClientHeight.fromJson,
      ),
      signer: json.as("signer"),
    );
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "packet": packet?.toJson(),
      "proof_commitment": CosmosUtils.tryToBase64(proofCommitment),
      "proof_height": proofHeight?.toJson(),
      "signer": signer,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2MsgRecvPacket;

  @override
  List get values => [packet, proofCommitment, proofHeight, signer];
  @override
  List<String?> get signers => [signer];

  @override
  IbcChannelV2MsgRecvPacketResponse onResponse(List<int> bytes) {
    return IbcChannelV2MsgRecvPacketResponse.deserialize(bytes);
  }
}
