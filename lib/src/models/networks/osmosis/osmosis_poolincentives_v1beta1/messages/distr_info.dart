import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

import 'distr_record.dart';

class OsmosisPoolincentivesDistrInfo extends CosmosMessage {
  final String totalWeight;
  final List<OsmosisPoolincentivesDistrRecord> records;
  OsmosisPoolincentivesDistrInfo(
      {required this.totalWeight,
      required List<OsmosisPoolincentivesDistrRecord> records})
      : records = records.immutable;
  factory OsmosisPoolincentivesDistrInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesDistrInfo(
        totalWeight: decode.getField(1),
        records: decode
            .getFields<List<int>>(2)
            .map((e) => OsmosisPoolincentivesDistrRecord.deserialize(e))
            .toList());
  }
  factory OsmosisPoolincentivesDistrInfo.fromJson(Map<String, dynamic> json) {
    return OsmosisPoolincentivesDistrInfo(
        totalWeight: json["total_weight"],
        records: (json["records"] as List?)
                ?.map((e) => OsmosisPoolincentivesDistrRecord.fromJson(e))
                .toList() ??
            <OsmosisPoolincentivesDistrRecord>[]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "total_weight": totalWeight,
      "records": records.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolincentivesV1beta1Types.distrInfo;
  @override
  List get values => [totalWeight, records];
}
