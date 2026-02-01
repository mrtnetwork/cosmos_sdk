import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'uptime_tracker.dart';

/// PoolIdToTickSpacingRecord is a struct that contains a pool id to new tick spacing pair.
class OsmosisConcentratedLiquidityTickInfo extends CosmosMessage {
  final String liquidityGross;
  final String liquidityNet;

  /// Total spread rewards accumulated in the opposite direction that the tick
  /// was last crossed. i.e. if the current tick is to the right of this tick
  /// (meaning its currently a greater price), then this is the total spread
  /// rewards accumulated below the tick. If the current tick is to the left of
  /// this tick (meaning its currently at a lower price), then this is the total
  /// spread rewards accumulated above the tick.
  ///
  /// Note: the way this value is used depends on the direction of spread rewards
  /// we are calculating for. If we are calculating spread rewards below the
  /// lower tick and the lower tick is the active tick, then this is the
  /// spreadRewardGrowthGlobal - the lower tick's
  /// spreadRewardGrowthOppositeDirectionOfLastTraversal. If we are calculating
  /// spread rewards above the upper tick and the upper tick is the active tick,
  /// then this is just the tick's
  /// spreadRewardGrowthOppositeDirectionOfLastTraversal value.
  final List<DecCoin> spreadRewardGrowthOsppositeDirectionOfLastTraversal;

  /// uptime_trackers is a container encapsulating the uptime trackers.
  /// We use a container instead of a "repeated UptimeTracker" directly
  /// because we need the ability to serialize and deserialize the
  /// container easily for events when crossing a tick.
  final OsmosisConcentratedLiquidityUptimeTrackers uptimeTrackers;

  OsmosisConcentratedLiquidityTickInfo({
    required this.liquidityGross,
    required this.liquidityNet,
    required List<DecCoin> spreadRewardGrowthOsppositeDirectionOfLastTraversal,
    required this.uptimeTrackers,
  }) : spreadRewardGrowthOsppositeDirectionOfLastTraversal =
           spreadRewardGrowthOsppositeDirectionOfLastTraversal.immutable;
  factory OsmosisConcentratedLiquidityTickInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityTickInfo(
      liquidityGross: decode.getField(1),
      liquidityNet: decode.getField(2),
      spreadRewardGrowthOsppositeDirectionOfLastTraversal:
          decode
              .getFields<List<int>>(3)
              .map((e) => DecCoin.deserialize(e))
              .toList(),
      uptimeTrackers: OsmosisConcentratedLiquidityUptimeTrackers.deserialize(
        decode.getField(4),
      ),
    );
  }
  factory OsmosisConcentratedLiquidityTickInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisConcentratedLiquidityTickInfo(
      liquidityGross: json["liquidity_gross"],
      liquidityNet: json["liquidity_net"],
      spreadRewardGrowthOsppositeDirectionOfLastTraversal:
          (json["spread_reward_growth_opposite_direction_of_last_traversal"]
                  as List?)
              ?.map((e) => DecCoin.fromJson(e))
              .toList() ??
          <DecCoin>[],
      uptimeTrackers: OsmosisConcentratedLiquidityUptimeTrackers.deserialize(
        json["uptime_trackers"],
      ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "liquidity_gross": liquidityGross,
      "liquidity_net": liquidityNet,
      "spread_reward_growth_opposite_direction_of_last_traversal":
          spreadRewardGrowthOsppositeDirectionOfLastTraversal
              .map((e) => e.toJson())
              .toList(),
      "uptime_trackers": uptimeTrackers.toJson(),
    };
  }

  @override
  List get values => [
    liquidityGross,
    liquidityNet,
    spreadRewardGrowthOsppositeDirectionOfLastTraversal,
    uptimeTrackers,
  ];

  @override
  TypeUrl get typeUrl => OsmosisConcentratedLiquidityV1beta1Types.tickInfo;
}
