import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// ValidatorOutstandingRewards represents outstanding (un-withdrawn)
/// rewards for a validator inexpensive to track, allows simple sanity checks.
class DistributionValidatorOutstandingRewards extends CosmosMessage {
  final List<DecCoin> rewards;
  DistributionValidatorOutstandingRewards(List<DecCoin> rewards)
      : rewards = rewards.immutable;
  factory DistributionValidatorOutstandingRewards.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionValidatorOutstandingRewards(
        decode.getFields(1).map((e) => DecCoin.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"rewards": rewards.map((e) => e.toJson()).toList()};
  }

  @override
  String get typeUrl =>
      DistributionV1beta1Types.distributionValidatorOutstandingRewards.typeUrl;

  @override
  List get values => [rewards];
}
