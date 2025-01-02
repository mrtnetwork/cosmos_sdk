import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_validator_outstanding_rewards_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryValidatorOutstandingRewardsRequest is the request type for the Query/ValidatorOutstandingRewards RPC method.
class DistributionQueryValidatorOutstandingRewardsRequest extends CosmosMessage
    with QueryMessage<DistributionQueryValidatorOutstandingRewardsResponse> {
  /// validator_address defines the validator address to query for.
  final CosmosBaseAddress validatorAddress;
  const DistributionQueryValidatorOutstandingRewardsRequest(
      {required this.validatorAddress});
  factory DistributionQueryValidatorOutstandingRewardsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryValidatorOutstandingRewardsRequest(
        validatorAddress: CosmosBaseAddress(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"validator_address": validatorAddress.address};
  }

  @override
  TypeUrl get typeUrl => DistributionV1beta1Types
      .distributionQueryValidatorOutstandingRewardsRequest;

  @override
  List get values => [validatorAddress];

  @override
  DistributionQueryValidatorOutstandingRewardsResponse onResponse(
      List<int> bytes) {
    return DistributionQueryValidatorOutstandingRewardsResponse.deserialize(
        bytes);
  }

  @override
  DistributionQueryValidatorOutstandingRewardsResponse onJsonResponse(
      Map<String, dynamic> json) {
    return DistributionQueryValidatorOutstandingRewardsResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [validatorAddress.address];
}
