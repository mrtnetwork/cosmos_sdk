import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/query/query_validator_unbonding_delegations_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';

/// QueryValidatorUnbondingDelegationsRequest is required type for the Query/ValidatorUnbondingDelegations RPC method
class QueryValidatorUnbondingDelegationsRequest extends CosmosMessage
    with QueryMessage<QueryValidatorUnbondingDelegationsResponse> {
  /// validator_addr defines the validator address to query for.
  final BaseAddress? validatorAddr;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const QueryValidatorUnbondingDelegationsRequest(
      {this.validatorAddr, this.pagination});

  factory QueryValidatorUnbondingDelegationsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryValidatorUnbondingDelegationsRequest(
        validatorAddr:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_addr": validatorAddr?.address,
      "pagination": pagination?.toJson()
    };
  }

  @override
  String get typeUrl =>
      StakingV1beta1Types.queryValidatorUnbondingDelegationsRequest.typeUrl;

  @override
  List get values => [validatorAddr?.address, pagination];

  @override
  String get queryPath =>
      StakingV1beta1Types.queryValidatorUnbondingDelegations.typeUrl;

  @override
  QueryValidatorUnbondingDelegationsResponse onResponse(List<int> bytes) {
    return QueryValidatorUnbondingDelegationsResponse.deserialize(bytes);
  }
}
