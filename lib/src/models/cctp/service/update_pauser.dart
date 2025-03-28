import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgUpdatePauser extends CCTPV1Service<EmptyServiceRequestResponse>
    with AminoMessage {
  final String from;
  final String newPauser;
  const CCTPV1MsgUpdatePauser({required this.from, required this.newPauser});

  factory CCTPV1MsgUpdatePauser.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgUpdatePauser(
        from: decode.getField(1), newPauser: decode.getField(2));
  }
  factory CCTPV1MsgUpdatePauser.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgUpdatePauser(
        from: json.as("from"), newPauser: json.as("new_pauser"));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"from": from, "new_pauser": newPauser};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgUpdatePauser;

  @override
  List get values => [from, newPauser];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(CCTPV1Types.msgUpdatePauserResponse);
  }
}
