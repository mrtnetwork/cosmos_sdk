import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// QueryAllBalancesResponse is the response type for the Query/AllBalances RPC method.
class QueryAllBalancesResponse extends CosmosMessage {
  /// balances is the balances of all the coins.
  final List<Coin> balances;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  const QueryAllBalancesResponse({required this.balances, this.pagination});
  factory QueryAllBalancesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAllBalancesResponse(
      balances:
          decode
              .getFields<List<int>>(1)
              .map((e) => Coin.deserialize(e))
              .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
    );
  }
  factory QueryAllBalancesResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllBalancesResponse(
      balances:
          (json["balances"] as List).map((e) => Coin.fromJson(e)).toList(),
      pagination: PageResponse.fromJson(json["pagination"]),
    );
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "balances": balances.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.allBalancesResponse;

  @override
  List get values => [balances, pagination];
}
