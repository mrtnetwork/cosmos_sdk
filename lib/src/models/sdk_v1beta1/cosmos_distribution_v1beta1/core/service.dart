import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/service/msg_fund_community_pool.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/service/msg_deposit_validator_rewards_pool.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/service/msg_set_withdraw_address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/service/msg_update_params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/service/msg_withdraw_delegator_reward.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/service/msg_withdraw_validator_commission.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_distribution_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';

abstract class DistributionV1Beta1Service<T extends CosmosMessage>
    extends CosmosSDKService<T> {
  const DistributionV1Beta1Service();

  static T? fromJson<T extends DistributionV1Beta1Service>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = DistributionV1beta1Types.findService(typeUrl);
    final DistributionV1Beta1Service? service =
        switch (type) {
              DistributionV1beta1Types
                  .distributionMsgDepositValidatorRewardsPool =>
                DistributionMsgDepositValidatorRewardsPool.fromJson(json),
              DistributionV1beta1Types.distributionMsgSetWithdrawAddress =>
                DistributionMsgSetWithdrawAddress.fromJson(json),
              DistributionV1beta1Types.distributionMsgUpdateParams =>
                DistributionMsgUpdateParams.fromJson(json),
              DistributionV1beta1Types.distributionMsgWithdrawDelegatorReward =>
                DistributionMsgWithdrawDelegatorReward.fromJson(json),
              DistributionV1beta1Types
                  .distributionMsgWithdrawValidatorCommission =>
                DistributionMsgWithdrawValidatorCommission.fromJson(json),
              DistributionV1beta1Types.distributionMsgFundCommunityPool =>
                DistributionMsgFundCommunityPool.fromJson(json),
              _ => null,
            }
            as DistributionV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid DistributionV1beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends DistributionV1Beta1Service>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = DistributionV1beta1Types.findService(typeUrl);
    final DistributionV1Beta1Service? service =
        switch (type) {
              DistributionV1beta1Types
                  .distributionMsgDepositValidatorRewardsPool =>
                DistributionMsgDepositValidatorRewardsPool.deserialize(bytes),
              DistributionV1beta1Types.distributionMsgSetWithdrawAddress =>
                DistributionMsgSetWithdrawAddress.deserialize(bytes),
              DistributionV1beta1Types.distributionMsgUpdateParams =>
                DistributionMsgUpdateParams.deserialize(bytes),
              DistributionV1beta1Types.distributionMsgWithdrawDelegatorReward =>
                DistributionMsgWithdrawDelegatorReward.deserialize(bytes),
              DistributionV1beta1Types
                  .distributionMsgWithdrawValidatorCommission =>
                DistributionMsgWithdrawValidatorCommission.deserialize(bytes),
              DistributionV1beta1Types.distributionMsgFundCommunityPool =>
                DistributionMsgFundCommunityPool.deserialize(bytes),
              _ => null,
            }
            as DistributionV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid DistributionV1beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
