import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

import 'query_pool_response.dart';

class OsmosisGammQueryPoolRequest extends CosmosMessage
    with QueryMessage<OsmosisGammQueryPoolResponse> {
  /// pagination defines an optional pagination for the request.
  final BigInt poolId;
  const OsmosisGammQueryPoolRequest({required this.poolId});
  factory OsmosisGammQueryPoolRequest.fromBytes(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisGammQueryPoolRequest(poolId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisGammQueryPoolResponse onResponse(List<int> bytes) {
    return OsmosisGammQueryPoolResponse.deserialize(bytes);
  }

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisGammV1beta1Types.queryPoolRequest;
  @override
  List<String> get pathParameters => [poolId.toString()];

  @override
  List get values => [poolId];

  @override
  OsmosisGammQueryPoolResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisGammQueryPoolResponse.fromJson(json);
  }

  @override
  Map<String, String> get queryParameters => {};
}
