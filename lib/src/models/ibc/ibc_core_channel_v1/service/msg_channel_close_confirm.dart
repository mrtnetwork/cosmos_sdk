import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgChannelCloseConfirm defines a msg sent by a Relayer to Chain B to
/// acknowledge the change of channel state to CLOSED on Chain A.
class MsgChannelCloseConfirm extends IbcService<EmptyServiceRequestResponse> {
  final String? portId;
  final String? channelId;
  final List<int>? proofInit;
  final IbcClientHeight proofHeight;
  final String? signer;
  final BigInt? counterpartyUpgradeSequence;
  MsgChannelCloseConfirm({
    this.portId,
    this.channelId,
    List<int>? proofInit,
    required this.proofHeight,
    this.signer,
    this.counterpartyUpgradeSequence,
  }) : proofInit = BytesUtils.tryToBytes(proofInit, unmodifiable: true);
  factory MsgChannelCloseConfirm.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelCloseConfirm(
      portId: decode.getField(1),
      channelId: decode.getField(2),
      proofInit: decode.getField(3),
      proofHeight: IbcClientHeight.deserialize(decode.getField(4)),
      signer: decode.getField(5),
      counterpartyUpgradeSequence: decode.getField(6),
    );
  }
  factory MsgChannelCloseConfirm.fromJson(Map<String, dynamic> json) {
    return MsgChannelCloseConfirm(
      portId: json.as("port_id"),
      channelId: json.as("channel_id"),
      proofInit: json.asBytes("proof_init"),
      proofHeight: IbcClientHeight.fromJson(json.asMap("proof_height")),
      signer: json.as("signer"),
      counterpartyUpgradeSequence: json.asBigInt(
        "counterparty_upgrade_sequence",
      ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "proof_init": BytesUtils.tryToHexString(proofInit),
      "proof_height": proofHeight.toJson(),
      "signer": signer,
      "counterparty_upgrade_sequence": counterpartyUpgradeSequence?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgChannelCloseConfirm;

  @override
  List get values => [
    portId,
    channelId,
    proofInit,
    proofHeight,
    signer,
    counterpartyUpgradeSequence,
  ];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(IbcTypes.msgChannelCloseConfirmResponse);
  }
}
