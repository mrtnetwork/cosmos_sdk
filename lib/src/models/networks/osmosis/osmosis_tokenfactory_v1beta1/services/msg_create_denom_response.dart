import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisTokenFactoryMsgCreateDenomResponse extends CosmosMessage {
  final String? newTokenDenom;
  OsmosisTokenFactoryMsgCreateDenomResponse({this.newTokenDenom});
  factory OsmosisTokenFactoryMsgCreateDenomResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryMsgCreateDenomResponse(
        newTokenDenom: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"new_token_denom": newTokenDenom};
  }

  @override
  String get typeUrl =>
      OsmosisTokenFactoryV1beta1Types.msgCreateDenomResponse.typeUrl;

  @override
  List get values => [newTokenDenom];
}
