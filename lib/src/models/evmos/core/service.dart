import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/evmos/erc20_v1/service/conver_coin.dart';
import 'package:cosmos_sdk/src/models/evmos/erc20_v1/service/convert_erc20.dart';
import 'package:cosmos_sdk/src/models/evmos/erc20_v1/service/register_erc20.dart';
import 'package:cosmos_sdk/src/models/evmos/erc20_v1/service/toggle_convertion.dart';
import 'package:cosmos_sdk/src/models/evmos/erc20_v1/service/update_params.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/evm_v1/service/msg_ethereum_tx.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/evm_v1/service/msg_ethereum_tx_response.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/evm_v1/service/msg_update_param.dart';
import 'package:cosmos_sdk/src/models/evmos/ethermint/fee_market_v1/service/update_params.dart';
import 'package:cosmos_sdk/src/models/evmos/inflation_v1/service/update_params.dart';
import 'package:cosmos_sdk/src/models/evmos/revenue_v1/service/cancel_revenue.dart';
import 'package:cosmos_sdk/src/models/evmos/revenue_v1/service/register_revenue.dart';
import 'package:cosmos_sdk/src/models/evmos/revenue_v1/service/update_params.dart';
import 'package:cosmos_sdk/src/models/evmos/revenue_v1/service/update_revenue.dart';
import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/models/evmos/vesting_v2/service/convert_vesting_account.dart';
import 'package:cosmos_sdk/src/models/evmos/vesting_v2/service/create_clawback_vesting_account.dart';
import 'package:cosmos_sdk/src/models/evmos/vesting_v2/service/fund_vesting_account.dart';
import 'package:cosmos_sdk/src/models/evmos/vesting_v2/service/msg_clawback.dart';
import 'package:cosmos_sdk/src/models/evmos/vesting_v2/service/update_vesting_funder.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class EvmosService<T extends CosmosMessage> extends ServiceMessage<T> {
  const EvmosService();

  static const String ethermintRoot = "/ethermint";
  static const String evmosRoot = "/evmos";

  static T? fromJson<T extends ServiceMessage>(
      {required String typeUrl,
      required Map<String, dynamic> json,
      bool amino = false}) {
    final type = EvmosErc20V1Types.findService(typeUrl, amino: amino);
    final ServiceMessage? service = switch (type) {
      EvmosErc20V1Types.msgConvertERC20 =>
        EvmosErc20V1MsgConvertERC20.fromJson(json),
      EvmosErc20V1Types.inflationMsgUpdateParams =>
        EvmosInflationV1MsgUpdateParams.fromJson(json),
      EvmosErc20V1Types.msgConvertCoin =>
        EvmosErc20V1MsgConvertCoin.fromJson(json),
      EvmosErc20V1Types.msgUpdateParams =>
        EvmosErc20V1MsgUpdateParams.fromJson(json),
      EvmosErc20V1Types.msgRegisterERC20 =>
        EvmosErc20V1MsgRegisterERC20.fromJson(json),
      EvmosErc20V1Types.msgToggleConversion =>
        EvmosErc20V1MsgToggleConversion.fromJson(json),
      EvmosErc20V1Types.msgRegisterRevenue =>
        EvmosRevenueV1MsgRegisterRevenue.fromJson(json),
      EvmosErc20V1Types.msgUpdateRevenue =>
        EvmosRevenueV1MsgUpdateRevenue.fromJson(json),
      EvmosErc20V1Types.msgCancelRevenue =>
        EvmosRevenueV1MsgCancelRevenue.fromJson(json),
      EvmosErc20V1Types.revenueMsgUpdateParams =>
        EvmosRevenueV1MsgUpdateParams.fromJson(json),
      EvmosErc20V1Types.msgCreateClawbackVestingAccount =>
        EvmosVestingV2MsgCreateClawbackVestingAccount.fromJson(json),
      EvmosErc20V1Types.msgFundVestingAccount =>
        EvmosVestingV2MsgFundVestingAccount.fromJson(json),
      EvmosErc20V1Types.msgClawback => EvmosVestingV2MsgClawback.fromJson(json),
      EvmosErc20V1Types.msgUpdateVestingFunder =>
        EvmosVestingV2MsgUpdateVestingFunder.fromJson(json),
      EvmosErc20V1Types.msgConvertVestingAccount =>
        EvmosVestingV2MsgConvertVestingAccount.fromJson(json),

      ////
      EvmosErc20V1Types.msgEthereumTxResponse =>
        EvmosEthermintEVMV1MsgEthereumTxResponse.fromJson(json),
      EvmosErc20V1Types.msgEthereumTx =>
        EvmosEthermintEVMV1MsgEthereumTx.fromJson(json),
      EvmosErc20V1Types.evmV1MsgUpdateParams =>
        EvmosEthermintEVMV1MsgUpdateParams.fromJson(json),
      EvmosErc20V1Types.feeMarketMsgUpdateParams =>
        EvmosEthermintFeeMarketV1MsgUpdateParams.fromJson(json),
      _ => null
    } as ServiceMessage?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid Ethermint Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }

  static T? deserialize<T extends ServiceMessage>(
      {required String typeUrl, required List<int> bytes}) {
    final type = EvmosErc20V1Types.findService(typeUrl);
    final ServiceMessage? service = switch (type) {
      EvmosErc20V1Types.msgConvertERC20 =>
        EvmosErc20V1MsgConvertERC20.deserialize(bytes),
      EvmosErc20V1Types.msgConvertCoin =>
        EvmosErc20V1MsgConvertCoin.deserialize(bytes),
      EvmosErc20V1Types.msgUpdateParams =>
        EvmosErc20V1MsgUpdateParams.deserialize(bytes),
      EvmosErc20V1Types.msgRegisterERC20 =>
        EvmosErc20V1MsgRegisterERC20.deserialize(bytes),
      EvmosErc20V1Types.inflationMsgUpdateParams =>
        EvmosInflationV1MsgUpdateParams.deserialize(bytes),
      EvmosErc20V1Types.msgToggleConversion =>
        EvmosErc20V1MsgToggleConversion.deserialize(bytes),
      EvmosErc20V1Types.msgRegisterRevenue =>
        EvmosRevenueV1MsgRegisterRevenue.deserialize(bytes),
      EvmosErc20V1Types.msgUpdateRevenue =>
        EvmosRevenueV1MsgUpdateRevenue.deserialize(bytes),
      EvmosErc20V1Types.msgCancelRevenue =>
        EvmosRevenueV1MsgCancelRevenue.deserialize(bytes),
      EvmosErc20V1Types.revenueMsgUpdateParams =>
        EvmosRevenueV1MsgUpdateParams.deserialize(bytes),

      ///
      EvmosErc20V1Types.msgCreateClawbackVestingAccount =>
        EvmosVestingV2MsgCreateClawbackVestingAccount.deserialize(bytes),
      EvmosErc20V1Types.msgFundVestingAccount =>
        EvmosVestingV2MsgFundVestingAccount.deserialize(bytes),
      EvmosErc20V1Types.msgClawback =>
        EvmosVestingV2MsgClawback.deserialize(bytes),
      EvmosErc20V1Types.msgUpdateVestingFunder =>
        EvmosVestingV2MsgUpdateVestingFunder.deserialize(bytes),
      EvmosErc20V1Types.msgConvertVestingAccount =>
        EvmosVestingV2MsgConvertVestingAccount.deserialize(bytes),
      EvmosErc20V1Types.msgEthereumTxResponse =>
        EvmosEthermintEVMV1MsgEthereumTxResponse.deserialize(bytes),
      EvmosErc20V1Types.msgEthereumTx =>
        EvmosEthermintEVMV1MsgEthereumTx.deserialize(bytes),
      EvmosErc20V1Types.evmV1MsgUpdateParams =>
        EvmosEthermintEVMV1MsgUpdateParams.deserialize(bytes),
      EvmosErc20V1Types.feeMarketMsgUpdateParams =>
        EvmosEthermintFeeMarketV1MsgUpdateParams.deserialize(bytes),
      _ => null
    } as ServiceMessage?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException("Invalid Ethermint Service.",
          details: {
            "excepted": "$T",
            "service": service.runtimeType.toString()
          });
    }
    return service;
  }
}
