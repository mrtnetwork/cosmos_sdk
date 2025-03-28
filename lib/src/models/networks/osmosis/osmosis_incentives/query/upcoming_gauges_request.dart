import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'upcoming_gauges_response.dart';

class OsmosisIncentiveUpcomingGaugesRequest extends CosmosMessage
    with QueryMessage<OsmosisIncentiveUpcomingGaugesResponse> {
  /// Pagination defines pagination for the request
  final PageRequest? pagination;
  const OsmosisIncentiveUpcomingGaugesRequest({this.pagination});
  factory OsmosisIncentiveUpcomingGaugesRequest.fromBytes(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveUpcomingGaugesRequest(
        pagination: decode
            .getResult(1)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisIncentiveUpcomingGaugesResponse onResponse(List<int> bytes) {
    return OsmosisIncentiveUpcomingGaugesResponse.deserialize(bytes);
  }

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisIncentivesTypes.upcomingGaugesRequest;

  @override
  List get values => [pagination];

  @override
  OsmosisIncentiveUpcomingGaugesResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisIncentiveUpcomingGaugesResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
