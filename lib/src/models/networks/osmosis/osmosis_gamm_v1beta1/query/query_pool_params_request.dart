import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_pool_params_response.dart';

class OsmosisGammQueryPoolParamsRequest extends CosmosMessage
    with QueryMessage<OsmosisGammQueryPoolParamsResponse> {
  final BigInt poolId;
  const OsmosisGammQueryPoolParamsRequest({required this.poolId});
  factory OsmosisGammQueryPoolParamsRequest.fromBytes(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryPoolParamsRequest(poolId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisGammQueryPoolParamsResponse onResponse(List<int> bytes) {
    return OsmosisGammQueryPoolParamsResponse.deserialize(bytes);
  }

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId.toString()};
  }

  @override
  List<String> get pathParameters => [poolId.toString()];

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.queryPoolParamsRequest;

  @override
  List get values => [poolId];

  @override
  OsmosisGammQueryPoolParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisGammQueryPoolParamsResponse.fromRpc(json);
  }

  @override
  Map<String, String> get queryParameters => {};
}
