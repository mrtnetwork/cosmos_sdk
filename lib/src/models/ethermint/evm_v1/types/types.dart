import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class EvmV1Types extends TypeUrl {
  const EvmV1Types._(super.typeUrl, {super.rpc, super.query});

  /// messages
  static const EvmV1Types txLogsResponse =
      EvmV1Types._("/ethermint.evm.v1.QueryTxLogsResponse");
  static const EvmV1Types traceTxResponse =
      EvmV1Types._("/ethermint.evm.v1.QueryTraceTxResponse");
  static const EvmV1Types traceBlockResponse =
      EvmV1Types._("/ethermint.evm.v1.QueryTraceBlockResponse");
  static const EvmV1Types storageResponse =
      EvmV1Types._("/ethermint.evm.v1.QueryStorageResponse");
  static const EvmV1Types storageRequest = EvmV1Types._(
      "/ethermint.evm.v1.QueryStorageRequest",
      query: "/ethermint.evm.v1.Query/Storage",
      rpc: "/ethermint/evm/v1/storage/:address/:key");
  static const EvmV1Types paramsRequest = EvmV1Types._(
      "/ethermint.evm.v1.QueryParamsRequest",
      query: "/ethermint.evm.v1.Query/Params",
      rpc: "/ethermint/evm/v1/params");
  static const EvmV1Types paramsResponse =
      EvmV1Types._("/ethermint.evm.v1.QueryParamsResponse");
  static const EvmV1Types cosmosAccountRequest = EvmV1Types._(
      "/ethermint.evm.v1.QueryCosmosAccountRequest",
      query: "/ethermint.evm.v1.Query/CosmosAccount",
      rpc: "/ethermint/evm/v1/cosmos_account/:address");
  static const EvmV1Types cosmosAccountResponse =
      EvmV1Types._("/ethermint.evm.v1.QueryCosmosAccountResponse");
  static const EvmV1Types codeRequest = EvmV1Types._(
      "/ethermint.evm.v1.QueryCodeRequest",
      query: "/ethermint.evm.v1.Query/Code",
      rpc: "/ethermint/evm/v1/codes/:address");
  static const EvmV1Types codeResponse =
      EvmV1Types._("/ethermint.evm.v1.QueryCodeResponse");
  static const EvmV1Types feeRequest = EvmV1Types._(
      "/ethermint.evm.v1.QueryBaseFeeRequest",
      query: "/ethermint.evm.v1.Query/BaseFee",
      rpc: "/ethermint/evm/v1/base_fee");
  static const EvmV1Types feeResponse =
      EvmV1Types._("/ethermint.evm.v1.QueryBaseFeeResponse");
  static const EvmV1Types accountResponse =
      EvmV1Types._("/ethermint.evm.v1.QueryAccountResponse");
  static const EvmV1Types accountRequest = EvmV1Types._(
      "/ethermint.evm.v1.QueryAccountRequest",
      query: "/ethermint.evm.v1.Query/Account",
      rpc: "/ethermint/evm/v1/account/:address");
  static const EvmV1Types traceBlockRequest = EvmV1Types._(
      "/ethermint.evm.v1.QueryTraceBlockRequest",
      query: "/ethermint.evm.v1.Query/TraceBlock",
      rpc: "/ethermint/evm/v1/trace_block");
  static const EvmV1Types traceTxRequest = EvmV1Types._(
      "/ethermint.evm.v1.QueryTraceTxRequest",
      query: "/ethermint.evm.v1.Query/TraceTx",
      rpc: "/ethermint/evm/v1/trace_tx");
  static const EvmV1Types balanceRequest = EvmV1Types._(
      "/ethermint.evm.v1.QueryBalanceRequest",
      query: "/ethermint.evm.v1.Query/Balance",
      rpc: "/ethermint/evm/v1/balances/:address");
  static const EvmV1Types balanceResponse =
      EvmV1Types._("/ethermint.evm.v1.QueryBalanceResponse");
  static const EvmV1Types txLogsRequest = EvmV1Types._(
      "/ethermint.evm.v1.QueryTxLogsRequest",
      query: "/ethermint.evm.v1.Query/TxLogs");
  static const EvmV1Types validatorAccountRequest = EvmV1Types._(
      "/ethermint.evm.v1.QueryValidatorAccountRequest",
      query: "/ethermint.evm.v1.Query/ValidatorAccount",
      rpc: "/ethermint/evm/v1/validator_account/:cons_address");
  static const EvmV1Types validatorAccountResponse =
      EvmV1Types._("/ethermint.evm.v1.QueryValidatorAccountResponse");

  static const EvmV1Types txResult = EvmV1Types._("/ethermint.evm.v1.TxResult");
  static const EvmV1Types transactionLogs =
      EvmV1Types._("/ethermint.evm.v1.TransactionLogs");
  static const EvmV1Types traceConfig =
      EvmV1Types._("/ethermint.evm.v1.TraceConfig");
  static const EvmV1Types legacyTx = EvmV1Types._("/ethermint.evm.v1.LegacyTx");
  static const EvmV1Types genesisState =
      EvmV1Types._("/ethermint.evm.v1.GenesisState");
  static const EvmV1Types genesisAccount =
      EvmV1Types._("/ethermint.evm.v1.GenesisAccount");
  static const EvmV1Types state = EvmV1Types._("/ethermint.evm.v1.State");
  static const EvmV1Types eventTxLog =
      EvmV1Types._("/ethermint.evm.v1.EventTxLog");
  static const EvmV1Types eventMessage =
      EvmV1Types._("/ethermint.evm.v1.EventMessage");
  static const EvmV1Types eventEthereumTx =
      EvmV1Types._("/ethermint.evm.v1.EventEthereumTx");
  static const EvmV1Types eventBlockBloom =
      EvmV1Types._("/ethermint.evm.v1.EventBlockBloom");
  static const EvmV1Types ethCallRequest = EvmV1Types._(
      "/ethermint.evm.v1.EthCallRequest",
      rpc: "/ethermint/evm/v1/eth_call",
      query: "/ethermint.evm.v1.Query/EthCall");
  static const EvmV1Types estimateGasRequest = EvmV1Types._(
      "/ethermint.evm.v1.EthCallRequest",
      rpc: "/ethermint/evm/v1/estimate_gas",
      query: "/ethermint.evm.v1.Query/EstimateGas");
  static const EvmV1Types estimateGasResponse =
      EvmV1Types._("/ethermint.evm.v1.EstimateGasResponse");
  static const EvmV1Types dynamicFeeTx =
      EvmV1Types._("/ethermint.evm.v1.DynamicFeeTx");
  static const EvmV1Types log = EvmV1Types._("/ethermint.evm.v1.Log");
  static const EvmV1Types params = EvmV1Types._("/ethermint.evm.v1.Params");
  static const EvmV1Types accessTuple =
      EvmV1Types._("/ethermint.evm.v1.AccessTuple");
  static const EvmV1Types accessListTx =
      EvmV1Types._("/ethermint.evm.v1.AccessListTx");
  static const EvmV1Types chainConfig =
      EvmV1Types._("/ethermint.evm.v1.ChainConfig");
  static const EvmV1Types msgEthereumTx =
      EvmV1Types._("/ethermint.evm.v1.MsgEthereumTx");
  static const EvmV1Types msgEthereumTxResponse =
      EvmV1Types._("/ethermint.evm.v1.MsgEthereumTxResponse");
  static const EvmV1Types msgUpdateParams =
      EvmV1Types._("/ethermint.evm.v1.MsgUpdateParams");
  static const EvmV1Types msgUpdateParamsResponse =
      EvmV1Types._("/ethermint.evm.v1.MsgUpdateParamsResponse");

  static const EvmV1Types ethereumTx =
      EvmV1Types._("/ethermint.evm.v1.Msg/EthereumTx");

  static const EvmV1Types updateParams =
      EvmV1Types._("/ethermint.evm.v1.Msg/UpdateParams");
}
