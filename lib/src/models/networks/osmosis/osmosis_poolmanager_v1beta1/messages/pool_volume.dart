import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/cosmos_base_v1beta1.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// PoolVolume stores the KVStore entries for each pool's volume, which is used in export/import genesis.
class OsmosisPoolManagerPoolVolume extends CosmosMessage {
  /// [poolId] is the id of the pool
  final BigInt? poolId;

  /// [poolVolume] is the cumulative volume of the pool.
  final List<Coin> poolVolume;

  OsmosisPoolManagerPoolVolume(
      {required this.poolId, required List<Coin> poolVolume})
      : poolVolume = poolVolume.mutable;
  factory OsmosisPoolManagerPoolVolume.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerPoolVolume(
        poolId: decode.getField(1),
        poolVolume:
            decode.getFields(2).map((e) => Coin.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "pool_volume": poolVolume.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisPoolManagerV1beta1Types.poolVolume.typeUrl;

  @override
  List get values => [poolId, poolVolume];
}
