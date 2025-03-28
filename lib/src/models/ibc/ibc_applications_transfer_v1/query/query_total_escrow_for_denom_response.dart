import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryTotalEscrowForDenomResponse is the response type for TotalEscrowForDenom RPC method.
class QueryTotalEscrowForDenomResponse extends CosmosMessage {
  final Coin amount;
  const QueryTotalEscrowForDenomResponse(this.amount);
  factory QueryTotalEscrowForDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryTotalEscrowForDenomResponse(
        Coin.deserialize(decode.getField(1)));
  }
  factory QueryTotalEscrowForDenomResponse.fromJson(Map<String, dynamic> json) {
    return QueryTotalEscrowForDenomResponse(Coin.fromJson(json["amount"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amount": amount.toJson()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryTotalEscrowForDenomResponse;

  @override
  List get values => [amount];
}
