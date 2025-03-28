import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgSendMessageResponse extends CosmosMessage {
  final BigInt? nonce;

  const CCTPV1MsgSendMessageResponse(this.nonce);

  factory CCTPV1MsgSendMessageResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgSendMessageResponse(decode.getField(1));
  }
  factory CCTPV1MsgSendMessageResponse.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgSendMessageResponse(json.asBigInt("nonce"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"nonce": nonce.toString()};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgSendMessageResponse;

  @override
  List get values => [nonce];
}
