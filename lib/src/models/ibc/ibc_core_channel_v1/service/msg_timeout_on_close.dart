import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/packet.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_timeout_on_close_response.dart';

/// MsgTimeoutOnClose timed-out packet upon counterparty channel closure.
class MsgTimeoutOnClose extends IbcService<MsgTimeoutOnCloseResponse> {
  final IbcChannelPacket packet;
  final List<int>? proofUnreceived;
  final List<int>? proofClose;
  final IbcClientHeight proofHeight;
  final BigInt? nextSequenceRecv;
  final String? signer;
  final BigInt? counterpartyUpgradeSequence;
  MsgTimeoutOnClose({
    required this.packet,
    List<int>? proofUnreceived,
    List<int>? proofClose,
    required this.proofHeight,
    this.nextSequenceRecv,
    this.signer,
    this.counterpartyUpgradeSequence,
  }) : proofUnreceived = BytesUtils.tryToBytes(proofUnreceived),
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
      counterpartyUpgradeSequence: decode.getField(7),
    );
  }
  factory MsgTimeoutOnClose.fromJson(Map<String, dynamic> json) {
    return MsgTimeoutOnClose(
      packet: IbcChannelPacket.fromJson(json.asMap("packet")),
      proofUnreceived: json.asBytes("proof_unreceived"),
      proofClose: json.asBytes("proof_close"),
      proofHeight: IbcClientHeight.deserialize(json.asMap("proof_height")),
      nextSequenceRecv: json.asBigInt("next_sequence_recv"),
      signer: json.as("signer"),
      counterpartyUpgradeSequence: json.asBigInt(
        "counterparty_upgrade_sequence",
      ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "packet": packet.toJson(),
      "proof_unreceived": BytesUtils.tryToHexString(proofUnreceived),
      "proof_close": BytesUtils.tryToHexString(proofClose),
      "proof_height": proofHeight.toJson(),
      "next_sequence_recv": nextSequenceRecv?.toString(),
      "signer": signer,
      "counterparty_upgrade_sequence": counterpartyUpgradeSequence.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgTimeoutOnClose;

  @override
  List get values => [
    packet,
    proofUnreceived,
    proofClose,
    proofHeight,
    nextSequenceRecv,
    signer,
    counterpartyUpgradeSequence,
  ];

  @override
  List<String?> get signers => [signer];

  @override
  MsgTimeoutOnCloseResponse onResponse(List<int> bytes) {
    return MsgTimeoutOnCloseResponse.deserialize(bytes);
  }
}
