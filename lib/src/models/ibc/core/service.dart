import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/service/msg_pay_packet_fee.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/service/msg_pay_packet_fee_async.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/service/msg_register_counterparty_payee.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_fee_v1/service/msg_register_payee.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_controller_v1/service/msg_send_tx.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_controller_v1/service/msg_update_params.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_host_v1/service/module_query_safe.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_applications_interchain_accounts_host_v1/service/msg_update_params.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_acknowledgement.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_channel_close_confirm.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_channel_close_init.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_channel_open_ack.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_channel_open_confirm.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_channel_open_init.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_channel_open_try.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_channel_upgrade_ack.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_channel_upgrade_cancel.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_channel_upgrade_confirm.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_channel_upgrade_init.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_channel_upgrade_open.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_channel_upgrade_timeout.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_channel_upgrade_try.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_prune_acknowledgements.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_recv_packet.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_timeout.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_timeout_on_close.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/service/msg_update_params.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v2/service/acknowledgement.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v2/service/recv_packet.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v2/service/send_packet.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/service/msg_create_client.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/service/msg_ibc_software_upgrade.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/service/msg_recover_client.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/service/msg_update_client.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/service/msg_update_params.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/service/msg_upgrade_client.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v2/service/register_counterparty.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/service/msg_connection_open_ack.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/service/msg_connection_open_confirm.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/service/msg_connection_open_init.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/service/msg_connection_open_try.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_connection_v1/service/msg_update_params.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_wasm_v1/service/msg_migrate_ontract.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_wasm_v1/service/msg_remove_checksum.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_lightclients_wasm_v1/service/msg_store_code.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

import '../ibc_applications_interchain_accounts_controller_v1/service/msg_register_interchain_account.dart';
import '../ibc_applications_transfer_v1/service/msg_transfer.dart';
import '../ibc_applications_transfer_v1/service/msg_update_params.dart';
import '../ibc_core_channel_v2/service/timeout.dart';

abstract class IbcService<T extends CosmosMessage> extends ServiceMessage<T> {
  const IbcService();
  static const String root = "/ibc";

  static T? fromJson<T extends ServiceMessage>(
      {required String typeUrl, required Map<String, dynamic> json}) {
    final type = IbcTypes.findService(typeUrl);
    final ServiceMessage? service = switch (type) {
      IbcTypes.msgPayPacketFeeAsync => MsgPayPacketFeeAsync.fromJson(json),
      IbcTypes.msgPayPacketFee => MsgPayPacketFee.fromJson(json),
      IbcTypes.msgRegisterCounterpartyPayee =>
        MsgRegisterCounterpartyPayee.fromJson(json),
      IbcTypes.msgRegisterPayee => MsgRegisterPayee.fromJson(json),
      //
      IbcTypes.msgRegisterInterchainAccount =>
        MsgRegisterInterchainAccount.fromJson(json),
      IbcTypes.msgSendTx => MsgSendTx.fromJson(json),
      IbcTypes.interchainAccountsControllerMsgUpdateParams =>
        InterchainAccountsControllerMsgUpdateParams.fromJson(json),

      ///
      IbcTypes.interchainAccountsHostMsgModuleQuerySafe =>
        InterchainAccountsHostModuleQuerySafe.fromJson(json),
      IbcTypes.interchainAccountsHostMsgUpdateParams =>
        InterchainAccountsHostUpdateParams.fromJson(json),

      ///
      IbcTypes.msgTransfer => MsgTransfer.fromJson(json),
      IbcTypes.ibcTransfermsgUpdateParams =>
        IbcTransferMsgUpdateParams.fromJson(json),

      ///
      IbcTypes.msgAcknowledgement => MsgAcknowledgement.fromJson(json),
      IbcTypes.msgChannelCloseConfirm => MsgChannelCloseConfirm.fromJson(json),
      IbcTypes.msgChannelCloseInit => MsgChannelCloseInit.fromJson(json),
      IbcTypes.msgChannelOpenAck => MsgChannelOpenAck.fromJson(json),
      IbcTypes.msgChannelOpenConfirm => MsgChannelOpenConfirm.fromJson(json),
      IbcTypes.msgChannelOpenInit => MsgChannelOpenInit.fromJson(json),
      IbcTypes.msgChannelOpenTry => MsgChannelOpenTry.fromJson(json),
      IbcTypes.msgChannelUpgradeAck => MsgChannelUpgradeAck.fromJson(json),
      IbcTypes.msgChannelUpgradeCancel =>
        MsgChannelUpgradeCancel.fromJson(json),
      IbcTypes.msgChannelUpgradeConfirm =>
        MsgChannelUpgradeConfirm.fromJson(json),
      IbcTypes.msgChannelUpgradeInit => MsgChannelUpgradeInit.fromJson(json),
      IbcTypes.msgChannelUpgradeOpen => MsgChannelUpgradeOpen.fromJson(json),
      IbcTypes.msgChannelUpgradeTimeout =>
        MsgChannelUpgradeTimeout.fromJson(json),
      IbcTypes.msgChannelUpgradeTry => MsgChannelUpgradeTry.fromJson(json),
      IbcTypes.msgPruneAcknowledgements =>
        MsgPruneAcknowledgements.fromJson(json),
      IbcTypes.msgRecvPacket => MsgRecvPacket.fromJson(json),
      IbcTypes.msgTimeoutOnClose => MsgTimeoutOnClose.fromJson(json),
      IbcTypes.msgTimeout => MsgTimeout.fromJson(json),
      IbcTypes.ibcChannelmsgUpdateParams =>
        IbcChannelMsgUpdateParams.fromJson(json),
      IbcTypes.channelV2MsgAcknowledgement =>
        IbcChannelV2MsgAcknowledgement.fromJson(json),
      IbcTypes.channelV2MsgRecvPacket =>
        IbcChannelV2MsgRecvPacket.fromJson(json),
      IbcTypes.channelV2MsgSendPacket =>
        IbcChannelV2MsgSendPacket.fromJson(json),
      IbcTypes.channelV2MsgTimeout => IbcChannelV2MsgTimeout.fromJson(json),
      IbcTypes.msgCreateClient => MsgCreateClient.fromJson(json),
      IbcTypes.msgIBCSoftwareUpgrade => MsgIBCSoftwareUpgrade.fromJson(json),
      IbcTypes.msgRecoverClient => MsgRecoverClient.fromJson(json),
      IbcTypes.msgUpdateClient => MsgUpdateClient.fromJson(json),
      IbcTypes.msgUpdateParams => IbcClientMsgUpdateParams.fromJson(json),
      IbcTypes.msgUpgradeClient => MsgUpgradeClient.fromJson(json),
      IbcTypes.ibClientV2MsgRegisterCounterparty =>
        IbcClientV2MsgRegisterCounterparty.fromJson(json),
      IbcTypes.msgConnectionOpenAck =>
        IbcConnectionMsgConnectionOpenAck.fromJson(json),
      IbcTypes.msgConnectionOpenConfirmResponse =>
        IbcConnectionMsgConnectionOpenConfirm.fromJson(json),
      IbcTypes.msgConnectionOpenInit =>
        IbcConnectionMsgConnectionOpenInit.fromJson(json),
      IbcTypes.msgConnectionOpenTry =>
        IbcConnectionMsgConnectionOpenTry.fromJson(json),
      IbcTypes.ibcConnectionMsgUpdateParams =>
        IbcConnectionMsgUpdateParams.fromJson(json),
      IbcTypes.ibcLightClientsWasmMsgMigrateContract =>
        IbcLightClientsWasmMsgMigrateContract.fromJson(json),
      IbcTypes.ibcLightClientsWasmMsgRemoveChecksum =>
        IbcLightClientsWasmMsgRemoveChecksum.fromJson(json),
      IbcTypes.ibcLightClientsWasmMsgStoreCode =>
        IbcLightClientsWasmMsgStoreCode.fromJson(json),
      _ => null
    } as ServiceMessage?;
    print("service ${service.runtimeType}");
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid IBC Service.", details: {
        "excepted": "$T",
        "service": service.runtimeType.toString()
      });
    }
    return service;
  }

  static T? deserialize<T extends ServiceMessage>(
      {required String typeUrl, required List<int> bytes}) {
    final type = IbcTypes.findService(typeUrl);
    final ServiceMessage? service = switch (type) {
      IbcTypes.msgPayPacketFeeAsync => MsgPayPacketFeeAsync.deserialize(bytes),
      IbcTypes.msgPayPacketFee => MsgPayPacketFee.deserialize(bytes),
      IbcTypes.msgRegisterCounterpartyPayee =>
        MsgRegisterCounterpartyPayee.deserialize(bytes),
      IbcTypes.msgRegisterPayee => MsgRegisterPayee.deserialize(bytes),
      //
      IbcTypes.msgRegisterInterchainAccount =>
        MsgRegisterInterchainAccount.deserialize(bytes),
      IbcTypes.msgSendTx => MsgSendTx.deserialize(bytes),
      IbcTypes.interchainAccountsControllerMsgUpdateParams =>
        InterchainAccountsControllerMsgUpdateParams.deserialize(bytes),

      ///
      IbcTypes.interchainAccountsHostMsgModuleQuerySafe =>
        InterchainAccountsHostModuleQuerySafe.deserialize(bytes),
      IbcTypes.interchainAccountsHostMsgUpdateParams =>
        InterchainAccountsHostUpdateParams.deserialize(bytes),

      ///
      IbcTypes.msgTransfer => MsgTransfer.deserialize(bytes),
      IbcTypes.ibcTransfermsgUpdateParams =>
        IbcTransferMsgUpdateParams.deserialize(bytes),

      ///
      IbcTypes.msgAcknowledgement => MsgAcknowledgement.deserialize(bytes),
      IbcTypes.msgChannelCloseConfirm =>
        MsgChannelCloseConfirm.deserialize(bytes),
      IbcTypes.msgChannelCloseInit => MsgChannelCloseInit.deserialize(bytes),
      IbcTypes.msgChannelOpenAck => MsgChannelOpenAck.deserialize(bytes),
      IbcTypes.msgChannelOpenConfirm =>
        MsgChannelOpenConfirm.deserialize(bytes),
      IbcTypes.msgChannelOpenInit => MsgChannelOpenInit.deserialize(bytes),
      IbcTypes.msgChannelOpenTry => MsgChannelOpenTry.deserialize(bytes),
      IbcTypes.msgChannelUpgradeAck => MsgChannelUpgradeAck.deserialize(bytes),
      IbcTypes.msgChannelUpgradeCancel =>
        MsgChannelUpgradeCancel.deserialize(bytes),
      IbcTypes.msgChannelUpgradeConfirm =>
        MsgChannelUpgradeConfirm.deserialize(bytes),
      IbcTypes.msgChannelUpgradeInit =>
        MsgChannelUpgradeInit.deserialize(bytes),
      IbcTypes.msgChannelUpgradeOpen =>
        MsgChannelUpgradeOpen.deserialize(bytes),
      IbcTypes.msgChannelUpgradeTimeout =>
        MsgChannelUpgradeTimeout.deserialize(bytes),
      IbcTypes.msgChannelUpgradeTry => MsgChannelUpgradeTry.deserialize(bytes),
      IbcTypes.msgPruneAcknowledgements =>
        MsgPruneAcknowledgements.deserialize(bytes),
      IbcTypes.msgRecvPacket => MsgRecvPacket.deserialize(bytes),
      IbcTypes.msgTimeoutOnClose => MsgTimeoutOnClose.deserialize(bytes),
      IbcTypes.msgTimeout => MsgTimeout.deserialize(bytes),
      IbcTypes.ibcChannelmsgUpdateParams =>
        IbcChannelMsgUpdateParams.deserialize(bytes),
      IbcTypes.channelV2MsgAcknowledgement =>
        IbcChannelV2MsgAcknowledgement.deserialize(bytes),
      IbcTypes.channelV2MsgRecvPacket =>
        IbcChannelV2MsgRecvPacket.deserialize(bytes),
      IbcTypes.channelV2MsgSendPacket =>
        IbcChannelV2MsgSendPacket.deserialize(bytes),
      IbcTypes.channelV2MsgTimeout => IbcChannelV2MsgTimeout.deserialize(bytes),
      IbcTypes.msgCreateClient => MsgCreateClient.deserialize(bytes),
      IbcTypes.msgIBCSoftwareUpgrade =>
        MsgIBCSoftwareUpgrade.deserialize(bytes),
      IbcTypes.msgRecoverClient => MsgRecoverClient.deserialize(bytes),
      IbcTypes.msgUpdateClient => MsgUpdateClient.deserialize(bytes),
      IbcTypes.msgUpdateParams => IbcClientMsgUpdateParams.deserialize(bytes),
      IbcTypes.msgUpgradeClient => MsgUpgradeClient.deserialize(bytes),
      IbcTypes.ibClientV2MsgRegisterCounterparty =>
        IbcClientV2MsgRegisterCounterparty.deserialize(bytes),
      IbcTypes.msgConnectionOpenAck =>
        IbcConnectionMsgConnectionOpenAck.deserialize(bytes),
      IbcTypes.msgConnectionOpenConfirmResponse =>
        IbcConnectionMsgConnectionOpenConfirm.deserialize(bytes),
      IbcTypes.msgConnectionOpenInit =>
        IbcConnectionMsgConnectionOpenInit.deserialize(bytes),
      IbcTypes.msgConnectionOpenTry =>
        IbcConnectionMsgConnectionOpenTry.deserialize(bytes),
      IbcTypes.ibcConnectionMsgUpdateParams =>
        IbcConnectionMsgUpdateParams.deserialize(bytes),
      IbcTypes.ibcLightClientsWasmMsgMigrateContract =>
        IbcLightClientsWasmMsgMigrateContract.deserialize(bytes),
      IbcTypes.ibcLightClientsWasmMsgRemoveChecksum =>
        IbcLightClientsWasmMsgRemoveChecksum.deserialize(bytes),
      IbcTypes.ibcLightClientsWasmMsgStoreCode =>
        IbcLightClientsWasmMsgStoreCode.deserialize(bytes),
      _ => null
    } as ServiceMessage?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid IBC Service.", details: {
        "excepted": "$T",
        "service": service.runtimeType.toString()
      });
    }
    return service;
  }
}
