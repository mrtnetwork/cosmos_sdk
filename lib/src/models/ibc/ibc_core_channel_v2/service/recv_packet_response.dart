import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v2/messages/response_result_type.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgRecvPacketResponse defines the Msg/RecvPacket response type.
class IbcChannelV2MsgRecvPacketResponse extends CosmosMessage {
  final IbcChannelV2ResponseResultType? result;
  IbcChannelV2MsgRecvPacketResponse({required this.result});
  factory IbcChannelV2MsgRecvPacketResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2MsgRecvPacketResponse(
        result: decode.getResult(1)?.to<IbcChannelV2ResponseResultType, int>(
            IbcChannelV2ResponseResultType.fromValue));
  }
  factory IbcChannelV2MsgRecvPacketResponse.fromJson(
      Map<String, dynamic> json) {
    return IbcChannelV2MsgRecvPacketResponse(
        result: json.maybeAs<IbcChannelV2ResponseResultType, int>(
            key: "result", onValue: IbcChannelV2ResponseResultType.fromValue));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"result": result?.name};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2MsgRecvPacketResponse;

  @override
  List get values => [result];
}
