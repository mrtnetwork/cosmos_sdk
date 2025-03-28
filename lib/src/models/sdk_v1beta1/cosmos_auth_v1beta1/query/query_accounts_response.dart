import 'package:cosmos_sdk/src/models/core/account/account.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';

/// QueryAccountsResponse is the response type for the Query/Accounts RPC method.
class QueryAccountsResponse extends CosmosMessage {
  /// accounts are the existing accounts.
  final List<CosmosBaseAccount> accounts;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;

  const QueryAccountsResponse({required this.accounts, this.pagination});
  factory QueryAccountsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAccountsResponse(
      accounts: decode
          .getFields<List<int>>(1)
          .map((e) => Any.deserialize(e))
          .map((e) => CosmosBaseAccount.fromAny(e))
          .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
    );
  }
  factory QueryAccountsResponse.fromJson(Map<String, dynamic> json) {
    return QueryAccountsResponse(
      accounts: (json["accounts"] as List)
          .map((e) => CosmosBaseAccount.fromJson(e))
          .toList(),
      pagination: PageResponse.fromJson(json["pagination"]),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "accounts": accounts.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  List get values => [accounts, pagination];

  @override
  TypeUrl get typeUrl => AuthV1beta1Types.accountsResponse;
}
