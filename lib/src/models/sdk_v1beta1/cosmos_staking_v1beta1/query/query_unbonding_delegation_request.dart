import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_unbonding_delegation_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryUnbondingDelegationRequest is request type for the Query/UnbondingDelegation RPC method.
class QueryUnbondingDelegationRequest extends CosmosMessage
    with QueryMessage<QueryUnbondingDelegationResponse> {
  /// delegator_addr defines the delegator address to query for.
  final BaseAddress? delegatorAddr;

  /// validator_addr defines the validator address to query for.
  final BaseAddress? validatorAddr;
  const QueryUnbondingDelegationRequest(
      {this.delegatorAddr, this.validatorAddr});
  factory QueryUnbondingDelegationRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryUnbondingDelegationRequest(
        delegatorAddr:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        validatorAddr: decode
            .getResult(2)
            ?.to<BaseAddress, String>((e) => BaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => StakingV1beta1Types.unbondingDelegation.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_addr": delegatorAddr?.address,
      "validator_addr": validatorAddr?.address
    };
  }

  @override
  String get typeUrl =>
      StakingV1beta1Types.queryUnbondingDelegationRequest.typeUrl;

  @override
  List get values => [delegatorAddr, validatorAddr?.address];
  @override
  QueryUnbondingDelegationResponse onResponse(List<int> bytes) {
    return QueryUnbondingDelegationResponse.deserialize(bytes);
  }
}
