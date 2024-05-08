import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'total_liquidity_response.dart';

class OsmosisPoolManagerTotalLiquidityRequest extends CosmosMessage
    with
        QueryMessage<OsmosisPoolManagerTotalLiquidityResponse>,
        RPCMessage<OsmosisPoolManagerTotalLiquidityResponse> {
  const OsmosisPoolManagerTotalLiquidityRequest();
  factory OsmosisPoolManagerTotalLiquidityRequest.deserialize(List<int> bytes) {
    return OsmosisPoolManagerTotalLiquidityRequest();
  }
  @override
  List<int> get fieldIds => [];

  @override
  OsmosisPoolManagerTotalLiquidityResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerTotalLiquidityResponse.fromRpc(json);
  }

  @override
  OsmosisPoolManagerTotalLiquidityResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerTotalLiquidityResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisPoolManagerV1beta1Types.totalLiquidity.typeUrl;

  @override
  String get rpcPath => OsmosisPoolManagerV1beta1Types.totalLiquidity.rpcUrl();

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl =>
      OsmosisPoolManagerV1beta1Types.totalLiquidityRequest.typeUrl;

  @override
  List get values => [];
}
