import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/upgrade_fields.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

import 'msg_channel_upgrade_try_response.dart';

/// MsgChannelUpgradeTry defines the request type for the ChannelUpgradeTry rpc
class MsgChannelUpgradeTry extends CosmosMessage
    with ServiceMessage<MsgChannelUpgradeTryResponse> {
  final String? portId;
  final String? channelId;
  final List<String>? proposedUpgradeConnectionHops;
  final UpgradeFields counterpartyUpgradeFields;
  final BigInt? counterpartyUpgradeSequence;
  final List<int>? proofChannel;
  final List<int>? proofUpgrade;
  final IbcClientHeight proofHeight;
  final String? signer;
  MsgChannelUpgradeTry({
    this.portId,
    this.channelId,
    List<String>? proposedUpgradeConnectionHops,
    required this.counterpartyUpgradeFields,
    this.counterpartyUpgradeSequence,
    List<int>? proofChannel,
    List<int>? proofUpgrade,
    required this.proofHeight,
    this.signer,
  })  : proposedUpgradeConnectionHops =
            proposedUpgradeConnectionHops?.emptyAsNull?.immutable,
        proofChannel = BytesUtils.tryToBytes(proofChannel, unmodifiable: true),
        proofUpgrade = BytesUtils.tryToBytes(proofUpgrade, unmodifiable: true);
  factory MsgChannelUpgradeTry.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelUpgradeTry(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        proposedUpgradeConnectionHops: decode.getFields<String>(3),
        counterpartyUpgradeFields:
            UpgradeFields.deserialize(decode.getField(4)),
        counterpartyUpgradeSequence: decode.getField(5),
        proofChannel: decode.getField(6),
        proofUpgrade: decode.getField(7),
        proofHeight: IbcClientHeight.deserialize(decode.getField(8)),
        signer: decode.getField(9));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "proposed_upgrade_connection_hops": proposedUpgradeConnectionHops,
      "counterparty_upgrade_fields": counterpartyUpgradeFields.toJson(),
      "counterparty_upgrade_sequence": counterpartyUpgradeSequence?.toString(),
      "proof_channel": BytesUtils.tryToHexString(proofChannel),
      "proof_upgrade": BytesUtils.tryToHexString(proofUpgrade),
      "proof_height": proofHeight.toJson(),
      "signer": signer
    };
  }

  @override
  String get typeUrl => IbcTypes.msgChannelUpgradeTry.typeUrl;

  @override
  List get values => [
        portId,
        channelId,
        proposedUpgradeConnectionHops,
        counterpartyUpgradeFields,
        counterpartyUpgradeSequence,
        proofChannel,
        proofUpgrade,
        proofHeight,
        signer
      ];

  @override
  String get service => IbcTypes.channelUpgradeTry.typeUrl;
  @override
  List<String?> get signers => [signer];

  @override
  MsgChannelUpgradeTryResponse onResponse(List<int> bytes) {
    return MsgChannelUpgradeTryResponse.deserialize(bytes);
  }
}
