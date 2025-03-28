import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisIncentiveModuleToDistributeCoinsResponse extends CosmosMessage {
  /// Coins that have yet to be distributed
  final List<Coin> coins;
  OsmosisIncentiveModuleToDistributeCoinsResponse(List<Coin> coins)
      : coins = coins.immutable;
  factory OsmosisIncentiveModuleToDistributeCoinsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveModuleToDistributeCoinsResponse(decode
        .getFields<List<int>>(1)
        .map((e) => Coin.deserialize(e))
        .toList());
  }
  factory OsmosisIncentiveModuleToDistributeCoinsResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisIncentiveModuleToDistributeCoinsResponse(
        (json["coins"] as List?)?.map((e) => Coin.fromJson(e)).toList() ??
            <Coin>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"coins": coins.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => OsmosisIncentivesTypes.moduleToDistributeCoinsResponse;

  @override
  List get values => [coins];
}
