import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_enabled_response.dart';

/// GetProtoRevEnabled queries whether the module is enabled or not
class OsmosisProtorevQueryGetProtoRevEnabledRequest extends CosmosMessage
    with
        QueryMessage<OsmosisProtorevQueryGetProtoRevEnabledResponse>,
        RPCMessage<OsmosisProtorevQueryGetProtoRevEnabledResponse> {
  const OsmosisProtorevQueryGetProtoRevEnabledRequest();
  factory OsmosisProtorevQueryGetProtoRevEnabledRequest.deserialize(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevEnabledRequest();
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
    return OsmosisProtorevQueryGetProtoRevEnabledResponse.fromRpc(json);
  }

  @override
  String get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevEnabledRequest.typeUrl;

  @override
  String get queryPath =>
      OsmosisProtorevV1beta1Types.getProtoRevEnabled.typeUrl;

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get rpcPath => OsmosisProtorevV1beta1Types.getProtoRevEnabled.rpcUrl();
}
