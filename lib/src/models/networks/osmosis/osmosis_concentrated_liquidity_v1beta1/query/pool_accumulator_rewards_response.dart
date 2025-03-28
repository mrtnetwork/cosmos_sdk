import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/messages/uptime_trackers.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisConcentratedLiquidityPoolAccumulatorRewardsResponse
    extends CosmosMessage {
  final List<DecCoin> spreadRewardGrowthGlobal;
  final List<OsmosisConcentratedLiquidityUptimeTracker> uptimeGrowthGlobal;

  OsmosisConcentratedLiquidityPoolAccumulatorRewardsResponse(
      {required List<DecCoin> spreadRewardGrowthGlobal,
      required List<OsmosisConcentratedLiquidityUptimeTracker>
          uptimeGrowthGlobal})
      : spreadRewardGrowthGlobal = spreadRewardGrowthGlobal.immutable,
        uptimeGrowthGlobal = uptimeGrowthGlobal.immutable;
  factory OsmosisConcentratedLiquidityPoolAccumulatorRewardsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPoolAccumulatorRewardsResponse(
        spreadRewardGrowthGlobal: decode
            .getFields<List<int>>(1)
            .map((e) => DecCoin.deserialize(e))
            .toList(),
        uptimeGrowthGlobal: decode
            .getFields<List<int>>(2)
            .map(
                (e) => OsmosisConcentratedLiquidityUptimeTracker.deserialize(e))
            .toList());
  }
  factory OsmosisConcentratedLiquidityPoolAccumulatorRewardsResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityPoolAccumulatorRewardsResponse(
        spreadRewardGrowthGlobal: (json["spread_reward_growth_global"] as List?)
                ?.map((e) => DecCoin.fromJson(e))
                .toList() ??
            <DecCoin>[],
        uptimeGrowthGlobal: (json["uptime_growth_global"] as List?)
                ?.map((e) =>
                    OsmosisConcentratedLiquidityUptimeTracker.fromJson(e))
                .toList() ??
            <OsmosisConcentratedLiquidityUptimeTracker>[]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "spread_reward_growth_global":
          spreadRewardGrowthGlobal.map((e) => e.toJson()).toList(),
      "uptime_growth_global": uptimeGrowthGlobal.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.poolAccumulatorRewardsResponse;

  @override
  List get values => [spreadRewardGrowthGlobal, uptimeGrowthGlobal];
}
