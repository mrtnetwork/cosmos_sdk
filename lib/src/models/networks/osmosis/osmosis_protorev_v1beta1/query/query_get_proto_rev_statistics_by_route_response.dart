import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/messages/route_statistics.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// GetProtoRevStatisticsByRoute queries the number of arbitrages and profits that have been executed for a given route.
class OsmosisProtorevQueryGetProtoRevStatisticsByRouteResponse
    extends CosmosMessage {
  /// statistics contains the number of trades the module has executed after a
  /// swap on a given pool and the profits from the trades
  final OsmosisProtorevRouteStatistics statistics;
  const OsmosisProtorevQueryGetProtoRevStatisticsByRouteResponse(
      this.statistics);
  factory OsmosisProtorevQueryGetProtoRevStatisticsByRouteResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevStatisticsByRouteResponse(
        OsmosisProtorevRouteStatistics.deserialize(decode.getField(1)));
  }
  factory OsmosisProtorevQueryGetProtoRevStatisticsByRouteResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevStatisticsByRouteResponse(
        OsmosisProtorevRouteStatistics.fromJson(json["statistics"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"statistics": statistics.toJson()};
  }

  @override
  List get values => [statistics];

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevStatisticsByRouteResponse;
}
