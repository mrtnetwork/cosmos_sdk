import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class OsmosisLockupModuleLockedAmountResponse extends CosmosMessage {
  final List<Coin> coins;
  OsmosisLockupModuleLockedAmountResponse(List<Coin> coins)
      : coins = coins.mutable;
  factory OsmosisLockupModuleLockedAmountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupModuleLockedAmountResponse(
        decode.getFields(1).map((e) => Coin.deserialize(e)).toList());
  }
  factory OsmosisLockupModuleLockedAmountResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisLockupModuleLockedAmountResponse(
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
  String get typeUrl => OsmosisLockupTypes.moduleLockedAmountResponse.typeUrl;

  @override
  List get values => [coins];
}
