import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_accum_v1beta1/osmosis_accum_v1beta1.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisConcentratedLiquidityAccumObject extends CosmosMessage {
  /// Accumulator's name (pulled from AccumulatorContent)
  final String? name;
  final OsmosisAccumAccumulatorContent? accumContent;
  OsmosisConcentratedLiquidityAccumObject({this.name, this.accumContent});
  factory OsmosisConcentratedLiquidityAccumObject.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityAccumObject(
        name: decode.getField(1),
        accumContent: decode
            .getResult(2)
            ?.to<OsmosisAccumAccumulatorContent, List<int>>(
                (e) => OsmosisAccumAccumulatorContent.deserialize(e)));
  }
  factory OsmosisConcentratedLiquidityAccumObject.fromJson(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityAccumObject(
        name: json["name"],
        accumContent: json["accum_content"] == null
            ? null
            : OsmosisAccumAccumulatorContent.fromJson(json["accum_content"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"name": name, "accum_content": accumContent?.toJson()};
  }

  @override
  List get values => [name, accumContent];

  @override
  TypeUrl get typeUrl => OsmosisConcentratedLiquidityV1beta1Types.accumObject;
}
