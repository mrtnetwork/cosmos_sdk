import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Input models transaction input.
class Input extends CosmosMessage {
  final BaseAddress address;
  final List<Coin> coins;

  const Input({required this.address, required this.coins});
  factory Input.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Input(
        address: BaseAddress(decode.getField(1)),
        coins: decode
            .getFileds<List<int>>(2)
            .map((e) => Coin.deserialize(e))
            .toList());
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
  String get typeUrl => BankV1beta1Types.input.typeUrl;
}
