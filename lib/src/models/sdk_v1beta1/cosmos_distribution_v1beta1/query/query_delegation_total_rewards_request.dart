import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_delegation_total_rewards_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryDelegationTotalRewardsRequest is the request type for the Query/DelegationTotalRewards RPC method.
class DistributionQueryDelegationTotalRewardsRequest extends CosmosMessage
    with QueryMessage<DistributionQueryDelegationTotalRewardsResponse> {
  /// delegator_address defines the delegator address to query for.
  final CosmosBaseAddress? delegatorAddress;
  DistributionQueryDelegationTotalRewardsRequest({this.delegatorAddress});
  factory DistributionQueryDelegationTotalRewardsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryDelegationTotalRewardsRequest(
        delegatorAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath =>
      DistributionV1beta1Types.distributionDelegationTotalRewards.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"delegator_address": delegatorAddress?.address};
  }

  @override
  String get typeUrl => DistributionV1beta1Types
      .distributionQueryDelegationTotalRewardsRequest.typeUrl;

  @override
  List get values => [delegatorAddress?.address];

  @override
  DistributionQueryDelegationTotalRewardsResponse onResponse(List<int> bytes) {
    return DistributionQueryDelegationTotalRewardsResponse.deserialize(bytes);
  }
}
