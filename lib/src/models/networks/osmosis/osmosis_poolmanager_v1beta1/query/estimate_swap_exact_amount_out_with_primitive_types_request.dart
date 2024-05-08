import 'package:blockchain_utils/numbers/numbers.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'estimate_swap_exact_amount_out_response.dart';

class OsmosisPoolManagerEstimateSwapExactAmountOutWithPrimitiveTypesRequest
    extends CosmosMessage
    with
        QueryMessage<OsmosisPoolManagerEstimateSwapExactAmountOutResponse>,
        RPCMessage<OsmosisPoolManagerEstimateSwapExactAmountOutResponse> {
  final BigInt? poolId;
  final List<BigInt>? routesPoolId;
  final List<String>? routesTokenInDenom;
  final String? tokenOut;

  OsmosisPoolManagerEstimateSwapExactAmountOutWithPrimitiveTypesRequest(
      {this.poolId,
      this.tokenOut,
      List<BigInt>? routesPoolId,
      List<String>? routesTokenInDenom})
      : routesPoolId = routesPoolId?.nullOnEmpy,
        routesTokenInDenom = routesTokenInDenom?.nullOnEmpy;
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
  String get queryPath => OsmosisPoolManagerV1beta1Types
      .estimateSwapExactAmountOutWithPrimitiveTypes.typeUrl;

  @override
  String get rpcPath => OsmosisPoolManagerV1beta1Types
      .estimateSwapExactAmountOutWithPrimitiveTypes
      .rpcUrl(pathParameters: [poolId?.toString()]);

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "token_out": tokenOut,
      "routes_pool_id": routesPoolId?.map((e) => e.toString()).toList(),
      "routes_token_in_denom": routesTokenInDenom
    };
  }

  @override
  String get typeUrl => OsmosisPoolManagerV1beta1Types
      .estimateSwapExactAmountOutWithPrimitiveTypesRequest.typeUrl;

  @override
  List get values => [poolId, routesPoolId, routesTokenInDenom, tokenOut];
}
