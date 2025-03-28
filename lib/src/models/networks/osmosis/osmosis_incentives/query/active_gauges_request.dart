import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'active_gauges_response.dart';

class OsmosisIncentiveActiveGaugesRequest extends CosmosMessage
    with QueryMessage<OsmosisIncentiveActiveGaugesResponse> {
  /// Pagination defines pagination for the request
  final PageRequest? pagination;
  const OsmosisIncentiveActiveGaugesRequest({this.pagination});
  factory OsmosisIncentiveActiveGaugesRequest.fromBytes(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveActiveGaugesRequest(
        pagination: decode
            .getResult(1)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisIncentiveActiveGaugesResponse onResponse(List<int> bytes) {
    return OsmosisIncentiveActiveGaugesResponse.deserialize(bytes);
  }

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisIncentivesTypes.activeGaugesRequest;

  @override
  List get values => [pagination];

  @override
  OsmosisIncentiveActiveGaugesResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisIncentiveActiveGaugesResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
