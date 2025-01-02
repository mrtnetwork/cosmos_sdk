import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/messages/swap_amount_out_route.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'estimate_swap_exact_amount_out_response.dart';

class OsmosisPoolManagerEstimateSwapExactAmountOutRequest extends CosmosMessage
    with QueryMessage<OsmosisPoolManagerEstimateSwapExactAmountOutResponse> {
  final BigInt poolId;
  final List<OsmosisPoolManagerSwapAmountOutRoute> routes;
  final String? tokenOut;

  OsmosisPoolManagerEstimateSwapExactAmountOutRequest(
      {required this.poolId,
      required List<OsmosisPoolManagerSwapAmountOutRoute> routes,
      this.tokenOut})
      : routes = routes.immutable;
  factory OsmosisPoolManagerEstimateSwapExactAmountOutRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerEstimateSwapExactAmountOutRequest(
        poolId: decode.getField(2),
        routes: decode
            .getFields(3)
            .map((e) => OsmosisPoolManagerSwapAmountOutRoute.deserialize(e))
            .toList(),
        tokenOut: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [2, 3, 4];

  @override
  OsmosisPoolManagerEstimateSwapExactAmountOutResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerEstimateSwapExactAmountOutResponse.fromRpc(json);
  }

  @override
  OsmosisPoolManagerEstimateSwapExactAmountOutResponse onResponse(
      List<int> bytes) {
    return OsmosisPoolManagerEstimateSwapExactAmountOutResponse.deserialize(
        bytes);
  }

  @override
  Map<String, String?> get queryParameters => {
        "token_out": tokenOut,
      };

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId.toString(),
      "routes": routes.map((e) => e.toJson()).toList(),
      "token_out": tokenOut
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolManagerV1beta1Types.estimateSwapExactAmountOutRequest;

  @override
  List get values => [poolId, routes, tokenOut];
  @override
  List<String> get pathParameters => [poolId.toString()];
}
