import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'msg_timeout_on_close_response.dart';

/// MsgTimeoutOnClose timed-out packet upon counterparty channel closure.
class MsgTimeoutOnClose extends CosmosMessage
    with ServiceMessage<MsgTimeoutOnCloseResponse> {
  final IbcChannelPacket packet;
  final List<int>? proofUnreceived;
  final List<int>? proofClose;
  final IbcClientHeight proofHeight;
  final BigInt? nextSequenceRecv;
  final String? signer;
  final BigInt? counterpartyUpgradeSequence;
  MsgTimeoutOnClose(
      {required this.packet,
      List<int>? proofUnreceived,
      List<int>? proofClose,
      required this.proofHeight,
      this.nextSequenceRecv,
      this.signer,
      this.counterpartyUpgradeSequence})
      : proofUnreceived = BytesUtils.tryToBytes(proofUnreceived),
        proofClose = BytesUtils.tryToBytes(proofClose, unmodifiable: true);
  factory MsgTimeoutOnClose.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgTimeoutOnClose(
        packet: IbcChannelPacket.deserialize(decode.getField(1)),
        proofUnreceived: decode.getField(2),
        proofClose: decode.getField(3),
        proofHeight: IbcClientHeight.deserialize(decode.getField(4)),
        nextSequenceRecv: decode.getField(5),
        signer: decode.getField(6),
        counterpartyUpgradeSequence: decode.getField(7));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  String get service => IbcTypes.timeoutOnClose.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "packet": packet.toJson(),
      "proof_unreceived": BytesUtils.tryToHexString(proofUnreceived),
      "proof_close": BytesUtils.tryToHexString(proofClose),
      "proof_height": proofHeight.toJson(),
      "next_sequence_recv": nextSequenceRecv?.toString(),
      "signer": signer,
      "counterparty_upgrade_sequence": counterpartyUpgradeSequence,
    };
  }

  @override
  String get typeUrl => IbcTypes.msgTimeoutOnClose.typeUrl;

  @override
  List get values => [
        packet,
        proofUnreceived,
        proofClose,
        proofHeight,
        nextSequenceRecv,
        signer,
        counterpartyUpgradeSequence
      ];

  @override
  List<String?> get signers => [signer];

  @override
  MsgTimeoutOnCloseResponse onResponse(List<int> bytes) {
    return MsgTimeoutOnCloseResponse.deserialize(bytes);
  }
}
