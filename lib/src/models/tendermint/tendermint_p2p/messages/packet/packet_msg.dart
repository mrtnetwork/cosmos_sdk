import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'packet_message.dart';

class PacketMsg extends PacketMessage {
  final int? channelId;
  final bool? eof;
  final List<int>? data;
  PacketMsg({this.channelId, this.eof, List<int>? data})
      : data = BytesUtils.tryToBytes(data, unmodifiable: true);
  factory PacketMsg.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return PacketMsg(
        channelId: decode.getField(1),
        eof: decode.getField(2),
        data: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "channel_id": channelId,
      "eof": eof,
      "data": BytesUtils.tryToHexString(data)
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.packetMsg;

  @override
  List get values => [channelId, eof, data];

  @override
  int get id => 3;
}
