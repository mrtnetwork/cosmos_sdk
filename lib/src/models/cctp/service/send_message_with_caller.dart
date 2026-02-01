import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';
import 'send_message_with_caller_response.dart';

class CCTPV1MsgSendMessageWithCaller
    extends CCTPV1Service<CCTPV1MsgSendMessageWithCallerResponse>
    with AminoMessage {
  final String? from;
  final int? destinationDomain;
  final List<int>? recipient;
  final List<int>? messageBody;
  final List<int>? destinationCaller;
  const CCTPV1MsgSendMessageWithCaller({
    required this.from,
    required this.destinationDomain,
    required this.recipient,
    required this.messageBody,
    required this.destinationCaller,
  });

  factory CCTPV1MsgSendMessageWithCaller.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgSendMessageWithCaller(
      from: decode.getField(1),
      destinationDomain: decode.getField(2),
      recipient: decode.getField(3),
      messageBody: decode.getField(4),
      destinationCaller: decode.getField(5),
    );
  }
  factory CCTPV1MsgSendMessageWithCaller.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgSendMessageWithCaller(
      from: json.as("from"),
      destinationDomain: json.as("destination_domain"),
      recipient: json.asBytes("recipient"),
      messageBody: json.asBytes("message_body"),
      destinationCaller: json.asBytes("destination_caller"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "from": from,
      "message_body": CosmosUtils.tryToBase64(messageBody),
      "destination_domain": destinationDomain,
      "recipient": CosmosUtils.tryToBase64(recipient),
      "destination_caller": CosmosUtils.tryToBase64(destinationCaller),
    };
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgSendMessageWithCaller;

  @override
  List get values => [
    from,
    destinationDomain,
    recipient,
    messageBody,
    destinationCaller,
  ];
  @override
  List<String?> get signers => [from];

  @override
  CCTPV1MsgSendMessageWithCallerResponse onResponse(List<int> bytes) {
    return CCTPV1MsgSendMessageWithCallerResponse.deserialize(bytes);
  }
}
