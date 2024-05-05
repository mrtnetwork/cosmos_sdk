import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisIncentiveRewardsEstResponse extends CosmosMessage {
  /// Estimated coin rewards that will be recieved at provided address
  /// from specified locks between current time and end epoch
  final List<Coin> coins;
  OsmosisIncentiveRewardsEstResponse(List<Coin> coins) : coins = coins.mutable;
  factory OsmosisIncentiveRewardsEstResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveRewardsEstResponse(
        decode.getFields(1).map((e) => Coin.deserialize(e)).toList());
  }
  factory OsmosisIncentiveRewardsEstResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisIncentiveRewardsEstResponse(
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
  String get typeUrl => OsmosisIncentivesTypes.rewardsEstResponse.typeUrl;

  @override
  List get values => [coins];
}
