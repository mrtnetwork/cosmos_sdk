import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_delegation_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryDelegationRequest is request type for the Query/Delegation RPC method.
class QueryDelegationRequest extends CosmosMessage
    with QueryMessage<QueryDelegationResponse> {
  /// delegator_addr defines the delegator address to query for.
  final CosmosBaseAddress? delegatorAddr;

  /// validator_addr defines the validator address to query for.
  final CosmosBaseAddress? validatorAddr;
  const QueryDelegationRequest({this.delegatorAddr, this.validatorAddr});
  factory QueryDelegationRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDelegationRequest(
        delegatorAddr: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        validatorAddr: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => StakingV1beta1Types.queryDelegation.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_addr": delegatorAddr?.address,
      "validator_addr": validatorAddr?.address
    };
  }

  @override
  String get typeUrl => StakingV1beta1Types.queryDelegationRequest.typeUrl;

  @override
  List get values => [delegatorAddr?.address, validatorAddr?.address];

  @override
  QueryDelegationResponse onResponse(List<int> bytes) {
    return QueryDelegationResponse.deserialize(bytes);
  }
}
