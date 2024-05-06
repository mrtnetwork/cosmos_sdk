import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_concentrated_liquidity_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisConcentratedLiquidityMsgCollectIncentivesResponse
    extends CosmosMessage {
  final List<Coin> collectedIncentives;
  final List<Coin> forfeitedIncentives;

  OsmosisConcentratedLiquidityMsgCollectIncentivesResponse(
      {required List<Coin> collectedIncentives,
      required List<Coin> forfeitedIncentives})
      : collectedIncentives = collectedIncentives.mutable,
        forfeitedIncentives = forfeitedIncentives.mutable;
  factory OsmosisConcentratedLiquidityMsgCollectIncentivesResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisConcentratedLiquidityMsgCollectIncentivesResponse(
        collectedIncentives:
            decode.getFields(1).map((e) => Coin.deserialize(e)).toList(),
        forfeitedIncentives:
            decode.getFields(2).map((e) => Coin.deserialize(e)).toList());
  }
  factory OsmosisConcentratedLiquidityMsgCollectIncentivesResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisConcentratedLiquidityMsgCollectIncentivesResponse(
      collectedIncentives: (json["collected_incentives"] as List?)
              ?.map((e) => Coin.fromRpc(e))
              .toList() ??
          <Coin>[],
      forfeitedIncentives: (json["forfeited_incentives"] as List?)
              ?.map((e) => Coin.fromRpc(e))
              .toList() ??
          <Coin>[],
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "collected_incentives":
          collectedIncentives.map((e) => e.toJson()).toList(),
      "forfeited_incentives":
          forfeitedIncentives.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values => [collectedIncentives, forfeitedIncentives];

  @override
  String get typeUrl => OsmosisConcentratedLiquidityV1beta1Types
      .msgCollectIncentivesResponse.typeUrl;
}
