import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// QuerySpendableBalanceByDenomResponse defines the gRPC response structure
/// for querying an account's spendable balance for a specific denom.
/// Since: cosmos-sdk 0.47
class QuerySpendableBalanceByDenomResponse extends CosmosMessage {
  /// balance is the balance of the coin.
  final Coin balance;
  const QuerySpendableBalanceByDenomResponse(this.balance);

  factory QuerySpendableBalanceByDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QuerySpendableBalanceByDenomResponse(
        Coin.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"balance": balance.toJson()};
  }

  @override
  String get typeUrl =>
      BankV1beta1Types.spendableBalanceByDenomResponse.typeUrl;

  @override
  List get values => [balance];
}
