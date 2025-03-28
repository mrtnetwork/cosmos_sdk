import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgPauseSendingAndReceivingMessages
    extends CCTPV1Service<EmptyServiceRequestResponse> with AminoMessage {
  final String from;
  const CCTPV1MsgPauseSendingAndReceivingMessages(this.from);

  factory CCTPV1MsgPauseSendingAndReceivingMessages.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgPauseSendingAndReceivingMessages(decode.getField(1));
  }
  factory CCTPV1MsgPauseSendingAndReceivingMessages.fromJson(
      Map<String, dynamic> json) {
    return CCTPV1MsgPauseSendingAndReceivingMessages(json.as("from"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"from": from};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgPauseSendingAndReceivingMessages;

  @override
  List get values => [from];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        CCTPV1Types.msgPauseSendingAndReceivingMessagesResponse);
  }
}
