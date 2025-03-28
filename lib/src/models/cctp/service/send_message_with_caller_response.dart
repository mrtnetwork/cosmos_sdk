import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgSendMessageWithCallerResponse extends CosmosMessage {
  final BigInt? nonce;

  const CCTPV1MsgSendMessageWithCallerResponse(this.nonce);

  factory CCTPV1MsgSendMessageWithCallerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgSendMessageWithCallerResponse(decode.getField(1));
  }
  factory CCTPV1MsgSendMessageWithCallerResponse.fromJson(
      Map<String, dynamic> json) {
    return CCTPV1MsgSendMessageWithCallerResponse(json.asBigInt("nonce"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"nonce": nonce.toString()};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgSendMessageWithCallerResponse;

  @override
  List get values => [nonce];
}
