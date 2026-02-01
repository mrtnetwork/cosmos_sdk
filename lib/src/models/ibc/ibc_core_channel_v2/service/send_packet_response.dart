import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgSendPacketResponse defines the Msg/SendPacket response type
class IbcChannelV2MsgSendPacketResponse extends CosmosMessage {
  final BigInt? sequence;
  const IbcChannelV2MsgSendPacketResponse({this.sequence});
  factory IbcChannelV2MsgSendPacketResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2MsgSendPacketResponse(sequence: decode.getField(1));
  }
  factory IbcChannelV2MsgSendPacketResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return IbcChannelV2MsgSendPacketResponse(
      sequence: json.asBigInt("sequence"),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"sequence": sequence?.toString()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2MsgSendPacketResponse;

  @override
  List get values => [sequence];
}
