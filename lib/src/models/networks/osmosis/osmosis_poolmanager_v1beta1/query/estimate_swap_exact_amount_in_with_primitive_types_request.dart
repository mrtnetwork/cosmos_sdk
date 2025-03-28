import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'estimate_swap_exact_mount_in_response.dart';

class OsmosisPoolManagerEstimateSwapExactAmountInWithPrimitiveTypesRequest
    extends CosmosMessage
    with QueryMessage<OsmosisPoolManagerEstimateSwapExactAmountInResponse> {
  final BigInt poolId;
  final String? tokenIn;
  final List<BigInt>? routesPoolId;
  final List<String>? routesTokenOutDenom;

  OsmosisPoolManagerEstimateSwapExactAmountInWithPrimitiveTypesRequest(
      {required this.poolId,
      this.tokenIn,
      List<BigInt>? routesPoolId,
      List<String>? routesTokenOutDenom})
      : routesPoolId = routesPoolId?.emptyAsNull?.immutable,
        routesTokenOutDenom = routesTokenOutDenom?.emptyAsNull?.immutable;
  factory OsmosisPoolManagerEstimateSwapExactAmountInWithPrimitiveTypesRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerEstimateSwapExactAmountInWithPrimitiveTypesRequest(
        poolId: decode.getField(1),
        tokenIn: decode.getField(2),
        routesPoolId: decode
                .getResult<ProtocolBufferDecoderResult?>(3)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[],
        routesTokenOutDenom: decode.getFields<String>(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  OsmosisPoolManagerEstimateSwapExactAmountInResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerEstimateSwapExactAmountInResponse.fromJson(json);
  }

  @override
  OsmosisPoolManagerEstimateSwapExactAmountInResponse onResponse(
      List<int> bytes) {
    return OsmosisPoolManagerEstimateSwapExactAmountInResponse.deserialize(
        bytes);
  }

  @override
  Map<String, String?> get queryParameters => {
        "token_in": tokenIn,
      };

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId.toString(),
      "token_in": tokenIn,
      "routes_pool_id": routesPoolId?.map((e) => e.toString()).toList(),
      "routes_token_out_denom": routesTokenOutDenom
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types
      .estimateSwapExactAmountInWithPrimitiveTypesRequest;

  @override
  List get values => [poolId, tokenIn, routesPoolId, routesTokenOutDenom];

  @override
  List<String> get pathParameters => [poolId.toString()];
}
