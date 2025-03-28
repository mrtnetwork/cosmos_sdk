import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// DecCoin defines a token with a denomination and a decimal amount.
class DecCoin extends CosmosMessage {
  /// denomination
  final String denom;

  /// decimal amount
  final String amount;
  const DecCoin({required this.denom, required this.amount});
  factory DecCoin.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DecCoin(denom: decode.getField(1), amount: decode.getField(2));
  }
  factory DecCoin.fromJson(Map<String, dynamic> json) {
    return DecCoin(denom: json["denom"], amount: json["amount"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom, "amount": amount.toString()};
  }

  @override
  List get values => [denom, amount];
  @override
  TypeUrl get typeUrl => BaseV1beta1Types.decCoin;
}
