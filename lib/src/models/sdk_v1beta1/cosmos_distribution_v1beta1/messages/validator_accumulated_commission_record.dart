import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/messages/validator_accumulated_commission.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ValidatorAccumulatedCommissionRecord is used for import / export via genesis json.
class DistributionValidatorAccumulatedCommissionRecord extends CosmosMessage {
  /// validator_address is the address of the validator.
  final BaseAddress? validatorAddress;

  /// accumulated is the accumulated commission of a validator.
  final DistributionValidatorAccumulatedCommission accumulated;
  const DistributionValidatorAccumulatedCommissionRecord(
      {this.validatorAddress, required this.accumulated});
  factory DistributionValidatorAccumulatedCommissionRecord.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionValidatorAccumulatedCommissionRecord(
      validatorAddress:
          decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
      accumulated: DistributionValidatorAccumulatedCommission.deserialize(
          decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_address": validatorAddress?.address,
      "accumulated": accumulated.toJson()
    };
  }

  @override
  String get typeUrl => DistributionV1beta1Types
      .distributionValidatorAccumulatedCommissionRecord.typeUrl;

  @override
  List get values => [validatorAddress, accumulated];
}
