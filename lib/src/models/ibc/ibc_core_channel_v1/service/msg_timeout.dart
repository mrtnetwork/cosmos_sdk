import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'msg_timeout_response.dart';

/// MsgTimeout receives timed-out packet
class MsgTimeout extends CosmosMessage with ServiceMessage<MsgTimeoutResponse> {
  final IbcChannelPacket packet;
  final List<int>? proofUnreceived;
  final IbcClientHeight proofHeight;
  final BigInt? nextSequenceRecv;
  final String? signer;
  MsgTimeout(
      {required this.packet,
      List<int>? proofUnreceived,
      required this.proofHeight,
      this.nextSequenceRecv,
      this.signer})
      : proofUnreceived =
            BytesUtils.tryToBytes(proofUnreceived, unmodifiable: true);
  factory MsgTimeout.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgTimeout(
        packet: IbcChannelPacket.deserialize(decode.getField(1)),
        proofUnreceived: decode.getField(2),
        proofHeight: IbcClientHeight.deserialize(decode.getField(3)),
        nextSequenceRecv: decode.getField(4),
        signer: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  String get service => IbcTypes.serviceTimeout.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "packet": packet.toJson(),
      "proof_unreceived": BytesUtils.tryToHexString(proofUnreceived),
      "proof_height": proofHeight.toJson(),
      "next_sequence_recv": nextSequenceRecv?.toString(),
      "signer": signer
    };
  }

  @override
  String get typeUrl => IbcTypes.msgTimeout.typeUrl;

  @override
  List get values =>
      [packet, proofUnreceived, proofHeight, nextSequenceRecv, signer];
  @override
  List<String?> get signers => [signer];

  @override
  MsgTimeoutResponse onResponse(List<int> bytes) {
    return MsgTimeoutResponse.deserialize(bytes);
  }
}
