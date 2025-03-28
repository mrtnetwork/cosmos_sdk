import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v2/messages/payload.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'send_packet_response.dart';

/// MsgSendPacket sends an outgoing IBC packet.
class IbcChannelV2MsgSendPacket
    extends IbcService<IbcChannelV2MsgSendPacketResponse> {
  final String? sourceClient;
  final BigInt? timoutTimestamp;
  final List<IbcChannelV2Payload>? payloads;
  final String? signer;
  IbcChannelV2MsgSendPacket(
      {required this.sourceClient,
      List<IbcChannelV2Payload>? payloads,
      required this.timoutTimestamp,
      this.signer})
      : payloads = payloads?.immutable;
  factory IbcChannelV2MsgSendPacket.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2MsgSendPacket(
        sourceClient: decode.getField(1),
        timoutTimestamp: decode.getField(2),
        payloads: decode
            .getFields<List<int>>(3)
            .map((e) => IbcChannelV2Payload.deserialize(e))
            .toList(),
        signer: decode.getField(4));
  }
  factory IbcChannelV2MsgSendPacket.fromJson(Map<String, dynamic> json) {
    return IbcChannelV2MsgSendPacket(
        sourceClient: json.as("source_client"),
        timoutTimestamp: json.asBigInt("timeout_timestamp"),
        payloads: json
            .asListOfMap("payloads")
            ?.map(IbcChannelV2Payload.fromJson)
            .toList(),
        signer: json.as("signer"));
  }
  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "source_client": sourceClient,
      "timeout_timestamp": timoutTimestamp?.toString(),
      "payloads": payloads?.map((e) => e.toJson()).toList(),
      "signer": signer
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2MsgSendPacket;

  @override
  List get values => [sourceClient, timoutTimestamp, payloads, signer];
  @override
  List<String?> get signers => [signer];

  @override
  IbcChannelV2MsgSendPacketResponse onResponse(List<int> bytes) {
    return IbcChannelV2MsgSendPacketResponse.deserialize(bytes);
  }
}
