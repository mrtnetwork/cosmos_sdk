import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// FungibleTokenPacketData defines a struct for the packet payload See FungibleTokenPacketData
/// spec: https://github.com/cosmos/ibc/tree/master/spec/app/ics-020-fungible-token-transfer#data-structures
class FungibleTokenPacketData extends CosmosMessage {
  /// the token denomination to be transferred
  final String? denom;

  /// the token amount to be transferred
  final String? amount;

  /// the sender address
  final String? sender;

  /// the recipient address on the destination chain
  final String? receiver;

  /// optional memo
  final String? memo;
  const FungibleTokenPacketData(
      {this.denom, this.amount, this.sender, this.receiver, this.memo});
  factory FungibleTokenPacketData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return FungibleTokenPacketData(
        denom: decode.getField(1),
        amount: decode.getField(2),
        sender: decode.getField(3),
        receiver: decode.getField(4),
        memo: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "denom": denom,
      "amount": amount,
      "sender": sender,
      "receiver": receiver,
      "memo": memo
    };
  }

  @override
  String get typeUrl => IbcTypes.fungibleTokenPacketData.typeUrl;

  @override
  List get values => [denom, amount, sender, receiver, memo];
}
