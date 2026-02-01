import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/models/stride/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class StridePeriod extends CosmosMessage {
  final BigInt? startTime;
  final BigInt? length;
  final Coin amount;
  final int? actionType;

  const StridePeriod({
    this.startTime,
    this.length,
    required this.amount,
    this.actionType,
  });
  factory StridePeriod.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return StridePeriod(
      startTime: decode.getField(1),
      length: decode.getField(2),
      amount: Coin.deserialize(decode.getField(3)),
      actionType: decode.getField(4),
    );
  }
  factory StridePeriod.fromJson(Map<String, dynamic> json) {
    return StridePeriod(
      startTime: json.asBigInt("start_time"),
      length: json.asBigInt("length"),
      amount: Coin.fromJson(json.asMap("amount")),
      actionType: json.asInt("action_type"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "start_time": startTime?.toString(),
      "length": length?.toString(),
      "amount": amount.toJson(),
      "action_type": actionType,
    };
  }

  @override
  TypeUrl get typeUrl => StrideTypes.period;

  @override
  List get values => [startTime, length, amount, actionType];
}
