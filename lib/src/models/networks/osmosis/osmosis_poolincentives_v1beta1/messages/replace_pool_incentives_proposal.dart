import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/messages/distr_record.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// ReplacePoolIncentivesProposal is a gov Content type for updating the pool incentives.
/// If a ReplacePoolIncentivesProposal passes, the proposal’s records override the existing
/// DistrRecords set in the module. Each record has a specified gauge id and weight,
/// and the incentives are distributed to each gauge according to weight/total_weight.
/// The incentives are put in the fee pool and it is allocated to gauges and community
/// pool by the DistrRecords configuration. Note that gaugeId=0 represents the community pool.
class OsmosisPoolincentivesReplacePoolIncentivesProposal extends CosmosMessage {
  final String? title;
  final String? description;
  final List<OsmosisPoolincentivesDistrRecord> records;
  OsmosisPoolincentivesReplacePoolIncentivesProposal(
      {this.title,
      required this.description,
      required List<OsmosisPoolincentivesDistrRecord> records})
      : records = records.immutable;
  factory OsmosisPoolincentivesReplacePoolIncentivesProposal.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesReplacePoolIncentivesProposal(
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
      OsmosisPoolincentivesV1beta1Types.replacePoolIncentivesProposal.typeUrl;
  @override
  List get values => [title, description, records];
}
