import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/dec_coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// DelegationDelegatorReward represents the properties of a delegator's delegation reward.
class DistributionDelegationDelegatorReward extends CosmosMessage {
  final BaseAddress? validatorddress;
  final List<DecCoin> reward;
  DistributionDelegationDelegatorReward(
      {this.validatorddress, required List<DecCoin> reward})
      : reward = reward.mutable;
  factory DistributionDelegationDelegatorReward.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DistributionDelegationDelegatorReward(
        validatorddress:
            decode.getResult(1)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        reward:
            decode.getFileds(2).map((e) => DecCoin.deserialize(e)).toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "validator_address": validatorddress?.address,
      "reward": reward.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl =>
      DistributionV1beta1Types.distributionDelegationDelegatorReward.typeUrl;

  @override
  List get values => [validatorddress?.address, reward];
}
