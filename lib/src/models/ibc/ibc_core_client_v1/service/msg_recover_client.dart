import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgRecoverClient defines the message used to recover a frozen or expired client.
class MsgRecoverClient extends IbcService<EmptyServiceRequestResponse> {
  /// the client identifier for the client to be updated if the proposal passes
  final String? subjectClientId;

  /// the substitute client identifier for the client which will replace the subject
  /// client
  final String? substituteClientId;

  /// signer address
  final String? signer;
  const MsgRecoverClient(
      {this.subjectClientId, this.substituteClientId, this.signer});
  factory MsgRecoverClient.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgRecoverClient(
        subjectClientId: decode.getField(1),
        substituteClientId: decode.getField(2),
        signer: decode.getField(3));
  }
  factory MsgRecoverClient.fromJson(Map<String, dynamic> json) {
    return MsgRecoverClient(
        subjectClientId: json.as("subject_client_id"),
        substituteClientId: json.as("substitute_client_id"),
        signer: json.as("signer"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "subject_client_id": subjectClientId,
      "substitute_client_id": substituteClientId,
      "signer": signer
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgRecoverClient;

  @override
  List get values => [subjectClientId, substituteClientId, signer];
  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(IbcTypes.msgRecoverClientResponse);
  }
}
