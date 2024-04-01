import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/messages/validator_outstanding_rewards.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryValidatorOutstandingRewardsResponse is the response type for the Query/ValidatorOutstandingRewards RPC method.
class DistributionQueryValidatorOutstandingRewardsResponse
    extends CosmosMessage {
  final DistributionValidatorOutstandingRewards rewards;
  const DistributionQueryValidatorOutstandingRewardsResponse(this.rewards);
  factory DistributionQueryValidatorOutstandingRewardsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryValidatorOutstandingRewardsResponse(
        DistributionValidatorOutstandingRewards.deserialize(
            decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"rewards": rewards.toJson()};
  }

  @override
  String get typeUrl => DistributionV1beta1Types
      .distributionQueryValidatorOutstandingRewardsResponse.typeUrl;

  @override
  List get values => [rewards];
}
