import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgUpdateSignatureThreshold
    extends CCTPV1Service<EmptyServiceRequestResponse> with AminoMessage {
  final String from;
  final int amount;
  const CCTPV1MsgUpdateSignatureThreshold(
      {required this.from, required this.amount});

  factory CCTPV1MsgUpdateSignatureThreshold.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgUpdateSignatureThreshold(
        from: decode.getField(1), amount: decode.getField(2));
  }
  factory CCTPV1MsgUpdateSignatureThreshold.fromJson(
      Map<String, dynamic> json) {
    return CCTPV1MsgUpdateSignatureThreshold(
        from: json.as("from"), amount: json.as("amount"));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"from": from, "amount": amount};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgUpdateSignatureThreshold;

  @override
  List get values => [from, amount];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        CCTPV1Types.msgUpdateSignatureThresholdResponse);
  }
}
