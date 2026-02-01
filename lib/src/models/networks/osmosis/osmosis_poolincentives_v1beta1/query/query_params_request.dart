import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_params_response.dart';

class OsmosisPoolincentivesQueryParamsRequest extends CosmosMessage
    with QueryMessage<OsmosisPoolincentivesQueryParamsResponse> {
  OsmosisPoolincentivesQueryParamsRequest();
  factory OsmosisPoolincentivesQueryParamsRequest.deserialize(List<int> bytes) {
    return OsmosisPoolincentivesQueryParamsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  OsmosisPoolincentivesQueryParamsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisPoolincentivesQueryParamsResponse.fromJson(json);
  }

  @override
  OsmosisPoolincentivesQueryParamsResponse onResponse(List<int> bytes) {
    return OsmosisPoolincentivesQueryParamsResponse.deserialize(bytes);
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolincentivesV1beta1Types.queryParamsRequest;
  @override
  List get values => [];

  @override
  Map<String, String?> get queryParameters => {};
}
