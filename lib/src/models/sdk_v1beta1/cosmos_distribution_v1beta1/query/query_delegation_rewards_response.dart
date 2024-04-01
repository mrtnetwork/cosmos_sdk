import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// QueryDelegationRewardsResponse is the response type for the Query/DelegationRewards RPC method.
class DistributionQueryDelegationRewardsResponse extends CosmosMessage {
  /// rewards defines the rewards accrued by a delegation.
  final List<DecCoin> rewards;
  DistributionQueryDelegationRewardsResponse(List<DecCoin> rewards)
      : rewards = rewards.mutable;
  factory DistributionQueryDelegationRewardsResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionQueryDelegationRewardsResponse(
        decode.getFileds(1).map((e) => DecCoin.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"rewards": rewards.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl => DistributionV1beta1Types
      .distributionQueryDelegationRewardsResponse.typeUrl;

  @override
  List get values => [rewards];
}
