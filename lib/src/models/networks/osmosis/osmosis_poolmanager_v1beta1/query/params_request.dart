import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'params_response.dart';

class OsmosisPoolManagerParamsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisPoolManagerParamsResponse>,
        RPCMessage<OsmosisPoolManagerParamsResponse> {
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
  String get queryPath => OsmosisPoolManagerV1beta1Types.queryParams.typeUrl;

  @override
  String get rpcPath => OsmosisPoolManagerV1beta1Types.queryParams.rpcUrl();

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisPoolManagerV1beta1Types.paramsRequest.typeUrl;

  @override
  List get values => [];
}
