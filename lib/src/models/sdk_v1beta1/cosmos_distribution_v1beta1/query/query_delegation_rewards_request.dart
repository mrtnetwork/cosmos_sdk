import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_delegation_rewards_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDelegationRewardsRequest is the request type for the Query/DelegationRewards RPC method.
class DistributionQueryDelegationRewardsRequest extends CosmosMessage
    with QueryMessage<DistributionQueryDelegationRewardsResponse> {
  /// delegator_address defines the delegator address to query for.
  final CosmosBaseAddress delegatorAddress;

  /// validator_address defines the validator address to query for.
  final CosmosBaseAddress validatorAddress;
  const DistributionQueryDelegationRewardsRequest(
      {required this.delegatorAddress, required this.validatorAddress});

  factory DistributionQueryDelegationRewardsRequest.fromRpc(
      Map<String, dynamic> json) {
    return DistributionQueryDelegationRewardsRequest(
      delegatorAddress: CosmosBaseAddress(json["delegator_address"]),
      validatorAddress: CosmosBaseAddress(json["validator_address"]),
    );
  }
  factory DistributionQueryDelegationRewardsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryDelegationRewardsRequest(
        delegatorAddress: CosmosBaseAddress(decode.getField(1)),
        validatorAddress: CosmosBaseAddress(decode.getField(2)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "delegator_address": delegatorAddress.address,
      "validator_address": validatorAddress.address
    };
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionQueryDelegationRewardsRequest;

  @override
  List get values => [delegatorAddress.address, validatorAddress.address];

  @override
  DistributionQueryDelegationRewardsResponse onResponse(List<int> bytes) {
    return DistributionQueryDelegationRewardsResponse.deserialize(bytes);
  }

  @override
  DistributionQueryDelegationRewardsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return DistributionQueryDelegationRewardsResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters =>
      [delegatorAddress.address, validatorAddress.address];
}
