import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisIncentiveModuleToDistributeCoinsResponse extends CosmosMessage {
  /// Coins that have yet to be distributed
  final List<Coin> coins;
  OsmosisIncentiveModuleToDistributeCoinsResponse(List<Coin> coins)
      : coins = coins.immutable;
  factory OsmosisIncentiveModuleToDistributeCoinsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveModuleToDistributeCoinsResponse(
        decode.getFields(1).map((e) => Coin.deserialize(e)).toList());
  }
  factory OsmosisIncentiveModuleToDistributeCoinsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisIncentiveModuleToDistributeCoinsResponse(
        (json["coins"] as List?)?.map((e) => Coin.fromRpc(e)).toList() ??
            <Coin>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"coins": coins.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl =>
      OsmosisIncentivesTypes.moduleToDistributeCoinsResponse.typeUrl;

  @override
  List get values => [coins];
}
