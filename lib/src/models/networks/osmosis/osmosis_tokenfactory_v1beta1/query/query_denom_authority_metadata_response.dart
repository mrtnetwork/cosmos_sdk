import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/messages/denom_authority_metadata.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomAuthorityMetadataResponse defines the response structure for the DenomAuthorityMetadata gRPC query.
class OsmosisTokenFactoryQueryDenomAuthorityMetadataResponse
    extends CosmosMessage {
  final OsmosisTokenFactoryDenomAuthorityMetadata authorityMetadata;
  OsmosisTokenFactoryQueryDenomAuthorityMetadataResponse(
      this.authorityMetadata);
  factory OsmosisTokenFactoryQueryDenomAuthorityMetadataResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryQueryDenomAuthorityMetadataResponse(
        OsmosisTokenFactoryDenomAuthorityMetadata.deserialize(
            decode.getField(1)));
  }
  factory OsmosisTokenFactoryQueryDenomAuthorityMetadataResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisTokenFactoryQueryDenomAuthorityMetadataResponse(
        OsmosisTokenFactoryDenomAuthorityMetadata.fromRpc(
            json["authority_metadata"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"authority_metadata": authorityMetadata.toJson()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisTokenFactoryV1beta1Types.queryDenomAuthorityMetadataResponse;

  @override
  List get values => [authorityMetadata];
}
