import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'balancer_pool_info.dart';
import 'concentrated_pool_info.dart';
import 'cosmwasm_pool_info.dart';
import 'stable_pool_info.dart';

/// InfoByPoolType contains information pertaining to how expensive (in terms of gas and time)
/// it is to execute a swap on a given pool type. This distinction is made and necessary because
/// the execution time ranges significantly between the different pool types.
class OsmosisProtorevInfoByPoolType extends CosmosMessage {
  /// The stable pool info
  final OsmosisProtorevStablePoolInfo stable;

  /// The balancer pool info
  final OsmosisProtorevBalancerPoolInfo balancer;

  /// The concentrated pool info
  final OsmosisProtorevConcentratedPoolInfo concentrated;

  /// The cosmwasm pool info
  final OsmosisProtorevCosmwasmPoolInfo cosmwasm;

  OsmosisProtorevInfoByPoolType({
    required this.stable,
    required this.balancer,
    required this.concentrated,
    required this.cosmwasm,
  });

  factory OsmosisProtorevInfoByPoolType.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevInfoByPoolType(
        stable: OsmosisProtorevStablePoolInfo.deserialize(decode.getField(1)),
        balancer:
            OsmosisProtorevBalancerPoolInfo.deserialize(decode.getField(2)),
        concentrated:
            OsmosisProtorevConcentratedPoolInfo.deserialize(decode.getField(3)),
        cosmwasm:
            OsmosisProtorevCosmwasmPoolInfo.deserialize(decode.getField(4)));
  }
  factory OsmosisProtorevInfoByPoolType.fromRpc(Map<String, dynamic> json) {
    return OsmosisProtorevInfoByPoolType(
        stable: OsmosisProtorevStablePoolInfo.fromRpc(json["stable"]),
        balancer: OsmosisProtorevBalancerPoolInfo.fromRpc(json["balancer"]),
        concentrated:
            OsmosisProtorevConcentratedPoolInfo.fromRpc(json["concentrated"]),
        cosmwasm: OsmosisProtorevCosmwasmPoolInfo.fromRpc(json["cosmwasm"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "stable": stable.toJson(),
      "balancer": balancer.toJson(),
      "concentrated": concentrated.toJson(),
      "cosmwasm": cosmwasm.toJson()
    };
  }

  @override
  String get typeUrl => OsmosisProtorevV1beta1Types.infoByPoolType.typeUrl;

  @override
  List get values => [stable, balancer, concentrated, cosmwasm];
}
