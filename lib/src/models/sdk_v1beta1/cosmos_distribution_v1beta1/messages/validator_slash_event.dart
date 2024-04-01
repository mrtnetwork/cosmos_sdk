import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ValidatorSlashEvent represents a validator slash event. Height is implicit within the store key.
/// This is needed to calculate appropriate amount of staking tokens for delegations which are withdrawn after a slash has occurred.
class DistributionValidatorSlashEvent extends CosmosMessage {
  final BigInt? validatorPeriod;
  final String fraction;
  const DistributionValidatorSlashEvent(
      {this.validatorPeriod, required this.fraction});
  factory DistributionValidatorSlashEvent.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionValidatorSlashEvent(
        fraction: decode.getField(2), validatorPeriod: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_period": validatorPeriod?.toString(),
      "fraction": fraction
    };
  }

  @override
  String get typeUrl =>
      DistributionV1beta1Types.distributionValidatorSlashEvent.typeUrl;

  @override
  List get values => [validatorPeriod, fraction];
}
