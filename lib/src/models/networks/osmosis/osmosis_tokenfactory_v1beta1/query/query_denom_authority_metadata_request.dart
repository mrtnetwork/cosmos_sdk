import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_denom_authority_metadata_response.dart';

/// QueryDenomAuthorityMetadataRequest defines the request structure for the DenomAuthorityMetadata gRPC query.
class OsmosisTokenFactoryQueryDenomAuthorityMetadataRequest
    extends CosmosMessage
    with
        QueryMessage<OsmosisTokenFactoryQueryDenomAuthorityMetadataResponse>,
        RPCMessage<OsmosisTokenFactoryQueryDenomAuthorityMetadataResponse> {
  final String? denom;
  OsmosisTokenFactoryQueryDenomAuthorityMetadataRequest({this.denom});
  factory OsmosisTokenFactoryQueryDenomAuthorityMetadataRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryQueryDenomAuthorityMetadataRequest(
        denom: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom};
  }

  @override
  String get typeUrl => OsmosisTokenFactoryV1beta1Types
      .queryDenomAuthorityMetadataRequest.typeUrl;

  @override
  List get values => [denom];

  @override
  OsmosisTokenFactoryQueryDenomAuthorityMetadataResponse onJsonResponse(
      Map<String, dynamic> json) {
    return OsmosisTokenFactoryQueryDenomAuthorityMetadataResponse.fromRpc(json);
  }

  @override
  OsmosisTokenFactoryQueryDenomAuthorityMetadataResponse onResponse(
      List<int> bytes) {
    return OsmosisTokenFactoryQueryDenomAuthorityMetadataResponse.deserialize(
        bytes);
  }

  @override
  Map<String, String?> get queryParameters => {};

  @override
  String get queryPath =>
      OsmosisTokenFactoryV1beta1Types.queryDenomAuthorityMetadata.typeUrl;

  @override
  String get rpcPath =>
      OsmosisTokenFactoryV1beta1Types.queryDenomAuthorityMetadata
          .rpcUrl(pathParameters: [denom]);
}
