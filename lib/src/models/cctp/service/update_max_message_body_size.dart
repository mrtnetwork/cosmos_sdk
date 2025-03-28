import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/cctp/core/service.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgUpdateMaxMessageBodySize
    extends CCTPV1Service<EmptyServiceRequestResponse> with AminoMessage {
  final String from;
  final BigInt messageSize;
  const CCTPV1MsgUpdateMaxMessageBodySize(
      {required this.from, required this.messageSize});

  factory CCTPV1MsgUpdateMaxMessageBodySize.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgUpdateMaxMessageBodySize(
        from: decode.getField(1), messageSize: decode.getField(2));
  }
  factory CCTPV1MsgUpdateMaxMessageBodySize.fromJson(
      Map<String, dynamic> json) {
    return CCTPV1MsgUpdateMaxMessageBodySize(
        from: json.as("from"), messageSize: json.asBigInt("message_size"));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"from": from, "message_size": messageSize};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgUpdateMaxMessageBodySize;

  @override
  List get values => [from, messageSize];
  @override
  List<String?> get signers => [from];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        CCTPV1Types.msgUpdateMaxMessageBodySizeResponse);
  }
}
