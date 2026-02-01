import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'upcoming_gauges_per_denom_response.dart';

class OsmosisIncentiveUpcomingGaugesPerDenomRequest extends CosmosMessage
    with QueryMessage<OsmosisIncentiveUpcomingGaugesPerDenomResponse> {
  /// Filter for upcoming gagues that match specific denom
  final String? denom;

  /// Pagination defines pagination for the request
  final PageRequest? pagination;
  const OsmosisIncentiveUpcomingGaugesPerDenomRequest({
    this.denom,
    this.pagination,
  });
  factory OsmosisIncentiveUpcomingGaugesPerDenomRequest.fromBytes(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveUpcomingGaugesPerDenomRequest(
      denom: decode.getField(1),
      pagination: decode
          .getResult(2)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  OsmosisIncentiveUpcomingGaugesPerDenomResponse onResponse(List<int> bytes) {
    return OsmosisIncentiveUpcomingGaugesPerDenomResponse.deserialize(bytes);
  }

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson(), "denom": denom};
  }

  @override
  TypeUrl get typeUrl => OsmosisIncentivesTypes.upcomingGaugesPerDenomRequest;

  @override
  List get values => [denom, pagination];

  @override
  OsmosisIncentiveUpcomingGaugesPerDenomResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisIncentiveUpcomingGaugesPerDenomResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {
    "denom": denom,
    ...pagination?.queryParameters ?? {},
  };
}
