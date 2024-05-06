import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// Position contains position's id, address, pool id, lower tick, upper tick join time, and liquidity.
class OsmosisConcentratedLiquidityMsgCollectSpreadRewardsResponse
    extends CosmosMessage {
  final List<Coin> collectedSpreadRewards;

  OsmosisConcentratedLiquidityMsgCollectSpreadRewardsResponse(
      List<Coin> collectedSpreadRewards)
      : collectedSpreadRewards = collectedSpreadRewards.mutable;
  factory OsmosisConcentratedLiquidityMsgCollectSpreadRewardsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityMsgCollectSpreadRewardsResponse(
        decode.getFields(1).map((e) => Coin.deserialize(e)).toList());
  }
  factory OsmosisConcentratedLiquidityMsgCollectSpreadRewardsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityMsgCollectSpreadRewardsResponse(
        (json["collected_spread_rewards"] as List?)
                ?.map((e) => Coin.fromRpc(e))
                .toList() ??
            <Coin>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "collected_spread_rewards":
          collectedSpreadRewards.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values => [collectedSpreadRewards];

  @override
  String get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .msgCollectSpreadRewardsResponse.typeUrl;
}
