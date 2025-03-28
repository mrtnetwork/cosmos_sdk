import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// QueryTotalSupplyResponse is the response type for the Query/TotalSupply RPC method.
class QueryTotalSupplyResponse extends CosmosMessage {
  /// supply is the supply of the coins.
  final List<Coin> supply;

  factory QueryTotalSupplyResponse.fromJson(Map<String, dynamic> json) {
    return QueryTotalSupplyResponse(
      supply:
          (json["supply"] as List?)?.map((e) => Coin.fromJson(e)).toList() ??
              [],
      pagination: json["pagination"] == null
          ? null
          : PageResponse.fromJson(json["pagination"]),
    );
  }

  /// pagination defines the pagination in the response.
  ///
  /// Since: cosmos-sdk 0.43
  final PageResponse? pagination;
  const QueryTotalSupplyResponse({required this.supply, this.pagination});
  factory QueryTotalSupplyResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryTotalSupplyResponse(
        supply: decode
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
      "supply": supply.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.totalSupplyResponse;

  @override
  List get values => [supply, pagination];
}
