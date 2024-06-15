import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolincentivesGaugeIdWithDuration extends CosmosMessage {
  final BigInt? gaugeId;
  final ProtobufDuration duration;
  final String? gaugeIncentivePercentage;

  OsmosisPoolincentivesGaugeIdWithDuration(
      {required this.gaugeId,
      required this.duration,
      this.gaugeIncentivePercentage});
  factory OsmosisPoolincentivesGaugeIdWithDuration.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesGaugeIdWithDuration(
        gaugeId: decode.getField(1),
        duration: ProtobufDuration.deserialize(decode.getField(2)),
        gaugeIncentivePercentage: decode.getField(3));
  }

  factory OsmosisPoolincentivesGaugeIdWithDuration.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisPoolincentivesGaugeIdWithDuration(
        gaugeId: BigintUtils.tryParse(json["gauge_id"]),
        duration: ProtobufDuration.fromString(json["duration"]),
        gaugeIncentivePercentage: json["gauge_incentive_percentage"]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "gauge_id": gaugeId?.toString(),
      "duration": duration.toJson(),
      "gauge_incentive_percentage": gaugeIncentivePercentage
    };
  }

  @override
  String get typeUrl =>
      OsmosisPoolincentivesV1beta1Types.gaugeIdWithDuration.typeUrl;
  @override
  List get values => [gaugeId, duration, gaugeIncentivePercentage];
}
