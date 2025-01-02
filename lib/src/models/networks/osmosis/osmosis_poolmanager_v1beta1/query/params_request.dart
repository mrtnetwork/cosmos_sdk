import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'params_response.dart';

class OsmosisPoolManagerParamsRequest extends CosmosMessage
    with QueryMessage<OsmosisPoolManagerParamsResponse> {
  @override
  List<int> get fieldIds => [];

  @override
  OsmosisPoolManagerParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisPoolManagerParamsResponse.fromRpc(json);
  }

  @override
  OsmosisPoolManagerParamsResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerParamsResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.paramsRequest;

  @override
  List get values => [];
}
