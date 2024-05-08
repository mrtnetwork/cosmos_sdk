import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'liquidity_net_in_direction_response.dart';

class OsmosisConcentratedLiquidityLiquidityNetInDirectionRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisConcentratedLiquidityLiquidityNetInDirectionResponse>,
        RPCMessage<
            OsmosisConcentratedLiquidityLiquidityNetInDirectionResponse> {
  final BigInt? poolId;
  final String? tokenIn;
  final BigInt? startTick;
  final bool? useCurTick;
  final BigInt? boundTick;
  final bool? useNoBound;

  const OsmosisConcentratedLiquidityLiquidityNetInDirectionRequest(
      {this.poolId,
      this.tokenIn,
      this.startTick,
      this.useCurTick,
      this.boundTick,
      this.useNoBound});
  factory OsmosisConcentratedLiquidityLiquidityNetInDirectionRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityLiquidityNetInDirectionRequest(
        poolId: decode.getField(1),
        tokenIn: decode.getField(2),
        startTick: decode.getField(3),
        useCurTick: decode.getField(4),
        boundTick: decode.getField(5),
        useNoBound: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, String?> get queryParameters => {
        "pool_id": poolId?.toString(),
        "token_in": tokenIn,
        "start_tick": startTick?.toString(),
        "use_cur_tick": useCurTick?.toString(),
        "bound_tick": boundTick?.toString(),
        "use_no_bound": useNoBound?.toString()
      };

  @override
  String get queryPath =>
      OsmosisConcentratedLiquidityV1beta1Types.liquidityNetInDirection.typeUrl;

  @override
  String get rpcPath =>
      OsmosisConcentratedLiquidityV1beta1Types.liquidityNetInDirection
          .rpcUrl(pathParameters: []);

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "token_in": tokenIn,
      "start_tick": startTick?.toString(),
      "use_cur_tick": useCurTick,
      "bound_tick": boundTick?.toString(),
      "use_no_bound": useNoBound
    };
  }

  @override
  String get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .liquidityNetInDirectionRequest.typeUrl;

  @override
  List get values =>
      [poolId, tokenIn, startTick, useCurTick, boundTick, useNoBound];

  @override
  OsmosisConcentratedLiquidityLiquidityNetInDirectionResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityLiquidityNetInDirectionResponse.fromRpc(
        json);
  }

  @override
  OsmosisConcentratedLiquidityLiquidityNetInDirectionResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityLiquidityNetInDirectionResponse
        .deserialize(bytes);
  }
}
