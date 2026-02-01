import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class CCTPV1MsgDepositForBurnWithCallerResponse extends CosmosMessage {
  final BigInt? nonce;

  const CCTPV1MsgDepositForBurnWithCallerResponse(this.nonce);

  factory CCTPV1MsgDepositForBurnWithCallerResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CCTPV1MsgDepositForBurnWithCallerResponse(decode.getField(1));
  }
  factory CCTPV1MsgDepositForBurnWithCallerResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CCTPV1MsgDepositForBurnWithCallerResponse(json.asBigInt("nonce"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"nonce": nonce.toString()};
  }

  @override
  TypeUrl get typeUrl => CCTPV1Types.msgDepositForBurnWithCallerResponse;

  @override
  List get values => [nonce];
}
