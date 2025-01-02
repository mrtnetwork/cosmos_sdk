import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_token_pair_arb_routes_response.dart';

/// QueryGetProtoRevTokenPairArbRoutesRequest is request type for the Query/GetProtoRevTokenPairArbRoutes RPC method.
class OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesResponse> {
  const OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesRequest();
  factory OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesRequest.deserialize(
      List<int> bytes) {
    return const OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesRequest();
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
  OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesResponse onResponse(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesResponse
        .deserialize(bytes);
  }

  @override
  OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevTokenPairArbRoutesResponse.fromRpc(
        json);
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevTokenPairArbRoutesRequest;

  @override
  Map<String, String?> get queryParameters => {};
}
