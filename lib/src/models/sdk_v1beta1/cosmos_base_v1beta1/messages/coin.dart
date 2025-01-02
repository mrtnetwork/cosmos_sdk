import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/utils/utils.dart';

import '../types/types.dart';

/// Coin defines a token with a denomination and an amount.
class Coin extends CosmosMessage {
  /// denomination
  final String denom;

  /// amount
  final BigInt amount;
  const Coin({required this.denom, required this.amount});
  factory Coin.deserialize(List<int> data) {
    final decode = CosmosProtocolBuffer.decode(data);
    return Coin(
        denom: decode.getField<String>(1),
        amount: BigintUtils.parse(decode.getField<String>(2)));
  }
  factory Coin.fromRpc(Map<String, dynamic> json) {
    return Coin(denom: json["denom"], amount: BigInt.parse(json["amount"]));
  }

  Coin copyWith({String? denom, BigInt? amount}) {
    return Coin(denom: denom ?? this.denom, amount: amount ?? this.amount);
  }

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
  TypeUrl get typeUrl => BaseV1beta1Types.coin;

  Map<String, String> toQueryParam(String tag) {
    return {"$tag.denom": denom, "$tag.amount": amount.toString()};
  }
}
