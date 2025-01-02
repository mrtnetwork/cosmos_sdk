import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/state.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/upgrade.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'msg_channel_upgrade_confirm_response.dart';

/// MsgChannelUpgradeConfirm defines the request type for the ChannelUpgradeConfirm rpc
class MsgChannelUpgradeConfirm extends CosmosMessage
    with ServiceMessage<MsgChannelUpgradeConfirmResponse> {
  final String? portId;
  final String? channelId;
  final IbcChannelState? counterpartyChannelState;
  final IbcChannelUpgrade counterpartyUpgrade;
  final List<int>? proofChannel;
  final List<int>? proofUpgrade;
  final IbcClientHeight proofHeight;
  final String? signer;
  MsgChannelUpgradeConfirm(
      {this.portId,
      this.channelId,
      this.counterpartyChannelState,
      required this.counterpartyUpgrade,
      List<int>? proofChannel,
      List<int>? proofUpgrade,
      required this.proofHeight,
      this.signer})
      : proofChannel = BytesUtils.tryToBytes(proofChannel, unmodifiable: true),
        proofUpgrade = BytesUtils.tryToBytes(proofUpgrade, unmodifiable: true);
  factory MsgChannelUpgradeConfirm.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelUpgradeConfirm(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        counterpartyChannelState: decode
            .getResult(3)
            ?.to<IbcChannelState, int>((e) => IbcChannelState.fromValue(e)),
        counterpartyUpgrade: IbcChannelUpgrade.deserialize(decode.getField(4)),
        proofChannel: decode.getField(5),
        proofUpgrade: decode.getField(6),
        proofHeight: IbcClientHeight.deserialize(decode.getField(7)),
        signer: decode.getField(8));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  TypeUrl get service => IbcTypes.channelUpgradeConfirm;

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "counterparty_channel_state": counterpartyChannelState?.value,
      "counterparty_upgrade": counterpartyUpgrade.toJson(),
      "proof_channel": BytesUtils.tryToBytes(proofChannel),
      "proof_upgrade": BytesUtils.tryToBytes(proofUpgrade),
      "proof_height": proofHeight.toJson(),
      "signer": signer
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgChannelUpgradeConfirm;

  @override
  List get values => [
        portId,
        channelId,
        counterpartyChannelState?.value,
        counterpartyUpgrade,
        proofChannel,
        proofUpgrade,
        proofHeight,
        signer
      ];

  @override
  List<String?> get signers => [signer];
  @override
  MsgChannelUpgradeConfirmResponse onResponse(List<int> bytes) {
    return MsgChannelUpgradeConfirmResponse.deserialize(bytes);
  }
}
