import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'query_total_liquidity_response.dart';

class OsmosisGammQueryTotalLiquidityRequest extends CosmosMessage
    with
        QueryMessage<OsmosisGammQueryTotalLiquidityResponse>,
        RPCMessage<OsmosisGammQueryTotalLiquidityResponse> {
  const OsmosisGammQueryTotalLiquidityRequest();
  factory OsmosisGammQueryTotalLiquidityRequest.fromBytes(List<int> bytes) {
    return OsmosisGammQueryTotalLiquidityRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  OsmosisGammQueryTotalLiquidityResponse onResponse(List<int> bytes) {
    return OsmosisGammQueryTotalLiquidityResponse.deserialize(bytes);
  }

  @override
  String get queryPath => OsmosisGammV1beta1Types.totalLiquidity.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl =>
      OsmosisGammV1beta1Types.queryTotalLiquidityRequest.typeUrl;

  @override
  List get values => [];

  @override
  OsmosisGammQueryTotalLiquidityResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisGammQueryTotalLiquidityResponse.fromRpc(json);
  }

  @override
  Map<String, String> get queryParameters => {};

  @override
  String get rpcPath => OsmosisGammV1beta1Types.totalLiquidity.rpcUrl();
}
