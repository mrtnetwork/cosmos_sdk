import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// DelegatorStartingInfo represents the starting info for a delegator reward period.
/// It tracks the previous validator period, the delegation's amount of staking token,
/// and the creation height (to check later on if any slashes have occurred).
/// NOTE: Even though validators are slashed to whole staking tokens, the delegators
/// within the validator may be left with less than a full token, thus sdk.Dec is used.
class DistributionDelegatorStartingInfo extends CosmosMessage {
  final BigInt? previousPeriod;
  final String stake;
  final BigInt height;
  DistributionDelegatorStartingInfo(
      {this.previousPeriod, required this.stake, required this.height});
  factory DistributionDelegatorStartingInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionDelegatorStartingInfo(
        previousPeriod: decode.getField(1),
        height: decode.getField(3),
        stake: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "previous_period": previousPeriod?.toString(),
      "stake": stake,
      "height": height.toString()
    };
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionDelegatorStartingInfo;

  @override
  List get values => [previousPeriod, stake, height];
}
