import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// MsgSend represents a message to send coins from one account to another.
class MsgSend extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final CosmosBaseAddress fromAddress;
  final CosmosBaseAddress toAddress;
  final List<Coin> amount;
  const MsgSend(
      {required this.fromAddress,
      required this.toAddress,
      required this.amount});
  factory MsgSend.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgSend(
        fromAddress: CosmosBaseAddress(decode.getField(1)),
        toAddress: CosmosBaseAddress(decode.getField(2)),
        amount: decode
            .getFields<List<int>>(3)
            .map((e) => Coin.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "from_address": fromAddress.address,
      "to_address": toAddress.address,
      "amount": amount.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values => [fromAddress.address, toAddress.address, amount];

  @override
  @override
  TypeUrl get typeUrl => BankV1beta1Types.msgSend;

  @override
  TypeUrl get service => BankV1beta1Types.send;

  @override
  List<String?> get signers => [fromAddress.address];
  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(BankV1beta1Types.msgSendResponse);
  }
}
