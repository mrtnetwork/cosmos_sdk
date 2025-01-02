import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_all_profits_response.dart';

/// GetProtoRevAllProfits queries all of the profits from the module.
class OsmosisProtorevQueryGetProtoRevAllProfitsRequest extends CosmosMessage
    with QueryMessage<OsmosisProtorevQueryGetProtoRevAllProfitsResponse> {
  const OsmosisProtorevQueryGetProtoRevAllProfitsRequest();
  factory OsmosisProtorevQueryGetProtoRevAllProfitsRequest.deserialize(
      List<int> bytes) {
    return const OsmosisProtorevQueryGetProtoRevAllProfitsRequest();
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
  OsmosisProtorevQueryGetProtoRevAllProfitsResponse onResponse(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevAllProfitsResponse.deserialize(bytes);
  }

  @override
  OsmosisProtorevQueryGetProtoRevAllProfitsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevAllProfitsResponse.fromRpc(json);
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevAllProfitsRequest;

  @override
  Map<String, String?> get queryParameters => {};
}
