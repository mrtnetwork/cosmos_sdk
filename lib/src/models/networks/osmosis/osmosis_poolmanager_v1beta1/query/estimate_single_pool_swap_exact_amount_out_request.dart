import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'estimate_swap_exact_amount_out_response.dart';

class OsmosisPoolManagerEstimateSinglePoolSwapExactAmountOutRequest
    extends CosmosMessage
    with QueryMessage<OsmosisPoolManagerEstimateSwapExactAmountOutResponse> {
  final BigInt poolId;
  final String? tokenInDenom;
  final String? tokenOut;

  OsmosisPoolManagerEstimateSinglePoolSwapExactAmountOutRequest(
      {required this.poolId, this.tokenInDenom, this.tokenOut});
  factory OsmosisPoolManagerEstimateSinglePoolSwapExactAmountOutRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerEstimateSinglePoolSwapExactAmountOutRequest(
        poolId: decode.getField(1),
        tokenInDenom: decode.getField(2),
        tokenOut: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  OsmosisPoolManagerEstimateSwapExactAmountOutResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisPoolManagerEstimateSwapExactAmountOutResponse.fromJson(json);
  }

  @override
  OsmosisPoolManagerEstimateSwapExactAmountOutResponse onResponse(
      List<int> bytes) {
    return OsmosisPoolManagerEstimateSwapExactAmountOutResponse.deserialize(
        bytes);
  }

  @override
  Map<String, String?> get queryParameters =>
      {"token_out": tokenOut, "token_in_denom": tokenInDenom};

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId.toString(),
      "token_out": tokenOut,
      "token_in_denom": tokenInDenom
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types
      .estimateSinglePoolSwapExactAmountOutRequest;

  @override
  List get values => [poolId, tokenInDenom, tokenOut];

  @override
  List<String> get pathParameters => [poolId.toString()];
}
