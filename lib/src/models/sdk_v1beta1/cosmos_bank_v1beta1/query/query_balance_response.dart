import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

class QueryBalanceResponse extends CosmosMessage {
  final Coin balance;
  const QueryBalanceResponse(this.balance);
  factory QueryBalanceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryBalanceResponse(Coin.deserialize(decode.getField(1)));
  }
  factory QueryBalanceResponse.fromRpc(Map<String, dynamic> json) {
    return QueryBalanceResponse(Coin.fromRpc(json["balance"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"balance": balance.toJson()};
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.balanceRespone;

  @override
  List get values => [balance];
}
