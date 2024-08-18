import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisLockupModuleBalanceResponse extends CosmosMessage {
  final List<Coin> coins;
  OsmosisLockupModuleBalanceResponse(List<Coin> coins)
      : coins = coins.immutable;
  factory OsmosisLockupModuleBalanceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupModuleBalanceResponse(
        decode.getFields(1).map((e) => Coin.deserialize(e)).toList());
  }
  factory OsmosisLockupModuleBalanceResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisLockupModuleBalanceResponse(
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
  String get typeUrl => OsmosisLockupTypes.moduleBalanceResponse.typeUrl;

  @override
  List get values => [coins];
}
