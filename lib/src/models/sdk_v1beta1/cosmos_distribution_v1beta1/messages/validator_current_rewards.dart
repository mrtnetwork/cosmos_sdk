import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// ValidatorCurrentRewards represents current rewards and current
/// period for a validator kept as a running counter and incremented
/// each block as long as the validator's tokens remain constant.
class DistributionValidatorCurrentRewards extends CosmosMessage {
  final List<DecCoin> rewards;
  final BigInt? period;
  DistributionValidatorCurrentRewards({
    required List<DecCoin> rewards,
    this.period,
  }) : rewards = rewards.immutable;

  factory DistributionValidatorCurrentRewards.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionValidatorCurrentRewards(
      rewards:
          decode
              .getFields<List<int>>(1)
              .map((e) => DecCoin.deserialize(e))
              .toList(),
      period: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"rewards": rewards.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionValidatorCurrentRewards;

  @override
  List get values => [rewards, period];
}
