import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/channel.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgChannelUpgradeTimeout defines the request type for the ChannelUpgradeTimeout rpc
class MsgChannelUpgradeTimeout extends IbcService<EmptyServiceRequestResponse> {
  final String? portId;
  final String? channelId;
  final IbcChannelChannel counterpartyChannel;
  final List<int>? proofChannel;
  final IbcClientHeight proofHeight;
  final String? signer;
  MsgChannelUpgradeTimeout({
    this.portId,
    this.channelId,
    required this.counterpartyChannel,
    List<int>? proofChannel,
    required this.proofHeight,
    this.signer,
  }) : proofChannel = BytesUtils.tryToBytes(proofChannel, unmodifiable: true);
  factory MsgChannelUpgradeTimeout.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelUpgradeTimeout(
      portId: decode.getField(1),
      channelId: decode.getField(2),
      counterpartyChannel: IbcChannelChannel.deserialize(decode.getField(3)),
      proofChannel: decode.getField(4),
      proofHeight: IbcClientHeight.deserialize(decode.getField(5)),
      signer: decode.getField(6),
    );
  }
  factory MsgChannelUpgradeTimeout.fromJson(Map<String, dynamic> json) {
    return MsgChannelUpgradeTimeout(
      portId: json.as("port_id"),
      channelId: json.as("channel_id"),
      counterpartyChannel: IbcChannelChannel.fromJson(
        json.asMap("counterparty_channel"),
      ),
      proofChannel: json.asBytes("proof_channel"),
      proofHeight: IbcClientHeight.fromJson(json.asMap("proof_height")),
      signer: json.as("signer"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "counterparty_channel": counterpartyChannel.toJson(),
      "proof_channel": BytesUtils.tryToHexString(proofChannel),
      "proof_height": proofHeight.toJson(),
      "signer": signer,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgChannelUpgradeTimeout;

  @override
  List get values => [
    portId,
    channelId,
    counterpartyChannel,
    proofChannel,
    proofHeight,
    signer,
  ];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      IbcTypes.msgChannelUpgradeTimeoutResponse,
    );
  }
}
