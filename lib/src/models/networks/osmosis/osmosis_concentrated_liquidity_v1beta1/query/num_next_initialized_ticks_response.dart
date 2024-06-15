import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/messages/tick_liquidity_net.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisConcentratedLiquidityNumNextInitializedTicksResponse
    extends CosmosMessage {
  final List<OsmosisConcentratedLiquidityTickLiquidityNet> liquidityDepths;
  final BigInt? currentTick;
  final String currentLiquidity;

  OsmosisConcentratedLiquidityNumNextInitializedTicksResponse({
    required List<OsmosisConcentratedLiquidityTickLiquidityNet> liquidityDepths,
    this.currentTick,
    required this.currentLiquidity,
  }) : liquidityDepths = liquidityDepths.mutable;
  factory OsmosisConcentratedLiquidityNumNextInitializedTicksResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityNumNextInitializedTicksResponse(
        liquidityDepths: decode
            .getFields(1)
            .map((e) =>
                OsmosisConcentratedLiquidityTickLiquidityNet.deserialize(e))
            .toList(),
        currentTick: decode.getField(2),
        currentLiquidity: decode.getField(3));
  }
  factory OsmosisConcentratedLiquidityNumNextInitializedTicksResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityNumNextInitializedTicksResponse(
        liquidityDepths: (json["liquidity_depths"] as List?)
                ?.map((e) =>
                    OsmosisConcentratedLiquidityTickLiquidityNet.fromRpc(e))
                .toList() ??
            <OsmosisConcentratedLiquidityTickLiquidityNet>[],
        currentTick: BigintUtils.tryParse(json["current_tick"]),
        currentLiquidity: json["current_liquidity"]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "liquidity_depths": liquidityDepths.map((e) => e.toJson()).toList(),
      "current_tick": currentTick?.toString(),
      "current_liquidity": currentLiquidity
    };
  }

  @override
  String get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .numNextInitializedTicksResponse.typeUrl;

  @override
  List get values => [liquidityDepths, currentTick, currentLiquidity];
}
