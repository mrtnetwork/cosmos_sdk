import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v2/messages/response_result_type.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgAcknowledgementResponse defines the Msg/Acknowledgement response type
class IbcChannelV2MsgAcknowledgementResponse extends CosmosMessage {
  final IbcChannelV2ResponseResultType? result;
  IbcChannelV2MsgAcknowledgementResponse({required this.result});
  factory IbcChannelV2MsgAcknowledgementResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2MsgAcknowledgementResponse(
        result: decode.getResult(1)?.to<IbcChannelV2ResponseResultType, int>(
            IbcChannelV2ResponseResultType.fromValue));
  }
  factory IbcChannelV2MsgAcknowledgementResponse.fromJson(
      Map<String, dynamic> json) {
    return IbcChannelV2MsgAcknowledgementResponse(
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
  TypeUrl get typeUrl => IbcTypes.channelV2MsgAcknowledgementResponse;

  @override
  List get values => [result];
}
