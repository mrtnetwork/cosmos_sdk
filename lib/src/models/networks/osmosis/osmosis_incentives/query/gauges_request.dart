import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'gauges_response.dart';

class OsmosisIncentiveGaugesRequest extends CosmosMessage
    with QueryMessage<OsmosisIncentiveGaugesResponse> {
  /// Pagination defines pagination for the request
  final PageRequest? pagination;
  const OsmosisIncentiveGaugesRequest({this.pagination});
  factory OsmosisIncentiveGaugesRequest.fromBytes(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveGaugesRequest(
        pagination: decode
            .getResult(1)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisIncentiveGaugesResponse onResponse(List<int> bytes) {
    return OsmosisIncentiveGaugesResponse.deserialize(bytes);
  }

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisIncentivesTypes.gaugesRequest;

  @override
  List get values => [pagination];

  @override
  OsmosisIncentiveGaugesResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisIncentiveGaugesResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
