import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgAcceptOwner extends CCTPV1Service<EmptyServiceRequestResponse>
    with AminoMessage {
  final String from;
  const CCTPV1MsgAcceptOwner(this.from);

  factory CCTPV1MsgAcceptOwner.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgAcceptOwner(decode.getField(1));
  }
  factory CCTPV1MsgAcceptOwner.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgAcceptOwner(json.as("from"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"from": from};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgAcceptOwner;

  @override
  List get values => [from];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(CCTPV1Types.msgAcceptOwnerResponse);
  }
}
