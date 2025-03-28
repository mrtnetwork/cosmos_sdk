import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// DenomAuthorityMetadata specifies metadata for addresses that have specific capabilities over a
/// token factory denom. Right now there is only one Admin permission, but is planned to be extended to the future.
class OsmosisTokenFactoryDenomAuthorityMetadata extends CosmosMessage {
  /// Can be empty for no admin, or a valid osmosis address
  final String? admin;
  OsmosisTokenFactoryDenomAuthorityMetadata({this.admin});
  factory OsmosisTokenFactoryDenomAuthorityMetadata.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryDenomAuthorityMetadata(admin: decode.getField(1));
  }
  factory OsmosisTokenFactoryDenomAuthorityMetadata.fromJson(
      Map<String, dynamic> json) {
    return OsmosisTokenFactoryDenomAuthorityMetadata(admin: json["admin"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"admin": admin};
  }

  @override
  TypeUrl get typeUrl => OsmosisTokenFactoryV1beta1Types.denomAuthorityMetadata;

  @override
  List get values => [admin];
}
