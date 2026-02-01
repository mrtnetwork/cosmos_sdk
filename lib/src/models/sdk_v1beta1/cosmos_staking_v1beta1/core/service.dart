import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/msg_begin_redelegate.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/msg_cancel_unbonding_delegation.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/msg_create_validator.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/msg_delegate.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/msg_disable_tokenize_shares.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/msg_edit_validator.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/msg_enable_tokenize_shares.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/msg_redeem_tokens_for_shares.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/msg_rotate_cons_pub_key.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/msg_tokenize_share.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/msg_transfer_tokenize_share_record.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/msg_undelegate.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/service/update_params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_staking_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/service/service.dart';

abstract class StakingV1Beta1Service<T extends CosmosMessage>
    extends CosmosSDKService<T> {
  const StakingV1Beta1Service();

  static T? fromJson<T extends StakingV1Beta1Service>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = StakingV1beta1Types.findService(typeUrl);
    final StakingV1Beta1Service? service =
        switch (type) {
              StakingV1beta1Types.msgBeginRedelegate =>
                MsgBeginRedelegate.fromJson(json),
              StakingV1beta1Types.msgCancelUnbondingDelegation =>
                MsgCancelUnbondingDelegation.fromJson(json),
              StakingV1beta1Types.msgCreateValidator =>
                MsgCreateValidator.fromJson(json),
              StakingV1beta1Types.msgDelegate => MsgDelegate.fromJson(json),
              StakingV1beta1Types.msgEditValidator => MsgEditValidator.fromJson(
                json,
              ),
              StakingV1beta1Types.msgRotateConsPubKey =>
                MsgRotateConsPubKey.fromJson(json),
              StakingV1beta1Types.msgUndelegate => MsgUndelegate.fromJson(json),
              StakingV1beta1Types.stakingMsgUpdateParams =>
                StakingMsgUpdateParams.fromJson(json),
              StakingV1beta1Types.msgDisableTokenizeShares =>
                MsgDisableTokenizeShares.fromJson(json),
              StakingV1beta1Types.msgEnableTokenizeShares =>
                MsgEnableTokenizeShares.fromJson(json),
              StakingV1beta1Types.msgRedeemTokensForShares =>
                MsgRedeemTokensForShares.fromJson(json),
              StakingV1beta1Types.msgTokenizeShares =>
                MsgTokenizeShares.fromJson(json),
              StakingV1beta1Types.msgTransferTokenizeShareRecord =>
                MsgTransferTokenizeShareRecord.fromJson(json),
              _ => null,
            }
            as StakingV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid StakingV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends StakingV1Beta1Service>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = StakingV1beta1Types.findService(typeUrl);
    final StakingV1Beta1Service? service =
        switch (type) {
              StakingV1beta1Types.msgBeginRedelegate =>
                MsgBeginRedelegate.deserialize(bytes),
              StakingV1beta1Types.msgCancelUnbondingDelegation =>
                MsgCancelUnbondingDelegation.deserialize(bytes),
              StakingV1beta1Types.msgCreateValidator =>
                MsgCreateValidator.deserialize(bytes),
              StakingV1beta1Types.msgDelegate => MsgDelegate.deserialize(bytes),
              StakingV1beta1Types.msgEditValidator =>
                MsgEditValidator.deserialize(bytes),
              StakingV1beta1Types.msgRotateConsPubKey =>
                MsgRotateConsPubKey.deserialize(bytes),
              StakingV1beta1Types.msgUndelegate => MsgUndelegate.deserialize(
                bytes,
              ),
              StakingV1beta1Types.stakingMsgUpdateParams =>
                StakingMsgUpdateParams.deserialize(bytes),
              StakingV1beta1Types.msgDisableTokenizeShares =>
                MsgDisableTokenizeShares.deserialize(bytes),
              StakingV1beta1Types.msgEnableTokenizeShares =>
                MsgEnableTokenizeShares.deserialize(bytes),
              StakingV1beta1Types.msgRedeemTokensForShares =>
                MsgRedeemTokensForShares.deserialize(bytes),
              StakingV1beta1Types.msgTokenizeShares =>
                MsgTokenizeShares.deserialize(bytes),
              StakingV1beta1Types.msgTransferTokenizeShareRecord =>
                MsgTransferTokenizeShareRecord.deserialize(bytes),
              _ => null,
            }
            as StakingV1Beta1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid StakingV1Beta1 Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
