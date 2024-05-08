import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_get_protorev_profits_by_denom_response.dart';

/// QueryGetProtoRevProfitsByDenomRequest is request type for the Query/GetProtoRevProfitsByDenom RPC method.
class OsmosisProtorevOsmosisProtorevQueryQueryGetProtoRevProfitsByDenomRequest
    extends CosmosMessage
    with
        QueryMessage<OsmosisProtorevQueryGetProtoRevProfitsByDenomResponse>,
        RPCMessage<OsmosisProtorevQueryGetProtoRevProfitsByDenomResponse> {
  /// [denom] is the denom to query profits by
  final String? denom;

  const OsmosisProtorevOsmosisProtorevQueryQueryGetProtoRevProfitsByDenomRequest(
      {this.denom});
  factory OsmosisProtorevOsmosisProtorevQueryQueryGetProtoRevProfitsByDenomRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevOsmosisProtorevQueryQueryGetProtoRevProfitsByDenomRequest(
        denom: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom};
  }

  @override
  List get values => [denom];

  @override
  OsmosisProtorevQueryGetProtoRevProfitsByDenomResponse onResponse(
      List<int> bytes) {
    return OsmosisProtorevQueryGetProtoRevProfitsByDenomResponse.deserialize(
        bytes);
  }

  @override
  OsmosisProtorevQueryGetProtoRevProfitsByDenomResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisProtorevQueryGetProtoRevProfitsByDenomResponse.fromRpc(json);
  }

  @override
  String get typeUrl =>
      OsmosisProtorevV1beta1Types.queryGetProtoRevProfitsByDenomRequest.typeUrl;

  @override
  String get queryPath =>
      OsmosisProtorevV1beta1Types.getProtoRevProfitsByDenom.typeUrl;

  @override
  Map<String, String?> get queryParameters => {"denom": denom};

  @override
  String get rpcPath =>
      OsmosisProtorevV1beta1Types.getProtoRevProfitsByDenom.rpcUrl();
}
