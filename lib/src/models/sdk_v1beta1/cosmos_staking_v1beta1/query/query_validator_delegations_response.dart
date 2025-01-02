import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/delegation_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryValidatorDelegationsResponse is response type for the Query/ValidatorDelegations RPC method
class QueryValidatorDelegationsResponse extends CosmosMessage {
  final List<DelegationResponse> delegationResponse;
  final PageResponse? pagination;
  const QueryValidatorDelegationsResponse(
      {required this.delegationResponse, this.pagination});
  factory QueryValidatorDelegationsResponse.fromRpc(Map<String, dynamic> json) {
    return QueryValidatorDelegationsResponse(
      delegationResponse: (json["delegation_responses"] as List?)
              ?.map((e) => DelegationResponse.fromRpc(e))
              .toList() ??
          [],
      pagination: json["pagination"] == null
          ? null
          : PageResponse.fromRpc(json["pagination"]),
    );
  }
  factory QueryValidatorDelegationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryValidatorDelegationsResponse(
        delegationResponse: decode
            .getFields<List<int>>(1)
            .map((e) => DelegationResponse.deserialize(e))
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
      "delegation_responses":
          delegationResponse.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.queryValidatorDelegationsResponse;

  @override
  List get values => [delegationResponse, pagination];
}
