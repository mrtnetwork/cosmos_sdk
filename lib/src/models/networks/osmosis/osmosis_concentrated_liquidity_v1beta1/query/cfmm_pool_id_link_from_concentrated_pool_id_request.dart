import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'cfmm_pool_id_link_from_concentrated_pool_id_response.dart';

class OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdResponse> {
  final BigInt concentratedPoolId;

  const OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdRequest(
      {required this.concentratedPoolId});
  factory OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdRequest(
        concentratedPoolId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  List<String> get pathParameters => [concentratedPoolId.toString()];

  @override
  Map<String, dynamic> toJson() {
    return {"concentrated_pool_id": concentratedPoolId.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .cFMMPoolIdLinkFromConcentratedPoolIdRequest;

  @override
  List get values => [concentratedPoolId];

  @override
  OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdResponse
      onJsonResponse(Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdResponse
        .fromJson(json);
  }

  @override
  OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdResponse
      onResponse(List<int> bytes) {
    return OsmosisConcentratedLiquidityCFMMPoolIdLinkFromConcentratedPoolIdResponse
        .deserialize(bytes);
  }
}
