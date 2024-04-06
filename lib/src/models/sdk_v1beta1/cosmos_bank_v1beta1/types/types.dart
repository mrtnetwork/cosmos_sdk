import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class BankV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const BankV1beta1Types._(this.typeUrl, {this.rpc});

  /// messages
  static const BankV1beta1Types msgSend =
      BankV1beta1Types._("/cosmos.bank.v1beta1.MsgSend");
  static const BankV1beta1Types msgSendResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.MsgSendResponse");
  static const BankV1beta1Types balanceRequest =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryBalanceRequest");
  static const BankV1beta1Types balanceRespone =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryBalanceResponse");
  static const BankV1beta1Types allBalancesRequest =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryAllBalancesRequest");
  static const BankV1beta1Types allBalancesResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryAllBalancesResponse");
  static const BankV1beta1Types spendableBalancesRequest =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QuerySpendableBalancesRequest");
  static const BankV1beta1Types spendableBalancesResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QuerySpendableBalancesResponse");
  static const BankV1beta1Types totalSupplyRequest =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryTotalSupplyRequest");
  static const BankV1beta1Types totalSupplyResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryTotalSupplyResponse");
  static const BankV1beta1Types spendableBalanceByDenomRequest =
      BankV1beta1Types._(
          "/cosmos.bank.v1beta1.QuerySpendableBalanceByDenomRequest");
  static const BankV1beta1Types spendableBalanceByDenomResponse =
      BankV1beta1Types._(
          "/cosmos.bank.v1beta1.QuerySpendableBalanceByDenomResponse");
  static const BankV1beta1Types supplyOfRequest =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QuerySupplyOfRequest");
  static const BankV1beta1Types supplyOfResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QuerySupplyOfResponse");
  static const BankV1beta1Types sendEnabled =
      BankV1beta1Types._("/cosmos.bank.v1beta1.SendEnabled");
  static const BankV1beta1Types params =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Params");
  static const BankV1beta1Types paramsRequest =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryParamsRequest");
  static const BankV1beta1Types paramsResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryParamsResponse");
  static const BankV1beta1Types denomUnit =
      BankV1beta1Types._("/cosmos.bank.v1beta1.DenomUnit");
  static const BankV1beta1Types metadata =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Metadata");
  static const BankV1beta1Types denomMetadataRequest =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryDenomMetadataRequest");
  static const BankV1beta1Types denomMetadataResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryDenomMetadataResponse");
  static const BankV1beta1Types denomMetadataByQueryStringResponse =
      BankV1beta1Types._(
          "/cosmos.bank.v1beta1.QueryDenomMetadataByQueryStringResponse");
  static const BankV1beta1Types denomMetadataByQueryStringRequest =
      BankV1beta1Types._(
          "/cosmos.bank.v1beta1.QueryDenomMetadataByQueryStringRequest");
  static const BankV1beta1Types denomsMetadataResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryDenomsMetadataResponse");
  static const BankV1beta1Types denomsMetadataRequest =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryDenomsMetadataRequest");
  static const BankV1beta1Types denomOwner =
      BankV1beta1Types._("/cosmos.bank.v1beta1.DenomOwner");
  static const BankV1beta1Types denomOwnersRequest =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryDenomOwnersRequest");
  static const BankV1beta1Types denomOwnersResponse =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QueryDenomOwnersResponse");
  static const BankV1beta1Types sendEnabledRequest =
      BankV1beta1Types._("/cosmos.bank.v1beta1.QuerySendEnabledRequest");
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

  /// queries
  static const BankV1beta1Types balance = BankV1beta1Types._(
      "/cosmos.bank.v1beta1.Query/Balance",
      rpc: "/cosmos/bank/v1beta1/balances/:address/by_denom");
  static const BankV1beta1Types allBalances = BankV1beta1Types._(
      "/cosmos.bank.v1beta1.Query/AllBalances",
      rpc: "/cosmos/bank/v1beta1/balances/:address");
  static const BankV1beta1Types spendableBalances =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Query/SpendableBalances");
  static const BankV1beta1Types totalSupply =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Query/TotalSupply");
  static const BankV1beta1Types spendableBalanceByDenom =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Query/SpendableBalanceByDenom");
  static const BankV1beta1Types supplyOf =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Query/SupplyOf");
  static const BankV1beta1Types queryParams =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Query/Params");
  static const BankV1beta1Types denomMetadata =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Query/DenomMetadata");
  static const BankV1beta1Types denomMetadataByQueryString = BankV1beta1Types._(
      "/cosmos.bank.v1beta1.Query/DenomMetadataByQueryString");
  static const BankV1beta1Types denomsMetadata =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Query/DenomsMetadata");
  static const BankV1beta1Types denomOwners =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Query/DenomOwners");
  static const BankV1beta1Types querySendEnabled =
      BankV1beta1Types._("/cosmos.bank.v1beta1.Query/SendEnabled");

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
