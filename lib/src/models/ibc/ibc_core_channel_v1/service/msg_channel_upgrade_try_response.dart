import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/response_result_type.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/upgrade.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgChannelUpgradeTryResponse defines the MsgChannelUpgradeTry response type
class MsgChannelUpgradeTryResponse extends CosmosMessage {
  final IbcChannelUpgrade upgrade;
  final BigInt? upgradeSequence;
  final IbcChannelResponseResultType? result;
  const MsgChannelUpgradeTryResponse({
    required this.upgrade,
    this.upgradeSequence,
    this.result,
  });
  factory MsgChannelUpgradeTryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelUpgradeTryResponse(
      upgrade: IbcChannelUpgrade.deserialize(decode.getField(1)),
      upgradeSequence: decode.getField(2),
      result: decode
          .getResult(3)
          ?.to<IbcChannelResponseResultType, int>(
            (e) => IbcChannelResponseResultType.fromValue(e),
          ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "upgrade": upgrade.toJson(),
      "upgrade_sequence": upgradeSequence?.toString(),
      "result": result?.value,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgChannelUpgradeTryResponse;

  @override
  List get values => [upgrade, upgradeSequence, result];
}
