import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// PoolWeights contains the weights of all of the different pool types.
/// This distinction is made and necessary because the execution time ranges
/// significantly between the different pool types. Each weight roughly corresponds
/// to the amount of time (in ms) it takes to execute a swap on that pool type.
///
/// DEPRECATED: This field is deprecated and will be removed in the next release.
/// It is replaced by the info_by_pool_type field.
class OsmosisProtorevPoolWeights extends CosmosMessage {
  /// The weight of a stableswap pool
  final BigInt? stableWeight;

  /// The weight of a balancer pool
  final BigInt? balancerWeight;

  /// The weight of a concentrated pool
  final BigInt? concentratedWeight;

  /// The weight of a cosmwasm pool
  final BigInt? cosmwasmWeight;

  OsmosisProtorevPoolWeights(
      {this.stableWeight,
      this.balancerWeight,
      this.concentratedWeight,
      this.cosmwasmWeight});

  factory OsmosisProtorevPoolWeights.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevPoolWeights(
        stableWeight: decode.getField(1),
        balancerWeight: decode.getField(2),
        concentratedWeight: decode.getField(3),
        cosmwasmWeight: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "stable_weight": stableWeight?.toString(),
      "balancer_weight": balancerWeight?.toString(),
      "concentrated_weight": concentratedWeight?.toString(),
      "cosmwasm_weight": cosmwasmWeight?.toString()
    };
  }

  @override
  String get typeUrl => OsmosisProtorevV1beta1Types.poolWeights.typeUrl;

  @override
  List get values =>
      [stableWeight, balancerWeight, concentratedWeight, cosmwasmWeight];
}
