import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/messages/gauge.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisIncentiveActiveGaugesPerDenomResponse extends CosmosMessage {
  /// Active gagues that match denom in query
  final List<OsmosisIncentivesGauge> data;

  /// Pagination defines pagination for the response
  final PageResponse? pagination;
  OsmosisIncentiveActiveGaugesPerDenomResponse({
    required List<OsmosisIncentivesGauge> data,
    this.pagination,
  }) : data = data.immutable;
  factory OsmosisIncentiveActiveGaugesPerDenomResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveActiveGaugesPerDenomResponse(
        data: decode
            .getFields<List<int>>(1)
            .map((e) => OsmosisIncentivesGauge.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }
  factory OsmosisIncentiveActiveGaugesPerDenomResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisIncentiveActiveGaugesPerDenomResponse(
        data: (json["data"] as List?)
                ?.map((e) => OsmosisIncentivesGauge.fromJson(e))
                .toList() ??
            <OsmosisIncentivesGauge>[],
        pagination: PageResponse.fromJson(json["pagination"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "data": data.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisIncentivesTypes.activeGaugesPerDenomResponse;

  @override
  List get values => [data, pagination];
}
