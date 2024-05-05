import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/messages/gauge.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisIncentiveGaugesResponse extends CosmosMessage {
  /// Upcoming and active gauges
  final List<OsmosisIncentivesGauge> data;

  /// Pagination defines pagination for the response
  final PageResponse? pagination;
  OsmosisIncentiveGaugesResponse({
    required List<OsmosisIncentivesGauge> data,
    this.pagination,
  }) : data = data.mutable;
  factory OsmosisIncentiveGaugesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveGaugesResponse(
        data: decode
            .getFields(1)
            .map((e) => OsmosisIncentivesGauge.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }
  factory OsmosisIncentiveGaugesResponse.fromRpc(Map<String, dynamic> json) {
    return OsmosisIncentiveGaugesResponse(
        data: (json["data"] as List?)
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
      "data": data.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl => OsmosisIncentivesTypes.gaugesResponse.typeUrl;

  @override
  List get values => [data, pagination];
}
