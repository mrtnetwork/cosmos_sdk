import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_proto_rev_base_denoms_response.dart';

/// GetProtoRevBaseDenoms queries the base denoms that the module is currently utilizing for arbitrage
class OsmosisProtorevQueryGetProtoRevBaseDenomsRequest extends CosmosMessage
    with
        QueryMessage<OsmosisProtorevQueryGetProtoRevBaseDenomsResponse>,
        RPCMessage<OsmosisProtorevQueryGetProtoRevBaseDenomsResponse> {
  const OsmosisProtorevQueryGetProtoRevBaseDenomsRequest();
  factory OsmosisProtorevQueryGetProtoRevBaseDenomsRequest.deserialize(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevBaseDenomsRequest();
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
  OsmosisProtorevQueryGetProtoRevBaseDenomsResponse onResponse(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevBaseDenomsResponse.deserialize(bytes);
  }

  @override
  OsmosisProtorevQueryGetProtoRevBaseDenomsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevBaseDenomsResponse.fromRpc(json);
  }

  @override
  String get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevBaseDenomsRequest.typeUrl;

  @override
  String get queryPath =>
      OsmosisProtorevV1beta1Types.getProtoRevBaseDenoms.typeUrl;

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get rpcPath =>
      OsmosisProtorevV1beta1Types.getProtoRevBaseDenoms.rpcUrl();
}
