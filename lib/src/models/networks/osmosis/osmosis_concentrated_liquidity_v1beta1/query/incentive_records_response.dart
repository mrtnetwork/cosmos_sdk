import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/messages/incentive_record.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisConcentratedLiquidityIncentiveRecordsResponse
    extends CosmosMessage {
  final List<OsmosisConcentratedLiquidityIncentiveRecord> incentiveRecords;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;

  OsmosisConcentratedLiquidityIncentiveRecordsResponse(
      {required List<OsmosisConcentratedLiquidityIncentiveRecord>
          incentiveRecords,
      this.pagination})
      : incentiveRecords = incentiveRecords.immutable;
  factory OsmosisConcentratedLiquidityIncentiveRecordsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityIncentiveRecordsResponse(
        incentiveRecords: decode
            .getFields(1)
            .map((e) =>
                OsmosisConcentratedLiquidityIncentiveRecord.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }
  factory OsmosisConcentratedLiquidityIncentiveRecordsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityIncentiveRecordsResponse(
        incentiveRecords: (json["incentive_records"] as List?)
                ?.map((e) =>
                    OsmosisConcentratedLiquidityIncentiveRecord.fromRpc(e))
                .toList() ??
            <OsmosisConcentratedLiquidityIncentiveRecord>[],
        pagination: json["pagination"] == null
            ? null
            : PageResponse.fromRpc(json["pagination"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "incentive_records": incentiveRecords.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.incentiveRecordsResponse.typeUrl;

  @override
  List get values => [incentiveRecords, pagination];
}
