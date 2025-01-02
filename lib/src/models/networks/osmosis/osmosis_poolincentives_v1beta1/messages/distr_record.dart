import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolincentivesDistrRecord extends CosmosMessage {
  final BigInt? gaugeId;
  final String weight;
  const OsmosisPoolincentivesDistrRecord({this.gaugeId, required this.weight});
  factory OsmosisPoolincentivesDistrRecord.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesDistrRecord(
        gaugeId: decode.getField(1), weight: decode.getField(2));
  }

  factory OsmosisPoolincentivesDistrRecord.fromRpc(Map<String, dynamic> json) {
    return OsmosisPoolincentivesDistrRecord(
        weight: json["weight"],
        gaugeId: BigintUtils.tryParse(json["gauge_id"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"gauge_id": gaugeId?.toString(), "weight": weight};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolincentivesV1beta1Types.distrRecord;
  @override
  List get values => [gaugeId, weight];
}
