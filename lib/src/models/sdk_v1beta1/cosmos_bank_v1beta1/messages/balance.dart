import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Balance defines an account address and balance pair used in the bank module's genesis state.
class Balance extends CosmosMessage {
  /// address is the address of the balance holder.
  final CosmosBaseAddress address;

  /// coins defines the different coins this balance holds.
  final List<Coin> coins;

  const Balance({required this.address, required this.coins});
  factory Balance.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Balance(
        address: CosmosBaseAddress(decode.getField(1)),
        coins: decode
            .getFields<List<int>>(2)
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
  String get typeUrl => BankV1beta1Types.msgSend.typeUrl;
}
