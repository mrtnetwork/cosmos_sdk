import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// Output models transaction outputs.
class Output extends CosmosMessage {
  final CosmosBaseAddress address;
  final List<Coin> coins;

  const Output({required this.address, required this.coins});
  factory Output.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Output(
      address: CosmosBaseAddress(decode.getField(1)),
      coins:
          decode
              .getFields<List<int>>(2)
              .map((e) => Coin.deserialize(e))
              .toList(),
    );
  }
  factory Output.fromJson(Map<String, dynamic> json) {
    return Output(
      address: CosmosBaseAddress(json.as("address")),
      coins: json.asListOfMap("coins")!.map((e) => Coin.fromJson(e)).toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "address": address.address,
      "coins": coins.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List get values => [address.address, coins];

  @override
  @override
  TypeUrl get typeUrl => BankV1beta1Types.output;
}
