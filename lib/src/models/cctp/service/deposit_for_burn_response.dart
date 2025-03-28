import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgDepositForBurnResponse extends CosmosMessage {
  final BigInt? nonce;

  const CCTPV1MsgDepositForBurnResponse(this.nonce);

  factory CCTPV1MsgDepositForBurnResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgDepositForBurnResponse(decode.getField(1));
  }
  factory CCTPV1MsgDepositForBurnResponse.fromJson(Map<String, dynamic> json) {
    return CCTPV1MsgDepositForBurnResponse(json.asBigInt("nonce"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"nonce": nonce.toString()};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgDepositForBurnResponse;

  @override
  List get values => [nonce];
}
