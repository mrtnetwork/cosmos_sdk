import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'gauge_by_id_response.dart';

class OsmosisIncentiveGaugeByIDRequest extends CosmosMessage
    with QueryMessage<OsmosisIncentiveGaugeByIDResponse> {
  /// Gague ID being queried
  final BigInt id;
  const OsmosisIncentiveGaugeByIDRequest({required this.id});
  factory OsmosisIncentiveGaugeByIDRequest.fromBytes(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisIncentiveGaugeByIDRequest(id: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisIncentiveGaugeByIDResponse onResponse(List<int> bytes) {
    return OsmosisIncentiveGaugeByIDResponse.deserialize(bytes);
  }

  @override
  Map<String, dynamic> toJson() {
    return {"id": id.toString()};
  }

  @override
  TypeUrl get typeUrl => OsmosisIncentivesTypes.gaugeByIDRequest;

  @override
  List<String> get pathParameters => [id.toString()];

  @override
  List get values => [id];

  @override
  OsmosisIncentiveGaugeByIDResponse onJsonResponse(Map<String, dynamic> json) {
    return OsmosisIncentiveGaugeByIDResponse.fromJson(json);
  }

  @override
  Map<String, String> get queryParameters => {};
}
