import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/numbers/numbers.dart';

import '../types/types.dart';

/// Coin defines a token with a denomination and an amount.
class Coin extends CosmosMessage {
  const Coin({required this.denom, required this.amount});
  factory Coin.deserialize(List<int> data) {
    final decode = CosmosProtocolBuffer.decode(data);
    return Coin(
        denom: decode.getField<String>(1),
        amount: BigintUtils.parse(decode.getField<String>(2)));
  }

  /// denomination
  final String denom;

  /// amount
  final BigInt amount;

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "denom": denom,
      "amount": amount.toString(),
    };
  }

  @override
  List get values => [denom, amount.toString()];

  @override
  String get typeUrl => BaseV1beta1Types.coin.typeUrl;
}
