import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisConcentratedLiquidityTickLiquidityNet extends CosmosMessage {
  final String liquidityNet;
  final BigInt? tickIndex;
  OsmosisConcentratedLiquidityTickLiquidityNet(
      {required this.liquidityNet, this.tickIndex});
  factory OsmosisConcentratedLiquidityTickLiquidityNet.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityTickLiquidityNet(
        liquidityNet: decode.getField(1), tickIndex: decode.getField(2));
  }
  factory OsmosisConcentratedLiquidityTickLiquidityNet.fromJson(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityTickLiquidityNet(
        liquidityNet: json["liquidity_net"],
        tickIndex: BigintUtils.tryParse(json["tick_index"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"liquidity_net": liquidityNet, "tick_index": tickIndex?.toString()};
  }

  @override
  List get values => [liquidityNet, tickIndex];

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.tickLiquidityNet;
}
