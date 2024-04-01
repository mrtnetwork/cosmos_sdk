import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgUpdateClient defines an sdk.Msg to update a IBC client state using the given client message.
class MsgUpdateClient extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// client unique identifier
  final String? clientId;

  /// client message to update the light client
  final Any? clientMessage;

  /// signer address
  final String? signer;
  const MsgUpdateClient({this.clientId, this.clientMessage, this.signer});
  factory MsgUpdateClient.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgUpdateClient(
        clientId: decode.getField(1),
        clientMessage:
            decode.getResult(2)?.to<Any, List<int>>((e) => Any.deserialize(e)),
        signer: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get service => IbcTypes.updateClient.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "client_id": clientId,
      "client_message": clientMessage?.toJson(),
      "signer": signer
    };
  }

  @override
  String get typeUrl => IbcTypes.msgUpdateClient.typeUrl;

  @override
  List get values => [clientId, clientMessage, signer];
  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        IbcTypes.msgUpdateClientResponse.typeUrl);
  }
}
