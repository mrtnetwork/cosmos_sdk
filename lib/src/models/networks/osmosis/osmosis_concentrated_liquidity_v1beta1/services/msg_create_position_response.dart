import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Position contains position's id, address, pool id, lower tick, upper tick join time, and liquidity.
class OsmosisConcentratedLiquidityMsgCreatePositionResponse
    extends CosmosMessage {
  final BigInt? positionId;
  final BigInt amount0;
  final BigInt amount1;
  final String liquidityCreated;

  /// the lower and upper tick are in the response because there are
  /// instances in which multiple ticks represent the same price, so
  /// we may move their provided tick to the canonical tick that represents
  /// the same price.
  final BigInt? lowerTick;
  final BigInt? upperTick;

  OsmosisConcentratedLiquidityMsgCreatePositionResponse(
      {this.positionId,
      required this.amount0,
      required this.amount1,
      required this.liquidityCreated,
      this.lowerTick,
      this.upperTick});
  factory OsmosisConcentratedLiquidityMsgCreatePositionResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityMsgCreatePositionResponse(
        positionId: decode.getField(1),
        amount0: BigInt.parse(decode.getField(2)),
        amount1: BigInt.parse(decode.getField(3)),
        liquidityCreated: decode.getField(5),
        lowerTick: decode.getField(6),
        upperTick: decode.getField(7));
  }
  factory OsmosisConcentratedLiquidityMsgCreatePositionResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityMsgCreatePositionResponse(
        positionId: BigintUtils.tryParse(json["position_id"]),
        amount0: BigintUtils.parse(json["amount0"]),
        amount1: BigintUtils.parse(json["amount1"]),
        liquidityCreated: json["liquidity_created"],
        lowerTick: BigintUtils.tryParse(json["lower_tick"]),
        upperTick: BigintUtils.tryParse(json["upper_tick"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "position_id": positionId?.toString(),
      "amount0": amount0.toString(),
      "amount1": amount1.toString(),
      "liquidity_created": liquidityCreated,
      "lower_tick": lowerTick?.toString(),
      "upper_tick": upperTick?.toString()
    };
  }

  @override
  List get values => [
        positionId,
        amount0.toString(),
        amount1.toString(),
        liquidityCreated,
        lowerTick,
        upperTick
      ];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.msgCreatePositionResponse;
}
