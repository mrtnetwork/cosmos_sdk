import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainMsgSend extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  final CosmosBaseAddress fromAddress;
  final CosmosBaseAddress toAddress;
  final List<Coin> amount;
  ThorchainMsgSend({
    required this.fromAddress,
    required this.toAddress,
    required List<Coin> amount,
  }) : amount = amount.immutable;
  factory ThorchainMsgSend.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgSend(
      fromAddress: CosmosBaseAddress.fromBytes(decode.getField(1)),
      toAddress: CosmosBaseAddress.fromBytes(decode.getField(2)),
      amount: decode.getFields(3).map((e) => Coin.deserialize(e)).toList(),
    );
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
  TypeUrl get typeUrl => ThorchainV1Types.msgSend;

  @override
  List get values => [fromAddress.toBytes(), toAddress.toBytes(), amount];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(typeUrl);
  }

  @override
  TypeUrl get service => ThorchainV1Types.msgSend;

  @override
  List<String?> get signers => [fromAddress.address];
}
