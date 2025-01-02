import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_delegation_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryDelegationRequest is request type for the Query/Delegation RPC method.
class QueryDelegationRequest extends CosmosMessage
    with QueryMessage<QueryDelegationResponse> {
  /// delegator_addr defines the delegator address to query for.
  final CosmosBaseAddress delegatorAddr;

  /// validator_addr defines the validator address to query for.
  final CosmosBaseAddress validatorAddr;
  const QueryDelegationRequest(
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
  TypeUrl get typeUrl => StakingV1beta1Types.queryDelegationRequest;

  @override
  List get values => [delegatorAddr.address, validatorAddr.address];

  @override
  QueryDelegationResponse onResponse(List<int> bytes) {
    return QueryDelegationResponse.deserialize(bytes);
  }

  @override
  QueryDelegationResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryDelegationResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters =>
      [validatorAddr.address, delegatorAddr.address];
}
