import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';

import 'query_pool_response.dart';

class OsmosisGammQueryPoolRequest extends CosmosMessage
    with
        QueryMessage<OsmosisGammQueryPoolResponse>,
        RPCMessage<OsmosisGammQueryPoolResponse> {
  /// pagination defines an optional pagination for the request.
  final BigInt? poolId;
  const OsmosisGammQueryPoolRequest({this.poolId});
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
  String get queryPath => OsmosisGammV1beta1Types.pool.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString()};
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.queryPoolRequest.typeUrl;

  @override
  List get values => [poolId];

  @override
  OsmosisGammQueryPoolResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisGammQueryPoolResponse.fromRpc(json);
  }

  @override
  Map<String, String> get queryParameters => {};

  @override
  String get rpcPath =>
      OsmosisGammV1beta1Types.pool.rpcUrl(pathParameters: [poolId?.toString()]);
}
