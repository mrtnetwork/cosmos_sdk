import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_protorev_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgSetDeveloperAccount defines the Msg/SetDeveloperAccount request type.
class OsmosisProtorevMsgSetDeveloperAccount extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// [admin] is the account that is authorized to set the developer account.
  final String? admin;

  /// [developerAccount] is the account that will receive a portion of the profits
  /// from the protorev module.
  final String? developerAccount;

  const OsmosisProtorevMsgSetDeveloperAccount(
      {this.admin, this.developerAccount});

  factory OsmosisProtorevMsgSetDeveloperAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisProtorevMsgSetDeveloperAccount(
        admin: decode.getField(1), developerAccount: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"admin": admin, "developer_account": developerAccount};
  }

  @override
  String get typeUrl =>
      OsmosisProtorevV1beta1Types.msgSetDeveloperAccount.typeUrl;

  @override
  List get values => [admin, developerAccount];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        OsmosisProtorevV1beta1Types.msgSetDeveloperAccountResponse.typeUrl);
  }

  @override
  String get service => OsmosisProtorevV1beta1Types.setDeveloperAccount.typeUrl;

  @override
  List<String?> get signers => [admin];
}
