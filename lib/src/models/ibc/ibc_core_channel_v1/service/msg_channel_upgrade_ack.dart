import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/upgrade.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'msg_channel_upgrade_ack_response.dart';

/// MsgChannelUpgradeAck defines the request type for the ChannelUpgradeAck rpc
class MsgChannelUpgradeAck extends CosmosMessage
    with ServiceMessage<MsgChannelUpgradeAckResponse> {
  final String? portId;
  final String? channelId;
  final IbcChannelUpgrade counterpartyUpgrade;
  final List<int>? proofChannel;
  final List<int>? proofUpgrade;
  final IbcClientHeight proofHeight;
  final String? signer;
  MsgChannelUpgradeAck(
      {this.portId,
      this.channelId,
      required this.counterpartyUpgrade,
      List<int>? proofChannel,
      List<int>? proofUpgrade,
      required this.proofHeight,
      this.signer})
      : proofChannel = BytesUtils.tryToBytes(proofChannel, unmodifiable: true),
        proofUpgrade = BytesUtils.tryToBytes(proofUpgrade, unmodifiable: true);
  factory MsgChannelUpgradeAck.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelUpgradeAck(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        counterpartyUpgrade: IbcChannelUpgrade.deserialize(decode.getField(3)),
        proofChannel: decode.getField(4),
        proofUpgrade: decode.getField(5),
        proofHeight: IbcClientHeight.deserialize(decode.getField(6)),
        signer: decode.getField(7));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  TypeUrl get service => IbcTypes.channelUpgradeAck;

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "counterparty_upgrade": counterpartyUpgrade.toJson(),
      "proof_channel": BytesUtils.tryToHexString(proofChannel),
      "proof_upgrade": BytesUtils.tryToHexString(proofUpgrade),
      "proof_height": proofHeight.toJson(),
      "signer": signer
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgChannelUpgradeAck;

  @override
  List get values => [
        portId,
        channelId,
        counterpartyUpgrade,
        proofChannel,
        proofUpgrade,
        proofHeight,
        signer
      ];

  @override
  List<String?> get signers => [signer];

  @override
  MsgChannelUpgradeAckResponse onResponse(List<int> bytes) {
    return MsgChannelUpgradeAckResponse.deserialize(bytes);
  }
}
