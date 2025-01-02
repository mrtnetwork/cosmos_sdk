import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class BankV1beta1Types extends TypeUrl {
  const BankV1beta1Types._(super.typeUrl, {super.query, super.rpc});

  /// messages
  static const BankV1beta1Types msgSend =
      BankV1beta1Types._("/cosmos.bank.v1beta1.MsgSend");
  static const BankV1beta1Types msgSendResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.MsgSendResponse");
  static const BankV1beta1Types balanceRequest = BankV1beta1Types._(
      "/cosmos.bank.v1beta1.QueryBalanceRequest",
      query: "/cosmos.bank.v1beta1.Query/Balance",
      rpc: "/cosmos/bank/v1beta1/balances/:address/by_denom");
  static const BankV1beta1Types balanceRespone =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryBalanceResponse");
  static const BankV1beta1Types allBalancesRequest = BankV1beta1Types._(
      "/cosmos.bank.v1beta1.QueryAllBalancesRequest",
      query: "/cosmos.bank.v1beta1.Query/AllBalances",
      rpc: "/cosmos/bank/v1beta1/balances/:address");
  static const BankV1beta1Types allBalancesResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryAllBalancesResponse");
  static const BankV1beta1Types spendableBalancesRequest = BankV1beta1Types._(
      "/cosmos.bank.v1beta1.QuerySpendableBalancesRequest",
      query: "/cosmos.bank.v1beta1.Query/SpendableBalances",
      rpc: "/cosmos/bank/v1beta1/spendable_balances/:address");
  static const BankV1beta1Types spendableBalancesResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QuerySpendableBalancesResponse");
  static const BankV1beta1Types totalSupplyRequest = BankV1beta1Types._(
      "/cosmos.bank.v1beta1.QueryTotalSupplyRequest",
      query: "/cosmos.bank.v1beta1.Query/TotalSupply",
      rpc: "/cosmos/bank/v1beta1/supply");
  static const BankV1beta1Types totalSupplyResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryTotalSupplyResponse");
  static const BankV1beta1Types spendableBalanceByDenomRequest =
      BankV1beta1Types._(
          "/cosmos.bank.v1beta1.QuerySpendableBalanceByDenomRequest",
          query: "/cosmos.bank.v1beta1.Query/SpendableBalanceByDenom",
          rpc: "/cosmos/bank/v1beta1/spendable_balances/:address/by_denom");
  static const BankV1beta1Types spendableBalanceByDenomResponse =
      BankV1beta1Types._(
          "/cosmos.bank.v1beta1.QuerySpendableBalanceByDenomResponse");
  static const BankV1beta1Types supplyOfRequest =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QuerySupplyOfRequest");
  static const BankV1beta1Types supplyOfResponse = BankV1beta1Types._(
      "/cosmos.bank.v1beta1.QuerySupplyOfResponse",
      query: "/cosmos.bank.v1beta1.Query/SupplyOf",
      rpc: "/cosmos/bank/v1beta1/supply/by_denom");
  static const BankV1beta1Types sendEnabled =
      BankV1beta1Types._("/cosmos.bank.v1beta1.SendEnabled");
  static const BankV1beta1Types params =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Params");
  static const BankV1beta1Types paramsRequest = BankV1beta1Types._(
      "/cosmos.bank.v1beta1.QueryParamsRequest",
      query: "/cosmos.bank.v1beta1.Query/Params",
      rpc: "/cosmos/bank/v1beta1/params");
  static const BankV1beta1Types paramsResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryParamsResponse");
  static const BankV1beta1Types denomUnit =
      BankV1beta1Types._("/cosmos.bank.v1beta1.DenomUnit");
  static const BankV1beta1Types metadata =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Metadata");
  static const BankV1beta1Types denomMetadataRequest = BankV1beta1Types._(
      "/cosmos.bank.v1beta1.QueryDenomMetadataRequest",
      query: "/cosmos.bank.v1beta1.Query/DenomMetadata",
      rpc: "/cosmos/bank/v1beta1/denoms_metadata/:denom");
  static const BankV1beta1Types denomMetadataResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryDenomMetadataResponse");
  static const BankV1beta1Types denomMetadataByQueryStringResponse =
      BankV1beta1Types._(
          "/cosmos.bank.v1beta1.QueryDenomMetadataByQueryStringResponse");
  static const BankV1beta1Types denomMetadataByQueryStringRequest =
      BankV1beta1Types._(
          "/cosmos.bank.v1beta1.QueryDenomMetadataByQueryStringRequest",
          query: "/cosmos.bank.v1beta1.Query/DenomMetadataByQueryString",
          rpc: "/cosmos/bank/v1beta1/denoms_metadata_by_query_string");
  static const BankV1beta1Types denomsMetadataResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryDenomsMetadataResponse");
  static const BankV1beta1Types denomsMetadataRequest = BankV1beta1Types._(
      "/cosmos.bank.v1beta1.QueryDenomsMetadataRequest",
      query: "/cosmos.bank.v1beta1.Query/DenomsMetadata",
      rpc: "/cosmos/bank/v1beta1/denoms_metadata");
  static const BankV1beta1Types denomOwner =
      BankV1beta1Types._("/cosmos.bank.v1beta1.DenomOwner");
  static const BankV1beta1Types denomOwnersRequest = BankV1beta1Types._(
      "/cosmos.bank.v1beta1.QueryDenomOwnersRequest",
      query: "/cosmos.bank.v1beta1.Query/DenomOwners",
      rpc: "/cosmos/bank/v1beta1/denom_owners/:denom");
  static const BankV1beta1Types denomOwnersResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryDenomOwnersResponse");
  static const BankV1beta1Types sendEnabledRequest = BankV1beta1Types._(
      "/cosmos.bank.v1beta1.QuerySendEnabledRequest",
      query: "/cosmos.bank.v1beta1.Query/SendEnabled",
      rpc: "/cosmos/bank/v1beta1/send_enabled");
  static const BankV1beta1Types sendEnabledResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QuerySendEnabledResponse");
  static const BankV1beta1Types genesisState =
      BankV1beta1Types._("/cosmos.bank.v1beta1.GenesisState");
  static const BankV1beta1Types input =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Input");
  static const BankV1beta1Types output =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Output");
  static const BankV1beta1Types msgBurn =
      BankV1beta1Types._("/cosmos.bank.v1beta1.MsgBurn");
  static const BankV1beta1Types msgBurnResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.MsgBurnResponse");
  static const BankV1beta1Types msgMultiSend =
      BankV1beta1Types._("/cosmos.bank.v1beta1.MsgMultiSend");
  static const BankV1beta1Types msgMultiSendResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.MsgMultiSendResponse");
  static const BankV1beta1Types msgSetSendEnabled =
      BankV1beta1Types._("/cosmos.bank.v1beta1.MsgSetSendEnabled");
  static const BankV1beta1Types msgSetSendEnabledResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.MsgSetSendEnabledResponse");
  static const BankV1beta1Types msgUpdateParams =
      BankV1beta1Types._("/cosmos.bank.v1beta1.MsgUpdateParams");
  static const BankV1beta1Types bankMsgUpdateParamsResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.MsgUpdateParams");

  /// services
  static const BankV1beta1Types send =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Msg/Send");
  static const BankV1beta1Types multiSend =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Msg/MultiSend");
  static const BankV1beta1Types burn =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Msg/Burn");
  static const BankV1beta1Types bankUpdateParams =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Msg/UpdateParams");
  static const BankV1beta1Types setSendEnabled =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Msg/SetSendEnabled");
}
