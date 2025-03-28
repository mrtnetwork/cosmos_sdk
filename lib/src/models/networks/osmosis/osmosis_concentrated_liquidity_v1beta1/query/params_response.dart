import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentratedliquidity/osmosis_concentratedliquidity.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisConcentratedLiquidityParamsResponse extends CosmosMessage {
  final OsmosisConcentratedLiquidityParams params;
  OsmosisConcentratedLiquidityParamsResponse(this.params);
  factory OsmosisConcentratedLiquidityParamsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityParamsResponse(
        OsmosisConcentratedLiquidityParams.deserialize(decode.getField(1)));
  }
  factory OsmosisConcentratedLiquidityParamsResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityParamsResponse(
        OsmosisConcentratedLiquidityParams.fromJson(json["params"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params.toJson()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.paramsResponse;

  @override
  List get values => [params];
}
