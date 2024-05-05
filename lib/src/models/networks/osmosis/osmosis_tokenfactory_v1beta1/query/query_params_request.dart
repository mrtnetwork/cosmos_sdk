import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_params_response.dart';

/// Params defines a gRPC query method that returns the tokenfactory module's parameters.
class OsmosisTokenFactoryQueryParamsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisTokenFactoryQueryParamsResponse>,
        RPCMessage<OsmosisTokenFactoryQueryParamsResponse> {
  OsmosisTokenFactoryQueryParamsRequest();
  factory OsmosisTokenFactoryQueryParamsRequest.deserialize(List<int> bytes) {
    return OsmosisTokenFactoryQueryParamsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl =>
      OsmosisTokenFactoryV1beta1Types.queryParamsRequest.typeUrl;

  @override
  List get values => [];

  @override
  OsmosisTokenFactoryQueryParamsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisTokenFactoryQueryParamsResponse.fromRpc(json);
  }

  @override
  OsmosisTokenFactoryQueryParamsResponse onResponse(List<int> bytes) {
    return OsmosisTokenFactoryQueryParamsResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath => OsmosisTokenFactoryV1beta1Types.queryParams.typeUrl;

  @override
  String get rpcPath => OsmosisTokenFactoryV1beta1Types.queryParams.rpcUrl();
}
