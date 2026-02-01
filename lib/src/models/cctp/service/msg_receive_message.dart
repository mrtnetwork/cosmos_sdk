import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

import 'msg_receive_message_response.dart';

class CCTPV1MsgReceiveMessage
    extends CCTPV1Service<CCTPV1MsgReceiveMessageResponse>
    with AminoMessage<CCTPV1MsgReceiveMessageResponse> {
  final String? from;
  final List<int>? message;
  final List<int>? attestation;

  const CCTPV1MsgReceiveMessage({this.from, this.message, this.attestation});

  factory CCTPV1MsgReceiveMessage.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgReceiveMessage(
      from: decode.getField(1),
      message: decode.getField(2),
      attestation: decode.getField(3),
    );
  }
  factory CCTPV1MsgReceiveMessage.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgReceiveMessage(
      from: json.as("from"),
      message: json.asBytes("message"),
      attestation: json.asBytes("attestation"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "from": from,
      "message": CosmosUtils.tryToBase64(message),
      "attestation": CosmosUtils.tryToBase64(attestation),
    };
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgReceiveMessage;

  @override
  List get values => [from, message, attestation];
  @override
  List<String?> get signers => [from];

  @override
  CCTPV1MsgReceiveMessageResponse onResponse(List<int> bytes) {
    return CCTPV1MsgReceiveMessageResponse.deserialize(bytes);
  }
}
