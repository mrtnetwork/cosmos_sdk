import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_unbonding_delegation_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryUnbondingDelegationRequest is request type for the Query/UnbondingDelegation RPC method.
class QueryUnbondingDelegationRequest extends CosmosMessage
    with QueryMessage<QueryUnbondingDelegationResponse> {
  /// delegator_addr defines the delegator address to query for.
  final CosmosBaseAddress delegatorAddr;

  /// validator_addr defines the validator address to query for.
  final CosmosBaseAddress validatorAddr;
  const QueryUnbondingDelegationRequest(
      {required this.delegatorAddr, required this.validatorAddr});

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_addr": delegatorAddr.address,
      "validator_addr": validatorAddr.address
    };
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.queryUnbondingDelegationRequest;

  @override
  List get values => [validatorAddr.address, delegatorAddr];
  @override
  QueryUnbondingDelegationResponse onResponse(List<int> bytes) {
    return QueryUnbondingDelegationResponse.deserialize(bytes);
  }

  @override
  QueryUnbondingDelegationResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryUnbondingDelegationResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters =>
      [delegatorAddr.address, validatorAddr.address];
}
