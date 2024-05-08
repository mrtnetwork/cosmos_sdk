import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisConcentratedLiquidityClaimableSpreadRewardsResponse
    extends CosmosMessage {
  final List<Coin> claimableSpreadRewards;

  OsmosisConcentratedLiquidityClaimableSpreadRewardsResponse(
      List<Coin> claimableSpreadRewards)
      : claimableSpreadRewards = claimableSpreadRewards.mutable;
  factory OsmosisConcentratedLiquidityClaimableSpreadRewardsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityClaimableSpreadRewardsResponse(
        decode.getFields(1).map((e) => Coin.deserialize(e)).toList());
  }
  factory OsmosisConcentratedLiquidityClaimableSpreadRewardsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityClaimableSpreadRewardsResponse(
      (json["claimable_spread_rewards"] as List?)
              ?.map((e) => Coin.fromRpc(e))
              .toList() ??
          <Coin>[],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "claimable_spread_rewards":
          claimableSpreadRewards.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .claimableSpreadRewardsResponse.typeUrl;

  @override
  List get values => [claimableSpreadRewards];
}
