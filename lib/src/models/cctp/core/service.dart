import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/cctp/service/accept_owner.dart';
import 'package:cosmos_sdk/src/models/cctp/service/deposit_for_burn.dart';
import 'package:cosmos_sdk/src/models/cctp/service/deposit_for_burn_with_caller.dart';
import 'package:cosmos_sdk/src/models/cctp/service/disable_attester.dart';
import 'package:cosmos_sdk/src/models/cctp/service/enable_attester.dart';
import 'package:cosmos_sdk/src/models/cctp/service/link_token_pair.dart';
import 'package:cosmos_sdk/src/models/cctp/service/max_burn_amount_per_message.dart';
import 'package:cosmos_sdk/src/models/cctp/service/msg_receive_message.dart';
import 'package:cosmos_sdk/src/models/cctp/service/pause_burning_and_minting.dart';
import 'package:cosmos_sdk/src/models/cctp/service/pause_sending_and_receiving_message.dart';
import 'package:cosmos_sdk/src/models/cctp/service/remote_token_messenger.dart';
import 'package:cosmos_sdk/src/models/cctp/service/remove_remote_token_messenger.dart';
import 'package:cosmos_sdk/src/models/cctp/service/replace_deposit_for_burn.dart';
import 'package:cosmos_sdk/src/models/cctp/service/replace_message.dart';
import 'package:cosmos_sdk/src/models/cctp/service/send_message.dart';
import 'package:cosmos_sdk/src/models/cctp/service/send_message_with_caller.dart';
import 'package:cosmos_sdk/src/models/cctp/service/unlink_token_pair.dart';
import 'package:cosmos_sdk/src/models/cctp/service/unpause_burning_and_minting.dart';
import 'package:cosmos_sdk/src/models/cctp/service/unpause_sending_and_receiving_message.dart';
import 'package:cosmos_sdk/src/models/cctp/service/update_attester_manager.dart';
import 'package:cosmos_sdk/src/models/cctp/service/update_max_message_body_size.dart';
import 'package:cosmos_sdk/src/models/cctp/service/update_owner.dart';
import 'package:cosmos_sdk/src/models/cctp/service/update_pauser.dart';
import 'package:cosmos_sdk/src/models/cctp/service/update_signature_threshold.dart';
import 'package:cosmos_sdk/src/models/cctp/service/update_token_controller.dart';
import 'package:cosmos_sdk/src/models/cctp/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_auth_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class CCTPV1Service<T extends CosmosMessage>
    extends ServiceMessage<T> {
  const CCTPV1Service();
  static const String root = "/circle";

  static T? fromJson<T extends ServiceMessage>(
      {required String typeUrl,
      required Map<String, dynamic> json,
      bool amino = false}) {
    final type = CCTPV1Types.findService(typeUrl, amino: amino);
    final ServiceMessage? service = switch (type) {
      CCTPV1Types.msgAcceptOwner => CCTPV1MsgAcceptOwner.fromJson(json),
      CCTPV1Types.msgUpdateOwner => CCTPV1MsgUpdateOwner.fromJson(json),
      CCTPV1Types.msgUpdatePauser => CCTPV1MsgUpdatePauser.fromJson(json),
      CCTPV1Types.msgUpdateSignatureThreshold =>
        CCTPV1MsgUpdateSignatureThreshold.fromJson(json),
      CCTPV1Types.msgUpdateTokenController =>
        CCTPV1MsgUpdateTokenController.fromJson(json),
      CCTPV1Types.msgUpdateAttesterManager =>
        CCTPV1MsgUpdateAttesterManager.fromJson(json),
      CCTPV1Types.msgUpdateMaxMessageBodySize =>
        CCTPV1MsgUpdateMaxMessageBodySize.fromJson(json),
      CCTPV1Types.msgSetMaxBurnAmountPerMessage =>
        CCTPV1MsgSetMaxBurnAmountPerMessage.fromJson(json),
      CCTPV1Types.msgPauseBurningAndMinting =>
        CCTPV1MsgPauseBurningAndMinting.fromJson(json),
      CCTPV1Types.msgUnpauseBurningAndMinting =>
        CCTPV1MsgUnpauseBurningAndMinting.fromJson(json),
      CCTPV1Types.msgPauseSendingAndReceivingMessages =>
        CCTPV1MsgPauseSendingAndReceivingMessages.fromJson(json),
      CCTPV1Types.msgUnpauseSendingAndReceivingMessages =>
        CCTPV1MsgUnpauseSendingAndReceivingMessages.fromJson(json),
      CCTPV1Types.msgAddRemoteTokenMessenger =>
        CCTPV1MsgAddRemoteTokenMessenger.fromJson(json),
      CCTPV1Types.msgReplaceDepositForBurn =>
        CCTPV1MsgReplaceDepositForBurn.fromJson(json),
      CCTPV1Types.msgReplaceMessage => CCTPV1MsgReplaceMessage.fromJson(json),
      CCTPV1Types.msgRemoveRemoteTokenMessenger =>
        CCTPV1MsgRemoveRemoteTokenMessenger.fromJson(json),
      CCTPV1Types.msgDepositForBurn => CCTPV1MsgDepositForBurn.fromJson(json),
      CCTPV1Types.msgSendMessage => CCTPV1MsgSendMessage.fromJson(json),
      CCTPV1Types.msgSendMessageWithCaller =>
        CCTPV1MsgSendMessageWithCaller.fromJson(json),
      CCTPV1Types.msgDepositForBurnWithCaller =>
        CCTPV1MsgDepositForBurnWithCaller.fromJson(json),
      CCTPV1Types.msgDisableAttester => CCTPV1MsgDisableAttester.fromJson(json),
      CCTPV1Types.msgEnableAttester => CCTPV1MsgEnableAttester.fromJson(json),
      CCTPV1Types.msgLinkTokenPair => CCTPV1MsgLinkTokenPair.fromJson(json),
      CCTPV1Types.msgUnlinkTokenPair => CCTPV1MsgUnlinkTokenPair.fromJson(json),
      CCTPV1Types.msgReceiveMessage => CCTPV1MsgReceiveMessage.fromJson(json),
      _ => null
    } as ServiceMessage?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid CCTP V1 Service.", details: {
        "excepted": "$T",
        "service": service.runtimeType.toString(),
        "type": type?.typeUrl
      });
    }
    return service;
  }

  static T? deserialize<T extends ServiceMessage>(
      {required String typeUrl, required List<int> bytes}) {
    final type = AuthV1beta1Types.findService(typeUrl);
    final ServiceMessage? service = switch (type) {
      CCTPV1Types.msgAcceptOwner => CCTPV1MsgAcceptOwner.deserialize(bytes),
      CCTPV1Types.msgUpdateOwner => CCTPV1MsgUpdateOwner.deserialize(bytes),
      CCTPV1Types.msgUpdatePauser => CCTPV1MsgUpdatePauser.deserialize(bytes),
      CCTPV1Types.msgUpdateSignatureThreshold =>
        CCTPV1MsgUpdateSignatureThreshold.deserialize(bytes),
      CCTPV1Types.msgUpdateTokenController =>
        CCTPV1MsgUpdateTokenController.deserialize(bytes),
      CCTPV1Types.msgUpdateAttesterManager =>
        CCTPV1MsgUpdateAttesterManager.deserialize(bytes),
      CCTPV1Types.msgUpdateMaxMessageBodySize =>
        CCTPV1MsgUpdateMaxMessageBodySize.deserialize(bytes),
      CCTPV1Types.msgSetMaxBurnAmountPerMessage =>
        CCTPV1MsgSetMaxBurnAmountPerMessage.deserialize(bytes),
      CCTPV1Types.msgPauseBurningAndMinting =>
        CCTPV1MsgPauseBurningAndMinting.deserialize(bytes),
      CCTPV1Types.msgUnpauseBurningAndMinting =>
        CCTPV1MsgUnpauseBurningAndMinting.deserialize(bytes),
      CCTPV1Types.msgPauseSendingAndReceivingMessages =>
        CCTPV1MsgPauseSendingAndReceivingMessages.deserialize(bytes),
      CCTPV1Types.msgUnpauseSendingAndReceivingMessages =>
        CCTPV1MsgUnpauseSendingAndReceivingMessages.deserialize(bytes),
      CCTPV1Types.msgAddRemoteTokenMessenger =>
        CCTPV1MsgAddRemoteTokenMessenger.deserialize(bytes),
      CCTPV1Types.msgReplaceDepositForBurn =>
        CCTPV1MsgReplaceDepositForBurn.deserialize(bytes),
      CCTPV1Types.msgReplaceMessage =>
        CCTPV1MsgReplaceMessage.deserialize(bytes),
      CCTPV1Types.msgRemoveRemoteTokenMessenger =>
        CCTPV1MsgRemoveRemoteTokenMessenger.deserialize(bytes),
      CCTPV1Types.msgDepositForBurn =>
        CCTPV1MsgDepositForBurn.deserialize(bytes),
      CCTPV1Types.msgSendMessage => CCTPV1MsgSendMessage.deserialize(bytes),
      CCTPV1Types.msgSendMessageWithCaller =>
        CCTPV1MsgSendMessageWithCaller.deserialize(bytes),
      CCTPV1Types.msgDepositForBurnWithCaller =>
        CCTPV1MsgDepositForBurnWithCaller.deserialize(bytes),
      CCTPV1Types.msgDisableAttester =>
        CCTPV1MsgDisableAttester.deserialize(bytes),
      CCTPV1Types.msgEnableAttester =>
        CCTPV1MsgEnableAttester.deserialize(bytes),
      CCTPV1Types.msgLinkTokenPair => CCTPV1MsgLinkTokenPair.deserialize(bytes),
      CCTPV1Types.msgUnlinkTokenPair =>
        CCTPV1MsgUnlinkTokenPair.deserialize(bytes),
      CCTPV1Types.msgReceiveMessage =>
        CCTPV1MsgReceiveMessage.deserialize(bytes),
      _ => null
    } as CCTPV1Service?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid CCTP V1 Service.", details: {
        "excepted": "$T",
        "service": service.runtimeType.toString()
      });
    }
    return service;
  }
}
