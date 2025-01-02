import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisLockupAccountUnlockingCoinsResponse extends CosmosMessage {
  final List<Coin> coins;
  OsmosisLockupAccountUnlockingCoinsResponse(List<Coin> coins)
      : coins = coins.immutable;
  factory OsmosisLockupAccountUnlockingCoinsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountUnlockingCoinsResponse(
        decode.getFields(1).map((e) => Coin.deserialize(e)).toList());
  }
  factory OsmosisLockupAccountUnlockingCoinsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountUnlockingCoinsResponse(
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
  TypeUrl get typeUrl => OsmosisLockupTypes.accountUnlockingCoinsResponse;

  @override
  List get values => [coins];
}
