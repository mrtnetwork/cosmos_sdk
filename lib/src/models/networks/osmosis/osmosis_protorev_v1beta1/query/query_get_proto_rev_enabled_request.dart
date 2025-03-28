import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_enabled_response.dart';

/// GetProtoRevEnabled queries whether the module is enabled or not
class OsmosisProtorevQueryGetProtoRevEnabledRequest extends CosmosMessage
    with QueryMessage<OsmosisProtorevQueryGetProtoRevEnabledResponse> {
  const OsmosisProtorevQueryGetProtoRevEnabledRequest();
  factory OsmosisProtorevQueryGetProtoRevEnabledRequest.deserialize(
      List<int> bytes) {
    return const OsmosisProtorevQueryGetProtoRevEnabledRequest();
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
  OsmosisProtorevQueryGetProtoRevEnabledResponse onResponse(List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevEnabledResponse.deserialize(bytes);
  }

  @override
  OsmosisProtorevQueryGetProtoRevEnabledResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevEnabledResponse.fromJson(json);
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevEnabledRequest;

  @override
  Map<String, String?> get queryParameters => {};
}
