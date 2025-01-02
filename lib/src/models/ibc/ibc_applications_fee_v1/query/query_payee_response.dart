import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryPayeeResponse defines the response type for the Payee rpc
class QueryPayeeResponse extends CosmosMessage {
  /// the payee address to which packet fees are paid out
  final String? payeeAddress;
  const QueryPayeeResponse({this.payeeAddress});
  factory QueryPayeeResponse.fromRpc(Map<String, dynamic> json) {
    return QueryPayeeResponse(payeeAddress: json["payee_address"]);
  }

  factory QueryPayeeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryPayeeResponse(payeeAddress: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"payee_address": payeeAddress};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.queryPayeeResponse;

  @override
  List get values => [payeeAddress];
}
