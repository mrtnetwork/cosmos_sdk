import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/messages/gauge_id_with_duration.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisPoolincentivesQueryGaugeIdsResponse extends CosmosMessage {
  final List<OsmosisPoolincentivesGaugeIdWithDuration>? gaugeIdsWithDuration;

  OsmosisPoolincentivesQueryGaugeIdsResponse(
      {List<OsmosisPoolincentivesGaugeIdWithDuration>? gaugeIdsWithDuration})
      : gaugeIdsWithDuration = gaugeIdsWithDuration?.emptyAsNull?.immutable;
  factory OsmosisPoolincentivesQueryGaugeIdsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesQueryGaugeIdsResponse(
        gaugeIdsWithDuration: decode
            .getFields<List<int>>(1)
            .map((e) => OsmosisPoolincentivesGaugeIdWithDuration.deserialize(e))
            .toList());
  }
  factory OsmosisPoolincentivesQueryGaugeIdsResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisPoolincentivesQueryGaugeIdsResponse(
        gaugeIdsWithDuration: (json["gauge_ids_with_duration"] as List?)
            ?.map((e) => OsmosisPoolincentivesGaugeIdWithDuration.fromJson(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "gauge_ids_with_duration":
          gaugeIdsWithDuration?.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolincentivesV1beta1Types.queryGaugeIdsResponse;
  @override
  List get values => [gaugeIdsWithDuration];
}
