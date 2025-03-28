import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/opinit/core/service.dart';
import 'package:cosmos_sdk/src/models/opinit/ophost_v1/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

import 'msg_initiate_token_deposit_response.dart';

class OpInitOpHostV1MsgInitiateTokenDeposit
    extends OpInitService<OpInitOpHostV1MsgInitiateTokenDepositResponse>
    with AminoMessage {
  final String? sender;

  final BigInt? bridgeId;

  final String? to;

  final Coin? amount;

  final List<int>? data;

  OpInitOpHostV1MsgInitiateTokenDeposit(
      {this.sender, this.bridgeId, this.to, this.amount, List<int>? data})
      : data = data?.asImmutableBytes;

  factory OpInitOpHostV1MsgInitiateTokenDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OpInitOpHostV1MsgInitiateTokenDeposit(
        sender: decode.getField(1),
        bridgeId: decode.getField(2),
        to: decode.getField(3),
        amount: decode.getResult(4)?.to<Coin, List<int>>(Coin.deserialize),
        data: decode.getField<List<int>>(5));
  }
  factory OpInitOpHostV1MsgInitiateTokenDeposit.fromJson(
      Map<String, dynamic> json) {
    return OpInitOpHostV1MsgInitiateTokenDeposit(
        sender: json.as("sender"),
        bridgeId: json.asBigInt("bridge_id"),
        to: json.as("to"),
        amount: json.maybeAs(key: "amount", onValue: Coin.fromJson),
        data: json.asBytes("data"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "bridge_id": bridgeId?.toString(),
      "to": to,
      "amount": amount?.toJson(),
      "data": CosmosUtils.tryToBase64(data)
    };
  }

  @override
  TypeUrl get typeUrl => OpInitOpHostV1Types.msgInitiateTokenDeposit;

  @override
  List get values => [sender, bridgeId, to, amount, data];
  @override
  List<String?> get signers => [sender];

  @override
  OpInitOpHostV1MsgInitiateTokenDepositResponse onResponse(List<int> bytes) {
    return OpInitOpHostV1MsgInitiateTokenDepositResponse.deserialize(bytes);
  }
}
