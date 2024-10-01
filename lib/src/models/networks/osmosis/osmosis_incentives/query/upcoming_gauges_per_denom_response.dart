import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/messages/gauge.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisIncentiveUpcomingGaugesPerDenomResponse extends CosmosMessage {
  /// Upcoming gagues that match denom in query
  final List<OsmosisIncentivesGauge> upcomingGauges;

  /// Pagination defines pagination for the response
  final PageResponse? pagination;
  OsmosisIncentiveUpcomingGaugesPerDenomResponse({
    required List<OsmosisIncentivesGauge> upcomingGauges,
    this.pagination,
  }) : upcomingGauges = upcomingGauges.immutable;
  factory OsmosisIncentiveUpcomingGaugesPerDenomResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveUpcomingGaugesPerDenomResponse(
        upcomingGauges: decode
            .getFields(1)
            .map((e) => OsmosisIncentivesGauge.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }
  factory OsmosisIncentiveUpcomingGaugesPerDenomResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisIncentiveUpcomingGaugesPerDenomResponse(
        upcomingGauges: (json["upcoming_gauges"] as List?)
                ?.map((e) => OsmosisIncentivesGauge.fromRpc(e))
                .toList() ??
            <OsmosisIncentivesGauge>[],
        pagination: PageResponse.fromRpc(json["pagination"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "upcoming_gauges": upcomingGauges.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl =>
      OsmosisIncentivesTypes.upcomingGaugesPerDenomResponse.typeUrl;

  @override
  List get values => [upcomingGauges, pagination];
}
