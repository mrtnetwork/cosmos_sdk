import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_max_pool_points_per_block_response.dart';

/// GetProtoRevMaxPoolPointsPerBlock queries the maximum number of pool points that can consumed per block
class OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockRequest
    extends CosmosMessage
    with
        QueryMessage<
            OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockResponse> {
  const OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockRequest();
  factory OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockRequest.deserialize(
      List<int> bytes) {
    return const OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockRequest();
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
  OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockResponse onResponse(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockResponse
        .deserialize(bytes);
  }

  @override
  OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevMaxPoolPointsPerBlockResponse
        .fromJson(json);
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevMaxPoolPointsPerBlockRequest;

  @override
  Map<String, String?> get queryParameters => {};
}
