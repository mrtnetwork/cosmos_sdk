import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/query/query_validator_outstanding_rewards_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryValidatorOutstandingRewardsRequest is the request type for the Query/ValidatorOutstandingRewards RPC method.
class DistributionQueryValidatorOutstandingRewardsRequest extends CosmosMessage
    with QueryMessage<DistributionQueryValidatorOutstandingRewardsResponse> {
  /// validator_address defines the validator address to query for.
  final BaseAddress? validatorAddress;
  const DistributionQueryValidatorOutstandingRewardsRequest(
      {this.validatorAddress});
  factory DistributionQueryValidatorOutstandingRewardsRequest.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryValidatorOutstandingRewardsRequest(
        validatorAddress: decode
            .getResult(1)
            ?.to<BaseAddress, String>((e) => BaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  String get queryPath => DistributionV1beta1Types
      .queryDistributionValidatorOutstandingRewards.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {"validator_address": validatorAddress?.address};
  }

  @override
  String get typeUrl => DistributionV1beta1Types
      .distributionQueryValidatorOutstandingRewardsRequest.typeUrl;

  @override
  List get values => [validatorAddress];

  @override
  DistributionQueryValidatorOutstandingRewardsResponse onResponse(
      List<int> bytes) {
    return DistributionQueryValidatorOutstandingRewardsResponse.deserialize(
        bytes);
  }
}
