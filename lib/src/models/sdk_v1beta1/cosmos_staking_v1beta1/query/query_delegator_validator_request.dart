import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_delegator_validator_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryDelegatorValidatorRequest is request type for the Query/DelegatorValidator RPC method.
class QueryDelegatorValidatorRequest extends CosmosMessage
    with QueryMessage<QueryDelegatorValidatorResponse> {
  /// delegator_addr defines the delegator address to query for.
  final BaseAddress? delegatorAddr;

  /// validator_addr defines the validator address to query for.
  final BaseAddress? validatorAddr;
  const QueryDelegatorValidatorRequest(
      {this.delegatorAddr, this.validatorAddr});
  factory QueryDelegatorValidatorRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryDelegatorValidatorRequest(
        delegatorAddr:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        validatorAddr: decode
            .getResult(2)
            ?.to<BaseAddress, String>((e) => BaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath => StakingV1beta1Types.queryDelegatorValidator.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_addr": delegatorAddr?.address,
      "validator_addr": validatorAddr?.address,
    };
  }

  @override
  String get typeUrl =>
      StakingV1beta1Types.queryDelegatorValidatorRequest.typeUrl;

  @override
  List get values => [delegatorAddr, validatorAddr?.address];
  @override
  QueryDelegatorValidatorResponse onResponse(List<int> bytes) {
    return QueryDelegatorValidatorResponse.deserialize(bytes);
  }
}
