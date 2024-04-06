import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_tx_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Tip is the tip used for meta-transactions.
/// Since: cosmos-sdk 0.46
/// deprecated
class Tip extends CosmosMessage {
  /// amount is the amount of the tip
  final List<Coin> amount;

  /// tipper is the address of the account paying for the tip
  final BaseAddress? tipper;

  const Tip({required this.amount, required this.tipper});
  factory Tip.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return Tip(
        amount: decode
            .getFields<List<int>>(1)
            .map((e) => Coin.deserialize(e))
            .toList(),
        tipper: decode
            .getResult(2)
            ?.to<BaseAddress, String>((e) => BaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "amount": amount.map((e) => e.toJson()).toList(),
      "tipper": tipper?.address
    };
  }

  @override
  List get values => [amount, tipper?.address];
  @override
  String get typeUrl => TxV1beta1Types.tip.typeUrl;
}
