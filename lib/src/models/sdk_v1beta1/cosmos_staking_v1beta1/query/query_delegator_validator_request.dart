import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_delegator_validator_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryDelegatorValidatorRequest is request type for the Query/DelegatorValidator RPC method.
class QueryDelegatorValidatorRequest extends CosmosMessage
    with QueryMessage<QueryDelegatorValidatorResponse> {
  /// delegator_addr defines the delegator address to query for.
  final CosmosBaseAddress delegatorAddr;

  /// validator_addr defines the validator address to query for.
  final CosmosBaseAddress validatorAddr;
  const QueryDelegatorValidatorRequest(
      {required this.delegatorAddr, required this.validatorAddr});

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_addr": delegatorAddr.address,
      "validator_addr": validatorAddr.address,
    };
  }

  @override
  TypeUrl get typeUrl => StakingV1beta1Types.queryDelegatorValidatorRequest;

  @override
  List get values => [delegatorAddr, validatorAddr.address];
  @override
  QueryDelegatorValidatorResponse onResponse(List<int> bytes) {
    return QueryDelegatorValidatorResponse.deserialize(bytes);
  }

  @override
  QueryDelegatorValidatorResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryDelegatorValidatorResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters =>
      [delegatorAddr.address, validatorAddr.address];
}
