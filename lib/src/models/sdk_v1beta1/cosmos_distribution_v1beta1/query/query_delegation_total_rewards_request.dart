import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_delegation_total_rewards_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDelegationTotalRewardsRequest is the request type for the Query/DelegationTotalRewards RPC method.
class DistributionQueryDelegationTotalRewardsRequest extends CosmosMessage
    with QueryMessage<DistributionQueryDelegationTotalRewardsResponse> {
  /// delegator_address defines the delegator address to query for.
  final CosmosBaseAddress delegatorAddress;
  DistributionQueryDelegationTotalRewardsRequest({
    required this.delegatorAddress,
  });

  factory DistributionQueryDelegationTotalRewardsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return DistributionQueryDelegationTotalRewardsRequest(
      delegatorAddress: CosmosBaseAddress(json["delegator_address"]),
    );
  }
  factory DistributionQueryDelegationTotalRewardsRequest.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryDelegationTotalRewardsRequest(
      delegatorAddress: CosmosBaseAddress(decode.getField(1)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"delegator_address": delegatorAddress.address};
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionQueryDelegationTotalRewardsRequest;

  @override
  List get values => [delegatorAddress.address];

  @override
  DistributionQueryDelegationTotalRewardsResponse onResponse(List<int> bytes) {
    return DistributionQueryDelegationTotalRewardsResponse.deserialize(bytes);
  }

  @override
  DistributionQueryDelegationTotalRewardsResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return DistributionQueryDelegationTotalRewardsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [delegatorAddress.address];
}
