import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'claimable_spread_rewards_response.dart';

/// ClaimableSpreadRewards returns the amount of spread rewards that can be claimed by a position with the given id.
class OsmosisConcentratedLiquidityClaimableSpreadRewardsRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisConcentratedLiquidityClaimableSpreadRewardsResponse>,
        RPCMessage<OsmosisConcentratedLiquidityClaimableSpreadRewardsResponse> {
  final BigInt? positionId;

  const OsmosisConcentratedLiquidityClaimableSpreadRewardsRequest(
      {this.positionId});
  factory OsmosisConcentratedLiquidityClaimableSpreadRewardsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityClaimableSpreadRewardsRequest(
        positionId: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, String?> get queryParameters => {
        "position_id": positionId?.toString(),
      };

  @override
  String get queryPath =>
      OsmosisConcentratedLiquidityV1beta1Types.claimableSpreadRewards.typeUrl;

  @override
  String get rpcPath =>
      OsmosisConcentratedLiquidityV1beta1Types.claimableSpreadRewards
          .rpcUrl(pathParameters: []);

  @override
  Map<String, dynamic> toJson() {
    return {"position_id": positionId?.toString()};
  }

  @override
  String get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .claimableSpreadRewardsRequest.typeUrl;

  @override
  List get values => [positionId];

  @override
  OsmosisConcentratedLiquidityClaimableSpreadRewardsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityClaimableSpreadRewardsResponse.fromRpc(
        json);
  }

  @override
  OsmosisConcentratedLiquidityClaimableSpreadRewardsResponse onResponse(
      List<int> bytes) {
    return OsmosisConcentratedLiquidityClaimableSpreadRewardsResponse
        .deserialize(bytes);
  }
}
