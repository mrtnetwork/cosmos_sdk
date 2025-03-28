import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgUpdateAttesterManager
    extends CCTPV1Service<EmptyServiceRequestResponse> with AminoMessage {
  final String from;
  final String newAttesterManager;
  const CCTPV1MsgUpdateAttesterManager(
      {required this.from, required this.newAttesterManager});

  factory CCTPV1MsgUpdateAttesterManager.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgUpdateAttesterManager(
        from: decode.getField(1), newAttesterManager: decode.getField(2));
  }
  factory CCTPV1MsgUpdateAttesterManager.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgUpdateAttesterManager(
        from: json.as("from"),
        newAttesterManager: json.as("new_attester_manager"));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"from": from, "new_attester_manager": newAttesterManager};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgUpdateAttesterManager;

  @override
  List get values => [from, newAttesterManager];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        CCTPV1Types.msgUpdateAttesterManagerResponse);
  }
}
