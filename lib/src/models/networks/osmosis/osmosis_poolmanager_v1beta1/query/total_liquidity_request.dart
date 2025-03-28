import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'total_liquidity_response.dart';

class OsmosisPoolManagerTotalLiquidityRequest extends CosmosMessage
    with QueryMessage<OsmosisPoolManagerTotalLiquidityResponse> {
  const OsmosisPoolManagerTotalLiquidityRequest();
  factory OsmosisPoolManagerTotalLiquidityRequest.deserialize(List<int> bytes) {
    return const OsmosisPoolManagerTotalLiquidityRequest();
  }
  @override
  List<int> get fieldIds => [];

  @override
  OsmosisPoolManagerTotalLiquidityResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerTotalLiquidityResponse.fromJson(json);
  }

  @override
  OsmosisPoolManagerTotalLiquidityResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerTotalLiquidityResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.totalLiquidityRequest;

  @override
  List get values => [];
}
