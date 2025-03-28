import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgEnableTokenizeSharesResponse defines the EnableTokenizeShares response type.
///
/// Since: cosmos-sdk 0.47-lsm
class MsgEnableTokenizeSharesResponse extends CosmosMessage {
  final ProtobufTimestamp completionTime;
  const MsgEnableTokenizeSharesResponse(this.completionTime);
  factory MsgEnableTokenizeSharesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgEnableTokenizeSharesResponse(
        ProtobufTimestamp.fromDateTime(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"completion_time": completionTime.toJson()};
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.msgEnableTokenizeSharesResponse;

  @override
  List get values => [completionTime];
}
