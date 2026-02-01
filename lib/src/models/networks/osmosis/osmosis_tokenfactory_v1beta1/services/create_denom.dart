import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_create_denom_response.dart';

class OsmosisTokenFactoryMsgCreateDenom
    extends
        OsmosisTokenFactoryV1Beta1<OsmosisTokenFactoryMsgCreateDenomResponse> {
  final String? sender;

  /// subdenom can be up to 44 "alphanumeric" characters long.
  final String? subdenom;
  OsmosisTokenFactoryMsgCreateDenom({this.sender, this.subdenom});
  factory OsmosisTokenFactoryMsgCreateDenom.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryMsgCreateDenom(
      sender: decode.getField(1),
      subdenom: decode.getField(2),
    );
  }
  factory OsmosisTokenFactoryMsgCreateDenom.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisTokenFactoryMsgCreateDenom(
      sender: json.as("sender"),
      subdenom: json.as("subdenom"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "subdenom": subdenom};
  }

  @override
  TypeUrl get typeUrl => OsmosisTokenFactoryV1beta1Types.msgCreateDenom;

  @override
  List get values => [sender, subdenom];

  @override
  OsmosisTokenFactoryMsgCreateDenomResponse onResponse(List<int> bytes) {
    return OsmosisTokenFactoryMsgCreateDenomResponse.deserialize(bytes);
  }

  @override
  List<String?> get signers => [sender];
}
