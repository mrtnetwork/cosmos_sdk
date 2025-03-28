import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/query/query_supply_of_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// QuerySupplyOfRequest is the request type for the Query/SupplyOf RPC method.
class QuerySupplyOfRequest extends CosmosMessage
    with QueryMessage<QuerySupplyOfResponse> {
  /// denom is the coin denom to query balances for.
  final String denom;
  const QuerySupplyOfRequest({required this.denom});
  factory QuerySupplyOfRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QuerySupplyOfRequest(denom: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"denom": denom};
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.supplyOfResponse;

  @override
  List get values => [denom];

  @override
  QuerySupplyOfResponse onResponse(List<int> bytes) {
    return QuerySupplyOfResponse.deserialize(bytes);
  }

  @override
  QuerySupplyOfResponse onJsonResponse(Map<String, dynamic> json) {
    return QuerySupplyOfResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {"denom": denom};
}
