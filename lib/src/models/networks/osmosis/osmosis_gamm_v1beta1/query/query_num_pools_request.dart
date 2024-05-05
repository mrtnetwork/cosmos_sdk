import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_gamm_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_num_pools_response.dart';

class OsmosisGammQueryNumPoolsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisGammQueryNumPoolsResponse>,
        RPCMessage<OsmosisGammQueryNumPoolsResponse> {
  const OsmosisGammQueryNumPoolsRequest();
  factory OsmosisGammQueryNumPoolsRequest.fromBytes(List<int> bytes) {
    return OsmosisGammQueryNumPoolsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  OsmosisGammQueryNumPoolsResponse onResponse(List<int> bytes) {
    return OsmosisGammQueryNumPoolsResponse.deserialize(bytes);
  }

  @override
  String get queryPath => OsmosisGammV1beta1Types.numPools.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisGammV1beta1Types.queryNumPoolsRequest.typeUrl;

  @override
  List get values => [];

  @override
  OsmosisGammQueryNumPoolsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisGammQueryNumPoolsResponse.fromRpc(json);
  }

  @override
  Map<String, String> get queryParameters => {};

  @override
  String get rpcPath => OsmosisGammV1beta1Types.numPools.rpcUrl();
}
