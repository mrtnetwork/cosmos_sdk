import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'query_total_pool_liquidity_response.dart';

class OsmosisGammQueryTotalPoolLiquidityRequest extends CosmosMessage
    with QueryMessage<OsmosisGammQueryTotalPoolLiquidityResponse> {
  final BigInt poolId;
  const OsmosisGammQueryTotalPoolLiquidityRequest(this.poolId);
  factory OsmosisGammQueryTotalPoolLiquidityRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryTotalPoolLiquidityRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisGammQueryTotalPoolLiquidityResponse onResponse(List<int> bytes) {
    return OsmosisGammQueryTotalPoolLiquidityResponse.deserialize(bytes);
  }

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.queryTotalPoolLiquidityRequest;

  @override
  List<String> get pathParameters => [poolId.toString()];

  @override
  List get values => [poolId];

  @override
  OsmosisGammQueryTotalPoolLiquidityResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisGammQueryTotalPoolLiquidityResponse.fromRpc(json);
  }

  @override
  Map<String, String> get queryParameters => {};
}
