import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgBeginRedelegateResponse defines the Msg/BeginRedelegate response type.
class MsgBeginRedelegateResponse extends CosmosMessage {
  final ProtobufTimestamp completionTime;
  const MsgBeginRedelegateResponse(this.completionTime);
  factory MsgBeginRedelegateResponse.fromBytes(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgBeginRedelegateResponse(
      ProtobufTimestamp.fromDateTime(decode.getField(1)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"completion_time": completionTime.toJson()};
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.msgBeginRedelegateResponse;

  @override
  List get values => [completionTime];
}
