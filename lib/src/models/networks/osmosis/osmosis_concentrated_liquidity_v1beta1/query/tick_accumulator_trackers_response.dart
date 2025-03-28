import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/messages/uptime_trackers.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse
    extends CosmosMessage {
  final List<DecCoin> spreadRewardGrowthOppositeDirectionOfLastTraversal;
  final List<OsmosisConcentratedLiquidityUptimeTracker> uptimeTrackers;

  OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse(
      {required List<DecCoin>
          spreadRewardGrowthOppositeDirectionOfLastTraversal,
      required List<OsmosisConcentratedLiquidityUptimeTracker> uptimeTrackers})
      : spreadRewardGrowthOppositeDirectionOfLastTraversal =
            spreadRewardGrowthOppositeDirectionOfLastTraversal.immutable,
        uptimeTrackers = uptimeTrackers.immutable;
  factory OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse(
        spreadRewardGrowthOppositeDirectionOfLastTraversal: decode
            .getFields<List<int>>(1)
            .map((e) => DecCoin.deserialize(e))
            .toList(),
        uptimeTrackers: decode
            .getFields<List<int>>(2)
            .map(
                (e) => OsmosisConcentratedLiquidityUptimeTracker.deserialize(e))
            .toList());
  }
  factory OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse(
        spreadRewardGrowthOppositeDirectionOfLastTraversal:
            (json["spread_reward_growth_opposite_direction_of_last_traversal"]
                        as List?)
                    ?.map((e) => DecCoin.fromJson(e))
                    .toList() ??
                <DecCoin>[],
        uptimeTrackers: (json["uptime_trackers"] as List?)
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
      "spread_reward_growth_opposite_direction_of_last_traversal":
          spreadRewardGrowthOppositeDirectionOfLastTraversal
              .map((e) => e.toJson())
              .toList(),
      "uptime_trackers": uptimeTrackers.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.tickAccumulatorTrackersResponse;

  @override
  List get values =>
      [spreadRewardGrowthOppositeDirectionOfLastTraversal, uptimeTrackers];
}
