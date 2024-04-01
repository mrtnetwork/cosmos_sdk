import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/unbonding_delegation.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// QueryUnbondingDelegatorDelegationsResponse is response type for the Query/UnbondingDelegatorDelegations RPC method.
class QueryDelegatorUnbondingDelegationsResponse extends CosmosMessage {
  final List<UnbondingDelegation> unbondingResponses;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  QueryDelegatorUnbondingDelegationsResponse(
      {required List<UnbondingDelegation> unbondingResponses, this.pagination})
      : unbondingResponses = unbondingResponses.mutable;
  factory QueryDelegatorUnbondingDelegationsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDelegatorUnbondingDelegationsResponse(
        unbondingResponses: decode
            .getFileds(1)
            .map((e) => UnbondingDelegation.deserialize(e))
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
      "unbonding_responses": unbondingResponses.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl =>
      StakingV1beta1Types.queryDelegatorUnbondingDelegationsResponse.typeUrl;

  @override
  List get values => [unbondingResponses, pagination];
}
