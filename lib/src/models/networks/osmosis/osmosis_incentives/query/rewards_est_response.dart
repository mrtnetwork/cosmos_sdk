import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisIncentiveRewardsEstResponse extends CosmosMessage {
  /// Estimated coin rewards that will be recieved at provided address
  /// from specified locks between current time and end epoch
  final List<Coin> coins;
  OsmosisIncentiveRewardsEstResponse(List<Coin> coins)
    : coins = coins.immutable;
  factory OsmosisIncentiveRewardsEstResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveRewardsEstResponse(
      decode.getFields<List<int>>(1).map((e) => Coin.deserialize(e)).toList(),
    );
  }
  factory OsmosisIncentiveRewardsEstResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisIncentiveRewardsEstResponse(
      (json["coins"] as List?)?.map((e) => Coin.fromJson(e)).toList() ??
          <Coin>[],
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"coins": coins.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => OsmosisIncentivesTypes.rewardsEstResponse;

  @override
  List get values => [coins];
}
