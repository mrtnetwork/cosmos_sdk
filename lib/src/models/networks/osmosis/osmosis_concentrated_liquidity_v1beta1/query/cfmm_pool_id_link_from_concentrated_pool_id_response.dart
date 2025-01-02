import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdResponse
    extends CosmosMessage {
  final BigInt? cfmmPoolId;

  OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdResponse(
      {this.cfmmPoolId});
  factory OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdResponse(
        cfmmPoolId: decode.getField(1));
  }
  factory OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdResponse(
        cfmmPoolId: BigintUtils.tryParse(json["cfmm_pool_id"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"cfmm_pool_id": cfmmPoolId?.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .cFMMPoolIdLinkFromConcentratedPoolIdResponse;

  @override
  List get values => [cfmmPoolId];
}
