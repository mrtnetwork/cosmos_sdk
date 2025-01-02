import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/redelegation_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryRedelegationsResponse is response type for the Query/Redelegations RPC method.
class QueryRedelegationsResponse extends CosmosMessage {
  final List<RedelegationResponse> redelegationResponses;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  const QueryRedelegationsResponse(
      {required this.redelegationResponses, this.pagination});

  factory QueryRedelegationsResponse.fromRpc(Map<String, dynamic> json) {
    return QueryRedelegationsResponse(
      redelegationResponses: (json["redelegation_responses"] as List?)
              ?.map((e) => RedelegationResponse.fromRpc(e))
              .toList() ??
          [],
      pagination: json["pagination"] == null
          ? null
          : PageResponse.fromRpc(json["pagination"]),
    );
  }
  factory QueryRedelegationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryRedelegationsResponse(
        redelegationResponses: decode
            .getFields<List<int>>(1)
            .map((e) => RedelegationResponse.deserialize(e))
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
      "redelegation_responses":
          redelegationResponses.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.queryRedelegationsResponse;

  @override
  List get values => [redelegationResponses, pagination];
}
