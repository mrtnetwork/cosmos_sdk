import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/messages/gauge.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisPoolincentivesQueryExternalIncentiveGaugesResponse
    extends CosmosMessage {
  final List<OsmosisIncentivesGauge> data;

  OsmosisPoolincentivesQueryExternalIncentiveGaugesResponse(
      List<OsmosisIncentivesGauge> data)
      : data = data.immutable;
  factory OsmosisPoolincentivesQueryExternalIncentiveGaugesResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesQueryExternalIncentiveGaugesResponse(decode
        .getFields<List<int>>(1)
        .map((e) => OsmosisIncentivesGauge.deserialize(e))
        .toList());
  }
  factory OsmosisPoolincentivesQueryExternalIncentiveGaugesResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisPoolincentivesQueryExternalIncentiveGaugesResponse(
        (json["data"] as List?)
                ?.map((e) => OsmosisIncentivesGauge.fromJson(e))
                .toList() ??
            <OsmosisIncentivesGauge>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"data": data.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisPoolincentivesV1beta1Types.queryExternalIncentiveGaugesResponse;
  @override
  List get values => [data];
}
