import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_info_by_pool_type_response.dart';

/// QueryGetProtoRevInfoByPoolTypeRequest is request type for the Query/GetProtoRevInfoByPoolType RPC method.
class OsmosisProtorevQueryGetProtoRevInfoByPoolTypeRequest extends CosmosMessage
    with QueryMessage<OsmosisProtorevQueryGetProtoRevInfoByPoolTypeResponse> {
  const OsmosisProtorevQueryGetProtoRevInfoByPoolTypeRequest();
  factory OsmosisProtorevQueryGetProtoRevInfoByPoolTypeRequest.deserialize(
      List<int> bytes) {
    return const OsmosisProtorevQueryGetProtoRevInfoByPoolTypeRequest();
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
  OsmosisProtorevQueryGetProtoRevInfoByPoolTypeResponse onResponse(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevInfoByPoolTypeResponse.deserialize(
        bytes);
  }

  @override
  OsmosisProtorevQueryGetProtoRevInfoByPoolTypeResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevInfoByPoolTypeResponse.fromJson(json);
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevInfoByPoolTypeRequest;

  @override
  Map<String, String?> get queryParameters => {};
}
