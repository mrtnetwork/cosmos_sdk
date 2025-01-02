import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'user_positions_response.dart';

class OsmosisConcentratedLiquidityUserPositionsRequest extends CosmosMessage
    with QueryMessage<OsmosisConcentratedLiquidityUserPositionsResponse> {
  final String address;
  final BigInt? poolId;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  OsmosisConcentratedLiquidityUserPositionsRequest({
    required this.address,
    this.poolId,
    this.pagination,
  });
  factory OsmosisConcentratedLiquidityUserPositionsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityUserPositionsRequest(
        address: decode.getField(1),
        poolId: decode.getField(2),
        pagination: decode
            .getResult(3)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, String?> get queryParameters => {"pool_id": poolId?.toString()};

  @override
  List<String> get pathParameters => [address];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pagination": pagination?.toJson(),
      "pool_id": poolId?.toString(),
      "address": address
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisConcentratedLiquidityV1beta1Types.userPositionsRequest;

  @override
  List get values => [address, poolId, pagination];

  @override
  OsmosisConcentratedLiquidityUserPositionsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityUserPositionsResponse.fromRpc(json);
  }

  @override
  OsmosisConcentratedLiquidityUserPositionsResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityUserPositionsResponse.deserialize(bytes);
  }
}
