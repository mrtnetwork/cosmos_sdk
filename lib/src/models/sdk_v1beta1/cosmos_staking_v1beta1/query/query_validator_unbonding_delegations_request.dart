import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_validator_unbonding_delegations_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryValidatorUnbondingDelegationsRequest is required type for the Query/ValidatorUnbondingDelegations RPC method
class QueryValidatorUnbondingDelegationsRequest extends CosmosMessage
    with QueryMessage<QueryValidatorUnbondingDelegationsResponse> {
  /// validator_addr defines the validator address to query for.
  final CosmosBaseAddress validatorAddr;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const QueryValidatorUnbondingDelegationsRequest({
    required this.validatorAddr,
    this.pagination,
  });

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_addr": validatorAddr.address,
      "pagination": pagination?.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      StakingV1beta1Types.queryValidatorUnbondingDelegationsRequest;

  @override
  List get values => [validatorAddr.address, pagination];

  @override
  QueryValidatorUnbondingDelegationsResponse onResponse(List<int> bytes) {
    return QueryValidatorUnbondingDelegationsResponse.deserialize(bytes);
  }

  @override
  QueryValidatorUnbondingDelegationsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return QueryValidatorUnbondingDelegationsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [validatorAddr.address];

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
