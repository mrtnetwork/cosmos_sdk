import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/query/query_balance_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// Balance queries the balance of a single coin for a single account.
class QueryBalanceRequest extends CosmosMessage
    with QueryMessage<QueryBalanceResponse> {
  /// address is the address to query balances for.
  final BaseAddress address;

  /// denom is the coin denom to query balances for.
  final String denom;

  const QueryBalanceRequest({required this.address, required this.denom});

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => BankV1beta1Types.balance.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"address": address.address, "denom": denom};
  }

  @override
  String get typeUrl => BankV1beta1Types.balanceRequest.typeUrl;

  @override
  List get values => [address.address, denom];

  @override
  QueryBalanceResponse onResponse(List<int> bytes) {
    return QueryBalanceResponse.deserialize(bytes);
  }
}
