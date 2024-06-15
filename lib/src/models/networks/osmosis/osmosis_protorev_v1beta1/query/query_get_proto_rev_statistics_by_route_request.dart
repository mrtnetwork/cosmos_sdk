import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';
import 'query_get_proto_rev_statistics_by_route_response.dart';

/// GetProtoRevStatisticsByRoute queries the number of arbitrages and profits that have been executed for a given route.
class OsmosisProtorevQueryGetProtoRevStatisticsByRouteRequest
    extends CosmosMessage
    with
        QueryMessage<OsmosisProtorevQueryGetProtoRevStatisticsByRouteResponse>,
        RPCMessage<OsmosisProtorevQueryGetProtoRevStatisticsByRouteResponse> {
  /// [route] is the set of pool ids to query statistics by i.e. 1,2,3
  final List<BigInt>? route;

  OsmosisProtorevQueryGetProtoRevStatisticsByRouteRequest({List<BigInt>? route})
      : route = route?.nullOnEmpy;
  factory OsmosisProtorevQueryGetProtoRevStatisticsByRouteRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevQueryGetProtoRevStatisticsByRouteRequest(
        route: decode
                .getResult<ProtocolBufferDecoderResult?>(1)
                ?.to<List<BigInt>, List<int>>(
                    (e) => e.map((e) => BigintUtils.parse(e)).toList()) ??
            <BigInt>[]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"route": route?.map((e) => e.toString()).toList()};
  }

  @override
  List get values => [route];

  @override
  OsmosisProtorevQueryGetProtoRevStatisticsByRouteResponse onResponse(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevStatisticsByRouteResponse.deserialize(
        bytes);
  }

  @override
  OsmosisProtorevQueryGetProtoRevStatisticsByRouteResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevStatisticsByRouteResponse.fromRpc(
        json);
  }

  @override
  String get typeUrl => OsmosisProtorevV1beta1Types
      .queryGetProtoRevStatisticsByRouteRequest.typeUrl;

  @override
  String get queryPath =>
      OsmosisProtorevV1beta1Types.getProtoRevStatisticsByRoute.typeUrl;

  @override
  Map<String, String?> get queryParameters =>
      {"route": route?.map((e) => e.toString()).join(",")};

  @override
  String get rpcPath =>
      OsmosisProtorevV1beta1Types.getProtoRevStatisticsByRoute.rpcUrl();
}
