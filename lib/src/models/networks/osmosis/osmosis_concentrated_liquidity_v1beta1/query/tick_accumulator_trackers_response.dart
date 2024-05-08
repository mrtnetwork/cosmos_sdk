import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/messages/uptime_trackers.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse
    extends CosmosMessage {
  final List<DecCoin> spreadRewardGrowthOppositeDirectionOfLastTraversal;
  final List<OsmosisConcentratedLiquidityUptimeTracker> uptimeTrackers;

  OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse(
      {required List<DecCoin>
          spreadRewardGrowthOppositeDirectionOfLastTraversal,
      required List<OsmosisConcentratedLiquidityUptimeTracker> uptimeTrackers})
      : spreadRewardGrowthOppositeDirectionOfLastTraversal =
            spreadRewardGrowthOppositeDirectionOfLastTraversal.mutable,
        uptimeTrackers = uptimeTrackers.mutable;
  factory OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse(
        spreadRewardGrowthOppositeDirectionOfLastTraversal:
            decode.getFields(1).map((e) => DecCoin.deserialize(e)).toList(),
        uptimeTrackers: decode
            .getFields(2)
            .map(
                (e) => OsmosisConcentratedLiquidityUptimeTracker.deserialize(e))
            .toList());
  }
  factory OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityTickAccumulatorTrackersResponse(
        spreadRewardGrowthOppositeDirectionOfLastTraversal:
            (json["spread_reward_growth_opposite_direction_of_last_traversal"]
                        as List?)
                    ?.map((e) => DecCoin.fromRpc(e))
                    .toList() ??
                <DecCoin>[],
        uptimeTrackers: (json["uptime_trackers"] as List?)
                ?.map(
                    (e) => OsmosisConcentratedLiquidityUptimeTracker.fromRpc(e))
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
  String get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .tickAccumulatorTrackersResponse.typeUrl;

  @override
  List get values =>
      [spreadRewardGrowthOppositeDirectionOfLastTraversal, uptimeTrackers];
}
