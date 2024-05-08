import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'pool_accumulator_rewards_response.dart';

class OsmosisConcentratedLiquidityPoolAccumulatorRewardsRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisConcentratedLiquidityPoolAccumulatorRewardsResponse>,
        RPCMessage<OsmosisConcentratedLiquidityPoolAccumulatorRewardsResponse> {
  final BigInt? poolId;
  OsmosisConcentratedLiquidityPoolAccumulatorRewardsRequest({this.poolId});
  factory OsmosisConcentratedLiquidityPoolAccumulatorRewardsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityPoolAccumulatorRewardsRequest(
        poolId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, String?> get queryParameters => {"pool_id": poolId?.toString()};

  @override
  String get queryPath =>
      OsmosisConcentratedLiquidityV1beta1Types.poolAccumulatorRewards.typeUrl;

  @override
  String get rpcPath =>
      OsmosisConcentratedLiquidityV1beta1Types.poolAccumulatorRewards.rpcUrl();

  @override
  Map<String, dynamic> toJson() {
    return {"pool_id": poolId?.toString()};
  }

  @override
  String get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .poolAccumulatorRewardsRequest.typeUrl;

  @override
  List get values => [poolId];

  @override
  OsmosisConcentratedLiquidityPoolAccumulatorRewardsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityPoolAccumulatorRewardsResponse.fromRpc(
        json);
  }

  @override
  OsmosisConcentratedLiquidityPoolAccumulatorRewardsResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityPoolAccumulatorRewardsResponse
        .deserialize(bytes);
  }
}
