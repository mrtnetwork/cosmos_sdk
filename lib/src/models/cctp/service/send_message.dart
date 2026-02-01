import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

import 'send_message_response.dart';

class CCTPV1MsgSendMessage extends CCTPV1Service<CCTPV1MsgSendMessageResponse>
    with AminoMessage {
  final String? from;
  final int? destinationDomain;
  final List<int>? recipient;
  final List<int>? messageBody;

  const CCTPV1MsgSendMessage({
    required this.from,
    required this.destinationDomain,
    required this.recipient,
    required this.messageBody,
  });

  factory CCTPV1MsgSendMessage.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgSendMessage(
      from: decode.getField(1),
      destinationDomain: decode.getField(2),
      recipient: decode.getField(3),
      messageBody: decode.getField(4),
    );
  }
  factory CCTPV1MsgSendMessage.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgSendMessage(
      from: json.as("from"),
      destinationDomain: json.as("destination_domain"),
      recipient: json.asBytes("recipient"),
      messageBody: json.asBytes("message_body"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "from": from,
      "message_body": CosmosUtils.tryToBase64(messageBody),
      "destination_domain": destinationDomain,
      "recipient": CosmosUtils.tryToBase64(recipient),
    };
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgSendMessage;

  @override
  List get values => [from, destinationDomain, recipient, messageBody];
  @override
  List<String?> get signers => [from];

  @override
  CCTPV1MsgSendMessageResponse onResponse(List<int> bytes) {
    return CCTPV1MsgSendMessageResponse.deserialize(bytes);
  }
}
