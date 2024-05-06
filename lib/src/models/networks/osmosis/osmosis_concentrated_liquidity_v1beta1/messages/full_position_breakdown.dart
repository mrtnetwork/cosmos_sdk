import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

import 'position.dart';

/// FullPositionBreakdown returns:
/// the position itself
/// the amount the position translates in terms of asset0 and asset1
/// the amount of claimable fees
/// the amount of claimable incentives
/// the amount of incentives that would be forfeited if the position was closed now
class FullPositionBreakdown extends CosmosMessage {
  final OsmosisConcentratedLiquidityPosition position;
  final Coin asset0;
  final Coin asset1;
  final List<Coin> claimableSpreadRewards;
  final List<Coin> claimableIncentives;
  final List<Coin> forfeitedIncentives;

  FullPositionBreakdown(
      {required this.position,
      required this.asset0,
      required this.asset1,
      required List<Coin> claimableSpreadRewards,
      required List<Coin> claimableIncentives,
      required List<Coin> forfeitedIncentives})
      : claimableSpreadRewards = claimableSpreadRewards.mutable,
        claimableIncentives = claimableIncentives.mutable,
        forfeitedIncentives = forfeitedIncentives.mutable;
  factory FullPositionBreakdown.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FullPositionBreakdown(
        position: OsmosisConcentratedLiquidityPosition.deserialize(
            decode.getField(1)),
        asset0: Coin.deserialize(decode.getField(2)),
        asset1: Coin.deserialize(decode.getField(3)),
        claimableSpreadRewards:
            decode.getFields(4).map((e) => Coin.deserialize(e)).toList(),
        claimableIncentives:
            decode.getFields(5).map((e) => Coin.deserialize(e)).toList(),
        forfeitedIncentives:
            decode.getFields(6).map((e) => Coin.deserialize(e)).toList());
  }

  factory FullPositionBreakdown.fromRpc(Map<String, dynamic> json) {
    return FullPositionBreakdown(
        position:
            OsmosisConcentratedLiquidityPosition.deserialize(json["position"]),
        asset0: Coin.fromRpc(json["asset0"]),
        asset1: Coin.fromRpc(json["asset1"]),
        claimableSpreadRewards: (json["claimable_spread_rewards"] as List?)
                ?.map((e) => Coin.deserialize(e))
                .toList() ??
            <Coin>[],
        claimableIncentives: (json["claimable_incentives"] as List?)
                ?.map((e) => Coin.deserialize(e))
                .toList() ??
            <Coin>[],
        forfeitedIncentives: (json["forfeited_incentives"] as List?)
                ?.map((e) => Coin.deserialize(e))
                .toList() ??
            <Coin>[]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "position": position.toJson(),
      "asset0": asset0.toJson(),
      "asset1": asset1.toJson(),
      "claimable_spread_rewards":
          claimableSpreadRewards.map((e) => e.toJson()).toList(),
      "claimable_incentives":
          claimableIncentives.map((e) => e.toJson()).toList(),
      "forfeited_incentives":
          forfeitedIncentives.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.fullPositionBreakdown.typeUrl;

  @override
  List get values => [
        position,
        asset0,
        asset1,
        claimableSpreadRewards,
        claimableIncentives,
        forfeitedIncentives
      ];
}
