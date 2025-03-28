import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgUpdateTokenController
    extends CCTPV1Service<EmptyServiceRequestResponse> with AminoMessage {
  final String from;
  final String newTokenController;
  const CCTPV1MsgUpdateTokenController(
      {required this.from, required this.newTokenController});

  factory CCTPV1MsgUpdateTokenController.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgUpdateTokenController(
        from: decode.getField(1), newTokenController: decode.getField(2));
  }
  factory CCTPV1MsgUpdateTokenController.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgUpdateTokenController(
        from: json.as("from"),
        newTokenController: json.as("new_token_controller"));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"from": from, "new_token_controller": newTokenController};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgUpdateTokenController;

  @override
  List get values => [from, newTokenController];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        CCTPV1Types.msgUpdateTokenControllerResponse);
  }
}
