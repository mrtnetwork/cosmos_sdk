import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_all_route_statistics_response.dart';

/// GetProtoRevAllRouteStatistics queries all of routes that the module has arbitraged against and the
/// number of trades and profits that have been accumulated for each route
class OsmosisProtorevQueryGetProtoRevAllRouteStatisticsRequest
    extends CosmosMessage
    with
        QueryMessage<
          OsmosisProtorevQueryGetProtoRevAllRouteStatisticsResponse
        > {
  const OsmosisProtorevQueryGetProtoRevAllRouteStatisticsRequest();
  factory OsmosisProtorevQueryGetProtoRevAllRouteStatisticsRequest.deserialize(
    List<int> bytes,
  ) {
    return const OsmosisProtorevQueryGetProtoRevAllRouteStatisticsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List get values => [];

  @override
  OsmosisProtorevQueryGetProtoRevAllRouteStatisticsResponse onResponse(
    List<int> bytes,
  ) {
    return OsmosisProtorevQueryGetProtoRevAllRouteStatisticsResponse.deserialize(
      bytes,
    );
  }

  @override
  OsmosisProtorevQueryGetProtoRevAllRouteStatisticsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisProtorevQueryGetProtoRevAllRouteStatisticsResponse.fromJson(
      json,
    );
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevAllRouteStatisticsRequest;

  @override
  Map<String, String?> get queryParameters => {};
}
