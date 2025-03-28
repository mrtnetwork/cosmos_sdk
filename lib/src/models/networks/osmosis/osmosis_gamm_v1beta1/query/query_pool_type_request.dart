import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'query_pool_type_response.dart';

class OsmosisGammQueryPoolTypeRequest extends CosmosMessage
    with QueryMessage<OsmosisGammQueryPoolTypeResponse> {
  final BigInt poolId;
  const OsmosisGammQueryPoolTypeRequest({required this.poolId});
  factory OsmosisGammQueryPoolTypeRequest.fromBytes(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryPoolTypeRequest(poolId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisGammQueryPoolTypeResponse onResponse(List<int> bytes) {
    return OsmosisGammQueryPoolTypeResponse.deserialize(bytes);
  }

  @override
  List<String> get pathParameters => [poolId.toString()];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.queryPoolTypeRequest;

  @override
  List get values => [poolId];

  @override
  OsmosisGammQueryPoolTypeResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisGammQueryPoolTypeResponse.fromJson(json);
  }

  @override
  Map<String, String> get queryParameters => {};
}
