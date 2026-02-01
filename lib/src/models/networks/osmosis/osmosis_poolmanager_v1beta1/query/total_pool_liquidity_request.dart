import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'total_pool_liquidity_response.dart';

class OsmosisPoolManagerTotalPoolLiquidityRequest extends CosmosMessage
    with QueryMessage<OsmosisPoolManagerTotalPoolLiquidityResponse> {
  final BigInt poolId;
  const OsmosisPoolManagerTotalPoolLiquidityRequest({required this.poolId});
  factory OsmosisPoolManagerTotalPoolLiquidityRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerTotalPoolLiquidityRequest(
      poolId: decode.getField(1),
    );
  }
  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisPoolManagerTotalPoolLiquidityResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisPoolManagerTotalPoolLiquidityResponse.fromJson(json);
  }

  @override
  OsmosisPoolManagerTotalPoolLiquidityResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerTotalPoolLiquidityResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId.toString()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolManagerV1beta1Types.totalPoolLiquidityRequest;

  @override
  List get values => [poolId];

  @override
  List<String> get pathParameters => [poolId.toString()];
}
