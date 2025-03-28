import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'liquidity_per_tick_range_response.dart';

class OsmosisConcentratedLiquidityLiquidityPerTickRangeRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisConcentratedLiquidityLiquidityPerTickRangeResponse> {
  final BigInt? poolId;

  OsmosisConcentratedLiquidityLiquidityPerTickRangeRequest({
    this.poolId,
  });
  factory OsmosisConcentratedLiquidityLiquidityPerTickRangeRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityLiquidityPerTickRangeRequest(
        poolId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, String?> get queryParameters => {"pool_id": poolId?.toString()};

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.liquidityPerTickRangeRequest;

  @override
  List get values => [poolId];

  @override
  OsmosisConcentratedLiquidityLiquidityPerTickRangeResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityLiquidityPerTickRangeResponse.fromJson(
        json);
  }

  @override
  OsmosisConcentratedLiquidityLiquidityPerTickRangeResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityLiquidityPerTickRangeResponse
        .deserialize(bytes);
  }
}
