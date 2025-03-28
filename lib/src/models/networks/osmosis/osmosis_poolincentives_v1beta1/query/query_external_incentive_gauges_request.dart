import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_external_incentive_gauges_response.dart';

class OsmosisPoolincentivesQueryExternalIncentiveGaugesRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisPoolincentivesQueryExternalIncentiveGaugesResponse> {
  OsmosisPoolincentivesQueryExternalIncentiveGaugesRequest();
  factory OsmosisPoolincentivesQueryExternalIncentiveGaugesRequest.deserialize(
      List<int> bytes) {
    return OsmosisPoolincentivesQueryExternalIncentiveGaugesRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  OsmosisPoolincentivesQueryExternalIncentiveGaugesResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisPoolincentivesQueryExternalIncentiveGaugesResponse.fromJson(
        json);
  }

  @override
  OsmosisPoolincentivesQueryExternalIncentiveGaugesResponse onResponse(
      List<int> bytes) {
    return OsmosisPoolincentivesQueryExternalIncentiveGaugesResponse
        .deserialize(bytes);
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolincentivesV1beta1Types.queryExternalIncentiveGaugesRequest;
  @override
  List get values => [];

  @override
  Map<String, String?> get queryParameters => {};
}
