import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'get_total_liquidity_response.dart';

class OsmosisConcentratedLiquidityGetTotalLiquidityRequest extends CosmosMessage
    with QueryMessage<OsmosisConcentratedLiquidityGetTotalLiquidityResponse> {
  const OsmosisConcentratedLiquidityGetTotalLiquidityRequest();
  factory OsmosisConcentratedLiquidityGetTotalLiquidityRequest.deserialize(
      List<int> bytes) {
    return const OsmosisConcentratedLiquidityGetTotalLiquidityRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, String?> get queryParameters => {};

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.getTotalLiquidityRequest;

  @override
  List get values => [];

  @override
  OsmosisConcentratedLiquidityGetTotalLiquidityResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityGetTotalLiquidityResponse.fromRpc(json);
  }

  @override
  OsmosisConcentratedLiquidityGetTotalLiquidityResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityGetTotalLiquidityResponse.deserialize(
        bytes);
  }
}
