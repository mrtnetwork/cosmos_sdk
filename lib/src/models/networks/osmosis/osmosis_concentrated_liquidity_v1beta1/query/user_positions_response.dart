import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/messages/full_position_breakdown.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisConcentratedLiquidityUserPositionsResponse extends CosmosMessage {
  final List<FullPositionBreakdown> positions;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;

  OsmosisConcentratedLiquidityUserPositionsResponse({
    required List<FullPositionBreakdown> positions,
    this.pagination,
  }) : positions = positions.immutable;
  factory OsmosisConcentratedLiquidityUserPositionsResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityUserPositionsResponse(
      positions:
          decode
              .getFields<List<int>>(1)
              .map((e) => FullPositionBreakdown.deserialize(e))
              .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
    );
  }
  factory OsmosisConcentratedLiquidityUserPositionsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisConcentratedLiquidityUserPositionsResponse(
      positions:
          (json["positions"] as List?)
              ?.map((e) => FullPositionBreakdown.fromJson(e))
              .toList() ??
          <FullPositionBreakdown>[],
      pagination:
          json["pagination"] == null
              ? null
              : PageResponse.fromJson(json["pagination"]),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "positions": positions.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.userPositionsResponse;

  @override
  List get values => [positions, pagination];
}
