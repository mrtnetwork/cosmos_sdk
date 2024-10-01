import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// ValidatorHistoricalRewards represents historical rewards for a validator.
/// Height is implicit within the store key. Cumulative reward ratio is the sum
/// from the zeroeth period until this period of rewards / tokens, per the spec.
/// The reference count indicates the number of objects which might need to reference
/// this historical entry at any point. ReferenceCount = number of outstanding
/// delegations which ended the associated period (and might need to read that record)
///
/// number of slashes which ended the associated period (and might need to read that record)
/// one per validator for the zeroeth period, set on initialization
class DistributionValidatorHistoricalRewards extends CosmosMessage {
  final List<DecCoin> cumulativeRewardRatio;
  final int? referenceCount;
  DistributionValidatorHistoricalRewards(
      {required List<DecCoin> cumulativeRewardRatio, this.referenceCount})
      : cumulativeRewardRatio = cumulativeRewardRatio.immutable;
  factory DistributionValidatorHistoricalRewards.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionValidatorHistoricalRewards(
      referenceCount: decode.getField(2),
      cumulativeRewardRatio:
          decode.getFields(1).map((e) => DecCoin.deserialize(e)).toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "cumulative_reward_ratio":
          cumulativeRewardRatio.map((e) => e.toJson()).toList(),
      "reference_count": referenceCount
    };
  }

  @override
  String get typeUrl =>
      DistributionV1beta1Types.distributionValidatorHistoricalRewards.typeUrl;

  @override
  List get values => [cumulativeRewardRatio, referenceCount];
}
