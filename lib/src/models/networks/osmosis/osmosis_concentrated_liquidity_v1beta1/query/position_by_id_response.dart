import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/messages/full_position_breakdown.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisConcentratedLiquidityPositionByIdResponse extends CosmosMessage {
  final FullPositionBreakdown position;

  OsmosisConcentratedLiquidityPositionByIdResponse(this.position);
  factory OsmosisConcentratedLiquidityPositionByIdResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPositionByIdResponse(
        FullPositionBreakdown.deserialize(decode.getField(1)));
  }
  factory OsmosisConcentratedLiquidityPositionByIdResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityPositionByIdResponse(
        FullPositionBreakdown.fromRpc(json["position"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"position": position.toJson()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.positionByIdResponse;

  @override
  List get values => [position];
}
