import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_poolincentives_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisPoolincentivesParams extends CosmosMessage {
  /// minted_denom is the denomination of the coin expected to be minted by the
  /// minting module. Pool-incentives module doesn’t actually mint the coin
  /// itself, but rather manages the distribution of coins that matches the
  /// defined minted_denom.
  final String? mintedDenom;
  OsmosisPoolincentivesParams({this.mintedDenom});
  factory OsmosisPoolincentivesParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisPoolincentivesParams(mintedDenom: decode.getField(1));
  }
  factory OsmosisPoolincentivesParams.fromRpc(Map<String, dynamic> json) {
    return OsmosisPoolincentivesParams(mintedDenom: json["minted_denom"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"minted_denom": mintedDenom};
  }

  @override
  TypeUrl get typeUrl => OsmosisPoolincentivesV1beta1Types.params;
  @override
  List get values => [mintedDenom];
}
