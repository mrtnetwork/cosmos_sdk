import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolmanager_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'list_pools_by_denom_response.dart';

class OsmosisPoolManagerListPoolsByDenomRequest extends CosmosMessage
    with QueryMessage<OsmosisPoolManagerListPoolsByDenomResponse> {
  final String? denom;
  const OsmosisPoolManagerListPoolsByDenomRequest({this.denom});
  factory OsmosisPoolManagerListPoolsByDenomRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolManagerListPoolsByDenomRequest(denom: decode.getField(1));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  OsmosisPoolManagerListPoolsByDenomResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return OsmosisPoolManagerListPoolsByDenomResponse.fromJson(json);
  }

  @override
  OsmosisPoolManagerListPoolsByDenomResponse onResponse(List<int> bytes) {
    return OsmosisPoolManagerListPoolsByDenomResponse.deserialize(bytes);
  }

  @override
  Map<String, String?> get queryParameters => {"denom": denom};

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolManagerV1beta1Types.listPoolsByDenomRequest;

  @override
  List get values => [denom];
}
