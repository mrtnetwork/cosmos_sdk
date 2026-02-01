import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/messages/denom_owner.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDenomOwnersResponse defines the RPC response of a DenomOwners RPC query.
/// Since: cosmos-sdk 0.46
class QueryDenomOwnersResponse extends CosmosMessage {
  final List<DenomOwner> denomOwners;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;

  const QueryDenomOwnersResponse({required this.denomOwners, this.pagination});
  factory QueryDenomOwnersResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomOwnersResponse(
      denomOwners:
          (json["denom_owners"] as List)
              .map((e) => DenomOwner.fromJson(e))
              .toList(),
      pagination:
          json["pagination"] == null
              ? null
              : PageResponse.fromJson(json["pagination"]),
    );
  }

  factory QueryDenomOwnersResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDenomOwnersResponse(
      denomOwners:
          decode
              .getFields<List<int>>(1)
              .map((e) => DenomOwner.deserialize(e))
              .toList(),
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
      "denom_owners": denomOwners.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.denomOwnersResponse;

  @override
  List get values => [denomOwners, pagination];
}
