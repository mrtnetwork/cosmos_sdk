import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisGammV1beta1Types extends TypeUrl {
  const OsmosisGammV1beta1Types._(super.typeUrl, {super.query, super.rpc});
  static const String root = "/osmosis.gamm.v1beta1";
  static const OsmosisGammV1beta1Types poolAsset =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.PoolAsset");
  static const OsmosisGammV1beta1Types pool =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.Pool");
  static const OsmosisGammV1beta1Types smoothWeightChangeParams =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.SmoothWeightChangeParams");
  static const OsmosisGammV1beta1Types params =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.Params");
  static const OsmosisGammV1beta1Types poolParams =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.PoolParams");
  static const OsmosisGammV1beta1Types genesisState =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.GenesisState");

  static const OsmosisGammV1beta1Types msgJoinPool =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.MsgJoinPool");
  static const OsmosisGammV1beta1Types msgJoinPoolResponse =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.MsgJoinPoolResponse");

  static const OsmosisGammV1beta1Types msgExitPool =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.MsgExitPool");
  static const OsmosisGammV1beta1Types msgExitPoolResponse =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.MsgExitPoolResponse");

  static const OsmosisGammV1beta1Types msgSwapExactAmountIn =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.MsgSwapExactAmountIn");
  static const OsmosisGammV1beta1Types msgSwapExactAmountInResponse =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.MsgSwapExactAmountInResponse");

  static const OsmosisGammV1beta1Types msgSwapExactAmountOut =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.MsgSwapExactAmountOut");
  static const OsmosisGammV1beta1Types msgSwapExactAmountOutResponse =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.MsgSwapExactAmountOutResponse");

  static const OsmosisGammV1beta1Types swapAmountInRoute =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.SwapAmountInRoute");
  static const OsmosisGammV1beta1Types swapAmountOutRoute =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.SwapAmountOutRoute");

  static const OsmosisGammV1beta1Types msgJoinSwapExternAmountIn =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.MsgJoinSwapExternAmountIn");
  static const OsmosisGammV1beta1Types msgJoinSwapExternAmountInResponse =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.MsgJoinSwapExternAmountInResponse");

  static const OsmosisGammV1beta1Types msgJoinSwapShareAmountOut =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.MsgJoinSwapShareAmountOut");
  static const OsmosisGammV1beta1Types msgJoinSwapShareAmountOutResponse =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.MsgJoinSwapShareAmountOutResponse");
  static const OsmosisGammV1beta1Types msgExitSwapExternAmountOut =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.MsgExitSwapExternAmountOut");
  static const OsmosisGammV1beta1Types msgExitSwapExternAmountOutResponse =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.MsgExitSwapExternAmountOutResponse");
  static const OsmosisGammV1beta1Types msgExitSwapShareAmountIn =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.MsgExitSwapShareAmountIn");
  static const OsmosisGammV1beta1Types msgExitSwapShareAmountInResponse =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.MsgExitSwapShareAmountInResponse");

  static const OsmosisGammV1beta1Types queryPoolsRequest =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.QueryPoolsRequest",
          query: "/osmosis.gamm.v1beta1.Query/Pools",
          rpc: "/osmosis/gamm/v1beta1/pools");
  static const OsmosisGammV1beta1Types queryPoolsResponse =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.QueryPoolsResponse");

  static const OsmosisGammV1beta1Types queryNumPoolsRequest =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.QueryNumPoolsRequest",
          query: "/osmosis.gamm.v1beta1.Query/Pools",
          rpc: "/osmosis/gamm/v1beta1/NumPools");
  static const OsmosisGammV1beta1Types queryNumPoolsResponse =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.QueryNumPoolsResponse");
  static const OsmosisGammV1beta1Types queryTotalLiquidityRequest =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.QueryTotalLiquidityRequest",
          query: "/osmosis.gamm.v1beta1.Query/TotalLiquidity",
          rpc: "/osmosis/gamm/v1beta1/total_liquidity");
  static const OsmosisGammV1beta1Types queryTotalLiquidityResponse =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.QueryTotalLiquidityResponse");

  static const OsmosisGammV1beta1Types queryPoolRequest =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.QueryPoolRequest",
          query: "/osmosis.gamm.v1beta1.Query/Pool",
          rpc: "/osmosis/gamm/v1beta1/pools/:pool");
  static const OsmosisGammV1beta1Types queryPoolResponse =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.QueryPoolResponse");
  static const OsmosisGammV1beta1Types queryPoolTypeRequest =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.QueryPoolTypeRequest",
          query: "/osmosis.gamm.v1beta1.Query/PoolType",
          rpc: "/osmosis/gamm/v1beta1/pool_type/:pool");
  static const OsmosisGammV1beta1Types queryPoolTypeResponse =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.QueryPoolTypeResponse");

  static const OsmosisGammV1beta1Types queryPoolParamsRequest =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.QueryPoolParamsRequest",
          query: "/osmosis.gamm.v1beta1.Query/PoolParams",
          rpc: "/osmosis/gamm/v1beta1/pools/:pool/params");
  static const OsmosisGammV1beta1Types queryPoolParamsResponse =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.QueryPoolParamsResponse");

  static const OsmosisGammV1beta1Types queryTotalPoolLiquidityRequest =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.QueryTotalPoolLiquidityRequest",
          query: "/osmosis.gamm.v1beta1.Query/TotalPoolLiquidity",
          rpc: "/osmosis/gamm/v1beta1/pools/:pool_id/total_pool_liquidity");
  static const OsmosisGammV1beta1Types queryTotalPoolLiquidityResponse =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.QueryTotalPoolLiquidityResponse");

  static const OsmosisGammV1beta1Types queryTotalSharesRequest =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.QueryTotalSharesRequest",
          query: "/osmosis.gamm.v1beta1.Query/TotalShares",
          rpc: "/osmosis/gamm/v1beta1/pools/:pool_id/total_shares");
  static const OsmosisGammV1beta1Types queryTotalSharesResponse =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.QueryTotalSharesResponse");

  static const OsmosisGammV1beta1Types querySpotPriceRequest =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.QuerySpotPriceRequest",
          query: "/osmosis.gamm.v1beta1.Query/SpotPrice",
          rpc: "/osmosis/gamm/v1beta1/pools/:pool_id/prices");
  static const OsmosisGammV1beta1Types querySpotPriceResponse =
      OsmosisGammV1beta1Types._("/osmosis.gamm.v1beta1.querySpotPriceResponse");

  static const OsmosisGammV1beta1Types querySwapExactAmountInRequest =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.QuerySwapExactAmountInRequest",
          query: "/osmosis.gamm.v1beta1.Query/EstimateSwapExactAmountIn",
          rpc: "/osmosis/gamm/v1beta1/:pool_id/estimate/swap_exact_amount_in");
  static const OsmosisGammV1beta1Types querySwapExactAmountInResponse =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.QuerySwapExactAmountInResponse");
  static const OsmosisGammV1beta1Types querySwapExactAmountOutRequest =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.QuerySwapExactAmountOutRequest",
          query: "/osmosis.gamm.v1beta1.Query/EstimateSwapExactAmountOut",
          rpc: "/osmosis/gamm/v1beta1/:pool_id/estimate/swap_exact_amount_out");
  static const OsmosisGammV1beta1Types querySwapExactAmountOutResponse =
      OsmosisGammV1beta1Types._(
          "/osmosis.gamm.v1beta1.QuerySwapExactAmountOutResponse");

  static const List<TypeUrl> services = [
    msgExitPool,
    msgExitSwapExternAmountOut,
    msgExitSwapShareAmountIn,
    msgJoinPool,
    msgJoinSwapExternAmountIn,
    msgJoinSwapShareAmountOut,
    msgSwapExactAmountOut,
    msgSwapExactAmountIn
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
