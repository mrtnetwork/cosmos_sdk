import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import '../../../../sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'pools_response.dart';

class OsmosisConcentratedLiquidityPoolsRequest extends CosmosMessage
    with QueryMessage<OsmosisConcentratedLiquidityPoolsResponse> {
  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  OsmosisConcentratedLiquidityPoolsRequest({this.pagination});
  factory OsmosisConcentratedLiquidityPoolsRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPoolsRequest(
      pagination: decode
          .getResult(2)
          ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)),
    );
  }

  @override
  List<int> get fieldIds => [2];

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisConcentratedLiquidityV1beta1Types.poolsRequest;

  @override
  List get values => [pagination];

  @override
  OsmosisConcentratedLiquidityPoolsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisConcentratedLiquidityPoolsResponse.fromJson(json);
  }

  @override
  OsmosisConcentratedLiquidityPoolsResponse onResponse(List<int> bytes) {
    return OsmosisConcentratedLiquidityPoolsResponse.deserialize(bytes);
  }
}
