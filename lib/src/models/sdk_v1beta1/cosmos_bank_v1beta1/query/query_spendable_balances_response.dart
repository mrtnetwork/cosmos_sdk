import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// QuerySpendableBalancesResponse defines the gRPC response structure
/// for querying an account's spendable balances.
/// Since: cosmos-sdk 0.46
class QuerySpendableBalancesResponse extends CosmosMessage {
  /// balances is the spendable balances of all the coins.
  final List<Coin> balances;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;

  factory QuerySpendableBalancesResponse.fromRpc(Map<String, dynamic> json) {
    return QuerySpendableBalancesResponse(
      balances:
          (json["balances"] as List?)?.map((e) => Coin.fromRpc(e)).toList() ??
              [],
      pagination: json["pagination"] == null
          ? null
          : PageResponse.fromRpc(json["pagination"]),
    );
  }
  const QuerySpendableBalancesResponse(
      {required this.balances, this.pagination});
  factory QuerySpendableBalancesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QuerySpendableBalancesResponse(
        balances: decode
            .getFields<List<int>>(1)
            .map((e) => Coin.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "balances": balances.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.spendableBalancesResponse;

  @override
  List get values => [balances, pagination];
}
