import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// DenomOwner defines structure representing an account that owns or holds a particular denominated token.
///  It contains the account address and account balance of the denominated token.
class DenomOwner extends CosmosMessage {
  /// address defines the address that owns a particular denomination.
  final CosmosBaseAddress address;

  /// balance is the balance of the denominated coin for an account.
  final Coin balance;

  const DenomOwner({required this.address, required this.balance});
  factory DenomOwner.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DenomOwner(
        address: CosmosBaseAddress(decode.getField(1)),
        balance: Coin.deserialize(decode.getField(2)));
  }
  factory DenomOwner.fromJson(Map<String, dynamic> json) {
    return DenomOwner(
        address: CosmosBaseAddress(json["address"]),
        balance: Coin.fromJson(json["balance"]));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address.address, "balance": balance.toJson()};
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.denomOwner;

  @override
  List get values => [address.address, balance];
}
