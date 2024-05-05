import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisStreamSwapV1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const OsmosisStreamSwapV1Types._(this.typeUrl, {this.rpc});
  static const OsmosisStreamSwapV1Types userPosition =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.UserPosition");
  static const OsmosisStreamSwapV1Types userPositionKV =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.UserPositionKV");
  static const OsmosisStreamSwapV1Types sale =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.Sale");
  static const OsmosisStreamSwapV1Types params =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.Params");
  static const OsmosisStreamSwapV1Types genesisState =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.GenesisState");
  static const OsmosisStreamSwapV1Types eventWithdraw =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.EventWithdraw");
  static const OsmosisStreamSwapV1Types eventSubscribe =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.EventSubscribe");
  static const OsmosisStreamSwapV1Types eventFinalizeSale =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.EventFinalizeSale");
  static const OsmosisStreamSwapV1Types eventExit =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.EventExit");
  static const OsmosisStreamSwapV1Types eventCreateSale =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.EventCreateSale");

  static const OsmosisStreamSwapV1Types msgCreateSale =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.MsgCreateSale");
  static const OsmosisStreamSwapV1Types msgCreateSaleResponse =
      OsmosisStreamSwapV1Types._(
          "/osmosis.streamswap.v1.MsgCreateSaleResponse");

  static const OsmosisStreamSwapV1Types msgSubscribe =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.MsgSubscribe");

  static const OsmosisStreamSwapV1Types msgWithdraw =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.MsgWithdraw");

  static const OsmosisStreamSwapV1Types msgExitSale =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.MsgExitSale");
  static const OsmosisStreamSwapV1Types msgExitSaleResponse =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.MsgExitSaleResponse");

  static const OsmosisStreamSwapV1Types msgFinalizeSale =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.MsgFinalizeSale");
  static const OsmosisStreamSwapV1Types msgFinalizeSaleResponse =
      OsmosisStreamSwapV1Types._(
          "/osmosis.streamswap.v1.MsgFinalizeSaleResponse");

  static const OsmosisStreamSwapV1Types querySales =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.QuerySales");
  static const OsmosisStreamSwapV1Types querySalesResponse =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.QuerySalesResponse");

  static const OsmosisStreamSwapV1Types querySaleRequest =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.QuerySale");
  static const OsmosisStreamSwapV1Types querySaleResponse =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.QuerySaleResponse");

  static const OsmosisStreamSwapV1Types queryUserPositionRequest =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.QueryUserPosition");
  static const OsmosisStreamSwapV1Types queryUserPositionResponse =
      OsmosisStreamSwapV1Types._(
          "/osmosis.streamswap.v1.QueryUserPositionResponse");

  /// query
  static const OsmosisStreamSwapV1Types queryUserPosition =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.Query/UserPosition",
          rpc: "/cosmos/streamswap/v1/sales/:sale_id/:user");
  static const OsmosisStreamSwapV1Types querySale = OsmosisStreamSwapV1Types._(
      "/osmosis.streamswap.v1.Query/Sale",
      rpc: "/cosmos/streamswap/v1/sales/:sale_id");
  static const OsmosisStreamSwapV1Types sales = OsmosisStreamSwapV1Types._(
      "/osmosis.streamswap.v1.Query/Sales",
      rpc: "/cosmos/streamswap/v1/sales");

  /// service
  static const OsmosisStreamSwapV1Types finalizeSale =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.Msg/FinalizeSale");
  static const OsmosisStreamSwapV1Types exitSale =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.Msg/ExitSale");
  static const OsmosisStreamSwapV1Types withdraw =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.Msg/Withdraw");
  static const OsmosisStreamSwapV1Types subscribe =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.Msg/Subscribe");
  static const OsmosisStreamSwapV1Types createSale =
      OsmosisStreamSwapV1Types._("/osmosis.streamswap.v1.Msg/CreateSale");
}
