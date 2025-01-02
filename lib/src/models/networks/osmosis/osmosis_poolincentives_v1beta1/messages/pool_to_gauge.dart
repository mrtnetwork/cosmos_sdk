import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolincentivesPoolToGauge extends CosmosMessage {
  final BigInt? poolId;
  final BigInt? gaugeId;
  final ProtobufDuration duration;
  OsmosisPoolincentivesPoolToGauge(
      {this.poolId, this.gaugeId, required this.duration});
  factory OsmosisPoolincentivesPoolToGauge.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesPoolToGauge(
        poolId: decode.getField(1),
        gaugeId: decode.getField(2),
        duration: ProtobufDuration.deserialize(decode.getField(3)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool_id": poolId?.toString(),
      "gauge_id": gaugeId?.toString(),
      "duration": duration.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolincentivesV1beta1Types.poolToGauge;
  @override
  List get values => [poolId, gaugeId, duration];
}
