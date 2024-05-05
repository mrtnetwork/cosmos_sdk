import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'denom_authority_metadata.dart';

/// GenesisDenom defines a tokenfactory denom that is defined within genesis state.
/// The structure contains DenomAuthorityMetadata which defines the denom's admin.
class OsmosisTokenFactoryGenesisDenom extends CosmosMessage {
  final String? denom;
  final OsmosisTokenFactoryDenomAuthorityMetadata authorityMetadata;
  OsmosisTokenFactoryGenesisDenom(
      {this.denom, required this.authorityMetadata});
  factory OsmosisTokenFactoryGenesisDenom.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryGenesisDenom(
        denom: decode.getField(1),
        authorityMetadata:
            OsmosisTokenFactoryDenomAuthorityMetadata.deserialize(
                decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom, "authority_metadata": authorityMetadata.toJson()};
  }

  @override
  String get typeUrl => OsmosisTokenFactoryV1beta1Types.genesisDenom.typeUrl;

  @override
  List get values => [denom, authorityMetadata];
}
