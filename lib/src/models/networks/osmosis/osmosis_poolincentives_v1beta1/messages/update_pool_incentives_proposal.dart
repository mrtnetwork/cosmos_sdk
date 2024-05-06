import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/messages/distr_record.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// For example: if the existing DistrRecords were: (Gauge 0, 5), (Gauge 1, 6), (Gauge 2, 6) An UpdatePoolIncentivesProposal includes
/// (Gauge 1, 0), (Gauge 2, 4), (Gauge 3, 10) This would delete Gauge 1, Edit Gauge 2, and Add Gauge 3 The result DistrRecords in
/// state would be: (Gauge 0, 5), (Gauge 2, 4), (Gauge 3, 10)
class OsmosisPoolincentivesUpdatePoolIncentivesProposal extends CosmosMessage {
  final String? title;
  final String? description;
  final List<OsmosisPoolincentivesDistrRecord> records;
  OsmosisPoolincentivesUpdatePoolIncentivesProposal(
      {this.title,
      required this.description,
      required List<OsmosisPoolincentivesDistrRecord> records})
      : records = records.mutable;
  factory OsmosisPoolincentivesUpdatePoolIncentivesProposal.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesUpdatePoolIncentivesProposal(
        title: decode.getField(1),
        description: decode.getField(2),
        records: decode
            .getFields(3)
            .map((e) => OsmosisPoolincentivesDistrRecord.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "records": records.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl =>
      OsmosisPoolincentivesV1beta1Types.updatePoolIncentivesProposal.typeUrl;
  @override
  List get values => [title, description, records];
}
