import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/auth_v1beta1_types.dart';

/// QueryAccountsResponse is the response type for the Query/Accounts RPC method.
class QueryAccountsResponse extends CosmosMessage {
  /// accounts are the existing accounts.
  final List<Any> accounts;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;

  const QueryAccountsResponse({required this.accounts, this.pagination});
  factory QueryAccountsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryAccountsResponse(
      accounts: decode.getFileds(1).map((e) => Any.deserialize(e)).toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
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
  String get typeUrl => AuthV1beta1Types.accountsResponse.typeUrl;
}
