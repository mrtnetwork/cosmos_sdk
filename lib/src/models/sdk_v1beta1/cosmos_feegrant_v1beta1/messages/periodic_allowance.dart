import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/messages/basic_allowance.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_feegrant_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// PeriodicAllowance extends Allowance to allow for both a maximum cap, as well as a limit per time period.
class PeriodicAllowance extends CosmosMessage {
  /// basic specifies a struct of `BasicAllowance`
  final BasicAllowance basic;

  /// period specifies the time duration in which period_spend_limit coins can
  /// be spent before that allowance is reset
  final ProtobufDuration period;

  /// period_spend_limit specifies the maximum number of coins that can be spent
  /// in the period
  final List<Coin> periodSpendLimit;

  /// period_can_spend is the number of coins left to be spent before the period_reset time
  final List<Coin> periodCanSpend;

  /// period_reset is the time at which this period resets and a new one begins,
  /// it is calculated from the start time of the first transaction after the
  /// last period ended
  final ProtobufTimestamp periodReset;
  PeriodicAllowance(
      {required this.basic,
      required this.period,
      required List<Coin> periodSpendLimit,
      required List<Coin> periodCanSpend,
      required this.periodReset})
      : periodSpendLimit = periodSpendLimit.mutable,
        periodCanSpend = periodCanSpend.mutable;
  factory PeriodicAllowance.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return PeriodicAllowance(
        basic: BasicAllowance.deserialize(decode.getField(1)),
        period: ProtobufDuration.deserialize(decode.getField(2)),
        periodSpendLimit:
            decode.getFields(3).map((e) => Coin.deserialize(e)).toList(),
        periodCanSpend:
            decode.getFields(4).map((e) => Coin.deserialize(e)).toList(),
        periodReset: ProtobufTimestamp.deserialize(decode.getField(5)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "basic": basic.toJson(),
      "period": period.toJson(),
      "period_spend_limit": periodSpendLimit.map((e) => e.toJson()).toList(),
      "period_can_spend": periodCanSpend.map((e) => e.toJson()).toList(),
      "period_reset": periodReset.toJson()
    };
  }

  @override
  String get typeUrl => FeegrantV1beta1Types.periodicAllowance.typeUrl;

  @override
  List get values =>
      [basic, period, periodSpendLimit, periodCanSpend, periodReset];
}
