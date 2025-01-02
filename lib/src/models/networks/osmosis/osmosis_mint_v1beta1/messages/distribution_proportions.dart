import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// DistributionProportions defines the distribution proportions of the minted denom. In other words,
/// defines which stakeholders will receive the minted denoms and how much.
class OsmosisMintDistributionProportions extends CosmosMessage {
  /// staking defines the proportion of the minted mint_denom that is to be
  /// allocated as staking rewards.
  final String staking;

  /// pool_incentives defines the proportion of the minted mint_denom that is
  /// to be allocated as pool incentives.
  final String poolIncentives;

  /// developer_rewards defines the proportion of the minted mint_denom that is
  /// to be allocated to developer rewards address.
  final String developerRewards;

  /// community_pool defines the proportion of the minted mint_denom that is
  /// to be allocated to the community pool.
  final String communityPool;
  const OsmosisMintDistributionProportions(
      {required this.staking,
      required this.poolIncentives,
      required this.developerRewards,
      required this.communityPool});
  factory OsmosisMintDistributionProportions.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisMintDistributionProportions(
        staking: decode.getField(1),
        poolIncentives: decode.getField(2),
        developerRewards: decode.getField(3),
        communityPool: decode.getField(4));
  }
  factory OsmosisMintDistributionProportions.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisMintDistributionProportions(
        staking: json["staking"],
        poolIncentives: json["pool_incentives"],
        developerRewards: json["developer_rewards"],
        communityPool: json["community_pool"]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "staking": staking,
      "pool_incentives": poolIncentives,
      "developer_rewards": developerRewards,
      "community_pool": communityPool
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisMintV1beta1Types.distributionProportions;

  @override
  List get values => [staking, poolIncentives, developerRewards, communityPool];
}
