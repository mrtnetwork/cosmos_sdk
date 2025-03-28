import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'all_pools_response.dart';

class OsmosisPoolManagerAllPoolsRequest extends CosmosMessage
    with QueryMessage<OsmosisPoolManagerAllPoolsResponse> {
  const OsmosisPoolManagerAllPoolsRequest();
  factory OsmosisPoolManagerAllPoolsRequest.deserialize(List<int> bytes) {
    return const OsmosisPoolManagerAllPoolsRequest();
  }
  @override
  List<int> get fieldIds => [];

  @override
  OsmosisPoolManagerAllPoolsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisPoolManagerAllPoolsResponse.fromJson(json);
  }

  @override
  OsmosisPoolManagerAllPoolsResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerAllPoolsResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.allPoolsRequest;

  @override
  List get values => [];
}
