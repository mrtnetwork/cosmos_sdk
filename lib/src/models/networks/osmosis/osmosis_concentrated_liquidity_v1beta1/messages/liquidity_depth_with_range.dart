import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisConcentratedLiquidityLiquidityDepthWithRange
    extends CosmosMessage {
  final String liquidityAmount;
  final BigInt? lowerTick;
  final BigInt? upperTick;

  OsmosisConcentratedLiquidityLiquidityDepthWithRange(
      {required this.liquidityAmount, this.lowerTick, this.upperTick});
  factory OsmosisConcentratedLiquidityLiquidityDepthWithRange.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityLiquidityDepthWithRange(
        liquidityAmount: decode.getField(1),
        lowerTick: decode.getField(2),
        upperTick: decode.getField(3));
  }
  factory OsmosisConcentratedLiquidityLiquidityDepthWithRange.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityLiquidityDepthWithRange(
        liquidityAmount: json["liquidity_amount"],
        lowerTick: BigintUtils.tryParse(json["lower_tick"]),
        upperTick: BigintUtils.tryParse(json["upper_tick"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "liquidity_amount": liquidityAmount,
      "lower_tick": lowerTick?.toString(),
      "upper_tick": upperTick?.toString(),
    };
  }

  @override
  List get values => [liquidityAmount, lowerTick, upperTick];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.liquidityDepthWithRange;
}
