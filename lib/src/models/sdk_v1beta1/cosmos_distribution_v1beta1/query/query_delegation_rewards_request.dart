import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_delegation_rewards_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDelegationRewardsRequest is the request type for the Query/DelegationRewards RPC method.
class DistributionQueryDelegationRewardsRequest extends CosmosMessage
    with QueryMessage<DistributionQueryDelegationRewardsResponse> {
  /// delegator_address defines the delegator address to query for.
  final BaseAddress? delegatorAddress;

  /// validator_address defines the validator address to query for.
  final BaseAddress? validatorAddress;
  const DistributionQueryDelegationRewardsRequest(
      {this.delegatorAddress, this.validatorAddress});
  factory DistributionQueryDelegationRewardsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryDelegationRewardsRequest(
        delegatorAddress:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        validatorAddress: decode
            .getResult(2)
            ?.to<BaseAddress, String>((e) => BaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  String get queryPath =>
      DistributionV1beta1Types.distributionDelegationRewards.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_address": delegatorAddress?.address,
      "validator_address": validatorAddress?.address
    };
  }

  @override
  String get typeUrl => DistributionV1beta1Types
      .distributionQueryDelegationRewardsRequest.typeUrl;

  @override
  List get values => [delegatorAddress?.address, validatorAddress?.address];

  @override
  DistributionQueryDelegationRewardsResponse onResponse(List<int> bytes) {
    return DistributionQueryDelegationRewardsResponse.deserialize(bytes);
  }
}
