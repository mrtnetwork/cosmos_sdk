import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'all_pools_response.dart';

class OsmosisPoolManagerAllPoolsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisPoolManagerAllPoolsResponse>,
        RPCMessage<OsmosisPoolManagerAllPoolsResponse> {
  const OsmosisPoolManagerAllPoolsRequest();
  factory OsmosisPoolManagerAllPoolsRequest.deserialize(List<int> bytes) {
    return OsmosisPoolManagerAllPoolsRequest();
  }
  @override
  List<int> get fieldIds => [];

  @override
  OsmosisPoolManagerAllPoolsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisPoolManagerAllPoolsResponse.fromRpc(json);
  }

  @override
  OsmosisPoolManagerAllPoolsResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerAllPoolsResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisPoolManagerV1beta1Types.allPools.typeUrl;

  @override
  String get rpcPath => OsmosisPoolManagerV1beta1Types.allPools.rpcUrl();

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisPoolManagerV1beta1Types.allPoolsRequest.typeUrl;

  @override
  List get values => [];
}
