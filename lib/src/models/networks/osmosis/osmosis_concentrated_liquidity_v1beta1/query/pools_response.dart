import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisConcentratedLiquidityPoolsResponse extends CosmosMessage {
  /// pagination defines an optional pagination for the request.
  final List<Any>? pools;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;

  OsmosisConcentratedLiquidityPoolsResponse({List<Any>? pools, this.pagination})
      : pools = pools?.emptyAsNull?.immutable;
  factory OsmosisConcentratedLiquidityPoolsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPoolsResponse(
        pools: decode.getFields(1).map((e) => Any.deserialize(e)).toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }
  factory OsmosisConcentratedLiquidityPoolsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityPoolsResponse(
        pools: (json["pools"] as List?)?.map((e) => Any.fromRpc(e)).toList(),
        pagination: json["pagination"] == null
            ? null
            : PageResponse.fromRpc(json["pagination"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pools": pools?.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.poolsResponse.typeUrl;

  @override
  List get values => [pools, pagination];
}
