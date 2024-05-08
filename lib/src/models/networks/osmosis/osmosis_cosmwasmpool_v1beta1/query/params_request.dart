import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_cosmwasmpool_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'params_response.dart';

class OsmosisCosmWasmPoolParamsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisCosmWasmPoolParamsResponse>,
        RPCMessage<OsmosisCosmWasmPoolParamsResponse> {
  OsmosisCosmWasmPoolParamsRequest();
  factory OsmosisCosmWasmPoolParamsRequest.deserialize(List<int> bytes) {
    return OsmosisCosmWasmPoolParamsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => OsmosisCosmWasmPoolV1beta1Types.paramsRequest.typeUrl;

  @override
  List get values => [];

  @override
  OsmosisCosmWasmPoolParamsResponse onResponse(List<int> bytes) {
    return OsmosisCosmWasmPoolParamsResponse.deserialize(bytes);
  }

  @override
  OsmosisCosmWasmPoolParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisCosmWasmPoolParamsResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {};
  @override
  String get queryPath => OsmosisCosmWasmPoolV1beta1Types.queryParams.typeUrl;

  @override
  String get rpcPath => OsmosisCosmWasmPoolV1beta1Types.queryParams.rpcUrl();
}
