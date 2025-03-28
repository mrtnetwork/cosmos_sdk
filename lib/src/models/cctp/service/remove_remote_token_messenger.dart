import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgRemoveRemoteTokenMessenger
    extends CCTPV1Service<EmptyServiceRequestResponse> with AminoMessage {
  final String? from;
  final int? domainId;

  const CCTPV1MsgRemoveRemoteTokenMessenger(
      {required this.from, required this.domainId});

  factory CCTPV1MsgRemoveRemoteTokenMessenger.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgRemoveRemoteTokenMessenger(
        domainId: decode.getField(2), from: decode.getField(1));
  }
  factory CCTPV1MsgRemoveRemoteTokenMessenger.fromJson(
      Map<String, dynamic> json) {
    return CCTPV1MsgRemoveRemoteTokenMessenger(
        from: json.as("from"), domainId: json.as("domain_id"));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"from": from, "domain_id": domainId};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgRemoveRemoteTokenMessenger;

  @override
  List get values => [from, domainId];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        CCTPV1Types.msgRemoveRemoteTokenMessengerResponse);
  }
}
