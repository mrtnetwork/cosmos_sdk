import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/messages/tick_liquidity_net.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisConcentratedLiquidityLiquidityNetInDirectionResponse
    extends CosmosMessage {
  final List<OsmosisConcentratedLiquidityTickLiquidityNet> liquidityDepths;
  final BigInt? currentTick;
  final String currentLiquidity;
  final String currentSqrtPrice;
  OsmosisConcentratedLiquidityLiquidityNetInDirectionResponse(
      {required List<OsmosisConcentratedLiquidityTickLiquidityNet>
          liquidityDepths,
      this.currentTick,
      required this.currentLiquidity,
      required this.currentSqrtPrice})
      : liquidityDepths = liquidityDepths.immutable;
  factory OsmosisConcentratedLiquidityLiquidityNetInDirectionResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityLiquidityNetInDirectionResponse(
        liquidityDepths: decode
            .getFields(1)
            .map((e) =>
                OsmosisConcentratedLiquidityTickLiquidityNet.deserialize(e))
            .toList(),
        currentTick: decode.getField(2),
        currentLiquidity: decode.getField(3),
        currentSqrtPrice: decode.getField(4));
  }
  factory OsmosisConcentratedLiquidityLiquidityNetInDirectionResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityLiquidityNetInDirectionResponse(
      currentLiquidity: json["current_liquidity"],
      currentSqrtPrice: json["current_sqrt_price"],
      currentTick: BigintUtils.tryParse(json["current_tick"]),
      liquidityDepths: (json["liquidity_depths"] as List?)
              ?.map((e) =>
                  OsmosisConcentratedLiquidityTickLiquidityNet.fromRpc(e))
              .toList() ??
          <OsmosisConcentratedLiquidityTickLiquidityNet>[],
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "liquidity_depths": liquidityDepths.map((e) => e.toJson()).toList(),
      "current_tick": currentTick?.toString(),
      "current_liquidity": currentLiquidity,
      "current_sqrt_price": currentSqrtPrice
    };
  }

  @override
  String get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .liquidityNetInDirectionResponse.typeUrl;

  @override
  List get values =>
      [liquidityDepths, currentTick, currentLiquidity, currentSqrtPrice];
}
