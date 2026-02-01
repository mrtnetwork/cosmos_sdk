import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/messages/delegation_delegator_reward.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryDelegationTotalRewardsResponse is the response type for the Query/DelegationTotalRewards RPC method.
class DistributionQueryDelegationTotalRewardsResponse extends CosmosMessage {
  /// rewards defines all the rewards accrued by a delegator.
  final List<DistributionDelegationDelegatorReward> rewards;

  /// total defines the sum of all the rewards.
  final List<DecCoin> total;
  DistributionQueryDelegationTotalRewardsResponse({
    required List<DistributionDelegationDelegatorReward> rewards,
    required List<DecCoin> total,
  }) : rewards = rewards.immutable,
       total = total.immutable;
  factory DistributionQueryDelegationTotalRewardsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return DistributionQueryDelegationTotalRewardsResponse(
      rewards:
          (json["rewards"] as List?)
              ?.map((e) => DistributionDelegationDelegatorReward.fromJson(e))
              .toList() ??
          [],
      total:
          (json["total"] as List?)?.map((e) => DecCoin.fromJson(e)).toList() ??
          [],
    );
  }
  factory DistributionQueryDelegationTotalRewardsResponse.deserialize(
    List<int> bytes,
  ) {
    final deocde = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryDelegationTotalRewardsResponse(
      rewards:
          deocde
              .getFields<List<int>>(1)
              .map((e) => DistributionDelegationDelegatorReward.deserialize(e))
              .toList(),
      total:
          deocde
              .getFields<List<int>>(2)
              .map((e) => DecCoin.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "rewards": rewards.map((e) => e.toJson()).toList(),
      "total": total.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionQueryDelegationTotalRewardsResponse;

  @override
  List get values => [rewards, total];
}
