import 'package:blockchain_utils/numbers/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolincentivesIncentivizedPool extends CosmosMessage {
  final BigInt? poolId;
  final ProtobufDuration lockableDuration;
  final BigInt? gaugeId;
  OsmosisPoolincentivesIncentivizedPool(
      {this.poolId, required this.lockableDuration, this.gaugeId});
  factory OsmosisPoolincentivesIncentivizedPool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesIncentivizedPool(
        poolId: decode.getField(1),
        lockableDuration: ProtobufDuration.deserialize(decode.getField(2)),
        gaugeId: decode.getField(3));
  }
  factory OsmosisPoolincentivesIncentivizedPool.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolincentivesIncentivizedPool(
        poolId: BigintUtils.tryParse(json["pool_id"]),
        lockableDuration:
            ProtobufDuration.fromString(json["lockable_duration"]),
        gaugeId: BigintUtils.tryParse(json["gauge_id"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "lockable_duration": lockableDuration.toJson(),
      "gauge_id": gaugeId?.toString()
    };
  }

  @override
  String get typeUrl =>
      OsmosisPoolincentivesV1beta1Types.incentivizedPool.typeUrl;
  @override
  List get values => [poolId, lockableDuration, gaugeId];
}
