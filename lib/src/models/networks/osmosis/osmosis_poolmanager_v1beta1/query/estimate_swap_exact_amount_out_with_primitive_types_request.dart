import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'estimate_swap_exact_amount_out_response.dart';

class OsmosisPoolManagerEstimateSwapExactAmountOutWithPrimitiveTypesRequest
    extends CosmosMessage
    with QueryMessage<OsmosisPoolManagerEstimateSwapExactAmountOutResponse> {
  final BigInt poolId;
  final List<BigInt>? routesPoolId;
  final List<String>? routesTokenInDenom;
  final String? tokenOut;

  OsmosisPoolManagerEstimateSwapExactAmountOutWithPrimitiveTypesRequest(
      {required this.poolId,
      this.tokenOut,
      List<BigInt>? routesPoolId,
      List<String>? routesTokenInDenom})
      : routesPoolId = routesPoolId?.emptyAsNull?.immutable,
        routesTokenInDenom = routesTokenInDenom?.emptyAsNull?.immutable;
  factory OsmosisPoolManagerEstimateSwapExactAmountOutWithPrimitiveTypesRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerEstimateSwapExactAmountOutWithPrimitiveTypesRequest(
        poolId: decode.getField(1),
        routesPoolId: decode
                .getResult<ProtocolBufferDecoderResult?>(2)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[],
        routesTokenInDenom: decode.getFields<String>(3),
        tokenOut: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

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
      "token_out": tokenOut,
      "routes_pool_id": routesPoolId?.map((e) => e.toString()).toList(),
      "routes_token_in_denom": routesTokenInDenom
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types
      .estimateSwapExactAmountOutWithPrimitiveTypesRequest;

  @override
  List get values => [poolId, routesPoolId, routesTokenInDenom, tokenOut];
  @override
  List<String> get pathParameters => [poolId.toString()];
}
