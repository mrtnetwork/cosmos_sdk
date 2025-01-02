import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

///  ValidatorOutstandingRewardsRecord is used for import/export via genesis json.
class DistributionValidatorOutstandingRewardsRecord extends CosmosMessage {
  /// validator_address is the address of the validator.
  final CosmosBaseAddress? validatorAddress;

  /// outstanding_rewards represents the outstanding rewards of a validator.
  final List<DecCoin> outstandingRewards;
  DistributionValidatorOutstandingRewardsRecord(
      {this.validatorAddress, required List<DecCoin> outstandingRewards})
      : outstandingRewards = outstandingRewards.immutable;
  factory DistributionValidatorOutstandingRewardsRecord.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionValidatorOutstandingRewardsRecord(
        validatorAddress: decode
            .getResult(1)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        outstandingRewards:
            decode.getFields(2).map((e) => DecCoin.deserialize(e)).toList());
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_address": validatorAddress?.address,
      "outstanding_rewards": outstandingRewards.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl =>
      DistributionV1beta1Types.distributionValidatorOutstandingRewardsRecord;

  @override
  List get values => [validatorAddress?.address, outstandingRewards];
}
