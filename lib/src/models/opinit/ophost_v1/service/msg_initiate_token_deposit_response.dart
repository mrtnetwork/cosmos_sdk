import 'package:cosmos_sdk/src/models/opinit/ophost_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

// MsgInitiateTokenDepositResponse returns a message handle result.
class OpInitOpHostV1MsgInitiateTokenDepositResponse extends CosmosMessage {
  final BigInt? sequence;

  OpInitOpHostV1MsgInitiateTokenDepositResponse({this.sequence});

  factory OpInitOpHostV1MsgInitiateTokenDepositResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OpInitOpHostV1MsgInitiateTokenDepositResponse(
        sequence: decode.getField(1));
  }
  factory OpInitOpHostV1MsgInitiateTokenDepositResponse.fromJson(
      Map<String, dynamic> json) {
    return OpInitOpHostV1MsgInitiateTokenDepositResponse(
        sequence: json.asBigInt("sequence"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"sequence": sequence?.toString()};
  }

  @override
  TypeUrl get typeUrl => OpInitOpHostV1Types.msgInitiateTokenDepositResponse;

  @override
  List get values => [sequence];
}
