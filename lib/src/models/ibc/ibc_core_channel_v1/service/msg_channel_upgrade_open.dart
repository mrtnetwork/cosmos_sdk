import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/state.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgChannelUpgradeOpen defines the request type for the ChannelUpgradeOpen rpc
class MsgChannelUpgradeOpen extends IbcService<EmptyServiceRequestResponse> {
  final String? portId;
  final String? channelId;
  final IbcChannelState? counterpartyChannelState;
  final BigInt? counterpartyUpgradeSequence;
  final List<int>? proofChannel;
  final IbcClientHeight proofHeight;
  final String? signer;
  MsgChannelUpgradeOpen({
    this.portId,
    this.channelId,
    this.counterpartyChannelState,
    this.counterpartyUpgradeSequence,
    List<int>? proofChannel,
    required this.proofHeight,
    this.signer,
  }) : proofChannel = BytesUtils.tryToBytes(proofChannel, unmodifiable: true);
  factory MsgChannelUpgradeOpen.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelUpgradeOpen(
      portId: decode.getField(1),
      channelId: decode.getField(2),
      counterpartyChannelState: decode
          .getResult(3)
          ?.to<IbcChannelState, int>((e) => IbcChannelState.fromValue(e)),
      counterpartyUpgradeSequence: decode.getField(4),
      proofChannel: decode.getField(5),
      proofHeight: IbcClientHeight.deserialize(decode.getField(6)),
      signer: decode.getField(7),
    );
  }
  factory MsgChannelUpgradeOpen.fromJson(Map<String, dynamic> json) {
    return MsgChannelUpgradeOpen(
      portId: json.as("port_id"),
      channelId: json.as("channel_id"),
      counterpartyChannelState: json.maybeAs<IbcChannelState, String>(
        key: "counterparty_channel_state",
        onValue: IbcChannelState.fromValue,
      ),
      counterpartyUpgradeSequence: json.asBigInt(
        "counterparty_upgrade_sequence",
      ),
      proofChannel: json.asBytes("proof_channel"),
      proofHeight: IbcClientHeight.fromJson(json.asMap("proof_height")),
      signer: json.as("signer"),
    );
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "counterparty_channel_state": counterpartyChannelState?.value,
      "counterparty_upgrade_sequence": counterpartyUpgradeSequence?.toString(),
      "proof_channel": BytesUtils.tryToHexString(proofChannel),
      "proof_height": proofHeight.toJson(),
      "signer": signer,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgChannelUpgradeOpen;

  @override
  List get values => [
    portId,
    channelId,
    counterpartyChannelState?.value,
    counterpartyUpgradeSequence,
    proofChannel,
    proofHeight,
    signer,
  ];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(IbcTypes.msgChannelUpgradeOpenResponse);
  }
}
