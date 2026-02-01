import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// CommissionRates defines the initial commission rates to be used for creating a validator.
class CommissionRates extends CosmosMessage {
  // rate is the commission rate charged to delegators, as a fraction.
  final String rate;

  // maxRate defines the maximum commission rate which validator can ever charge, as a fraction.
  final String maxRate;

  // maxChangeRate defines the maximum daily increase of the validator commission, as a fraction.
  final String maxChangeRate;
  factory CommissionRates.fromJson(Map<String, dynamic> json) {
    return CommissionRates(
      maxChangeRate: json["max_change_rate"],
      maxRate: json["max_rate"],
      rate: json["rate"],
    );
  }
  const CommissionRates({
    required this.rate,
    required this.maxRate,
    required this.maxChangeRate,
  });
  factory CommissionRates.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CommissionRates(
      rate: decode.getField(1),
      maxRate: decode.getField(2),
      maxChangeRate: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "rate": rate,
      "max_rate": maxRate,
      "max_change_rate": maxChangeRate,
    };
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.commissionRates;

  @override
  List get values => [rate, maxRate, maxChangeRate];
}
