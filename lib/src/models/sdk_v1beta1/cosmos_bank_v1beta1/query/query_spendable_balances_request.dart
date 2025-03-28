import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/query/query_spendable_balances_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

///. SpendableBalances queries the spendable balance of all coins for a single account.
/// When called from another module, this query might consume a high amount of gas if the pagination field is incorrectly set.
/// Since: cosmos-sdk 0.46
class QuerySpendableBalancesRequest extends CosmosMessage
    with QueryMessage<QuerySpendableBalancesResponse> {
  /// address is the address to query spendable balances for.
  final CosmosBaseAddress address;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;

  const QuerySpendableBalancesRequest({required this.address, this.pagination});

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address.address, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.spendableBalancesRequest;

  @override
  List get values => [address.address, pagination];

  @override
  QuerySpendableBalancesResponse onResponse(List<int> bytes) {
    return QuerySpendableBalancesResponse.deserialize(bytes);
  }

  @override
  QuerySpendableBalancesResponse onJsonResponse(Map<String, dynamic> json) {
    return QuerySpendableBalancesResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [address.address];

  @override
  Map<String, String?> get queryParameters =>
      {...pagination?.queryParameters ?? {}};
}
