import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'params_response.dart';

class OsmosisConcentratedLiquidityParamsRequest extends CosmosMessage
    with QueryMessage<OsmosisConcentratedLiquidityParamsResponse> {
  OsmosisConcentratedLiquidityParamsRequest();
  factory OsmosisConcentratedLiquidityParamsRequest.deserialize(
    List<int> bytes,
  ) {
    return OsmosisConcentratedLiquidityParamsRequest();
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
  TypeUrl get typeUrl => OsmosisConcentratedLiquidityV1beta1Types.paramsRequest;

  @override
  List get values => [];

  @override
  OsmosisConcentratedLiquidityParamsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisConcentratedLiquidityParamsResponse.fromJson(json);
  }

  @override
  OsmosisConcentratedLiquidityParamsResponse onResponse(List<int> bytes) {
    return OsmosisConcentratedLiquidityParamsResponse.deserialize(bytes);
  }
}
