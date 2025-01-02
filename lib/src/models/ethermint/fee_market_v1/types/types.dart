import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class FeeMarketTypes extends TypeUrl {
  const FeeMarketTypes._(super.typeUrl, {super.rpc, super.query});

  /// messages
  static const FeeMarketTypes eventBlockGas =
      FeeMarketTypes._("/ethermint.feemarket.v1.EventBlockGas");
  static const FeeMarketTypes eventFeeMarket =
      FeeMarketTypes._("/ethermint.feemarket.v1.EventFeeMarket");
  static const FeeMarketTypes params =
      FeeMarketTypes._("/ethermint.feemarket.v1.Params");
  static const FeeMarketTypes msgUpdateParamsResponse =
      FeeMarketTypes._("/ethermint.feemarket.v1.MsgUpdateParamsResponse");

  static const FeeMarketTypes msgEthereumTxResponse =
      FeeMarketTypes._("/ethermint.feemarket.v1.MsgUpdateParams");
  static const FeeMarketTypes baseFeeRequest = FeeMarketTypes._(
      "/ethermint.feemarket.v1.QueryBaseFeeRequest",
      query: "/ethermint.feemarket.v1.Query/BaseFee",
      rpc: "/ethermint/feemarket/v1/base_fee");
  static const FeeMarketTypes baseFeeResponse =
      FeeMarketTypes._("/ethermint.feemarket.v1.QueryBaseFeeResponse");
  static const FeeMarketTypes blockGasRequest = FeeMarketTypes._(
      "/ethermint.feemarket.v1.QueryBlockGasRequest",
      query: "/ethermint.feemarket.v1.Query/BlockGas",
      rpc: "/ethermint/feemarket/v1/block_gas");
  static const FeeMarketTypes blockGasResponse =
      FeeMarketTypes._("/ethermint.feemarket.v1.QueryBlockGasResponse");
  static const FeeMarketTypes paramsRequest = FeeMarketTypes._(
      "/ethermint.feemarket.v1.QueryParamsRequest",
      query: "/ethermint.feemarket.v1.Query/Params",
      rpc: "/ethermint/feemarket/v1/params");
  static const FeeMarketTypes paramsResponse =
      FeeMarketTypes._("/ethermint.feemarket.v1.QueryParamsResponse");

  static const FeeMarketTypes updateParams =
      FeeMarketTypes._("/ethermint.feemarket.v1.Msg/UpdateParams");
}
