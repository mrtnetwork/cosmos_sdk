import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// PoolIdToTickSpacingRecord is a struct that contains a pool id to new tick spacing pair.
class OsmosisConcentratedLiquidityPool extends CosmosMessage {
  /// pool's address holding all liquidity tokens.
  final String? address;

  /// address holding the incentives liquidity.
  final String? incentivesAddress;

  /// address holding spread rewards from swaps.
  final String? spreadRewardsAddress;
  final BigInt? id;

  /// Amount of total liquidity
  final String currentTickLiquidity;
  final String? token0;
  final String? token1;
  final String currentSqrtPrice;
  final BigInt? currentTick;

  /// tick_spacing must be one of the authorized_tick_spacing values set in the
  /// concentrated-liquidity parameters
  final BigInt? tickSpacing;
  final BigInt? exponentAtPriceOne;

  /// spread_factor is the ratio that is charged on the amount of token in.
  final String spreadFactor;

  /// last_liquidity_update is the last time either the pool liquidity or the
  /// active tick changed
  final ProtobufTimestamp lastLiquidityUpdate;
  OsmosisConcentratedLiquidityPool({
    this.address,
    this.incentivesAddress,
    this.spreadRewardsAddress,
    this.id,
    required this.currentTickLiquidity,
    this.token0,
    this.token1,
    required this.currentSqrtPrice,
    this.currentTick,
    this.tickSpacing,
    this.exponentAtPriceOne,
    required this.spreadFactor,
    required this.lastLiquidityUpdate,
  });
  factory OsmosisConcentratedLiquidityPool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPool(
      address: decode.getField(1),
      incentivesAddress: decode.getField(2),
      spreadRewardsAddress: decode.getField(3),
      id: decode.getField(4),
      currentTickLiquidity: decode.getField(5),
      token0: decode.getField(6),
      token1: decode.getField(7),
      currentSqrtPrice: decode.getField(8),
      currentTick: decode.getField(9),
      tickSpacing: decode.getField(10),
      exponentAtPriceOne: decode.getField(11),
      spreadFactor: decode.getField(12),
      lastLiquidityUpdate: ProtobufTimestamp.deserialize(decode.getField(13)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "incentives_address": incentivesAddress,
      "spread_rewards_address": spreadRewardsAddress,
      "id": id?.toString(),
      "current_tick_liquidity": currentTickLiquidity,
      "token0": token0,
      "token1": token1,
      "current_sqrt_price": currentSqrtPrice,
      "current_tick": currentTick?.toString(),
      "tick_spacing": tickSpacing?.toString(),
      "exponent_at_price_one": exponentAtPriceOne?.toString(),
      "spread_factor": spreadFactor,
      "last_liquidity_update": lastLiquidityUpdate.toJson(),
    };
  }

  @override
  List get values => [
    address,
    incentivesAddress,
    spreadRewardsAddress,
    id,
    currentTickLiquidity,
    token0,
    token1,
    currentSqrtPrice,
    currentTick,
    tickSpacing,
    exponentAtPriceOne,
    spreadFactor,
    lastLiquidityUpdate,
  ];

  @override
  TypeUrl get typeUrl => OsmosisConcentratedLiquidityV1beta1Types.pool;
}
