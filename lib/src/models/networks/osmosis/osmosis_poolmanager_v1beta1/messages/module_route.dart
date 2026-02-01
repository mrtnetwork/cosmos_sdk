import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'pool_type.dart';

/// ModuleRouter defines a route encapsulating pool type. It is used as the value of a mapping from pool id to the
/// pool type, allowing the pool manager to know which module to route swaps to given the pool id.
class OsmosisPoolManagerModuleRoute extends CosmosMessage {
  /// pool_type specifies the type of the pool
  final OsmosisPoolManagerPoolType? poolType;
  final BigInt? poolId;
  OsmosisPoolManagerModuleRoute({this.poolType, this.poolId});
  factory OsmosisPoolManagerModuleRoute.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerModuleRoute(
      poolType: decode
          .getResult(1)
          ?.to<OsmosisPoolManagerPoolType, int>(
            (e) => OsmosisPoolManagerPoolType.fromValue(e),
          ),
      poolId: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"pool_type": poolType?.name, "pool_id": poolId?.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.moduleRoute;

  @override
  List get values => [poolType, poolId];
}
