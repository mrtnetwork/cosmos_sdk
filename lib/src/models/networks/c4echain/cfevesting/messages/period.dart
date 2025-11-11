import 'package:blockchain_utils/utils/json/extension/json.dart';
import 'package:cosmos_sdk/src/models/networks/c4echain/cfevesting/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ContinuousVestingPeriod defines a length of time and amount of coins that will vest.
class C4eChiainContinuousVestingPeriod extends CosmosMessage {
  final BigInt? startTime;

  final BigInt? endTime;

  final List<Coin>? amount;
  C4eChiainContinuousVestingPeriod({this.startTime, this.endTime, this.amount});

  factory C4eChiainContinuousVestingPeriod.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return C4eChiainContinuousVestingPeriod(
        startTime: decode.getField(1),
        endTime: decode.getField(2),
        amount: decode
            .getFields<List<int>>(3)
            .map((e) => Coin.deserialize(e))
            .toList());
  }
  factory C4eChiainContinuousVestingPeriod.fromJson(Map<String, dynamic> json) {
    return C4eChiainContinuousVestingPeriod(
        startTime: json.valueAs("start_time"),
        endTime: json.valueAs("end_time"),
        amount: json
            .valueAsList<List<Map<String, dynamic>>?>('amount')
            ?.map((e) => Coin.fromJson(e))
            .toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'start_time': startTime?.toString(),
      'end_time': endTime?.toString(),
      "amount": amount?.map((e) => e.toJson()).toList()
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  TypeUrl get typeUrl => CFEvestingTypes.continuousVestingPeriod;

  @override
  List get values => [startTime, endTime, amount];
}
