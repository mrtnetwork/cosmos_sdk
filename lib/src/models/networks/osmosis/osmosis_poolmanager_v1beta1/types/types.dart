import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisPoolManagerV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const OsmosisPoolManagerV1beta1Types._(this.typeUrl, {this.rpc});
  static const OsmosisPoolManagerV1beta1Types trackedVolume =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.TrackedVolume");
  static const OsmosisPoolManagerV1beta1Types takerFeesTracker =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.TakerFeesTracker");
  static const OsmosisPoolManagerV1beta1Types takerFeeDistributionPercentage =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.TakerFeeDistributionPercentage");
  static const OsmosisPoolManagerV1beta1Types takerFeeParams =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.TakerFeeParams");
  static const OsmosisPoolManagerV1beta1Types swapAmountOutRoute =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.SwapAmountOutRoute");

  static const OsmosisPoolManagerV1beta1Types swapAmountOutSplitRoute =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.SwapAmountOutSplitRoute");
  static const OsmosisPoolManagerV1beta1Types denomPairTakerFee =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.DenomPairTakerFee");

  static const OsmosisPoolManagerV1beta1Types denomPairTakerFeeProposal =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.DenomPairTakerFeeProposal");
  static const OsmosisPoolManagerV1beta1Types params =
      OsmosisPoolManagerV1beta1Types._("/smosis.poolmanager.v1beta1.params");

  static const OsmosisPoolManagerV1beta1Types moduleRoute =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.ModuleRoute");

  static const OsmosisPoolManagerV1beta1Types genesisState =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.GenesisState");
  static const OsmosisPoolManagerV1beta1Types poolVolume =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.PoolVolume");
  static const OsmosisPoolManagerV1beta1Types swapAmountInRoute =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.SwapAmountInRoute");

  static const OsmosisPoolManagerV1beta1Types msgSwapExactAmountIn =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.MsgSwapExactAmountIn");
  static const OsmosisPoolManagerV1beta1Types msgSwapExactAmountInResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.MsgSwapExactAmountInResponse");

  static const OsmosisPoolManagerV1beta1Types msgSwapExactAmountOut =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.MsgSwapExactAmountOut");
  static const OsmosisPoolManagerV1beta1Types msgSwapExactAmountOutResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.MsgSwapExactAmountOutResponse");

  static const OsmosisPoolManagerV1beta1Types msgSplitRouteSwapExactAmountIn =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.MsgSplitRouteSwapExactAmountIn");
  static const OsmosisPoolManagerV1beta1Types
      msgSplitRouteSwapExactAmountInResponse = OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.MsgSplitRouteSwapExactAmountInResponse");

  static const OsmosisPoolManagerV1beta1Types msgSplitRouteSwapExactAmountOut =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.MsgSplitRouteSwapExactAmountOut");
  static const OsmosisPoolManagerV1beta1Types
      msgSplitRouteSwapExactAmountOutResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.MsgSplitRouteSwapExactAmountOutResponse");

  static const OsmosisPoolManagerV1beta1Types msgSetDenomPairTakerFee =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.MsgSetDenomPairTakerFee");
  static const OsmosisPoolManagerV1beta1Types msgSetDenomPairTakerFeeResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.MsgSetDenomPairTakerFeeResponse");

  static const OsmosisPoolManagerV1beta1Types paramsRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.ParamsRequest");
  static const OsmosisPoolManagerV1beta1Types paramsResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.ParamsResponse");

  static const OsmosisPoolManagerV1beta1Types estimateSwapExactAmountInRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.EstimateSwapExactAmountInRequest");
  static const OsmosisPoolManagerV1beta1Types
      estimateSwapExactAmountInResponse = OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.EstimateSwapExactAmountInResponse");

  static const OsmosisPoolManagerV1beta1Types
      estimateSwapExactAmountInWithPrimitiveTypesRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.EstimateSwapExactAmountInWithPrimitiveTypesRequest");

  static const OsmosisPoolManagerV1beta1Types
      estimateSwapExactAmountOutRequest = OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.EstimateSwapExactAmountOutRequest");
  static const OsmosisPoolManagerV1beta1Types
      estimateSwapExactAmountOutResponse = OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.EstimateSwapExactAmountOutResponse");

  static const OsmosisPoolManagerV1beta1Types
      estimateSwapExactAmountOutWithPrimitiveTypesRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.EstimateSwapExactAmountOutWithPrimitiveTypesRequest");

  static const OsmosisPoolManagerV1beta1Types
      estimateSinglePoolSwapExactAmountOutRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.EstimateSinglePoolSwapExactAmountOutRequest");

  static const OsmosisPoolManagerV1beta1Types numPoolsRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.NumPoolsRequest");
  static const OsmosisPoolManagerV1beta1Types numPoolsResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.NumPoolsResponse");

  static const OsmosisPoolManagerV1beta1Types poolRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.PoolRequest");
  static const OsmosisPoolManagerV1beta1Types poolResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.PoolResponse");

  static const OsmosisPoolManagerV1beta1Types allPoolsRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.AllPoolsRequest");
  static const OsmosisPoolManagerV1beta1Types allPoolsResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.AllPoolsResponse");

  static const OsmosisPoolManagerV1beta1Types listPoolsByDenomRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.ListPoolsByDenomRequest");
  static const OsmosisPoolManagerV1beta1Types listPoolsByDenomResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.ListPoolsByDenomResponse");

  static const OsmosisPoolManagerV1beta1Types spotPriceRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.SpotPriceRequest");
  static const OsmosisPoolManagerV1beta1Types spotPriceResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.SpotPriceResponse");

  static const OsmosisPoolManagerV1beta1Types totalPoolLiquidityRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.TotalPoolLiquidityRequest");
  static const OsmosisPoolManagerV1beta1Types totalPoolLiquidityResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.TotalPoolLiquidityResponse");

  static const OsmosisPoolManagerV1beta1Types totalLiquidityRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.TotalLiquidityRequest");
  static const OsmosisPoolManagerV1beta1Types totalLiquidityResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.TotalLiquidityResponse");

  static const OsmosisPoolManagerV1beta1Types totalVolumeForPoolRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.TotalVolumeForPoolRequest");
  static const OsmosisPoolManagerV1beta1Types totalVolumeForPoolResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.TotalVolumeForPoolResponse");

  static const OsmosisPoolManagerV1beta1Types tradingPairTakerFeeRequest =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.TradingPairTakerFeeRequest");
  static const OsmosisPoolManagerV1beta1Types tradingPairTakerFeeResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.TradingPairTakerFeeResponse");

  static const OsmosisPoolManagerV1beta1Types
      estimateTradeBasedOnPriceImpactRequest = OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.EstimateTradeBasedOnPriceImpactRequest");
  static const OsmosisPoolManagerV1beta1Types
      estimateTradeBasedOnPriceImpactResponse =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.EstimateTradeBasedOnPriceImpactResponse");

  /// query
  static const OsmosisPoolManagerV1beta1Types estimateTradeBasedOnPriceImpact =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/EstimateTradeBasedOnPriceImpact",
          rpc: "/osmosis/poolmanager/v1beta1/:pool_id/estimate_trade");
  static const OsmosisPoolManagerV1beta1Types tradingPairTakerFee =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/TradingPairTakerFee",
          rpc: "/osmosis/poolmanager/v1beta1/trading_pair_takerfee");
  static const OsmosisPoolManagerV1beta1Types totalVolumeForPool =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/TotalVolumeForPool",
          rpc: "/osmosis/poolmanager/v1beta1/pools/:pool_id/total_volume");
  static const OsmosisPoolManagerV1beta1Types totalLiquidity =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/TotalLiquidity",
          rpc: "/osmosis/poolmanager/v1beta1/pools/total_liquidity");
  static const OsmosisPoolManagerV1beta1Types totalPoolLiquidity =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/TotalPoolLiquidity",
          rpc:
              "/osmosis/poolmanager/v1beta1/pools/:pool_id/total_pool_liquidity");
  static const OsmosisPoolManagerV1beta1Types spotPrice =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/SpotPrice",
          rpc: "/osmosis/poolmanager/pools/:pool_id/prices");
  static const OsmosisPoolManagerV1beta1Types listPoolsByDenom =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/ListPoolsByDenom",
          rpc: "/osmosis/poolmanager/v1beta1/list-pools-by-denom");
  static const OsmosisPoolManagerV1beta1Types allPools =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/AllPools",
          rpc: "/osmosis/poolmanager/v1beta1/all-pools");
  static const OsmosisPoolManagerV1beta1Types pool =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/Pool",
          rpc: "/osmosis/poolmanager/v1beta1/pools/:pool_id");

  static const OsmosisPoolManagerV1beta1Types numPools =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/NumPools",
          rpc: "/osmosis/poolmanager/v1beta1/num_pools");

  static const OsmosisPoolManagerV1beta1Types
      estimateSinglePoolSwapExactAmountOut = OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/EstimateSinglePoolSwapExactAmountOut",
          rpc:
              "/osmosis/poolmanager/v1beta1/:pool_id/estimate_out/single_pool_swap_exact_amount_out");
  static const OsmosisPoolManagerV1beta1Types
      estimateSwapExactAmountOutWithPrimitiveTypes =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/EstimateSwapExactAmountOutWithPrimitiveTypes",
          rpc:
              "/osmosis/poolmanager/v1beta1/:pool_id/estimate/swap_exact_amount_out_with_primitive_types");
  static const OsmosisPoolManagerV1beta1Types estimateSwapExactAmountOut =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/EstimateSwapExactAmountOut",
          rpc:
              "/osmosis/poolmanager/v1beta1/:pool_id/estimate/swap_exact_amount_out");

  static const OsmosisPoolManagerV1beta1Types
      estimateSwapExactAmountInWithPrimitiveTypes =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/EstimateSwapExactAmountInWithPrimitiveTypes",
          rpc:
              "/osmosis/poolmanager/v1beta1/:pool_id/estimate/swap_exact_amount_in_with_primitive_types");

  static const OsmosisPoolManagerV1beta1Types estimateSwapExactAmountIn =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.Query/EstimateSwapExactAmountIn",
          rpc:
              "/osmosis/poolmanager/v1beta1/:pool_id/estimate/swap_exact_amount_in");

  static const OsmosisPoolManagerV1beta1Types queryParams =
      OsmosisPoolManagerV1beta1Types._(
          "/osmosis.poolmanager.v1beta1.Query/Params",
          rpc: "/osmosis/poolmanager/v1beta1/Params");

  /// services

  static const OsmosisPoolManagerV1beta1Types setDenomPairTakerFee =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.Msg/SetDenomPairTakerFee");
  static const OsmosisPoolManagerV1beta1Types splitRouteSwapExactAmountOut =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.Msg/SplitRouteSwapExactAmountOut");
  static const OsmosisPoolManagerV1beta1Types splitRouteSwapExactAmountIn =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.Msg/SplitRouteSwapExactAmountIn");
  static const OsmosisPoolManagerV1beta1Types swapExactAmountOut =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.Msg/SwapExactAmountOut");
  static const OsmosisPoolManagerV1beta1Types swapExactAmountIn =
      OsmosisPoolManagerV1beta1Types._(
          "/smosis.poolmanager.v1beta1.Msg/SwapExactAmountIn");
}
