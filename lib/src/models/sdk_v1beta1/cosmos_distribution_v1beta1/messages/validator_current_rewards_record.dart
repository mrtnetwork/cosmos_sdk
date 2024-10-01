import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/messages/validator_current_rewards.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// ValidatorCurrentRewardsRecord is used for import / export via genesis json.
class DistributionValidatorCurrentRewardsRecord extends CosmosMessage {
  /// validator_address is the address of the validator.
  final CosmosBaseAddress? validatorAddress;

  /// rewards defines the current rewards of a validator.
  final List<DistributionValidatorCurrentRewards> rewards;
  DistributionValidatorCurrentRewardsRecord(
      {this.validatorAddress,
      required List<DistributionValidatorCurrentRewards> rewards})
      : rewards = rewards.immutable;
  factory DistributionValidatorCurrentRewardsRecord.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionValidatorCurrentRewardsRecord(
        validatorAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        rewards: decode
            .getFields(2)
            .map((e) => DistributionValidatorCurrentRewards.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_address": validatorAddress?.address,
      "rewards": rewards.map((e) => e.toJson()).toList(),
    };
  }

  @override
  String get typeUrl => DistributionV1beta1Types
      .distributionValidatorCurrentRewardsRecord.typeUrl;

  @override
  List get values => [validatorAddress?.address, rewards];
}
