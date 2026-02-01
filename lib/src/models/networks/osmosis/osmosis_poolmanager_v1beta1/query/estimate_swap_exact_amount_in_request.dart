import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/messages/swap_amount_in_route.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'estimate_swap_exact_mount_in_response.dart';

class OsmosisPoolManagerEstimateSwapExactAmountInRequest extends CosmosMessage
    with QueryMessage<OsmosisPoolManagerEstimateSwapExactAmountInResponse> {
  final BigInt poolId;
  final String? tokenIn;
  final List<OsmosisPoolManagerSwapAmountInRoute> routes;

  OsmosisPoolManagerEstimateSwapExactAmountInRequest({
    required this.poolId,
    this.tokenIn,
    required List<OsmosisPoolManagerSwapAmountInRoute> routes,
  }) : routes = routes.immutable;
  factory OsmosisPoolManagerEstimateSwapExactAmountInRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerEstimateSwapExactAmountInRequest(
      poolId: decode.getField(2),
      tokenIn: decode.getField(3),
      routes:
          decode
              .getFields<List<int>>(4)
              .map((e) => OsmosisPoolManagerSwapAmountInRoute.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [2, 3, 4];

  @override
  OsmosisPoolManagerEstimateSwapExactAmountInResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisPoolManagerEstimateSwapExactAmountInResponse.fromJson(json);
  }

  @override
  OsmosisPoolManagerEstimateSwapExactAmountInResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisPoolManagerEstimateSwapExactAmountInResponse.deserialize(
      bytes,
    );
  }

  @override
  Map<String, String?> get queryParameters => {"token_in": tokenIn};

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId.toString(),
      "token_in": tokenIn,
      "routes": routes.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolManagerV1beta1Types.estimateSwapExactAmountInRequest;

  @override
  List get values => [poolId, tokenIn, routes];

  @override
  List<String> get pathParameters => [poolId.toString()];
}
