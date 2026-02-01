import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/messages/validator_historical_rewards.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ValidatorHistoricalRewardsRecord is used for import / export via genesis json.
class DistributionValidatorHistoricalRewardsRecord extends CosmosMessage {
  /// validator_address is the address of the validator.
  final CosmosBaseAddress? validatorAddress;

  /// period defines the period the historical rewards apply to.
  final BigInt? period;

  /// rewards defines the historical rewards of a validator.
  final DistributionValidatorHistoricalRewards rewards;
  const DistributionValidatorHistoricalRewardsRecord({
    this.validatorAddress,
    this.period,
    required this.rewards,
  });
  factory DistributionValidatorHistoricalRewardsRecord.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionValidatorHistoricalRewardsRecord(
      validatorAddress: decode
          .getResult(1)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      period: decode.getField(2),
      rewards: DistributionValidatorHistoricalRewards.deserialize(
        decode.getField(3),
      ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_address": validatorAddress?.address,
      "period": period?.toString(),
      "rewards": rewards.toJson(),
    };
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionValidatorHistoricalRewardsRecord;

  @override
  List get values => [validatorAddress, period, rewards];
}
