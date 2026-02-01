import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class CCTPV1MsgReplaceMessage extends CCTPV1Service<EmptyServiceRequestResponse>
    with AminoMessage {
  final String? from;
  final List<int>? originalMessage;
  final List<int>? originalAttestation;
  final List<int>? newMessageBody;
  final List<int>? newDestinationCaller;

  const CCTPV1MsgReplaceMessage({
    required this.from,
    required this.originalMessage,
    required this.originalAttestation,
    required this.newMessageBody,
    required this.newDestinationCaller,
  });

  factory CCTPV1MsgReplaceMessage.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgReplaceMessage(
      from: decode.getField(1),
      originalMessage: decode.getField(2),
      originalAttestation: decode.getField(3),
      newDestinationCaller: decode.getField(5),
      newMessageBody: decode.getField(4),
    );
  }
  factory CCTPV1MsgReplaceMessage.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgReplaceMessage(
      from: json.as("from"),
      originalMessage: json.asBytes("original_message"),
      originalAttestation: json.asBytes("original_attestation"),
      newMessageBody: json.asBytes("new_message_body"),
      newDestinationCaller: json.asBytes("new_destination_caller"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "from": from,
      "original_message": CosmosUtils.tryToBase64(originalMessage),
      "original_attestation": CosmosUtils.tryToBase64(originalAttestation),
      "new_destination_caller": CosmosUtils.tryToBase64(newDestinationCaller),
      "new_message_body": CosmosUtils.tryToBase64(newMessageBody),
    };
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgReplaceMessage;

  @override
  List get values => [
    from,
    originalMessage,
    originalAttestation,
    newMessageBody,
    newDestinationCaller,
  ];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(CCTPV1Types.msgReplaceMessageResponse);
  }
}
