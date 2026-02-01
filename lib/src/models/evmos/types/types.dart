import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class EvmosErc20V1Types extends TypeUrl {
  static const String basePath = "/evmos.erc20.v1";
  const EvmosErc20V1Types._(
    super.typeUrl, {
    super.aminoType,
    super.query,
    super.rpc,
  });
  static const EvmosErc20V1Types period = EvmosErc20V1Types._(
    "/evmos.vesting.v1.Period",
  );
  static const EvmosErc20V1Types msgConvertERC20 = EvmosErc20V1Types._(
    "/evmos.erc20.v1.MsgConvertERC20",
    aminoType: "evmos/MsgConvertERC20",
  );
  static const EvmosErc20V1Types msgConvertCoin = EvmosErc20V1Types._(
    "/evmos.erc20.v1.MsgConvertCoin",
    aminoType: "evmos/MsgConvertCoin",
  );
  static const EvmosErc20V1Types msgUpdateParams = EvmosErc20V1Types._(
    "/evmos.erc20.v1.MsgUpdateParams",
    aminoType: "evmos/erc20/MsgUpdateParams",
  );
  static const EvmosErc20V1Types msgRegisterERC20 = EvmosErc20V1Types._(
    "/evmos.erc20.v1.MsgRegisterERC20",
    aminoType: "evmos/MsgRegisterERC20",
  );
  static const EvmosErc20V1Types msgToggleConversion = EvmosErc20V1Types._(
    "/evmos.erc20.v1.MsgToggleConversion",
    aminoType: "evmos/MsgToggleConversion",
  );

  static const EvmosErc20V1Types msgConvertCoinResponse = EvmosErc20V1Types._(
    "/evmos.erc20.v1.MsgConvertCoinResponse",
  );
  static const EvmosErc20V1Types msgConvertERC20Response = EvmosErc20V1Types._(
    "/evmos.erc20.v1.MsgConvertERC20Response",
  );
  static const EvmosErc20V1Types msgUpdateParamsResponse = EvmosErc20V1Types._(
    "/evmos.erc20.v1.MsgUpdateParamsResponse",
  );
  static const EvmosErc20V1Types params = EvmosErc20V1Types._(
    "/evmos.erc20.v1.Params",
  );
  static const EvmosErc20V1Types msgRegisterERC20Response = EvmosErc20V1Types._(
    "/evmos.erc20.v1.MsgRegisterERC20Response",
  );
  static const EvmosErc20V1Types msgToggleConversionResponse =
      EvmosErc20V1Types._("/evmos.erc20.v1.MsgToggleConversionResponse");

  static const EvmosErc20V1Types inflationMsgUpdateParams = EvmosErc20V1Types._(
    "/evmos.inflation.v1.MsgUpdateParams",
    aminoType: "evmos/inflation/MsgUpdateParams",
  );

  static const EvmosErc20V1Types exponentialCalculation = EvmosErc20V1Types._(
    "/evmos.inflation.v1.ExponentialCalculation",
  );
  static const EvmosErc20V1Types inflationDistribution = EvmosErc20V1Types._(
    "/evmos.inflation.v1.InflationDistribution",
  );
  static const EvmosErc20V1Types inflationParams = EvmosErc20V1Types._(
    "/evmos.inflation.v1.Params",
  );
  static const EvmosErc20V1Types inflationMsgUpdateParamsResponse =
      EvmosErc20V1Types._("/evmos.inflation.v1.MsgUpdateParamsResponse");

  static const EvmosErc20V1Types msgRegisterRevenue = EvmosErc20V1Types._(
    "/evmos.revenue.v1.MsgRegisterRevenue",
    aminoType: "evmos/MsgRegisterRevenue",
  );
  static const EvmosErc20V1Types msgUpdateRevenue = EvmosErc20V1Types._(
    "/evmos.revenue.v1.MsgUpdateRevenue",
    aminoType: "evmos/MsgUpdateRevenue",
  );
  static const EvmosErc20V1Types msgCancelRevenue = EvmosErc20V1Types._(
    "/evmos.revenue.v1.MsgCancelRevenue",
    aminoType: "evmos/MsgCancelRevenue",
  );
  static const EvmosErc20V1Types revenueMsgUpdateParams = EvmosErc20V1Types._(
    "/evmos.revenue.v1.MsgUpdateParams",
    aminoType: "evmos/MsgUpdateParams",
  );

  static const EvmosErc20V1Types msgRegisterRevenueResponse =
      EvmosErc20V1Types._("/evmos.revenue.v1.MsgRegisterRevenueResponse");
  static const EvmosErc20V1Types msgUpdateRevenueResponse = EvmosErc20V1Types._(
    "/evmos.revenue.v1.MsgUpdateRevenueResponse",
  );
  static const EvmosErc20V1Types msgCancelRevenueResponse = EvmosErc20V1Types._(
    "/evmos.revenue.v1.MsgCancelRevenueResponse",
  );
  static const EvmosErc20V1Types revenueParams = EvmosErc20V1Types._(
    "/evmos.revenue.v1.Params",
  );
  static const EvmosErc20V1Types revenueMsgUpdateParamsResponse =
      EvmosErc20V1Types._("/evmos.revenue.v1.MsgUpdateParamsResponse");

  static const EvmosErc20V1Types msgCreateClawbackVestingAccount =
      EvmosErc20V1Types._(
        "/evmos.vesting.v2.MsgCreateClawbackVestingAccount",
        aminoType: "evmos/MsgCreateClawbackVestingAccount",
      );
  static const EvmosErc20V1Types msgFundVestingAccount = EvmosErc20V1Types._(
    "/evmos.vesting.v2.MsgFundVestingAccount",
    aminoType: "evmos/MsgFundVestingAccount",
  );
  static const EvmosErc20V1Types msgClawback = EvmosErc20V1Types._(
    "/evmos.vesting.v2.MsgClawback",
    aminoType: "evmos/MsgClawback",
  );
  static const EvmosErc20V1Types msgUpdateVestingFunder = EvmosErc20V1Types._(
    "/evmos.vesting.v2.MsgUpdateVestingFunder",
    aminoType: "evmos/MsgUpdateVestingFunder",
  );
  static const EvmosErc20V1Types msgConvertVestingAccount = EvmosErc20V1Types._(
    "/evmos.vesting.v2.MsgConvertVestingAccount",
    aminoType: "evmos/MsgConvertVestingAccount",
  );

  static const EvmosErc20V1Types msgCreateClawbackVestingAccountResponse =
      EvmosErc20V1Types._(
        "/evmos.vesting.v2.MsgCreateClawbackVestingAccountResponse",
      );
  static const EvmosErc20V1Types msgFundVestingAccountResponse =
      EvmosErc20V1Types._("/evmos.vesting.v2.MsgFundVestingAccountResponse");
  static const EvmosErc20V1Types msgClawbackResponse = EvmosErc20V1Types._(
    "/evmos.vesting.v2.MsgClawbackResponse",
  );
  static const EvmosErc20V1Types msgUpdateVestingFunderResponse =
      EvmosErc20V1Types._("/evmos.vesting.v2.MsgUpdateVestingFunderResponse");
  static const EvmosErc20V1Types msgConvertVestingAccountResponse =
      EvmosErc20V1Types._("/evmos.vesting.v2.MsgConvertVestingAccountResponse");

  ///
  /// messages
  static const EvmosErc20V1Types txLogsResponse = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryTxLogsResponse",
  );
  static const EvmosErc20V1Types traceTxResponse = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryTraceTxResponse",
  );
  static const EvmosErc20V1Types traceBlockResponse = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryTraceBlockResponse",
  );
  static const EvmosErc20V1Types storageResponse = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryStorageResponse",
  );
  static const EvmosErc20V1Types storageRequest = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryStorageRequest",
    query: "/ethermint.evm.v1.Query/Storage",
    rpc: "/ethermint/evm/v1/storage/:address/:key",
  );
  static const EvmosErc20V1Types paramsRequest = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryParamsRequest",
    query: "/ethermint.evm.v1.Query/Params",
    rpc: "/ethermint/evm/v1/params",
  );
  static const EvmosErc20V1Types paramsResponse = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryParamsResponse",
  );
  static const EvmosErc20V1Types cosmosAccountRequest = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryCosmosAccountRequest",
    query: "/ethermint.evm.v1.Query/CosmosAccount",
    rpc: "/ethermint/evm/v1/cosmos_account/:address",
  );
  static const EvmosErc20V1Types cosmosAccountResponse = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryCosmosAccountResponse",
  );
  static const EvmosErc20V1Types codeRequest = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryCodeRequest",
    query: "/ethermint.evm.v1.Query/Code",
    rpc: "/ethermint/evm/v1/codes/:address",
  );
  static const EvmosErc20V1Types codeResponse = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryCodeResponse",
  );
  static const EvmosErc20V1Types feeRequest = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryBaseFeeRequest",
    query: "/ethermint.evm.v1.Query/BaseFee",
    rpc: "/ethermint/evm/v1/base_fee",
  );
  static const EvmosErc20V1Types feeResponse = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryBaseFeeResponse",
  );
  static const EvmosErc20V1Types accountResponse = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryAccountResponse",
  );
  static const EvmosErc20V1Types accountRequest = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryAccountRequest",
    query: "/ethermint.evm.v1.Query/Account",
    rpc: "/ethermint/evm/v1/account/:address",
  );
  static const EvmosErc20V1Types traceBlockRequest = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryTraceBlockRequest",
    query: "/ethermint.evm.v1.Query/TraceBlock",
    rpc: "/ethermint/evm/v1/trace_block",
  );
  static const EvmosErc20V1Types traceTxRequest = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryTraceTxRequest",
    query: "/ethermint.evm.v1.Query/TraceTx",
    rpc: "/ethermint/evm/v1/trace_tx",
  );
  static const EvmosErc20V1Types balanceRequest = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryBalanceRequest",
    query: "/ethermint.evm.v1.Query/Balance",
    rpc: "/ethermint/evm/v1/balances/:address",
  );
  static const EvmosErc20V1Types balanceResponse = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryBalanceResponse",
  );
  static const EvmosErc20V1Types txLogsRequest = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryTxLogsRequest",
    query: "/ethermint.evm.v1.Query/TxLogs",
  );
  static const EvmosErc20V1Types validatorAccountRequest = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryValidatorAccountRequest",
    query: "/ethermint.evm.v1.Query/ValidatorAccount",
    rpc: "/ethermint/evm/v1/validator_account/:cons_address",
  );
  static const EvmosErc20V1Types validatorAccountResponse = EvmosErc20V1Types._(
    "/ethermint.evm.v1.QueryValidatorAccountResponse",
  );

  static const EvmosErc20V1Types txResult = EvmosErc20V1Types._(
    "/ethermint.evm.v1.TxResult",
  );
  static const EvmosErc20V1Types transactionLogs = EvmosErc20V1Types._(
    "/ethermint.evm.v1.TransactionLogs",
  );
  static const EvmosErc20V1Types traceConfig = EvmosErc20V1Types._(
    "/ethermint.evm.v1.TraceConfig",
  );
  static const EvmosErc20V1Types legacyTx = EvmosErc20V1Types._(
    "/ethermint.evm.v1.LegacyTx",
  );
  static const EvmosErc20V1Types genesisState = EvmosErc20V1Types._(
    "/ethermint.evm.v1.GenesisState",
  );
  static const EvmosErc20V1Types genesisAccount = EvmosErc20V1Types._(
    "/ethermint.evm.v1.GenesisAccount",
  );
  static const EvmosErc20V1Types state = EvmosErc20V1Types._(
    "/ethermint.evm.v1.State",
  );
  static const EvmosErc20V1Types eventTxLog = EvmosErc20V1Types._(
    "/ethermint.evm.v1.EventTxLog",
  );
  static const EvmosErc20V1Types eventMessage = EvmosErc20V1Types._(
    "/ethermint.evm.v1.EventMessage",
  );
  static const EvmosErc20V1Types eventEthereumTx = EvmosErc20V1Types._(
    "/ethermint.evm.v1.EventEthereumTx",
  );
  static const EvmosErc20V1Types eventBlockBloom = EvmosErc20V1Types._(
    "/ethermint.evm.v1.EventBlockBloom",
  );
  static const EvmosErc20V1Types ethCallRequest = EvmosErc20V1Types._(
    "/ethermint.evm.v1.EthCallRequest",
    rpc: "/ethermint/evm/v1/eth_call",
    query: "/ethermint.evm.v1.Query/EthCall",
  );
  static const EvmosErc20V1Types estimateGasRequest = EvmosErc20V1Types._(
    "/ethermint.evm.v1.EthCallRequest",
    rpc: "/ethermint/evm/v1/estimate_gas",
    query: "/ethermint.evm.v1.Query/EstimateGas",
  );
  static const EvmosErc20V1Types estimateGasResponse = EvmosErc20V1Types._(
    "/ethermint.evm.v1.EstimateGasResponse",
  );
  static const EvmosErc20V1Types dynamicFeeTx = EvmosErc20V1Types._(
    "/ethermint.evm.v1.DynamicFeeTx",
  );
  static const EvmosErc20V1Types log = EvmosErc20V1Types._(
    "/ethermint.evm.v1.Log",
  );
  static const EvmosErc20V1Types evmV1params = EvmosErc20V1Types._(
    "/ethermint.evm.v1.Params",
  );
  static const EvmosErc20V1Types accessTuple = EvmosErc20V1Types._(
    "/ethermint.evm.v1.AccessTuple",
  );
  static const EvmosErc20V1Types accessListTx = EvmosErc20V1Types._(
    "/ethermint.evm.v1.AccessListTx",
  );
  static const EvmosErc20V1Types chainConfig = EvmosErc20V1Types._(
    "/ethermint.evm.v1.ChainConfig",
  );
  static const EvmosErc20V1Types msgEthereumTx = EvmosErc20V1Types._(
    "/ethermint.evm.v1.EvmosEthermintEVMV1MsgEthereumTx",
    aminoType: "ethermint/EvmosEthermintEVMV1MsgEthereumTx",
  );
  static const EvmosErc20V1Types msgEthereumTxResponse = EvmosErc20V1Types._(
    "/ethermint.evm.v1.EvmosEthermintEVMV1MsgEthereumTxResponse",
  );
  static const EvmosErc20V1Types evmV1MsgUpdateParams = EvmosErc20V1Types._(
    "/ethermint.evm.v1.MsgUpdateParams",
    aminoType: "ethermint/MsgUpdateParams",
  );
  static const EvmosErc20V1Types evmV1MsgUpdateParamsResponse =
      EvmosErc20V1Types._("/ethermint.evm.v1.MsgUpdateParamsResponse");

  /// messages
  static const EvmosErc20V1Types eventBlockGas = EvmosErc20V1Types._(
    "/ethermint.feemarket.v1.EventBlockGas",
  );
  static const EvmosErc20V1Types eventFeeMarket = EvmosErc20V1Types._(
    "/ethermint.feemarket.v1.EventFeeMarket",
  );
  static const EvmosErc20V1Types feeMarketparams = EvmosErc20V1Types._(
    "/ethermint.feemarket.v1.Params",
  );
  static const EvmosErc20V1Types feeMarketMsgUpdateParamsResponse =
      EvmosErc20V1Types._("/ethermint.feemarket.v1.MsgUpdateParamsResponse");

  static const EvmosErc20V1Types feeMarketMsgUpdateParams = EvmosErc20V1Types._(
    "/ethermint.feemarket.v1.MsgUpdateParams",
    aminoType: "ethermint/feemarket/MsgUpdateParams",
  );
  static const EvmosErc20V1Types baseFeeRequest = EvmosErc20V1Types._(
    "/ethermint.feemarket.v1.QueryBaseFeeRequest",
    query: "/ethermint.feemarket.v1.Query/BaseFee",
    rpc: "/ethermint/feemarket/v1/base_fee",
  );
  static const EvmosErc20V1Types baseFeeResponse = EvmosErc20V1Types._(
    "/ethermint.feemarket.v1.QueryBaseFeeResponse",
  );
  static const EvmosErc20V1Types blockGasRequest = EvmosErc20V1Types._(
    "/ethermint.feemarket.v1.QueryBlockGasRequest",
    query: "/ethermint.feemarket.v1.Query/BlockGas",
    rpc: "/ethermint/feemarket/v1/block_gas",
  );
  static const EvmosErc20V1Types blockGasResponse = EvmosErc20V1Types._(
    "/ethermint.feemarket.v1.QueryBlockGasResponse",
  );
  static const EvmosErc20V1Types feeMarketParamsRequest = EvmosErc20V1Types._(
    "/ethermint.feemarket.v1.QueryParamsRequest",
    query: "/ethermint.feemarket.v1.Query/Params",
    rpc: "/ethermint/feemarket/v1/params",
  );
  static const EvmosErc20V1Types feeMarketParamsResponse = EvmosErc20V1Types._(
    "/ethermint.feemarket.v1.QueryParamsResponse",
  );

  static const EvmosErc20V1Types ethAccount = EvmosErc20V1Types._(
    "/ethermint.types.v1.EthAccount",
  );
  static const EvmosErc20V1Types extensionOptionDynamicFeeTx =
      EvmosErc20V1Types._("/ethermint.types.v1.ExtensionOptionDynamicFeeTx");
  static const EvmosErc20V1Types extensionOptionsWeb3Tx = EvmosErc20V1Types._(
    "/ethermint.types.v1.ExtensionOptionsWeb3Tx",
  );
  static const EvmosErc20V1Types typesTxResult = EvmosErc20V1Types._(
    "/ethermint.types.v1.TxResult",
  );

  static const List<EvmosErc20V1Types> values = [
    msgConvertERC20,
    msgConvertCoin,
    msgUpdateParams,
    msgRegisterERC20,
    msgToggleConversion,
    inflationMsgUpdateParams,
    msgRegisterRevenue,
    msgUpdateRevenue,
    msgCancelRevenue,
    revenueMsgUpdateParams,
    msgCreateClawbackVestingAccount,
    msgFundVestingAccount,
    msgClawback,
    msgUpdateVestingFunder,
    msgConvertVestingAccount,
    msgEthereumTxResponse,
    msgEthereumTx,
    evmV1MsgUpdateParams,
    feeMarketMsgUpdateParams,
  ];
  static EvmosErc20V1Types? findService(String? type, {bool amino = false}) {
    if (type == null) return null;
    if (amino) {
      return values.firstWhereNullable((e) => e.aminoType == type);
    }
    return values.firstWhereNullable((e) => e.typeUrl == type);
  }
}
