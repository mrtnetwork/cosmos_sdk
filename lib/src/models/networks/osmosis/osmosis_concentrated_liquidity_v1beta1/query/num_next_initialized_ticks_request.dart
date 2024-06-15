import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'num_next_initialized_ticks_response.dart';

class OsmosisConcentratedLiquidityNumNextInitializedTicksRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisConcentratedLiquidityNumNextInitializedTicksResponse>,
        RPCMessage<
            OsmosisConcentratedLiquidityNumNextInitializedTicksResponse> {
  final BigInt? poolId;
  final String? tokenInDenom;
  final BigInt? numNextInitializedTicks;
  OsmosisConcentratedLiquidityNumNextInitializedTicksRequest(
      {this.poolId, this.tokenInDenom, this.numNextInitializedTicks});
  factory OsmosisConcentratedLiquidityNumNextInitializedTicksRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityNumNextInitializedTicksRequest(
        poolId: decode.getField(1),
        tokenInDenom: decode.getField(2),
        numNextInitializedTicks: decode.getField(3));
  }
  factory OsmosisConcentratedLiquidityNumNextInitializedTicksRequest.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityNumNextInitializedTicksRequest(
        poolId: BigintUtils.tryParse(json["pool_id"]),
        numNextInitializedTicks:
            BigintUtils.tryParse(json["num_next_initialized_ticks"]),
        tokenInDenom: json["token_in_denom"]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "token_in_denom": tokenInDenom,
      "num_next_initialized_ticks": numNextInitializedTicks?.toString()
    };
  }

  @override
  String get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .numNextInitializedTicksRequest.typeUrl;

  @override
  List get values => [poolId, tokenInDenom, numNextInitializedTicks];

  @override
  Map<String, String?> get queryParameters => {
        "pool_id": poolId?.toString(),
        "token_in_denom": tokenInDenom,
        "num_next_initialized_ticks": numNextInitializedTicks?.toString()
      };

  @override
  String get queryPath =>
      OsmosisConcentratedLiquidityV1beta1Types.numNextInitializedTicks.typeUrl;

  @override
  String get rpcPath =>
      OsmosisConcentratedLiquidityV1beta1Types.numNextInitializedTicks.rpcUrl();

  @override
  OsmosisConcentratedLiquidityNumNextInitializedTicksResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityNumNextInitializedTicksResponse.fromRpc(
        json);
  }

  @override
  OsmosisConcentratedLiquidityNumNextInitializedTicksResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityNumNextInitializedTicksResponse
        .deserialize(bytes);
  }
}
