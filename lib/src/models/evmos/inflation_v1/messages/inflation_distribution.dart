import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/codec/decoder.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// InflationDistribution defines the distribution in which inflation is
/// allocated through minting on each epoch (staking, incentives, community). It
/// excludes the team vesting distribution, as this is minted once at genesis.
/// The initial InflationDistribution can be calculated from the Evmos Token
/// Model like this:
/// mintDistribution1 = distribution1 / (1 - teamVestingDistribution)
/// 0.5333333         = 40%           / (1 - 25%)
class EvmosInflationV1InflationDistribution extends CosmosMessage {
  /// stakingRewards defines the proportion of the minted minted_denom that is
  /// to be allocated as staking rewards
  final String? stakingRewards;

  /// Deprecated: usage_incentives defines the proportion of the minted minted_denom that is
  /// to be allocated to the incentives module address
  final String? usageIncentives;

  /// communityPool defines the proportion of the minted minted_denom that is to
  /// be allocated to the community pool
  final String? communityPool;

  EvmosInflationV1InflationDistribution(
      {this.stakingRewards, this.usageIncentives, this.communityPool});
  factory EvmosInflationV1InflationDistribution.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosInflationV1InflationDistribution(
        stakingRewards: decode.getField(1),
        usageIncentives: decode.getField(2),
        communityPool: decode.getField(3));
  }
  factory EvmosInflationV1InflationDistribution.fromJson(
      Map<String, dynamic> json) {
    return EvmosInflationV1InflationDistribution(
        stakingRewards: json.as("staking_rewards"),
        usageIncentives: json.as("usage_incentives"),
        communityPool: json.as("community_pool"));
  }
  @override
  List get values => [stakingRewards, usageIncentives, communityPool];

  @override
  List<int> get fieldIds => [1, 3, 3];

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.inflationDistribution;
  @override
  Map<String, dynamic> toJson() {
    return {
      "staking_rewards": stakingRewards,
      "usage_incentives": usageIncentives,
      "community_pool": communityPool
    };
  }
}
