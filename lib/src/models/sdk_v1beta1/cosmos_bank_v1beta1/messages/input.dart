import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// Input models transaction input.
class Input extends CosmosMessage {
  final CosmosBaseAddress address;
  final List<Coin> coins;

  const Input({required this.address, required this.coins});
  factory Input.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Input(
        address: CosmosBaseAddress(decode.getField(1)),
        coins: decode
            .getFields<List<int>>(2)
            .map((e) => Coin.deserialize(e))
            .toList());
  }
  factory Input.fromJson(Map<String, dynamic> json) {
    return Input(
        address: CosmosBaseAddress(json.as("address")),
        coins:
            json.asListOfMap("coins")!.map((e) => Coin.fromJson(e)).toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address.address,
      "coins": coins.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values => [address.address, coins];

  @override
  @override
  TypeUrl get typeUrl => BankV1beta1Types.input;
}
