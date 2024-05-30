import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'get_total_liquidity_response.dart';

class OsmosisConcentratedLiquidityGetTotalLiquidityRequest extends CosmosMessage
    with
        QueryMessage<OsmosisConcentratedLiquidityGetTotalLiquidityResponse>,
        RPCMessage<OsmosisConcentratedLiquidityGetTotalLiquidityResponse> {
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
  String get queryPath =>
      OsmosisConcentratedLiquidityV1beta1Types.getTotalLiquidity.typeUrl;

  @override
  String get rpcPath =>
      OsmosisConcentratedLiquidityV1beta1Types.getTotalLiquidity
          .rpcUrl(pathParameters: []);

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.getTotalLiquidityRequest.typeUrl;

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
