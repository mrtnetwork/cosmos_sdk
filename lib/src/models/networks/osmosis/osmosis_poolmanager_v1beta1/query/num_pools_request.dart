import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'num_pools_response.dart';

class OsmosisPoolManagerNumPoolsRequest extends CosmosMessage
    with QueryMessage<OsmosisPoolManagerNumPoolsResponse> {
  const OsmosisPoolManagerNumPoolsRequest();
  factory OsmosisPoolManagerNumPoolsRequest.deserialize() {
    return const OsmosisPoolManagerNumPoolsRequest();
  }
  @override
  List<int> get fieldIds => [];

  @override
  OsmosisPoolManagerNumPoolsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisPoolManagerNumPoolsResponse.fromJson(json);
  }

  @override
  OsmosisPoolManagerNumPoolsResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerNumPoolsResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.numPoolsRequest;

  @override
  List get values => [];
}
