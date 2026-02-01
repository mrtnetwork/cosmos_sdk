import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

class CCTPV1MsgReplaceDepositForBurn
    extends CCTPV1Service<EmptyServiceRequestResponse>
    with AminoMessage {
  final String? from;
  final List<int>? originalMessage;
  final List<int>? originalAttestation;
  final List<int>? newDestinationCaller;
  final List<int>? newMintRecipient;

  const CCTPV1MsgReplaceDepositForBurn({
    required this.from,
    required this.originalMessage,
    required this.originalAttestation,
    required this.newDestinationCaller,
    required this.newMintRecipient,
  });

  factory CCTPV1MsgReplaceDepositForBurn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgReplaceDepositForBurn(
      from: decode.getField(1),
      originalMessage: decode.getField(2),
      originalAttestation: decode.getField(3),
      newDestinationCaller: decode.getField(4),
      newMintRecipient: decode.getField(5),
    );
  }
  factory CCTPV1MsgReplaceDepositForBurn.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgReplaceDepositForBurn(
      from: json.as("from"),
      originalMessage: json.asBytes("original_message"),
      originalAttestation: json.asBytes("original_attestation"),
      newDestinationCaller: json.asBytes("new_destination_caller"),
      newMintRecipient: json.asBytes("new_mint_recipient"),
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
      "new_mint_recipient": CosmosUtils.tryToBase64(newMintRecipient),
    };
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgReplaceDepositForBurn;

  @override
  List get values => [
    from,
    originalMessage,
    originalAttestation,
    newDestinationCaller,
    newMintRecipient,
  ];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
      CCTPV1Types.msgReplaceDepositForBurnResponse,
    );
  }
}
