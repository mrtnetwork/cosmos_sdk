import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_tokenfactory_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgChangeAdmin is the sdk.Msg type for allowing an admin account to reassign adminship of a denom to a new account
class OsmosisTokenFactoryMsgChangeAdmin extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final String? sender;
  final String? denom;
  final String? newAdmin;
  OsmosisTokenFactoryMsgChangeAdmin({this.sender, this.denom, this.newAdmin});
  factory OsmosisTokenFactoryMsgChangeAdmin.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisTokenFactoryMsgChangeAdmin(
        sender: decode.getField(1),
        denom: decode.getField(2),
        newAdmin: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "denom": denom, "new_admin": newAdmin};
  }

  @override
  TypeUrl get typeUrl => OsmosisTokenFactoryV1beta1Types.msgChangeAdmin;

  @override
  List get values => [sender, denom, newAdmin];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisTokenFactoryV1beta1Types.msgChangeAdminResponse);
  }

  @override
  TypeUrl get service => OsmosisTokenFactoryV1beta1Types.changeAdmin;

  @override
  List<String?> get signers => [sender];
}
