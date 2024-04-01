import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgUndelegateResponse defines the Msg/Undelegate response type.
class MsgUndelegateResponse extends CosmosMessage {
  final ProtobufTimestamp complationTime;

  /// amount returns the amount of undelegated coins
  ///
  /// Since: cosmos-sdk 0.50
  final Coin amount;
  const MsgUndelegateResponse(
      {required this.complationTime, required this.amount});
  factory MsgUndelegateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgUndelegateResponse(
        complationTime: ProtobufTimestamp.deserialize(decode.getField(1)),
        amount: Coin.deserialize(decode.getField(2)));
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'completion_time': complationTime.toJson(),
      'amount': amount.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get typeUrl => StakingV1beta1Types.msgUndelegateResponse.typeUrl;

  @override
  List get values => [complationTime, amount];
}
