import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/messages/gauge.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisIncentiveGaugeByIDResponse extends CosmosMessage {
  /// Coins that have yet to be distributed
  final OsmosisIncentivesGauge? gauge;
  OsmosisIncentiveGaugeByIDResponse({this.gauge});
  factory OsmosisIncentiveGaugeByIDResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveGaugeByIDResponse(
        gauge: OsmosisIncentivesGauge.deserialize(decode.getField(1)));
  }
  factory OsmosisIncentiveGaugeByIDResponse.fromRpc(Map<String, dynamic> json) {
    return OsmosisIncentiveGaugeByIDResponse(
        gauge: json["gauge"] == null
            ? null
            : OsmosisIncentivesGauge.fromRpc(json["gauge"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"gauge": gauge?.toJson()};
  }

  @override
  String get typeUrl => OsmosisIncentivesTypes.gaugeByIDResponse.typeUrl;

  @override
  List get values => [gauge];
}
