import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/query/query_spendable_balance_by_denom_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// QuerySpendableBalanceByDenomRequest defines the gRPC request
/// structure for querying an account's spendable balance for a specific denom.
/// Since: cosmos-sdk 0.47
class QuerySpendableBalanceByDenomRequest extends CosmosMessage
    with QueryMessage<QuerySpendableBalanceByDenomResponse> {
  /// address is the address to query balances for.
  final CosmosBaseAddress address;

  /// denom is the coin denom to query balances for.
  final String denom;
  const QuerySpendableBalanceByDenomRequest(
      {required this.address, required this.denom});
  factory QuerySpendableBalanceByDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QuerySpendableBalanceByDenomRequest(
        address: CosmosBaseAddress(decode.getField(1)),
        denom: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address.address, "denom": denom};
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.spendableBalanceByDenomRequest;

  @override
  List get values => [address.address, denom];

  @override
  QuerySpendableBalanceByDenomResponse onResponse(List<int> bytes) {
    return QuerySpendableBalanceByDenomResponse.deserialize(bytes);
  }

  @override
  QuerySpendableBalanceByDenomResponse onJsonResponse(
      Map<String, dynamic> json) {
    return QuerySpendableBalanceByDenomResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [address.address];

  @override
  Map<String, String?> get queryParameters => {"denom": denom};
}
