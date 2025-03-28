import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/query/query_params_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisProtorevQueryParamsRequest extends CosmosMessage
    with QueryMessage<OsmosisProtorevQueryParamsResponse> {
  const OsmosisProtorevQueryParamsRequest();
  factory OsmosisProtorevQueryParamsRequest.deserialize(List<int> bytes) {
    return const OsmosisProtorevQueryParamsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List get values => [];

  @override
  OsmosisProtorevQueryParamsResponse onResponse(List<int> bytes) {
    return OsmosisProtorevQueryParamsResponse.deserialize(bytes);
  }

  @override
  OsmosisProtorevQueryParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisProtorevQueryParamsResponse.fromJson(json);
  }

  @override
  TypeUrl get typeUrl => OsmosisProtorevV1beta1Types.queryParamsRequest;

  @override
  Map<String, String?> get queryParameters => {};
}
