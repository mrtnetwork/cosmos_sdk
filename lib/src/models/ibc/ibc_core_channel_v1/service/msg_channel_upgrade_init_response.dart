import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/upgrade.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgChannelUpgradeInitResponse defines the MsgChannelUpgradeInit response type
class MsgChannelUpgradeInitResponse extends CosmosMessage {
  final IbcChannelUpgrade upgrade;
  final BigInt? upgradeSequence;
  const MsgChannelUpgradeInitResponse(
      {required this.upgrade, this.upgradeSequence});
  factory MsgChannelUpgradeInitResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelUpgradeInitResponse(
        upgrade: IbcChannelUpgrade.deserialize(decode.getField(1)),
        upgradeSequence: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "upgrade": upgrade.toJson(),
      "upgrade_sequence": upgradeSequence?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgChannelUpgradeInitResponse;

  @override
  List get values => [upgrade, upgradeSequence];
}
