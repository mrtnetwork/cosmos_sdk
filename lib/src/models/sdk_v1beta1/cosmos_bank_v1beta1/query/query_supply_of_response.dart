import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// QuerySupplyOfResponse is the response type for the Query/SupplyOf RPC method.
class QuerySupplyOfResponse extends CosmosMessage {
  /// amount is the supply of the coin.
  final Coin amount;

  const QuerySupplyOfResponse({required this.amount});
  factory QuerySupplyOfResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QuerySupplyOfResponse(amount: Coin.deserialize(decode.getField(1)));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amount": amount.toJson()};
  }

  @override
  String get typeUrl => BankV1beta1Types.supplyOfResponse.typeUrl;

  @override
  List get values => [amount];
}
