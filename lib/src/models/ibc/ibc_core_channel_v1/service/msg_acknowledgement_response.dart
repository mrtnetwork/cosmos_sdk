import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/response_result_type.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgAcknowledgementResponse defines the Msg/Acknowledgement response type.
class MsgAcknowledgementResponse extends CosmosMessage {
  final IbcChannelResponseResultType? result;
  const MsgAcknowledgementResponse({this.result});
  factory MsgAcknowledgementResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgAcknowledgementResponse(
        result: decode.getResult(1)?.to<IbcChannelResponseResultType, int>(
            (e) => IbcChannelResponseResultType.fromValue(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"result": result?.value};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgAcknowledgementResponse;

  @override
  List get values => [1];
}
