import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'query_total_liquidity_response.dart';

class OsmosisGammQueryTotalLiquidityRequest extends CosmosMessage
    with QueryMessage<OsmosisGammQueryTotalLiquidityResponse> {
  const OsmosisGammQueryTotalLiquidityRequest();
  factory OsmosisGammQueryTotalLiquidityRequest.fromBytes(List<int> bytes) {
    return const OsmosisGammQueryTotalLiquidityRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  OsmosisGammQueryTotalLiquidityResponse onResponse(List<int> bytes) {
    return OsmosisGammQueryTotalLiquidityResponse.deserialize(bytes);
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.queryTotalLiquidityRequest;

  @override
  List get values => [];

  @override
  OsmosisGammQueryTotalLiquidityResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisGammQueryTotalLiquidityResponse.fromJson(json);
  }

  @override
  Map<String, String> get queryParameters => {};
}
