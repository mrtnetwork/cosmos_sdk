import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TakerFeeDistributionPercentage defines what percent of the taker fee category gets distributed to the available categories.
class OsmosisPoolManagerTakerFeeDistributionPercentage extends CosmosMessage {
  final String stakingRewards;
  final String communityPool;

  OsmosisPoolManagerTakerFeeDistributionPercentage(
      {required this.stakingRewards, required this.communityPool});
  factory OsmosisPoolManagerTakerFeeDistributionPercentage.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerTakerFeeDistributionPercentage(
        stakingRewards: decode.getField(1), communityPool: decode.getField(2));
  }
  factory OsmosisPoolManagerTakerFeeDistributionPercentage.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerTakerFeeDistributionPercentage(
        stakingRewards: json["staking_rewards"],
        communityPool: json["community_pool"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"staking_rewards": stakingRewards, "community_pool": communityPool};
  }

  @override
  String get typeUrl =>
      OsmosisPoolManagerV1beta1Types.takerFeeDistributionPercentage.typeUrl;

  @override
  List get values => [stakingRewards, communityPool];
}
