import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/delegation_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryDelegatorDelegationsResponse is response type for the Query/DelegatorDelegations RPC method.
class QueryDelegatorDelegationsResponse extends CosmosMessage {
  /// delegation_responses defines all the delegations' info of a delegator.
  final List<DelegationResponse> delegationResponses;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;

  const QueryDelegatorDelegationsResponse(
      {required this.delegationResponses, this.pagination});
  factory QueryDelegatorDelegationsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDelegatorDelegationsResponse(
        delegationResponses: decode
            .getFileds<List<int>>(1)
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
          delegationResponses.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl =>
      StakingV1beta1Types.queryDelegatorDelegationsResponse.typeUrl;

  @override
  List get values => [delegationResponses, pagination];
}
