import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisLockupAccountUnlockableCoinsResponse extends CosmosMessage {
  final List<Coin> coins;
  OsmosisLockupAccountUnlockableCoinsResponse(List<Coin> coins)
      : coins = coins.immutable;
  factory OsmosisLockupAccountUnlockableCoinsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountUnlockableCoinsResponse(decode
        .getFields<List<int>>(1)
        .map((e) => Coin.deserialize(e))
        .toList());
  }
  factory OsmosisLockupAccountUnlockableCoinsResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountUnlockableCoinsResponse(
        (json["coins"] as List?)?.map((e) => Coin.deserialize(e)).toList() ??
            <Coin>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"coins": coins.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.accountUnlockableCoinsResponse;

  @override
  List get values => [coins];
}
