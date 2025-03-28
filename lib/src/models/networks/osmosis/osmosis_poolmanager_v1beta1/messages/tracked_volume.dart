import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisPoolManagerTrackedVolume extends CosmosMessage {
  final List<Coin> amount;
  OsmosisPoolManagerTrackedVolume(List<Coin> amount)
      : amount = amount.immutable;
  factory OsmosisPoolManagerTrackedVolume.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerTrackedVolume(decode
        .getFields<List<int>>(1)
        .map((e) => Coin.deserialize(e))
        .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amount": amount.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.trackedVolume;

  @override
  List get values => [amount];
}
