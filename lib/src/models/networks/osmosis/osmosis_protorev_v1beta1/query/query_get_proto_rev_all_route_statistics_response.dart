import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/messages/route_statistics.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// GetProtoRevAllRouteStatistics queries all of routes that the module has arbitraged
/// against and the number of trades and profits that have been accumulated for each route
class OsmosisProtorevQueryGetProtoRevAllRouteStatisticsResponse
    extends CosmosMessage {
  /// statistics contains the number of trades/profits the module has executed on
  /// all routes it has successfully executed a trade on
  final List<OsmosisProtorevRouteStatistics> statistics;
  OsmosisProtorevQueryGetProtoRevAllRouteStatisticsResponse(
      List<OsmosisProtorevRouteStatistics> statistics)
      : statistics = statistics.immutable;
  factory OsmosisProtorevQueryGetProtoRevAllRouteStatisticsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevAllRouteStatisticsResponse(decode
        .getFields(1)
        .map((e) => OsmosisProtorevRouteStatistics.deserialize(e))
        .toList());
  }
  factory OsmosisProtorevQueryGetProtoRevAllRouteStatisticsResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevAllRouteStatisticsResponse(
        (json["statistics"] as List?)
                ?.map((e) => OsmosisProtorevRouteStatistics.fromRpc(e))
                .toList() ??
            <OsmosisProtorevRouteStatistics>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"statistics": statistics.map((e) => e.toJson())};
  }

  @override
  List get values => [statistics];

  @override
  String get typeUrl => OsmosisProtorevV1beta1Types
      .queryGetProtoRevAllRouteStatisticsResponse.typeUrl;
}
