import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/messages/unbonding_delegation.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// QueryValidatorUnbondingDelegationsResponse is response type for the Query/ValidatorUnbondingDelegations RPC method.
class QueryValidatorUnbondingDelegationsResponse extends CosmosMessage {
  final List<UnbondingDelegation> unbondingResponses;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  QueryValidatorUnbondingDelegationsResponse(
      {required List<UnbondingDelegation> unbondingResponses, this.pagination})
      : unbondingResponses = unbondingResponses.immutable;
  factory QueryValidatorUnbondingDelegationsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryValidatorUnbondingDelegationsResponse(
        unbondingResponses: decode
            .getFields(1)
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
      StakingV1beta1Types.queryValidatorUnbondingDelegationsResponse.typeUrl;

  @override
  List get values => [unbondingResponses, pagination];
}
