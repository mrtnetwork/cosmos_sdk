import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_pool_params_response.dart';

class OsmosisGammQueryPoolParamsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisGammQueryPoolParamsResponse>,
        RPCMessage<OsmosisGammQueryPoolParamsResponse> {
  final BigInt? poolId;
  const OsmosisGammQueryPoolParamsRequest({this.poolId});
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
  String get queryPath => OsmosisGammV1beta1Types.queryPpoolParams.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString()};
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.queryPoolParamsRequest.typeUrl;

  @override
  List get values => [poolId];

  @override
  OsmosisGammQueryPoolParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisGammQueryPoolParamsResponse.fromRpc(json);
  }

  @override
  Map<String, String> get queryParameters => {};

  @override
  String get rpcPath => OsmosisGammV1beta1Types.queryPpoolParams
      .rpcUrl(pathParameters: [poolId?.toString()]);
}
