import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'denom_pair_taker_fee.dart';
import 'module_route.dart';
import 'params.dart';
import 'pool_volume.dart';
import 'taker_fees_tracker.dart';

/// GenesisState defines the poolmanager module's genesis state.
class OsmosisPoolGenesisState extends CosmosMessage {
  /// the [nextPoolId]
  final BigInt? nextPoolId;

  /// params is the container of poolmanager parameters.
  final OsmosisPoolManagerParams params;

  /// [poolRoutes] is the container of the mappings from pool id to pool type
  final List<OsmosisPoolManagerModuleRoute> poolRoutes;

  /// KVStore state
  final OsmosisPoolManagerTakerFeesTracker takerFeesTracker;
  final List<OsmosisPoolManagerPoolVolume> poolVolumes;
  final List<OsmosisPoolManagerDenomPairTakerFee> denomPairTakerFeeStore;
  OsmosisPoolGenesisState(
      {this.nextPoolId,
      required this.params,
      required List<OsmosisPoolManagerModuleRoute> poolRoutes,
      required this.takerFeesTracker,
      required List<OsmosisPoolManagerPoolVolume> poolVolumes,
      required List<OsmosisPoolManagerDenomPairTakerFee>
          denomPairTakerFeeStore})
      : poolRoutes = poolRoutes.immutable,
        poolVolumes = poolVolumes.immutable,
        denomPairTakerFeeStore = denomPairTakerFeeStore.immutable;
  factory OsmosisPoolGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolGenesisState(
      nextPoolId: decode.getField(1),
      params: OsmosisPoolManagerParams.deserialize(decode.getField(2)),
      poolRoutes: decode
          .getFields(3)
          .map((e) => OsmosisPoolManagerModuleRoute.deserialize(e))
          .toList(),
      takerFeesTracker:
          OsmosisPoolManagerTakerFeesTracker.deserialize(decode.getField(4)),
      poolVolumes: decode
          .getFields(5)
          .map((e) => OsmosisPoolManagerPoolVolume.deserialize(e))
          .toList(),
      denomPairTakerFeeStore: decode
          .getFields(6)
          .map((e) => OsmosisPoolManagerDenomPairTakerFee.deserialize(e))
          .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "next_pool_id": nextPoolId?.toString(),
      "params": params.toJson(),
      "pool_routes": poolRoutes.map((e) => e.toJson()).toList(),
      "taker_fees_tracker": takerFeesTracker.toJson(),
      "pool_volumes": poolVolumes.map((e) => e.toJson()).toList(),
      "denom_pair_taker_fee_store":
          denomPairTakerFeeStore.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => OsmosisPoolManagerV1beta1Types.genesisState.typeUrl;

  @override
  List get values => [
        nextPoolId,
        params,
        poolRoutes,
        takerFeesTracker,
        poolVolumes,
        denomPairTakerFeeStore
      ];
}
