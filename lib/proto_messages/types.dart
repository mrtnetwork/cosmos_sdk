import 'package:cosmos_sdk/sdk/exception/exception.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import 'package:blockchain_utils/blockchain_utils.dart';

enum DefaultCosmosProtoTypeUrl implements CosmosProtoTypeUrl {
  osmosisValsetprefV1beta1UserValidatorPreferencesRequest(
    typeUrl: '/osmosis.valsetpref.v1beta1.UserValidatorPreferencesRequest',
    serviceUrl: "/osmosis.valsetpref.v1beta1.Query/UserValidatorPreferences",
  ),
  osmosisValsetprefV1beta1UserValidatorPreferencesResponse(
    typeUrl: '/osmosis.valsetpref.v1beta1.UserValidatorPreferencesResponse',
  ),
  osmosisValsetprefV1beta1ValidatorPreference(
    typeUrl: '/osmosis.valsetpref.v1beta1.ValidatorPreference',
  ),
  osmosisValsetprefV1beta1MsgSetValidatorSetPreference(
    typeUrl: '/osmosis.valsetpref.v1beta1.MsgSetValidatorSetPreference',
    serviceUrl: "/osmosis.valsetpref.v1beta1.Msg/SetValidatorSetPreference",
    aminoType: "osmosis/MsgSetValidatorSetPreference",
  ),
  osmosisValsetprefV1beta1MsgSetValidatorSetPreferenceResponse(
    typeUrl: '/osmosis.valsetpref.v1beta1.MsgSetValidatorSetPreferenceResponse',
  ),
  osmosisValsetprefV1beta1MsgDelegateToValidatorSet(
    typeUrl: '/osmosis.valsetpref.v1beta1.MsgDelegateToValidatorSet',
    serviceUrl: "/osmosis.valsetpref.v1beta1.Msg/DelegateToValidatorSet",
    aminoType: "osmosis/MsgDelegateToValidatorSet",
  ),
  osmosisValsetprefV1beta1MsgDelegateToValidatorSetResponse(
    typeUrl: '/osmosis.valsetpref.v1beta1.MsgDelegateToValidatorSetResponse',
  ),
  osmosisValsetprefV1beta1MsgUndelegateFromValidatorSet(
    typeUrl: '/osmosis.valsetpref.v1beta1.MsgUndelegateFromValidatorSet',
    serviceUrl: "/osmosis.valsetpref.v1beta1.Msg/UndelegateFromValidatorSet",
    aminoType: "osmosis/MsgUndelegateFromValidatorSet",
  ),
  osmosisValsetprefV1beta1MsgUndelegateFromValidatorSetResponse(
    typeUrl:
        '/osmosis.valsetpref.v1beta1.MsgUndelegateFromValidatorSetResponse',
  ),
  osmosisValsetprefV1beta1MsgUndelegateFromRebalancedValidatorSet(
    typeUrl:
        '/osmosis.valsetpref.v1beta1.MsgUndelegateFromRebalancedValidatorSet',
    serviceUrl:
        "/osmosis.valsetpref.v1beta1.Msg/UndelegateFromRebalancedValidatorSet",
    aminoType: "osmosis/MsgUndelegateFromRebalValset",
  ),
  osmosisValsetprefV1beta1MsgUndelegateFromRebalancedValidatorSetResponse(
    typeUrl:
        '/osmosis.valsetpref.v1beta1.MsgUndelegateFromRebalancedValidatorSetResponse',
  ),
  osmosisValsetprefV1beta1MsgRedelegateValidatorSet(
    typeUrl: '/osmosis.valsetpref.v1beta1.MsgRedelegateValidatorSet',
    serviceUrl: "/osmosis.valsetpref.v1beta1.Msg/RedelegateValidatorSet",
    aminoType: "osmosis/MsgRedelegateValidatorSet",
  ),
  osmosisValsetprefV1beta1MsgRedelegateValidatorSetResponse(
    typeUrl: '/osmosis.valsetpref.v1beta1.MsgRedelegateValidatorSetResponse',
  ),
  osmosisValsetprefV1beta1MsgWithdrawDelegationRewards(
    typeUrl: '/osmosis.valsetpref.v1beta1.MsgWithdrawDelegationRewards',
    serviceUrl: "/osmosis.valsetpref.v1beta1.Msg/WithdrawDelegationRewards",
    aminoType: "osmosis/MsgWithdrawDelegationRewards",
  ),
  osmosisValsetprefV1beta1MsgWithdrawDelegationRewardsResponse(
    typeUrl: '/osmosis.valsetpref.v1beta1.MsgWithdrawDelegationRewardsResponse',
  ),
  osmosisValsetprefV1beta1MsgDelegateBondedTokens(
    typeUrl: '/osmosis.valsetpref.v1beta1.MsgDelegateBondedTokens',
    serviceUrl: "/osmosis.valsetpref.v1beta1.Msg/DelegateBondedTokens",
    aminoType: "osmosis/MsgDelegateBondedTokens",
  ),
  osmosisValsetprefV1beta1MsgDelegateBondedTokensResponse(
    typeUrl: '/osmosis.valsetpref.v1beta1.MsgDelegateBondedTokensResponse',
  ),
  osmosisIbchooksMsgEmitIBCAck(
    typeUrl: '/osmosis.ibchooks.MsgEmitIBCAck',
    serviceUrl: "/osmosis.ibchooks.Msg/EmitIBCAck",
    aminoType: "osmosis/MsgEmitIBCAck",
  ),
  osmosisIbchooksMsgEmitIBCAckResponse(
    typeUrl: '/osmosis.ibchooks.MsgEmitIBCAckResponse',
  ),
  osmosisProtorevV1beta1QueryParamsRequest(
    typeUrl: '/osmosis.protorev.v1beta1.QueryParamsRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/Params",
  ),
  osmosisProtorevV1beta1QueryParamsResponse(
    typeUrl: '/osmosis.protorev.v1beta1.QueryParamsResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevNumberOfTradesRequest(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevNumberOfTradesRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetProtoRevNumberOfTrades",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevNumberOfTradesResponse(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevNumberOfTradesResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevProfitsByDenomRequest(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevProfitsByDenomRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetProtoRevProfitsByDenom",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevProfitsByDenomResponse(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevProfitsByDenomResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevAllProfitsRequest(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevAllProfitsRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetProtoRevAllProfits",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevAllProfitsResponse(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevAllProfitsResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevStatisticsByRouteRequest(
    typeUrl:
        '/osmosis.protorev.v1beta1.QueryGetProtoRevStatisticsByRouteRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetProtoRevStatisticsByRoute",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevStatisticsByRouteResponse(
    typeUrl:
        '/osmosis.protorev.v1beta1.QueryGetProtoRevStatisticsByRouteResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevAllRouteStatisticsRequest(
    typeUrl:
        '/osmosis.protorev.v1beta1.QueryGetProtoRevAllRouteStatisticsRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetProtoRevAllRouteStatistics",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevAllRouteStatisticsResponse(
    typeUrl:
        '/osmosis.protorev.v1beta1.QueryGetProtoRevAllRouteStatisticsResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevTokenPairArbRoutesRequest(
    typeUrl:
        '/osmosis.protorev.v1beta1.QueryGetProtoRevTokenPairArbRoutesRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetProtoRevTokenPairArbRoutes",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevTokenPairArbRoutesResponse(
    typeUrl:
        '/osmosis.protorev.v1beta1.QueryGetProtoRevTokenPairArbRoutesResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevAdminAccountRequest(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevAdminAccountRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetProtoRevAdminAccount",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevAdminAccountResponse(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevAdminAccountResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevDeveloperAccountRequest(
    typeUrl:
        '/osmosis.protorev.v1beta1.QueryGetProtoRevDeveloperAccountRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetProtoRevDeveloperAccount",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevDeveloperAccountResponse(
    typeUrl:
        '/osmosis.protorev.v1beta1.QueryGetProtoRevDeveloperAccountResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevInfoByPoolTypeRequest(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevInfoByPoolTypeRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetProtoRevInfoByPoolType",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevInfoByPoolTypeResponse(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevInfoByPoolTypeResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevMaxPoolPointsPerBlockRequest(
    typeUrl:
        '/osmosis.protorev.v1beta1.QueryGetProtoRevMaxPoolPointsPerBlockRequest',
    serviceUrl:
        "/osmosis.protorev.v1beta1.Query/GetProtoRevMaxPoolPointsPerBlock",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevMaxPoolPointsPerBlockResponse(
    typeUrl:
        '/osmosis.protorev.v1beta1.QueryGetProtoRevMaxPoolPointsPerBlockResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevMaxPoolPointsPerTxRequest(
    typeUrl:
        '/osmosis.protorev.v1beta1.QueryGetProtoRevMaxPoolPointsPerTxRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetProtoRevMaxPoolPointsPerTx",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevMaxPoolPointsPerTxResponse(
    typeUrl:
        '/osmosis.protorev.v1beta1.QueryGetProtoRevMaxPoolPointsPerTxResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevBaseDenomsRequest(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevBaseDenomsRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetProtoRevBaseDenoms",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevBaseDenomsResponse(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevBaseDenomsResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevEnabledRequest(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevEnabledRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetProtoRevEnabled",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevEnabledResponse(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevEnabledResponse',
  ),
  osmosisProtorevV1beta1QueryGetProtoRevPoolRequest(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevPoolRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetProtoRevPool",
  ),
  osmosisProtorevV1beta1QueryGetProtoRevPoolResponse(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetProtoRevPoolResponse',
  ),
  osmosisProtorevV1beta1QueryGetAllProtocolRevenueRequest(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetAllProtocolRevenueRequest',
    serviceUrl: "/osmosis.protorev.v1beta1.Query/GetAllProtocolRevenue",
  ),
  osmosisProtorevV1beta1QueryGetAllProtocolRevenueResponse(
    typeUrl: '/osmosis.protorev.v1beta1.QueryGetAllProtocolRevenueResponse',
  ),
  osmosisProtorevV1beta1TokenPairArbRoutes(
    typeUrl: '/osmosis.protorev.v1beta1.TokenPairArbRoutes',
  ),
  osmosisProtorevV1beta1Route(typeUrl: '/osmosis.protorev.v1beta1.Route'),
  osmosisProtorevV1beta1Trade(typeUrl: '/osmosis.protorev.v1beta1.Trade'),
  osmosisProtorevV1beta1RouteStatistics(
    typeUrl: '/osmosis.protorev.v1beta1.RouteStatistics',
  ),
  osmosisProtorevV1beta1InfoByPoolType(
    typeUrl: '/osmosis.protorev.v1beta1.InfoByPoolType',
  ),
  osmosisProtorevV1beta1StablePoolInfo(
    typeUrl: '/osmosis.protorev.v1beta1.StablePoolInfo',
  ),
  osmosisProtorevV1beta1BalancerPoolInfo(
    typeUrl: '/osmosis.protorev.v1beta1.BalancerPoolInfo',
  ),
  osmosisProtorevV1beta1ConcentratedPoolInfo(
    typeUrl: '/osmosis.protorev.v1beta1.ConcentratedPoolInfo',
  ),
  osmosisProtorevV1beta1CosmwasmPoolInfo(
    typeUrl: '/osmosis.protorev.v1beta1.CosmwasmPoolInfo',
  ),
  osmosisProtorevV1beta1WeightMap(
    typeUrl: '/osmosis.protorev.v1beta1.WeightMap',
  ),
  osmosisProtorevV1beta1BaseDenom(
    typeUrl: '/osmosis.protorev.v1beta1.BaseDenom',
  ),
  osmosisProtorevV1beta1AllProtocolRevenue(
    typeUrl: '/osmosis.protorev.v1beta1.AllProtocolRevenue',
  ),
  osmosisProtorevV1beta1CyclicArbTracker(
    typeUrl: '/osmosis.protorev.v1beta1.CyclicArbTracker',
  ),
  osmosisProtorevV1beta1Params(typeUrl: '/osmosis.protorev.v1beta1.Params'),
  osmosisProtorevV1beta1MsgSetHotRoutes(
    typeUrl: '/osmosis.protorev.v1beta1.MsgSetHotRoutes',
    serviceUrl: "/osmosis.protorev.v1beta1.Msg/SetHotRoutes",
    aminoType: "osmosis/MsgSetHotRoutes",
  ),
  osmosisProtorevV1beta1MsgSetHotRoutesResponse(
    typeUrl: '/osmosis.protorev.v1beta1.MsgSetHotRoutesResponse',
  ),
  osmosisProtorevV1beta1MsgSetDeveloperAccount(
    typeUrl: '/osmosis.protorev.v1beta1.MsgSetDeveloperAccount',
    serviceUrl: "/osmosis.protorev.v1beta1.Msg/SetDeveloperAccount",
    aminoType: "osmosis/MsgSetDeveloperAccount",
  ),
  osmosisProtorevV1beta1MsgSetDeveloperAccountResponse(
    typeUrl: '/osmosis.protorev.v1beta1.MsgSetDeveloperAccountResponse',
  ),
  osmosisProtorevV1beta1MsgSetInfoByPoolType(
    typeUrl: '/osmosis.protorev.v1beta1.MsgSetInfoByPoolType',
    serviceUrl: "/osmosis.protorev.v1beta1.Msg/SetInfoByPoolType",
    aminoType: "osmosis/MsgSetInfoByPoolType",
  ),
  osmosisProtorevV1beta1MsgSetInfoByPoolTypeResponse(
    typeUrl: '/osmosis.protorev.v1beta1.MsgSetInfoByPoolTypeResponse',
  ),
  osmosisProtorevV1beta1MsgSetMaxPoolPointsPerTx(
    typeUrl: '/osmosis.protorev.v1beta1.MsgSetMaxPoolPointsPerTx',
    serviceUrl: "/osmosis.protorev.v1beta1.Msg/SetMaxPoolPointsPerTx",
    aminoType: "osmosis/MsgSetMaxPoolPointsPerTx",
  ),
  osmosisProtorevV1beta1MsgSetMaxPoolPointsPerTxResponse(
    typeUrl: '/osmosis.protorev.v1beta1.MsgSetMaxPoolPointsPerTxResponse',
  ),
  osmosisProtorevV1beta1MsgSetMaxPoolPointsPerBlock(
    typeUrl: '/osmosis.protorev.v1beta1.MsgSetMaxPoolPointsPerBlock',
    serviceUrl: "/osmosis.protorev.v1beta1.Msg/SetMaxPoolPointsPerBlock",
    aminoType: "osmosis/MsgSetPoolWeights",
  ),
  osmosisProtorevV1beta1MsgSetMaxPoolPointsPerBlockResponse(
    typeUrl: '/osmosis.protorev.v1beta1.MsgSetMaxPoolPointsPerBlockResponse',
  ),
  osmosisProtorevV1beta1MsgSetBaseDenoms(
    typeUrl: '/osmosis.protorev.v1beta1.MsgSetBaseDenoms',
    serviceUrl: "/osmosis.protorev.v1beta1.Msg/SetBaseDenoms",
    aminoType: "osmosis/MsgSetBaseDenoms",
  ),
  osmosisProtorevV1beta1MsgSetBaseDenomsResponse(
    typeUrl: '/osmosis.protorev.v1beta1.MsgSetBaseDenomsResponse',
  ),
  osmosisGammV2QuerySpotPriceRequest(
    typeUrl: '/osmosis.gamm.v2.QuerySpotPriceRequest',
    serviceUrl: "/osmosis.gamm.v2.Query/SpotPrice",
  ),
  osmosisGammV2QuerySpotPriceResponse(
    typeUrl: '/osmosis.gamm.v2.QuerySpotPriceResponse',
  ),
  osmosisGammPoolmodelsBalancerV1beta1MsgCreateBalancerPool(
    typeUrl: '/osmosis.gamm.poolmodels.balancer.v1beta1.MsgCreateBalancerPool',
    serviceUrl:
        "/osmosis.gamm.poolmodels.balancer.v1beta1.Msg/CreateBalancerPool",
    aminoType: "osmosis/gamm/create-balancer-pool",
  ),
  osmosisGammPoolmodelsBalancerV1beta1MsgCreateBalancerPoolResponse(
    typeUrl:
        '/osmosis.gamm.poolmodels.balancer.v1beta1.MsgCreateBalancerPoolResponse',
  ),
  osmosisGammPoolmodelsStableswapV1beta1PoolParams(
    typeUrl: '/osmosis.gamm.poolmodels.stableswap.v1beta1.PoolParams',
    aminoType: "osmosis/gamm/StableswapPoolParams",
  ),
  osmosisGammPoolmodelsStableswapV1beta1MsgCreateStableswapPool(
    typeUrl:
        '/osmosis.gamm.poolmodels.stableswap.v1beta1.MsgCreateStableswapPool',
    serviceUrl:
        "/osmosis.gamm.poolmodels.stableswap.v1beta1.Msg/CreateStableswapPool",
    aminoType: "osmosis/gamm/create-stableswap-pool",
  ),
  osmosisGammPoolmodelsStableswapV1beta1MsgCreateStableswapPoolResponse(
    typeUrl:
        '/osmosis.gamm.poolmodels.stableswap.v1beta1.MsgCreateStableswapPoolResponse',
  ),
  osmosisGammPoolmodelsStableswapV1beta1MsgStableSwapAdjustScalingFactors(
    typeUrl:
        '/osmosis.gamm.poolmodels.stableswap.v1beta1.MsgStableSwapAdjustScalingFactors',
    serviceUrl:
        "/osmosis.gamm.poolmodels.stableswap.v1beta1.Msg/StableSwapAdjustScalingFactors",
    aminoType: "osmosis/gamm/stableswap-adjust-scaling-factors",
  ),
  osmosisGammPoolmodelsStableswapV1beta1MsgStableSwapAdjustScalingFactorsResponse(
    typeUrl:
        '/osmosis.gamm.poolmodels.stableswap.v1beta1.MsgStableSwapAdjustScalingFactorsResponse',
  ),
  osmosisGammV1beta1ParamsRequest(
    typeUrl: '/osmosis.gamm.v1beta1.ParamsRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/Params",
  ),
  osmosisGammV1beta1ParamsResponse(
    typeUrl: '/osmosis.gamm.v1beta1.ParamsResponse',
  ),
  osmosisGammV1beta1QueryPoolRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryPoolRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/Pool",
  ),
  osmosisGammV1beta1QueryPoolResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QueryPoolResponse',
  ),
  osmosisGammV1beta1QueryPoolsRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryPoolsRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/Pools",
  ),
  osmosisGammV1beta1QueryPoolsResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QueryPoolsResponse',
  ),
  osmosisGammV1beta1QueryNumPoolsRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryNumPoolsRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/NumPools",
  ),
  osmosisGammV1beta1QueryNumPoolsResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QueryNumPoolsResponse',
  ),
  osmosisGammV1beta1QueryPoolTypeRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryPoolTypeRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/PoolType",
  ),
  osmosisGammV1beta1QueryPoolTypeResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QueryPoolTypeResponse',
  ),
  osmosisGammV1beta1QueryCalcJoinPoolSharesRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryCalcJoinPoolSharesRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/CalcJoinPoolShares",
  ),
  osmosisGammV1beta1QueryCalcJoinPoolSharesResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QueryCalcJoinPoolSharesResponse',
  ),
  osmosisGammV1beta1QueryCalcExitPoolCoinsFromSharesRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryCalcExitPoolCoinsFromSharesRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/CalcExitPoolCoinsFromShares",
  ),
  osmosisGammV1beta1QueryCalcExitPoolCoinsFromSharesResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QueryCalcExitPoolCoinsFromSharesResponse',
  ),
  osmosisGammV1beta1QueryPoolParamsRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryPoolParamsRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/PoolParams",
  ),
  osmosisGammV1beta1QueryPoolParamsResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QueryPoolParamsResponse',
  ),
  osmosisGammV1beta1QueryTotalPoolLiquidityRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryTotalPoolLiquidityRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/TotalPoolLiquidity",
  ),
  osmosisGammV1beta1QueryTotalPoolLiquidityResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QueryTotalPoolLiquidityResponse',
  ),
  osmosisGammV1beta1QueryTotalSharesRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryTotalSharesRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/TotalShares",
  ),
  osmosisGammV1beta1QueryTotalSharesResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QueryTotalSharesResponse',
  ),
  osmosisGammV1beta1QueryCalcJoinPoolNoSwapSharesRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryCalcJoinPoolNoSwapSharesRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/CalcJoinPoolNoSwapShares",
  ),
  osmosisGammV1beta1QueryCalcJoinPoolNoSwapSharesResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QueryCalcJoinPoolNoSwapSharesResponse',
  ),
  osmosisGammV1beta1QuerySpotPriceRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QuerySpotPriceRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/SpotPrice",
  ),
  osmosisGammV1beta1QueryPoolsWithFilterRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryPoolsWithFilterRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/PoolsWithFilter",
  ),
  osmosisGammV1beta1QueryPoolsWithFilterResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QueryPoolsWithFilterResponse',
  ),
  osmosisGammV1beta1QuerySpotPriceResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QuerySpotPriceResponse',
  ),
  osmosisGammV1beta1QuerySwapExactAmountInRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QuerySwapExactAmountInRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/EstimateSwapExactAmountIn",
  ),
  osmosisGammV1beta1QuerySwapExactAmountInResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QuerySwapExactAmountInResponse',
  ),
  osmosisGammV1beta1QuerySwapExactAmountOutRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QuerySwapExactAmountOutRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/EstimateSwapExactAmountOut",
  ),
  osmosisGammV1beta1QuerySwapExactAmountOutResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QuerySwapExactAmountOutResponse',
  ),
  osmosisGammV1beta1QueryTotalLiquidityRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryTotalLiquidityRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/TotalLiquidity",
  ),
  osmosisGammV1beta1QueryTotalLiquidityResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QueryTotalLiquidityResponse',
  ),
  osmosisGammV1beta1QueryConcentratedPoolIdLinkFromCFMMRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryConcentratedPoolIdLinkFromCFMMRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/ConcentratedPoolIdLinkFromCFMM",
  ),
  osmosisGammV1beta1QueryConcentratedPoolIdLinkFromCFMMResponse(
    typeUrl:
        '/osmosis.gamm.v1beta1.QueryConcentratedPoolIdLinkFromCFMMResponse',
  ),
  osmosisGammV1beta1QueryCFMMConcentratedPoolLinksRequest(
    typeUrl: '/osmosis.gamm.v1beta1.QueryCFMMConcentratedPoolLinksRequest',
    serviceUrl: "/osmosis.gamm.v1beta1.Query/CFMMConcentratedPoolLinks",
  ),
  osmosisGammV1beta1QueryCFMMConcentratedPoolLinksResponse(
    typeUrl: '/osmosis.gamm.v1beta1.QueryCFMMConcentratedPoolLinksResponse',
  ),
  osmosisGammV1beta1SmoothWeightChangeParams(
    typeUrl: '/osmosis.gamm.v1beta1.SmoothWeightChangeParams',
  ),
  osmosisGammV1beta1PoolParams(
    typeUrl: '/osmosis.gamm.v1beta1.PoolParams',
    aminoType: "osmosis/gamm/BalancerPoolParams",
  ),
  osmosisGammV1beta1PoolAsset(typeUrl: '/osmosis.gamm.v1beta1.PoolAsset'),
  osmosisGammV1beta1MigrationRecords(
    typeUrl: '/osmosis.gamm.v1beta1.MigrationRecords',
  ),
  osmosisGammV1beta1BalancerToConcentratedPoolLink(
    typeUrl: '/osmosis.gamm.v1beta1.BalancerToConcentratedPoolLink',
  ),
  osmosisGammV1beta1Params(typeUrl: '/osmosis.gamm.v1beta1.Params'),
  osmosisGammV1beta1MsgJoinPool(
    typeUrl: '/osmosis.gamm.v1beta1.MsgJoinPool',
    serviceUrl: "/osmosis.gamm.v1beta1.Msg/JoinPool",
    aminoType: "osmosis/gamm/join-pool",
  ),
  osmosisGammV1beta1MsgJoinPoolResponse(
    typeUrl: '/osmosis.gamm.v1beta1.MsgJoinPoolResponse',
  ),
  osmosisGammV1beta1MsgExitPool(
    typeUrl: '/osmosis.gamm.v1beta1.MsgExitPool',
    serviceUrl: "/osmosis.gamm.v1beta1.Msg/ExitPool",
    aminoType: "osmosis/gamm/exit-pool",
  ),
  osmosisGammV1beta1MsgExitPoolResponse(
    typeUrl: '/osmosis.gamm.v1beta1.MsgExitPoolResponse',
  ),
  osmosisGammV1beta1MsgSwapExactAmountIn(
    typeUrl: '/osmosis.gamm.v1beta1.MsgSwapExactAmountIn',
    serviceUrl: "/osmosis.gamm.v1beta1.Msg/SwapExactAmountIn",
    aminoType: "osmosis/gamm/swap-exact-amount-in",
  ),
  osmosisGammV1beta1MsgSwapExactAmountInResponse(
    typeUrl: '/osmosis.gamm.v1beta1.MsgSwapExactAmountInResponse',
  ),
  osmosisGammV1beta1MsgSwapExactAmountOut(
    typeUrl: '/osmosis.gamm.v1beta1.MsgSwapExactAmountOut',
    serviceUrl: "/osmosis.gamm.v1beta1.Msg/SwapExactAmountOut",
    aminoType: "osmosis/gamm/swap-exact-amount-out",
  ),
  osmosisGammV1beta1MsgSwapExactAmountOutResponse(
    typeUrl: '/osmosis.gamm.v1beta1.MsgSwapExactAmountOutResponse',
  ),
  osmosisGammV1beta1MsgJoinSwapExternAmountIn(
    typeUrl: '/osmosis.gamm.v1beta1.MsgJoinSwapExternAmountIn',
    serviceUrl: "/osmosis.gamm.v1beta1.Msg/JoinSwapExternAmountIn",
    aminoType: "osmosis/gamm/join-swap-extern-amount-in",
  ),
  osmosisGammV1beta1MsgJoinSwapExternAmountInResponse(
    typeUrl: '/osmosis.gamm.v1beta1.MsgJoinSwapExternAmountInResponse',
  ),
  osmosisGammV1beta1MsgJoinSwapShareAmountOut(
    typeUrl: '/osmosis.gamm.v1beta1.MsgJoinSwapShareAmountOut',
    serviceUrl: "/osmosis.gamm.v1beta1.Msg/JoinSwapShareAmountOut",
    aminoType: "osmosis/gamm/join-swap-share-amount-out",
  ),
  osmosisGammV1beta1MsgJoinSwapShareAmountOutResponse(
    typeUrl: '/osmosis.gamm.v1beta1.MsgJoinSwapShareAmountOutResponse',
  ),
  osmosisGammV1beta1MsgExitSwapShareAmountIn(
    typeUrl: '/osmosis.gamm.v1beta1.MsgExitSwapShareAmountIn',
    serviceUrl: "/osmosis.gamm.v1beta1.Msg/ExitSwapShareAmountIn",
    aminoType: "osmosis/gamm/exit-swap-share-amount-in",
  ),
  osmosisGammV1beta1MsgExitSwapShareAmountInResponse(
    typeUrl: '/osmosis.gamm.v1beta1.MsgExitSwapShareAmountInResponse',
  ),
  osmosisGammV1beta1MsgExitSwapExternAmountOut(
    typeUrl: '/osmosis.gamm.v1beta1.MsgExitSwapExternAmountOut',
    serviceUrl: "/osmosis.gamm.v1beta1.Msg/ExitSwapExternAmountOut",
    aminoType: "osmosis/gamm/exit-swap-extern-amount-out",
  ),
  osmosisGammV1beta1MsgExitSwapExternAmountOutResponse(
    typeUrl: '/osmosis.gamm.v1beta1.MsgExitSwapExternAmountOutResponse',
  ),
  osmosisLockupModuleBalanceRequest(
    typeUrl: '/osmosis.lockup.ModuleBalanceRequest',
    serviceUrl: "/osmosis.lockup.Query/ModuleBalance",
  ),
  osmosisLockupModuleBalanceResponse(
    typeUrl: '/osmosis.lockup.ModuleBalanceResponse',
  ),
  osmosisLockupModuleLockedAmountRequest(
    typeUrl: '/osmosis.lockup.ModuleLockedAmountRequest',
    serviceUrl: "/osmosis.lockup.Query/ModuleLockedAmount",
  ),
  osmosisLockupModuleLockedAmountResponse(
    typeUrl: '/osmosis.lockup.ModuleLockedAmountResponse',
  ),
  osmosisLockupAccountUnlockableCoinsRequest(
    typeUrl: '/osmosis.lockup.AccountUnlockableCoinsRequest',
    serviceUrl: "/osmosis.lockup.Query/AccountUnlockableCoins",
  ),
  osmosisLockupAccountUnlockableCoinsResponse(
    typeUrl: '/osmosis.lockup.AccountUnlockableCoinsResponse',
  ),
  osmosisLockupAccountUnlockingCoinsRequest(
    typeUrl: '/osmosis.lockup.AccountUnlockingCoinsRequest',
    serviceUrl: "/osmosis.lockup.Query/AccountUnlockingCoins",
  ),
  osmosisLockupAccountUnlockingCoinsResponse(
    typeUrl: '/osmosis.lockup.AccountUnlockingCoinsResponse',
  ),
  osmosisLockupAccountLockedCoinsRequest(
    typeUrl: '/osmosis.lockup.AccountLockedCoinsRequest',
    serviceUrl: "/osmosis.lockup.Query/AccountLockedCoins",
  ),
  osmosisLockupAccountLockedCoinsResponse(
    typeUrl: '/osmosis.lockup.AccountLockedCoinsResponse',
  ),
  osmosisLockupAccountLockedPastTimeRequest(
    typeUrl: '/osmosis.lockup.AccountLockedPastTimeRequest',
    serviceUrl: "/osmosis.lockup.Query/AccountLockedPastTime",
  ),
  osmosisLockupAccountLockedPastTimeResponse(
    typeUrl: '/osmosis.lockup.AccountLockedPastTimeResponse',
  ),
  osmosisLockupAccountLockedPastTimeNotUnlockingOnlyRequest(
    typeUrl: '/osmosis.lockup.AccountLockedPastTimeNotUnlockingOnlyRequest',
    serviceUrl: "/osmosis.lockup.Query/AccountLockedPastTimeNotUnlockingOnly",
  ),
  osmosisLockupAccountLockedPastTimeNotUnlockingOnlyResponse(
    typeUrl: '/osmosis.lockup.AccountLockedPastTimeNotUnlockingOnlyResponse',
  ),
  osmosisLockupAccountUnlockedBeforeTimeRequest(
    typeUrl: '/osmosis.lockup.AccountUnlockedBeforeTimeRequest',
    serviceUrl: "/osmosis.lockup.Query/AccountUnlockedBeforeTime",
  ),
  osmosisLockupAccountUnlockedBeforeTimeResponse(
    typeUrl: '/osmosis.lockup.AccountUnlockedBeforeTimeResponse',
  ),
  osmosisLockupAccountLockedPastTimeDenomRequest(
    typeUrl: '/osmosis.lockup.AccountLockedPastTimeDenomRequest',
    serviceUrl: "/osmosis.lockup.Query/AccountLockedPastTimeDenom",
  ),
  osmosisLockupAccountLockedPastTimeDenomResponse(
    typeUrl: '/osmosis.lockup.AccountLockedPastTimeDenomResponse',
  ),
  osmosisLockupLockedDenomRequest(
    typeUrl: '/osmosis.lockup.LockedDenomRequest',
    serviceUrl: "/osmosis.lockup.Query/LockedDenom",
  ),
  osmosisLockupLockedDenomResponse(
    typeUrl: '/osmosis.lockup.LockedDenomResponse',
  ),
  osmosisLockupLockedRequest(
    typeUrl: '/osmosis.lockup.LockedRequest',
    serviceUrl: "/osmosis.lockup.Query/LockedByID",
  ),
  osmosisLockupLockedResponse(typeUrl: '/osmosis.lockup.LockedResponse'),
  osmosisLockupLockRewardReceiverRequest(
    typeUrl: '/osmosis.lockup.LockRewardReceiverRequest',
    serviceUrl: "/osmosis.lockup.Query/LockRewardReceiver",
  ),
  osmosisLockupLockRewardReceiverResponse(
    typeUrl: '/osmosis.lockup.LockRewardReceiverResponse',
  ),
  osmosisLockupNextLockIDRequest(
    typeUrl: '/osmosis.lockup.NextLockIDRequest',
    serviceUrl: "/osmosis.lockup.Query/NextLockID",
  ),
  osmosisLockupNextLockIDResponse(
    typeUrl: '/osmosis.lockup.NextLockIDResponse',
  ),
  osmosisLockupSyntheticLockupsByLockupIDRequest(
    typeUrl: '/osmosis.lockup.SyntheticLockupsByLockupIDRequest',
    serviceUrl: "/osmosis.lockup.Query/SyntheticLockupsByLockupID",
  ),
  osmosisLockupSyntheticLockupsByLockupIDResponse(
    typeUrl: '/osmosis.lockup.SyntheticLockupsByLockupIDResponse',
  ),
  osmosisLockupSyntheticLockupByLockupIDRequest(
    typeUrl: '/osmosis.lockup.SyntheticLockupByLockupIDRequest',
    serviceUrl: "/osmosis.lockup.Query/SyntheticLockupByLockupID",
  ),
  osmosisLockupSyntheticLockupByLockupIDResponse(
    typeUrl: '/osmosis.lockup.SyntheticLockupByLockupIDResponse',
  ),
  osmosisLockupAccountLockedLongerDurationRequest(
    typeUrl: '/osmosis.lockup.AccountLockedLongerDurationRequest',
    serviceUrl: "/osmosis.lockup.Query/AccountLockedLongerDuration",
  ),
  osmosisLockupAccountLockedLongerDurationResponse(
    typeUrl: '/osmosis.lockup.AccountLockedLongerDurationResponse',
  ),
  osmosisLockupAccountLockedDurationRequest(
    typeUrl: '/osmosis.lockup.AccountLockedDurationRequest',
    serviceUrl: "/osmosis.lockup.Query/AccountLockedDuration",
  ),
  osmosisLockupAccountLockedDurationResponse(
    typeUrl: '/osmosis.lockup.AccountLockedDurationResponse',
  ),
  osmosisLockupAccountLockedLongerDurationNotUnlockingOnlyRequest(
    typeUrl:
        '/osmosis.lockup.AccountLockedLongerDurationNotUnlockingOnlyRequest',
    serviceUrl:
        "/osmosis.lockup.Query/AccountLockedLongerDurationNotUnlockingOnly",
  ),
  osmosisLockupAccountLockedLongerDurationNotUnlockingOnlyResponse(
    typeUrl:
        '/osmosis.lockup.AccountLockedLongerDurationNotUnlockingOnlyResponse',
  ),
  osmosisLockupAccountLockedLongerDurationDenomRequest(
    typeUrl: '/osmosis.lockup.AccountLockedLongerDurationDenomRequest',
    serviceUrl: "/osmosis.lockup.Query/AccountLockedLongerDurationDenom",
  ),
  osmosisLockupAccountLockedLongerDurationDenomResponse(
    typeUrl: '/osmosis.lockup.AccountLockedLongerDurationDenomResponse',
  ),
  osmosisLockupQueryParamsRequest(
    typeUrl: '/osmosis.lockup.QueryParamsRequest',
    serviceUrl: "/osmosis.lockup.Query/Params",
  ),
  osmosisLockupQueryParamsResponse(
    typeUrl: '/osmosis.lockup.QueryParamsResponse',
  ),
  osmosisLockupParams(typeUrl: '/osmosis.lockup.Params'),
  osmosisLockupPeriodLock(typeUrl: '/osmosis.lockup.PeriodLock'),
  osmosisLockupQueryCondition(typeUrl: '/osmosis.lockup.QueryCondition'),
  osmosisLockupSyntheticLock(typeUrl: '/osmosis.lockup.SyntheticLock'),
  osmosisLockupMsgLockTokens(
    typeUrl: '/osmosis.lockup.MsgLockTokens',
    serviceUrl: "/osmosis.lockup.Msg/LockTokens",
    aminoType: "osmosis/lockup/lock-tokens",
  ),
  osmosisLockupMsgLockTokensResponse(
    typeUrl: '/osmosis.lockup.MsgLockTokensResponse',
  ),
  osmosisLockupMsgBeginUnlockingAll(
    typeUrl: '/osmosis.lockup.MsgBeginUnlockingAll',
    serviceUrl: "/osmosis.lockup.Msg/BeginUnlockingAll",
    aminoType: "osmosis/lockup/begin-unlock-tokens",
  ),
  osmosisLockupMsgBeginUnlockingAllResponse(
    typeUrl: '/osmosis.lockup.MsgBeginUnlockingAllResponse',
  ),
  osmosisLockupMsgBeginUnlocking(
    typeUrl: '/osmosis.lockup.MsgBeginUnlocking',
    serviceUrl: "/osmosis.lockup.Msg/BeginUnlocking",
    aminoType: "osmosis/lockup/begin-unlock-period-lock",
  ),
  osmosisLockupMsgBeginUnlockingResponse(
    typeUrl: '/osmosis.lockup.MsgBeginUnlockingResponse',
  ),
  osmosisLockupMsgExtendLockup(
    typeUrl: '/osmosis.lockup.MsgExtendLockup',
    serviceUrl: "/osmosis.lockup.Msg/ExtendLockup",
    aminoType: "osmosis/lockup/extend-lockup",
  ),
  osmosisLockupMsgExtendLockupResponse(
    typeUrl: '/osmosis.lockup.MsgExtendLockupResponse',
  ),
  osmosisLockupMsgForceUnlock(
    typeUrl: '/osmosis.lockup.MsgForceUnlock',
    serviceUrl: "/osmosis.lockup.Msg/ForceUnlock",
    aminoType: "osmosis/lockup/force-unlock-tokens",
  ),
  osmosisLockupMsgForceUnlockResponse(
    typeUrl: '/osmosis.lockup.MsgForceUnlockResponse',
  ),
  osmosisLockupMsgSetRewardReceiverAddress(
    typeUrl: '/osmosis.lockup.MsgSetRewardReceiverAddress',
    serviceUrl: "/osmosis.lockup.Msg/SetRewardReceiverAddress",
    aminoType: "osmosis/lockup/set-reward-receiver-address",
  ),
  osmosisLockupMsgSetRewardReceiverAddressResponse(
    typeUrl: '/osmosis.lockup.MsgSetRewardReceiverAddressResponse',
  ),
  osmosisSmartaccountV1beta1QueryParamsRequest(
    typeUrl: '/osmosis.smartaccount.v1beta1.QueryParamsRequest',
    serviceUrl: "/osmosis.smartaccount.v1beta1.Query/Params",
  ),
  osmosisSmartaccountV1beta1QueryParamsResponse(
    typeUrl: '/osmosis.smartaccount.v1beta1.QueryParamsResponse',
  ),
  osmosisSmartaccountV1beta1GetAuthenticatorsRequest(
    typeUrl: '/osmosis.smartaccount.v1beta1.GetAuthenticatorsRequest',
    serviceUrl: "/osmosis.smartaccount.v1beta1.Query/GetAuthenticators",
  ),
  osmosisSmartaccountV1beta1GetAuthenticatorsResponse(
    typeUrl: '/osmosis.smartaccount.v1beta1.GetAuthenticatorsResponse',
  ),
  osmosisSmartaccountV1beta1GetAuthenticatorRequest(
    typeUrl: '/osmosis.smartaccount.v1beta1.GetAuthenticatorRequest',
    serviceUrl: "/osmosis.smartaccount.v1beta1.Query/GetAuthenticator",
  ),
  osmosisSmartaccountV1beta1GetAuthenticatorResponse(
    typeUrl: '/osmosis.smartaccount.v1beta1.GetAuthenticatorResponse',
  ),
  osmosisSmartaccountV1beta1Params(
    typeUrl: '/osmosis.smartaccount.v1beta1.Params',
  ),
  osmosisSmartaccountV1beta1AccountAuthenticator(
    typeUrl: '/osmosis.smartaccount.v1beta1.AccountAuthenticator',
  ),
  osmosisSmartaccountV1beta1MsgAddAuthenticator(
    typeUrl: '/osmosis.smartaccount.v1beta1.MsgAddAuthenticator',
    serviceUrl: "/osmosis.smartaccount.v1beta1.Msg/AddAuthenticator",
    aminoType: "osmosis/smartaccount/add-authenticator",
  ),
  osmosisSmartaccountV1beta1MsgAddAuthenticatorResponse(
    typeUrl: '/osmosis.smartaccount.v1beta1.MsgAddAuthenticatorResponse',
  ),
  osmosisSmartaccountV1beta1MsgRemoveAuthenticator(
    typeUrl: '/osmosis.smartaccount.v1beta1.MsgRemoveAuthenticator',
    serviceUrl: "/osmosis.smartaccount.v1beta1.Msg/RemoveAuthenticator",
    aminoType: "osmosis/smartaccount/remove-authenticator",
  ),
  osmosisSmartaccountV1beta1MsgRemoveAuthenticatorResponse(
    typeUrl: '/osmosis.smartaccount.v1beta1.MsgRemoveAuthenticatorResponse',
  ),
  osmosisSmartaccountV1beta1MsgSetActiveState(
    typeUrl: '/osmosis.smartaccount.v1beta1.MsgSetActiveState',
    serviceUrl: "/osmosis.smartaccount.v1beta1.Msg/SetActiveState",
    aminoType: "osmosis/smartaccount/set-active-state",
  ),
  osmosisSmartaccountV1beta1MsgSetActiveStateResponse(
    typeUrl: '/osmosis.smartaccount.v1beta1.MsgSetActiveStateResponse',
  ),
  osmosisCosmwasmpoolV1beta1ParamsRequest(
    typeUrl: '/osmosis.cosmwasmpool.v1beta1.ParamsRequest',
    serviceUrl: "/osmosis.cosmwasmpool.v1beta1.Query/Params",
  ),
  osmosisCosmwasmpoolV1beta1ParamsResponse(
    typeUrl: '/osmosis.cosmwasmpool.v1beta1.ParamsResponse',
  ),
  osmosisCosmwasmpoolV1beta1PoolsRequest(
    typeUrl: '/osmosis.cosmwasmpool.v1beta1.PoolsRequest',
    serviceUrl: "/osmosis.cosmwasmpool.v1beta1.Query/Pools",
  ),
  osmosisCosmwasmpoolV1beta1PoolsResponse(
    typeUrl: '/osmosis.cosmwasmpool.v1beta1.PoolsResponse',
  ),
  osmosisCosmwasmpoolV1beta1ContractInfoByPoolIdRequest(
    typeUrl: '/osmosis.cosmwasmpool.v1beta1.ContractInfoByPoolIdRequest',
    serviceUrl: "/osmosis.cosmwasmpool.v1beta1.Query/ContractInfoByPoolId",
  ),
  osmosisCosmwasmpoolV1beta1ContractInfoByPoolIdResponse(
    typeUrl: '/osmosis.cosmwasmpool.v1beta1.ContractInfoByPoolIdResponse',
  ),
  osmosisCosmwasmpoolV1beta1PoolRawFilteredStateRequest(
    typeUrl: '/osmosis.cosmwasmpool.v1beta1.PoolRawFilteredStateRequest',
    serviceUrl: "/osmosis.cosmwasmpool.v1beta1.Query/PoolRawFilteredState",
  ),
  osmosisCosmwasmpoolV1beta1PoolRawFilteredStateResponse(
    typeUrl: '/osmosis.cosmwasmpool.v1beta1.PoolRawFilteredStateResponse',
  ),
  osmosisCosmwasmpoolV1beta1MsgCreateCosmWasmPool(
    typeUrl: '/osmosis.cosmwasmpool.v1beta1.MsgCreateCosmWasmPool',
    serviceUrl: "/osmosis.cosmwasmpool.v1beta1.MsgCreator/CreateCosmWasmPool",
    aminoType: "osmosis/MsgCreateCosmWasmPool",
  ),
  osmosisCosmwasmpoolV1beta1MsgCreateCosmWasmPoolResponse(
    typeUrl: '/osmosis.cosmwasmpool.v1beta1.MsgCreateCosmWasmPoolResponse',
  ),
  osmosisCosmwasmpoolV1beta1Params(
    typeUrl: '/osmosis.cosmwasmpool.v1beta1.Params',
  ),
  osmosisDowntimedetectorV1beta1RecoveredSinceDowntimeOfLengthRequest(
    typeUrl:
        '/osmosis.downtimedetector.v1beta1.RecoveredSinceDowntimeOfLengthRequest',
    serviceUrl:
        "/osmosis.downtimedetector.v1beta1.Query/RecoveredSinceDowntimeOfLength",
  ),
  osmosisDowntimedetectorV1beta1RecoveredSinceDowntimeOfLengthResponse(
    typeUrl:
        '/osmosis.downtimedetector.v1beta1.RecoveredSinceDowntimeOfLengthResponse',
  ),
  osmosisTxfeesV1beta1QueryFeeTokensRequest(
    typeUrl: '/osmosis.txfees.v1beta1.QueryFeeTokensRequest',
    serviceUrl: "/osmosis.txfees.v1beta1.Query/FeeTokens",
  ),
  osmosisTxfeesV1beta1QueryFeeTokensResponse(
    typeUrl: '/osmosis.txfees.v1beta1.QueryFeeTokensResponse',
  ),
  osmosisTxfeesV1beta1QueryDenomSpotPriceRequest(
    typeUrl: '/osmosis.txfees.v1beta1.QueryDenomSpotPriceRequest',
    serviceUrl: "/osmosis.txfees.v1beta1.Query/DenomSpotPrice",
  ),
  osmosisTxfeesV1beta1QueryDenomSpotPriceResponse(
    typeUrl: '/osmosis.txfees.v1beta1.QueryDenomSpotPriceResponse',
  ),
  osmosisTxfeesV1beta1QueryDenomPoolIdRequest(
    typeUrl: '/osmosis.txfees.v1beta1.QueryDenomPoolIdRequest',
    serviceUrl: "/osmosis.txfees.v1beta1.Query/DenomPoolId",
  ),
  osmosisTxfeesV1beta1QueryDenomPoolIdResponse(
    typeUrl: '/osmosis.txfees.v1beta1.QueryDenomPoolIdResponse',
  ),
  osmosisTxfeesV1beta1QueryBaseDenomRequest(
    typeUrl: '/osmosis.txfees.v1beta1.QueryBaseDenomRequest',
    serviceUrl: "/osmosis.txfees.v1beta1.Query/BaseDenom",
  ),
  osmosisTxfeesV1beta1QueryBaseDenomResponse(
    typeUrl: '/osmosis.txfees.v1beta1.QueryBaseDenomResponse',
  ),
  osmosisTxfeesV1beta1QueryEipBaseFeeRequest(
    typeUrl: '/osmosis.txfees.v1beta1.QueryEipBaseFeeRequest',
    serviceUrl: "/osmosis.txfees.v1beta1.Query/GetEipBaseFee",
  ),
  osmosisTxfeesV1beta1QueryEipBaseFeeResponse(
    typeUrl: '/osmosis.txfees.v1beta1.QueryEipBaseFeeResponse',
  ),
  osmosisTxfeesV1beta1TxFeesTracker(
    typeUrl: '/osmosis.txfees.v1beta1.TxFeesTracker',
  ),
  osmosisTxfeesV1beta1MsgSetFeeTokens(
    typeUrl: '/osmosis.txfees.v1beta1.MsgSetFeeTokens',
    serviceUrl: "/osmosis.txfees.v1beta1.Msg/SetFeeTokens",
    aminoType: "osmosis/set-fee-tokens",
  ),
  osmosisTxfeesV1beta1MsgSetFeeTokensResponse(
    typeUrl: '/osmosis.txfees.v1beta1.MsgSetFeeTokensResponse',
  ),
  osmosisTxfeesV1beta1FeeToken(typeUrl: '/osmosis.txfees.v1beta1.FeeToken'),
  osmosisIngestV1beta1PoolData(typeUrl: '/osmosis.ingest.v1beta1.PoolData'),
  osmosisIngestV1beta1ProcessBlockRequest(
    typeUrl: '/osmosis.ingest.v1beta1.ProcessBlockRequest',
    serviceUrl: "/osmosis.ingest.v1beta1.SQSIngester/ProcessBlock",
  ),
  osmosisIngestV1beta1ProcessBlockReply(
    typeUrl: '/osmosis.ingest.v1beta1.ProcessBlockReply',
  ),
  osmosisSuperfluidQueryParamsRequest(
    typeUrl: '/osmosis.superfluid.QueryParamsRequest',
    serviceUrl: "/osmosis.superfluid.Query/Params",
  ),
  osmosisSuperfluidQueryParamsResponse(
    typeUrl: '/osmosis.superfluid.QueryParamsResponse',
  ),
  osmosisSuperfluidAssetTypeRequest(
    typeUrl: '/osmosis.superfluid.AssetTypeRequest',
    serviceUrl: "/osmosis.superfluid.Query/AssetType",
  ),
  osmosisSuperfluidAssetTypeResponse(
    typeUrl: '/osmosis.superfluid.AssetTypeResponse',
  ),
  osmosisSuperfluidAllAssetsRequest(
    typeUrl: '/osmosis.superfluid.AllAssetsRequest',
    serviceUrl: "/osmosis.superfluid.Query/AllAssets",
  ),
  osmosisSuperfluidAllAssetsResponse(
    typeUrl: '/osmosis.superfluid.AllAssetsResponse',
  ),
  osmosisSuperfluidAssetMultiplierRequest(
    typeUrl: '/osmosis.superfluid.AssetMultiplierRequest',
    serviceUrl: "/osmosis.superfluid.Query/AssetMultiplier",
  ),
  osmosisSuperfluidAssetMultiplierResponse(
    typeUrl: '/osmosis.superfluid.AssetMultiplierResponse',
  ),
  osmosisSuperfluidSuperfluidIntermediaryAccountInfo(
    typeUrl: '/osmosis.superfluid.SuperfluidIntermediaryAccountInfo',
  ),
  osmosisSuperfluidAllIntermediaryAccountsRequest(
    typeUrl: '/osmosis.superfluid.AllIntermediaryAccountsRequest',
    serviceUrl: "/osmosis.superfluid.Query/AllIntermediaryAccounts",
  ),
  osmosisSuperfluidAllIntermediaryAccountsResponse(
    typeUrl: '/osmosis.superfluid.AllIntermediaryAccountsResponse',
  ),
  osmosisSuperfluidConnectedIntermediaryAccountRequest(
    typeUrl: '/osmosis.superfluid.ConnectedIntermediaryAccountRequest',
    serviceUrl: "/osmosis.superfluid.Query/ConnectedIntermediaryAccount",
  ),
  osmosisSuperfluidConnectedIntermediaryAccountResponse(
    typeUrl: '/osmosis.superfluid.ConnectedIntermediaryAccountResponse',
  ),
  osmosisSuperfluidQueryTotalDelegationByValidatorForDenomRequest(
    typeUrl:
        '/osmosis.superfluid.QueryTotalDelegationByValidatorForDenomRequest',
    serviceUrl: "/osmosis.superfluid.Query/TotalDelegationByValidatorForDenom",
  ),
  osmosisSuperfluidQueryTotalDelegationByValidatorForDenomResponse(
    typeUrl:
        '/osmosis.superfluid.QueryTotalDelegationByValidatorForDenomResponse',
  ),
  osmosisSuperfluidDelegations(typeUrl: '/osmosis.superfluid.Delegations'),
  osmosisSuperfluidTotalSuperfluidDelegationsRequest(
    typeUrl: '/osmosis.superfluid.TotalSuperfluidDelegationsRequest',
    serviceUrl: "/osmosis.superfluid.Query/TotalSuperfluidDelegations",
  ),
  osmosisSuperfluidTotalSuperfluidDelegationsResponse(
    typeUrl: '/osmosis.superfluid.TotalSuperfluidDelegationsResponse',
  ),
  osmosisSuperfluidSuperfluidDelegationAmountRequest(
    typeUrl: '/osmosis.superfluid.SuperfluidDelegationAmountRequest',
    serviceUrl: "/osmosis.superfluid.Query/SuperfluidDelegationAmount",
  ),
  osmosisSuperfluidSuperfluidDelegationAmountResponse(
    typeUrl: '/osmosis.superfluid.SuperfluidDelegationAmountResponse',
  ),
  osmosisSuperfluidSuperfluidDelegationsByDelegatorRequest(
    typeUrl: '/osmosis.superfluid.SuperfluidDelegationsByDelegatorRequest',
    serviceUrl: "/osmosis.superfluid.Query/SuperfluidDelegationsByDelegator",
  ),
  osmosisSuperfluidSuperfluidDelegationsByDelegatorResponse(
    typeUrl: '/osmosis.superfluid.SuperfluidDelegationsByDelegatorResponse',
  ),
  osmosisSuperfluidSuperfluidUndelegationsByDelegatorRequest(
    typeUrl: '/osmosis.superfluid.SuperfluidUndelegationsByDelegatorRequest',
    serviceUrl: "/osmosis.superfluid.Query/SuperfluidUndelegationsByDelegator",
  ),
  osmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse(
    typeUrl: '/osmosis.superfluid.SuperfluidUndelegationsByDelegatorResponse',
  ),
  osmosisSuperfluidSuperfluidDelegationsByValidatorDenomRequest(
    typeUrl: '/osmosis.superfluid.SuperfluidDelegationsByValidatorDenomRequest',
    serviceUrl:
        "/osmosis.superfluid.Query/SuperfluidDelegationsByValidatorDenom",
  ),
  osmosisSuperfluidSuperfluidDelegationsByValidatorDenomResponse(
    typeUrl:
        '/osmosis.superfluid.SuperfluidDelegationsByValidatorDenomResponse',
  ),
  osmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomRequest(
    typeUrl:
        '/osmosis.superfluid.EstimateSuperfluidDelegatedAmountByValidatorDenomRequest',
    serviceUrl:
        "/osmosis.superfluid.Query/EstimateSuperfluidDelegatedAmountByValidatorDenom",
  ),
  osmosisSuperfluidEstimateSuperfluidDelegatedAmountByValidatorDenomResponse(
    typeUrl:
        '/osmosis.superfluid.EstimateSuperfluidDelegatedAmountByValidatorDenomResponse',
  ),
  osmosisSuperfluidQueryTotalDelegationByDelegatorRequest(
    typeUrl: '/osmosis.superfluid.QueryTotalDelegationByDelegatorRequest',
    serviceUrl: "/osmosis.superfluid.Query/TotalDelegationByDelegator",
  ),
  osmosisSuperfluidQueryTotalDelegationByDelegatorResponse(
    typeUrl: '/osmosis.superfluid.QueryTotalDelegationByDelegatorResponse',
  ),
  osmosisSuperfluidQueryUnpoolWhitelistRequest(
    typeUrl: '/osmosis.superfluid.QueryUnpoolWhitelistRequest',
    serviceUrl: "/osmosis.superfluid.Query/UnpoolWhitelist",
  ),
  osmosisSuperfluidQueryUnpoolWhitelistResponse(
    typeUrl: '/osmosis.superfluid.QueryUnpoolWhitelistResponse',
  ),
  osmosisSuperfluidUserConcentratedSuperfluidPositionsDelegatedRequest(
    typeUrl:
        '/osmosis.superfluid.UserConcentratedSuperfluidPositionsDelegatedRequest',
    serviceUrl:
        "/osmosis.superfluid.Query/UserConcentratedSuperfluidPositionsDelegated",
  ),
  osmosisSuperfluidUserConcentratedSuperfluidPositionsDelegatedResponse(
    typeUrl:
        '/osmosis.superfluid.UserConcentratedSuperfluidPositionsDelegatedResponse',
  ),
  osmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingRequest(
    typeUrl:
        '/osmosis.superfluid.UserConcentratedSuperfluidPositionsUndelegatingRequest',
    serviceUrl:
        "/osmosis.superfluid.Query/UserConcentratedSuperfluidPositionsUndelegating",
  ),
  osmosisSuperfluidUserConcentratedSuperfluidPositionsUndelegatingResponse(
    typeUrl:
        '/osmosis.superfluid.UserConcentratedSuperfluidPositionsUndelegatingResponse',
  ),
  osmosisSuperfluidQueryRestSupplyRequest(
    typeUrl: '/osmosis.superfluid.QueryRestSupplyRequest',
    serviceUrl: "/osmosis.superfluid.Query/RestSupply",
  ),
  osmosisSuperfluidQueryRestSupplyResponse(
    typeUrl: '/osmosis.superfluid.QueryRestSupplyResponse',
  ),
  osmosisSuperfluidParams(typeUrl: '/osmosis.superfluid.Params'),
  osmosisSuperfluidSuperfluidAsset(
    typeUrl: '/osmosis.superfluid.SuperfluidAsset',
  ),
  osmosisSuperfluidOsmoEquivalentMultiplierRecord(
    typeUrl: '/osmosis.superfluid.OsmoEquivalentMultiplierRecord',
  ),
  osmosisSuperfluidSuperfluidDelegationRecord(
    typeUrl: '/osmosis.superfluid.SuperfluidDelegationRecord',
  ),
  osmosisSuperfluidConcentratedPoolUserPositionRecord(
    typeUrl: '/osmosis.superfluid.ConcentratedPoolUserPositionRecord',
  ),
  osmosisSuperfluidMsgSuperfluidDelegate(
    typeUrl: '/osmosis.superfluid.MsgSuperfluidDelegate',
    serviceUrl: "/osmosis.superfluid.Msg/SuperfluidDelegate",
    aminoType: "osmosis/superfluid-delegate",
  ),
  osmosisSuperfluidMsgSuperfluidDelegateResponse(
    typeUrl: '/osmosis.superfluid.MsgSuperfluidDelegateResponse',
  ),
  osmosisSuperfluidMsgSuperfluidUndelegate(
    typeUrl: '/osmosis.superfluid.MsgSuperfluidUndelegate',
    serviceUrl: "/osmosis.superfluid.Msg/SuperfluidUndelegate",
    aminoType: "osmosis/superfluid-undelegate",
  ),
  osmosisSuperfluidMsgSuperfluidUndelegateResponse(
    typeUrl: '/osmosis.superfluid.MsgSuperfluidUndelegateResponse',
  ),
  osmosisSuperfluidMsgSuperfluidUnbondLock(
    typeUrl: '/osmosis.superfluid.MsgSuperfluidUnbondLock',
    serviceUrl: "/osmosis.superfluid.Msg/SuperfluidUnbondLock",
    aminoType: "osmosis/superfluid-unbond-lock",
  ),
  osmosisSuperfluidMsgSuperfluidUnbondLockResponse(
    typeUrl: '/osmosis.superfluid.MsgSuperfluidUnbondLockResponse',
  ),
  osmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLock(
    typeUrl: '/osmosis.superfluid.MsgSuperfluidUndelegateAndUnbondLock',
    serviceUrl: "/osmosis.superfluid.Msg/SuperfluidUndelegateAndUnbondLock",
    aminoType: "osmosis/superfluid-undelegate-unbond-lock",
  ),
  osmosisSuperfluidMsgSuperfluidUndelegateAndUnbondLockResponse(
    typeUrl: '/osmosis.superfluid.MsgSuperfluidUndelegateAndUnbondLockResponse',
  ),
  osmosisSuperfluidMsgLockAndSuperfluidDelegate(
    typeUrl: '/osmosis.superfluid.MsgLockAndSuperfluidDelegate',
    serviceUrl: "/osmosis.superfluid.Msg/LockAndSuperfluidDelegate",
    aminoType: "osmosis/lock-and-superfluid-delegate",
  ),
  osmosisSuperfluidMsgLockAndSuperfluidDelegateResponse(
    typeUrl: '/osmosis.superfluid.MsgLockAndSuperfluidDelegateResponse',
  ),
  osmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegate(
    typeUrl:
        '/osmosis.superfluid.MsgCreateFullRangePositionAndSuperfluidDelegate',
    serviceUrl:
        "/osmosis.superfluid.Msg/CreateFullRangePositionAndSuperfluidDelegate",
    aminoType: "osmosis/full-range-and-sf-delegate",
  ),
  osmosisSuperfluidMsgCreateFullRangePositionAndSuperfluidDelegateResponse(
    typeUrl:
        '/osmosis.superfluid.MsgCreateFullRangePositionAndSuperfluidDelegateResponse',
  ),
  osmosisSuperfluidMsgUnPoolWhitelistedPool(
    typeUrl: '/osmosis.superfluid.MsgUnPoolWhitelistedPool',
    serviceUrl: "/osmosis.superfluid.Msg/UnPoolWhitelistedPool",
    aminoType: "osmosis/unpool-whitelisted-pool",
  ),
  osmosisSuperfluidMsgUnPoolWhitelistedPoolResponse(
    typeUrl: '/osmosis.superfluid.MsgUnPoolWhitelistedPoolResponse',
  ),
  osmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPosition(
    typeUrl:
        '/osmosis.superfluid.MsgUnlockAndMigrateSharesToFullRangeConcentratedPosition',
    serviceUrl:
        "/osmosis.superfluid.Msg/UnlockAndMigrateSharesToFullRangeConcentratedPosition",
    aminoType: "osmosis/unlock-and-migrate",
  ),
  osmosisSuperfluidMsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse(
    typeUrl:
        '/osmosis.superfluid.MsgUnlockAndMigrateSharesToFullRangeConcentratedPositionResponse',
  ),
  osmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPosition(
    typeUrl:
        '/osmosis.superfluid.MsgAddToConcentratedLiquiditySuperfluidPosition',
    serviceUrl:
        "/osmosis.superfluid.Msg/AddToConcentratedLiquiditySuperfluidPosition",
    aminoType: "osmosis/add-to-cl-superfluid-position",
  ),
  osmosisSuperfluidMsgAddToConcentratedLiquiditySuperfluidPositionResponse(
    typeUrl:
        '/osmosis.superfluid.MsgAddToConcentratedLiquiditySuperfluidPositionResponse',
  ),
  osmosisSuperfluidMsgUnbondConvertAndStake(
    typeUrl: '/osmosis.superfluid.MsgUnbondConvertAndStake',
    serviceUrl: "/osmosis.superfluid.Msg/UnbondConvertAndStake",
    aminoType: "osmosis/unbond-convert-and-stake",
  ),
  osmosisSuperfluidMsgUnbondConvertAndStakeResponse(
    typeUrl: '/osmosis.superfluid.MsgUnbondConvertAndStakeResponse',
  ),
  osmosisIbcratelimitV1beta1ParamsRequest(
    typeUrl: '/osmosis.ibcratelimit.v1beta1.ParamsRequest',
    serviceUrl: "/osmosis.ibcratelimit.v1beta1.Query/Params",
  ),
  osmosisIbcratelimitV1beta1ParamsResponse(
    typeUrl: '/osmosis.ibcratelimit.v1beta1.ParamsResponse',
  ),
  osmosisIbcratelimitV1beta1Params(
    typeUrl: '/osmosis.ibcratelimit.v1beta1.Params',
  ),
  osmosisPoolincentivesV1beta1QueryGaugeIdsRequest(
    typeUrl: '/osmosis.poolincentives.v1beta1.QueryGaugeIdsRequest',
    serviceUrl: "/osmosis.poolincentives.v1beta1.Query/GaugeIds",
  ),
  osmosisPoolincentivesV1beta1QueryGaugeIdsResponse(
    typeUrl: '/osmosis.poolincentives.v1beta1.QueryGaugeIdsResponse',
  ),
  osmosisPoolincentivesV1beta1QueryGaugeIdsResponseGaugeIdWithDuration(
    typeUrl:
        '/osmosis.poolincentives.v1beta1.QueryGaugeIdsResponse.GaugeIdWithDuration',
  ),
  osmosisPoolincentivesV1beta1QueryDistrInfoRequest(
    typeUrl: '/osmosis.poolincentives.v1beta1.QueryDistrInfoRequest',
    serviceUrl: "/osmosis.poolincentives.v1beta1.Query/DistrInfo",
  ),
  osmosisPoolincentivesV1beta1QueryDistrInfoResponse(
    typeUrl: '/osmosis.poolincentives.v1beta1.QueryDistrInfoResponse',
  ),
  osmosisPoolincentivesV1beta1QueryParamsRequest(
    typeUrl: '/osmosis.poolincentives.v1beta1.QueryParamsRequest',
    serviceUrl: "/osmosis.poolincentives.v1beta1.Query/Params",
  ),
  osmosisPoolincentivesV1beta1QueryParamsResponse(
    typeUrl: '/osmosis.poolincentives.v1beta1.QueryParamsResponse',
  ),
  osmosisPoolincentivesV1beta1QueryLockableDurationsRequest(
    typeUrl: '/osmosis.poolincentives.v1beta1.QueryLockableDurationsRequest',
    serviceUrl: "/osmosis.poolincentives.v1beta1.Query/LockableDurations",
  ),
  osmosisPoolincentivesV1beta1QueryLockableDurationsResponse(
    typeUrl: '/osmosis.poolincentives.v1beta1.QueryLockableDurationsResponse',
  ),
  osmosisPoolincentivesV1beta1QueryIncentivizedPoolsRequest(
    typeUrl: '/osmosis.poolincentives.v1beta1.QueryIncentivizedPoolsRequest',
    serviceUrl: "/osmosis.poolincentives.v1beta1.Query/IncentivizedPools",
  ),
  osmosisPoolincentivesV1beta1IncentivizedPool(
    typeUrl: '/osmosis.poolincentives.v1beta1.IncentivizedPool',
  ),
  osmosisPoolincentivesV1beta1QueryIncentivizedPoolsResponse(
    typeUrl: '/osmosis.poolincentives.v1beta1.QueryIncentivizedPoolsResponse',
  ),
  osmosisPoolincentivesV1beta1QueryExternalIncentiveGaugesRequest(
    typeUrl:
        '/osmosis.poolincentives.v1beta1.QueryExternalIncentiveGaugesRequest',
    serviceUrl: "/osmosis.poolincentives.v1beta1.Query/ExternalIncentiveGauges",
  ),
  osmosisPoolincentivesV1beta1QueryExternalIncentiveGaugesResponse(
    typeUrl:
        '/osmosis.poolincentives.v1beta1.QueryExternalIncentiveGaugesResponse',
  ),
  osmosisPoolincentivesV1beta1Params(
    typeUrl: '/osmosis.poolincentives.v1beta1.Params',
  ),
  osmosisPoolincentivesV1beta1DistrInfo(
    typeUrl: '/osmosis.poolincentives.v1beta1.DistrInfo',
  ),
  osmosisPoolincentivesV1beta1DistrRecord(
    typeUrl: '/osmosis.poolincentives.v1beta1.DistrRecord',
  ),
  osmosisTokenfactoryV1beta1QueryParamsRequest(
    typeUrl: '/osmosis.tokenfactory.v1beta1.QueryParamsRequest',
    serviceUrl: "/osmosis.tokenfactory.v1beta1.Query/Params",
  ),
  osmosisTokenfactoryV1beta1QueryParamsResponse(
    typeUrl: '/osmosis.tokenfactory.v1beta1.QueryParamsResponse',
  ),
  osmosisTokenfactoryV1beta1QueryDenomAuthorityMetadataRequest(
    typeUrl: '/osmosis.tokenfactory.v1beta1.QueryDenomAuthorityMetadataRequest',
    serviceUrl: "/osmosis.tokenfactory.v1beta1.Query/DenomAuthorityMetadata",
  ),
  osmosisTokenfactoryV1beta1QueryDenomAuthorityMetadataResponse(
    typeUrl:
        '/osmosis.tokenfactory.v1beta1.QueryDenomAuthorityMetadataResponse',
  ),
  osmosisTokenfactoryV1beta1QueryDenomsFromCreatorRequest(
    typeUrl: '/osmosis.tokenfactory.v1beta1.QueryDenomsFromCreatorRequest',
    serviceUrl: "/osmosis.tokenfactory.v1beta1.Query/DenomsFromCreator",
  ),
  osmosisTokenfactoryV1beta1QueryDenomsFromCreatorResponse(
    typeUrl: '/osmosis.tokenfactory.v1beta1.QueryDenomsFromCreatorResponse',
  ),
  osmosisTokenfactoryV1beta1QueryBeforeSendHookAddressRequest(
    typeUrl: '/osmosis.tokenfactory.v1beta1.QueryBeforeSendHookAddressRequest',
    serviceUrl: "/osmosis.tokenfactory.v1beta1.Query/BeforeSendHookAddress",
  ),
  osmosisTokenfactoryV1beta1QueryBeforeSendHookAddressResponse(
    typeUrl: '/osmosis.tokenfactory.v1beta1.QueryBeforeSendHookAddressResponse',
  ),
  osmosisTokenfactoryV1beta1QueryAllBeforeSendHooksAddressesRequest(
    typeUrl:
        '/osmosis.tokenfactory.v1beta1.QueryAllBeforeSendHooksAddressesRequest',
    serviceUrl:
        "/osmosis.tokenfactory.v1beta1.Query/AllBeforeSendHooksAddresses",
  ),
  osmosisTokenfactoryV1beta1QueryAllBeforeSendHooksAddressesResponse(
    typeUrl:
        '/osmosis.tokenfactory.v1beta1.QueryAllBeforeSendHooksAddressesResponse',
  ),
  osmosisTokenfactoryV1beta1DenomAuthorityMetadata(
    typeUrl: '/osmosis.tokenfactory.v1beta1.DenomAuthorityMetadata',
  ),
  osmosisTokenfactoryV1beta1Params(
    typeUrl: '/osmosis.tokenfactory.v1beta1.Params',
  ),
  osmosisTokenfactoryV1beta1MsgCreateDenom(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgCreateDenom',
    serviceUrl: "/osmosis.tokenfactory.v1beta1.Msg/CreateDenom",
    aminoType: "osmosis/tokenfactory/create-denom",
  ),
  osmosisTokenfactoryV1beta1MsgCreateDenomResponse(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgCreateDenomResponse',
  ),
  osmosisTokenfactoryV1beta1MsgMint(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgMint',
    serviceUrl: "/osmosis.tokenfactory.v1beta1.Msg/Mint",
    aminoType: "osmosis/tokenfactory/mint",
  ),
  osmosisTokenfactoryV1beta1MsgMintResponse(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgMintResponse',
  ),
  osmosisTokenfactoryV1beta1MsgBurn(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgBurn',
    serviceUrl: "/osmosis.tokenfactory.v1beta1.Msg/Burn",
    aminoType: "osmosis/tokenfactory/burn",
  ),
  osmosisTokenfactoryV1beta1MsgBurnResponse(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgBurnResponse',
  ),
  osmosisTokenfactoryV1beta1MsgChangeAdmin(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgChangeAdmin',
    serviceUrl: "/osmosis.tokenfactory.v1beta1.Msg/ChangeAdmin",
    aminoType: "osmosis/tokenfactory/change-admin",
  ),
  osmosisTokenfactoryV1beta1MsgChangeAdminResponse(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgChangeAdminResponse',
  ),
  osmosisTokenfactoryV1beta1MsgSetBeforeSendHook(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgSetBeforeSendHook',
    serviceUrl: "/osmosis.tokenfactory.v1beta1.Msg/SetBeforeSendHook",
    aminoType: "osmosis/tokenfactory/set-bef-send-hook",
  ),
  osmosisTokenfactoryV1beta1MsgSetBeforeSendHookResponse(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgSetBeforeSendHookResponse',
  ),
  osmosisTokenfactoryV1beta1MsgSetDenomMetadata(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgSetDenomMetadata',
    serviceUrl: "/osmosis.tokenfactory.v1beta1.Msg/SetDenomMetadata",
    aminoType: "osmosis/tokenfactory/set-denom-metadata",
  ),
  osmosisTokenfactoryV1beta1MsgSetDenomMetadataResponse(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgSetDenomMetadataResponse',
  ),
  osmosisTokenfactoryV1beta1MsgForceTransfer(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgForceTransfer',
    serviceUrl: "/osmosis.tokenfactory.v1beta1.Msg/ForceTransfer",
    aminoType: "osmosis/tokenfactory/force-transfer",
  ),
  osmosisTokenfactoryV1beta1MsgForceTransferResponse(
    typeUrl: '/osmosis.tokenfactory.v1beta1.MsgForceTransferResponse',
  ),
  osmosisIncentivesModuleToDistributeCoinsRequest(
    typeUrl: '/osmosis.incentives.ModuleToDistributeCoinsRequest',
    serviceUrl: "/osmosis.incentives.Query/ModuleToDistributeCoins",
  ),
  osmosisIncentivesModuleToDistributeCoinsResponse(
    typeUrl: '/osmosis.incentives.ModuleToDistributeCoinsResponse',
  ),
  osmosisIncentivesGaugeByIDRequest(
    typeUrl: '/osmosis.incentives.GaugeByIDRequest',
    serviceUrl: "/osmosis.incentives.Query/GaugeByID",
  ),
  osmosisIncentivesGaugeByIDResponse(
    typeUrl: '/osmosis.incentives.GaugeByIDResponse',
  ),
  osmosisIncentivesGaugesRequest(
    typeUrl: '/osmosis.incentives.GaugesRequest',
    serviceUrl: "/osmosis.incentives.Query/Gauges",
  ),
  osmosisIncentivesGaugesResponse(
    typeUrl: '/osmosis.incentives.GaugesResponse',
  ),
  osmosisIncentivesActiveGaugesRequest(
    typeUrl: '/osmosis.incentives.ActiveGaugesRequest',
    serviceUrl: "/osmosis.incentives.Query/ActiveGauges",
  ),
  osmosisIncentivesActiveGaugesResponse(
    typeUrl: '/osmosis.incentives.ActiveGaugesResponse',
  ),
  osmosisIncentivesActiveGaugesPerDenomRequest(
    typeUrl: '/osmosis.incentives.ActiveGaugesPerDenomRequest',
    serviceUrl: "/osmosis.incentives.Query/ActiveGaugesPerDenom",
  ),
  osmosisIncentivesActiveGaugesPerDenomResponse(
    typeUrl: '/osmosis.incentives.ActiveGaugesPerDenomResponse',
  ),
  osmosisIncentivesUpcomingGaugesRequest(
    typeUrl: '/osmosis.incentives.UpcomingGaugesRequest',
    serviceUrl: "/osmosis.incentives.Query/UpcomingGauges",
  ),
  osmosisIncentivesUpcomingGaugesResponse(
    typeUrl: '/osmosis.incentives.UpcomingGaugesResponse',
  ),
  osmosisIncentivesUpcomingGaugesPerDenomRequest(
    typeUrl: '/osmosis.incentives.UpcomingGaugesPerDenomRequest',
    serviceUrl: "/osmosis.incentives.Query/UpcomingGaugesPerDenom",
  ),
  osmosisIncentivesUpcomingGaugesPerDenomResponse(
    typeUrl: '/osmosis.incentives.UpcomingGaugesPerDenomResponse',
  ),
  osmosisIncentivesRewardsEstRequest(
    typeUrl: '/osmosis.incentives.RewardsEstRequest',
    serviceUrl: "/osmosis.incentives.Query/RewardsEst",
  ),
  osmosisIncentivesRewardsEstResponse(
    typeUrl: '/osmosis.incentives.RewardsEstResponse',
  ),
  osmosisIncentivesQueryLockableDurationsRequest(
    typeUrl: '/osmosis.incentives.QueryLockableDurationsRequest',
    serviceUrl: "/osmosis.incentives.Query/LockableDurations",
  ),
  osmosisIncentivesQueryLockableDurationsResponse(
    typeUrl: '/osmosis.incentives.QueryLockableDurationsResponse',
  ),
  osmosisIncentivesQueryAllGroupsRequest(
    typeUrl: '/osmosis.incentives.QueryAllGroupsRequest',
    serviceUrl: "/osmosis.incentives.Query/AllGroups",
  ),
  osmosisIncentivesQueryAllGroupsResponse(
    typeUrl: '/osmosis.incentives.QueryAllGroupsResponse',
  ),
  osmosisIncentivesQueryAllGroupsGaugesRequest(
    typeUrl: '/osmosis.incentives.QueryAllGroupsGaugesRequest',
    serviceUrl: "/osmosis.incentives.Query/AllGroupsGauges",
  ),
  osmosisIncentivesQueryAllGroupsGaugesResponse(
    typeUrl: '/osmosis.incentives.QueryAllGroupsGaugesResponse',
  ),
  osmosisIncentivesQueryAllGroupsWithGaugeRequest(
    typeUrl: '/osmosis.incentives.QueryAllGroupsWithGaugeRequest',
    serviceUrl: "/osmosis.incentives.Query/AllGroupsWithGauge",
  ),
  osmosisIncentivesQueryAllGroupsWithGaugeResponse(
    typeUrl: '/osmosis.incentives.QueryAllGroupsWithGaugeResponse',
  ),
  osmosisIncentivesQueryGroupByGroupGaugeIDRequest(
    typeUrl: '/osmosis.incentives.QueryGroupByGroupGaugeIDRequest',
    serviceUrl: "/osmosis.incentives.Query/GroupByGroupGaugeID",
  ),
  osmosisIncentivesQueryGroupByGroupGaugeIDResponse(
    typeUrl: '/osmosis.incentives.QueryGroupByGroupGaugeIDResponse',
  ),
  osmosisIncentivesQueryCurrentWeightByGroupGaugeIDRequest(
    typeUrl: '/osmosis.incentives.QueryCurrentWeightByGroupGaugeIDRequest',
    serviceUrl: "/osmosis.incentives.Query/CurrentWeightByGroupGaugeID",
  ),
  osmosisIncentivesQueryCurrentWeightByGroupGaugeIDResponse(
    typeUrl: '/osmosis.incentives.QueryCurrentWeightByGroupGaugeIDResponse',
  ),
  osmosisIncentivesGaugeWeight(typeUrl: '/osmosis.incentives.GaugeWeight'),
  osmosisIncentivesQueryInternalGaugesRequest(
    typeUrl: '/osmosis.incentives.QueryInternalGaugesRequest',
    serviceUrl: "/osmosis.incentives.Query/InternalGauges",
  ),
  osmosisIncentivesQueryInternalGaugesResponse(
    typeUrl: '/osmosis.incentives.QueryInternalGaugesResponse',
  ),
  osmosisIncentivesQueryExternalGaugesRequest(
    typeUrl: '/osmosis.incentives.QueryExternalGaugesRequest',
    serviceUrl: "/osmosis.incentives.Query/ExternalGauges",
  ),
  osmosisIncentivesQueryExternalGaugesResponse(
    typeUrl: '/osmosis.incentives.QueryExternalGaugesResponse',
  ),
  osmosisIncentivesQueryGaugesByPoolIDRequest(
    typeUrl: '/osmosis.incentives.QueryGaugesByPoolIDRequest',
    serviceUrl: "/osmosis.incentives.Query/GaugesByPoolID",
  ),
  osmosisIncentivesQueryGaugesByPoolIDResponse(
    typeUrl: '/osmosis.incentives.QueryGaugesByPoolIDResponse',
  ),
  osmosisIncentivesParamsRequest(
    typeUrl: '/osmosis.incentives.ParamsRequest',
    serviceUrl: "/osmosis.incentives.Query/Params",
  ),
  osmosisIncentivesParamsResponse(
    typeUrl: '/osmosis.incentives.ParamsResponse',
  ),
  osmosisIncentivesInternalGaugeInfo(
    typeUrl: '/osmosis.incentives.InternalGaugeInfo',
  ),
  osmosisIncentivesInternalGaugeRecord(
    typeUrl: '/osmosis.incentives.InternalGaugeRecord',
  ),
  osmosisIncentivesGroup(typeUrl: '/osmosis.incentives.Group'),
  osmosisIncentivesGroupsWithGauge(
    typeUrl: '/osmosis.incentives.GroupsWithGauge',
  ),
  osmosisIncentivesParams(typeUrl: '/osmosis.incentives.Params'),
  osmosisIncentivesGauge(typeUrl: '/osmosis.incentives.Gauge'),
  osmosisIncentivesMsgCreateGauge(
    typeUrl: '/osmosis.incentives.MsgCreateGauge',
    serviceUrl: "/osmosis.incentives.Msg/CreateGauge",
    aminoType: "osmosis/incentives/create-gauge",
  ),
  osmosisIncentivesMsgCreateGaugeResponse(
    typeUrl: '/osmosis.incentives.MsgCreateGaugeResponse',
  ),
  osmosisIncentivesMsgAddToGauge(
    typeUrl: '/osmosis.incentives.MsgAddToGauge',
    serviceUrl: "/osmosis.incentives.Msg/AddToGauge",
    aminoType: "osmosis/incentives/add-to-gauge",
  ),
  osmosisIncentivesMsgAddToGaugeResponse(
    typeUrl: '/osmosis.incentives.MsgAddToGaugeResponse',
  ),
  osmosisIncentivesMsgCreateGroup(
    typeUrl: '/osmosis.incentives.MsgCreateGroup',
    serviceUrl: "/osmosis.incentives.Msg/CreateGroup",
    aminoType: "osmosis/incentives/create-group",
  ),
  osmosisIncentivesMsgCreateGroupResponse(
    typeUrl: '/osmosis.incentives.MsgCreateGroupResponse',
  ),
  osmosisConcentratedliquidityPoolmodelConcentratedV1beta1MsgCreateConcentratedPool(
    typeUrl:
        '/osmosis.concentratedliquidity.poolmodel.concentrated.v1beta1.MsgCreateConcentratedPool',
    serviceUrl:
        "/osmosis.concentratedliquidity.poolmodel.concentrated.v1beta1.Msg/CreateConcentratedPool",
    aminoType: "osmosis/create-concentrated-pool",
  ),
  osmosisConcentratedliquidityPoolmodelConcentratedV1beta1MsgCreateConcentratedPoolResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.poolmodel.concentrated.v1beta1.MsgCreateConcentratedPoolResponse',
  ),
  osmosisConcentratedliquidityParams(
    typeUrl: '/osmosis.concentratedliquidity.Params',
  ),
  osmosisConcentratedliquidityV1beta1UserPositionsRequest(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.UserPositionsRequest',
    serviceUrl: "/osmosis.concentratedliquidity.v1beta1.Query/UserPositions",
  ),
  osmosisConcentratedliquidityV1beta1UserPositionsResponse(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.UserPositionsResponse',
  ),
  osmosisConcentratedliquidityV1beta1PositionByIdRequest(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.PositionByIdRequest',
    serviceUrl: "/osmosis.concentratedliquidity.v1beta1.Query/PositionById",
  ),
  osmosisConcentratedliquidityV1beta1PositionByIdResponse(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.PositionByIdResponse',
  ),
  osmosisConcentratedliquidityV1beta1PoolsRequest(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.PoolsRequest',
    serviceUrl: "/osmosis.concentratedliquidity.v1beta1.Query/Pools",
  ),
  osmosisConcentratedliquidityV1beta1PoolsResponse(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.PoolsResponse',
  ),
  osmosisConcentratedliquidityV1beta1ParamsRequest(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.ParamsRequest',
    serviceUrl: "/osmosis.concentratedliquidity.v1beta1.Query/Params",
  ),
  osmosisConcentratedliquidityV1beta1ParamsResponse(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.ParamsResponse',
  ),
  osmosisConcentratedliquidityV1beta1TickLiquidityNet(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.TickLiquidityNet',
  ),
  osmosisConcentratedliquidityV1beta1LiquidityDepthWithRange(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.LiquidityDepthWithRange',
  ),
  osmosisConcentratedliquidityV1beta1LiquidityNetInDirectionRequest(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.LiquidityNetInDirectionRequest',
    serviceUrl:
        "/osmosis.concentratedliquidity.v1beta1.Query/LiquidityNetInDirection",
  ),
  osmosisConcentratedliquidityV1beta1LiquidityNetInDirectionResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.LiquidityNetInDirectionResponse',
  ),
  osmosisConcentratedliquidityV1beta1LiquidityPerTickRangeRequest(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.LiquidityPerTickRangeRequest',
    serviceUrl:
        "/osmosis.concentratedliquidity.v1beta1.Query/LiquidityPerTickRange",
  ),
  osmosisConcentratedliquidityV1beta1LiquidityPerTickRangeResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.LiquidityPerTickRangeResponse',
  ),
  osmosisConcentratedliquidityV1beta1ClaimableSpreadRewardsRequest(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.ClaimableSpreadRewardsRequest',
    serviceUrl:
        "/osmosis.concentratedliquidity.v1beta1.Query/ClaimableSpreadRewards",
  ),
  osmosisConcentratedliquidityV1beta1ClaimableSpreadRewardsResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.ClaimableSpreadRewardsResponse',
  ),
  osmosisConcentratedliquidityV1beta1ClaimableIncentivesRequest(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.ClaimableIncentivesRequest',
    serviceUrl:
        "/osmosis.concentratedliquidity.v1beta1.Query/ClaimableIncentives",
  ),
  osmosisConcentratedliquidityV1beta1ClaimableIncentivesResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.ClaimableIncentivesResponse',
  ),
  osmosisConcentratedliquidityV1beta1PoolAccumulatorRewardsRequest(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.PoolAccumulatorRewardsRequest',
    serviceUrl:
        "/osmosis.concentratedliquidity.v1beta1.Query/PoolAccumulatorRewards",
  ),
  osmosisConcentratedliquidityV1beta1PoolAccumulatorRewardsResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.PoolAccumulatorRewardsResponse',
  ),
  osmosisConcentratedliquidityV1beta1TickAccumulatorTrackersRequest(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.TickAccumulatorTrackersRequest',
    serviceUrl:
        "/osmosis.concentratedliquidity.v1beta1.Query/TickAccumulatorTrackers",
  ),
  osmosisConcentratedliquidityV1beta1TickAccumulatorTrackersResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.TickAccumulatorTrackersResponse',
  ),
  osmosisConcentratedliquidityV1beta1IncentiveRecordsRequest(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.IncentiveRecordsRequest',
    serviceUrl: "/osmosis.concentratedliquidity.v1beta1.Query/IncentiveRecords",
  ),
  osmosisConcentratedliquidityV1beta1IncentiveRecordsResponse(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.IncentiveRecordsResponse',
  ),
  osmosisConcentratedliquidityV1beta1CFMMPoolIdLinkFromConcentratedPoolIdRequest(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.CFMMPoolIdLinkFromConcentratedPoolIdRequest',
    serviceUrl:
        "/osmosis.concentratedliquidity.v1beta1.Query/CFMMPoolIdLinkFromConcentratedPoolId",
  ),
  osmosisConcentratedliquidityV1beta1CFMMPoolIdLinkFromConcentratedPoolIdResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.CFMMPoolIdLinkFromConcentratedPoolIdResponse',
  ),
  osmosisConcentratedliquidityV1beta1UserUnbondingPositionsRequest(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.UserUnbondingPositionsRequest',
    serviceUrl:
        "/osmosis.concentratedliquidity.v1beta1.Query/UserUnbondingPositions",
  ),
  osmosisConcentratedliquidityV1beta1UserUnbondingPositionsResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.UserUnbondingPositionsResponse',
  ),
  osmosisConcentratedliquidityV1beta1GetTotalLiquidityRequest(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.GetTotalLiquidityRequest',
    serviceUrl:
        "/osmosis.concentratedliquidity.v1beta1.Query/GetTotalLiquidity",
  ),
  osmosisConcentratedliquidityV1beta1GetTotalLiquidityResponse(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.GetTotalLiquidityResponse',
  ),
  osmosisConcentratedliquidityV1beta1NumNextInitializedTicksRequest(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.NumNextInitializedTicksRequest',
    serviceUrl:
        "/osmosis.concentratedliquidity.v1beta1.Query/NumNextInitializedTicks",
  ),
  osmosisConcentratedliquidityV1beta1NumNextInitializedTicksResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.NumNextInitializedTicksResponse',
  ),
  osmosisConcentratedliquidityV1beta1Position(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.Position',
  ),
  osmosisConcentratedliquidityV1beta1FullPositionBreakdown(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.FullPositionBreakdown',
  ),
  osmosisConcentratedliquidityV1beta1PositionWithPeriodLock(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.PositionWithPeriodLock',
  ),
  osmosisConcentratedliquidityV1beta1UptimeTracker(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.UptimeTracker',
  ),
  osmosisConcentratedliquidityV1beta1IncentiveRecord(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.IncentiveRecord',
  ),
  osmosisConcentratedliquidityV1beta1IncentiveRecordBody(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.IncentiveRecordBody',
  ),
  osmosisConcentratedliquidityV1beta1MsgCreatePosition(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.MsgCreatePosition',
    serviceUrl: "/osmosis.concentratedliquidity.v1beta1.Msg/CreatePosition",
    aminoType: "osmosis/cl-create-position",
  ),
  osmosisConcentratedliquidityV1beta1MsgCreatePositionResponse(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.MsgCreatePositionResponse',
  ),
  osmosisConcentratedliquidityV1beta1MsgAddToPosition(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.MsgAddToPosition',
    serviceUrl: "/osmosis.concentratedliquidity.v1beta1.Msg/AddToPosition",
    aminoType: "osmosis/cl-add-to-position",
  ),
  osmosisConcentratedliquidityV1beta1MsgAddToPositionResponse(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.MsgAddToPositionResponse',
  ),
  osmosisConcentratedliquidityV1beta1MsgWithdrawPosition(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.MsgWithdrawPosition',
    serviceUrl: "/osmosis.concentratedliquidity.v1beta1.Msg/WithdrawPosition",
    aminoType: "osmosis/cl-withdraw-position",
  ),
  osmosisConcentratedliquidityV1beta1MsgWithdrawPositionResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.MsgWithdrawPositionResponse',
  ),
  osmosisConcentratedliquidityV1beta1MsgCollectSpreadRewards(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.MsgCollectSpreadRewards',
    serviceUrl:
        "/osmosis.concentratedliquidity.v1beta1.Msg/CollectSpreadRewards",
    aminoType: "osmosis/cl-col-sp-rewards",
  ),
  osmosisConcentratedliquidityV1beta1MsgCollectSpreadRewardsResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.MsgCollectSpreadRewardsResponse',
  ),
  osmosisConcentratedliquidityV1beta1MsgCollectIncentives(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.MsgCollectIncentives',
    serviceUrl: "/osmosis.concentratedliquidity.v1beta1.Msg/CollectIncentives",
    aminoType: "osmosis/cl-collect-incentives",
  ),
  osmosisConcentratedliquidityV1beta1MsgCollectIncentivesResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.MsgCollectIncentivesResponse',
  ),
  osmosisConcentratedliquidityV1beta1MsgTransferPositions(
    typeUrl: '/osmosis.concentratedliquidity.v1beta1.MsgTransferPositions',
    serviceUrl: "/osmosis.concentratedliquidity.v1beta1.Msg/TransferPositions",
    aminoType: "osmosis/cl-transfer-positions",
  ),
  osmosisConcentratedliquidityV1beta1MsgTransferPositionsResponse(
    typeUrl:
        '/osmosis.concentratedliquidity.v1beta1.MsgTransferPositionsResponse',
  ),
  osmosisMintV1beta1QueryParamsRequest(
    typeUrl: '/osmosis.mint.v1beta1.QueryParamsRequest',
    serviceUrl: "/osmosis.mint.v1beta1.Query/Params",
  ),
  osmosisMintV1beta1QueryParamsResponse(
    typeUrl: '/osmosis.mint.v1beta1.QueryParamsResponse',
  ),
  osmosisMintV1beta1QueryEpochProvisionsRequest(
    typeUrl: '/osmosis.mint.v1beta1.QueryEpochProvisionsRequest',
    serviceUrl: "/osmosis.mint.v1beta1.Query/EpochProvisions",
  ),
  osmosisMintV1beta1QueryEpochProvisionsResponse(
    typeUrl: '/osmosis.mint.v1beta1.QueryEpochProvisionsResponse',
  ),
  osmosisMintV1beta1QueryInflationRequest(
    typeUrl: '/osmosis.mint.v1beta1.QueryInflationRequest',
    serviceUrl: "/osmosis.mint.v1beta1.Query/Inflation",
  ),
  osmosisMintV1beta1QueryInflationResponse(
    typeUrl: '/osmosis.mint.v1beta1.QueryInflationResponse',
  ),
  osmosisMintV1beta1WeightedAddress(
    typeUrl: '/osmosis.mint.v1beta1.WeightedAddress',
  ),
  osmosisMintV1beta1DistributionProportions(
    typeUrl: '/osmosis.mint.v1beta1.DistributionProportions',
  ),
  osmosisMintV1beta1Params(typeUrl: '/osmosis.mint.v1beta1.Params'),
  osmosisPoolmanagerV2SpotPriceRequest(
    typeUrl: '/osmosis.poolmanager.v2.SpotPriceRequest',
    serviceUrl: "/osmosis.poolmanager.v2.Query/SpotPriceV2",
  ),
  osmosisPoolmanagerV2SpotPriceResponse(
    typeUrl: '/osmosis.poolmanager.v2.SpotPriceResponse',
  ),
  osmosisPoolmanagerV1beta1ParamsRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.ParamsRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/Params",
  ),
  osmosisPoolmanagerV1beta1ParamsResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.ParamsResponse',
  ),
  osmosisPoolmanagerV1beta1EstimateSwapExactAmountInRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.EstimateSwapExactAmountInRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/EstimateSwapExactAmountIn",
  ),
  osmosisPoolmanagerV1beta1EstimateSwapExactAmountInWithPrimitiveTypesRequest(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.EstimateSwapExactAmountInWithPrimitiveTypesRequest',
    serviceUrl:
        "/osmosis.poolmanager.v1beta1.Query/EstimateSwapExactAmountInWithPrimitiveTypes",
  ),
  osmosisPoolmanagerV1beta1EstimateSinglePoolSwapExactAmountInRequest(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.EstimateSinglePoolSwapExactAmountInRequest',
    serviceUrl:
        "/osmosis.poolmanager.v1beta1.Query/EstimateSinglePoolSwapExactAmountIn",
  ),
  osmosisPoolmanagerV1beta1EstimateSwapExactAmountInResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.EstimateSwapExactAmountInResponse',
  ),
  osmosisPoolmanagerV1beta1EstimateSwapExactAmountOutRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.EstimateSwapExactAmountOutRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/EstimateSwapExactAmountOut",
  ),
  osmosisPoolmanagerV1beta1EstimateSwapExactAmountOutWithPrimitiveTypesRequest(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.EstimateSwapExactAmountOutWithPrimitiveTypesRequest',
    serviceUrl:
        "/osmosis.poolmanager.v1beta1.Query/EstimateSwapExactAmountOutWithPrimitiveTypes",
  ),
  osmosisPoolmanagerV1beta1EstimateSinglePoolSwapExactAmountOutRequest(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.EstimateSinglePoolSwapExactAmountOutRequest',
    serviceUrl:
        "/osmosis.poolmanager.v1beta1.Query/EstimateSinglePoolSwapExactAmountOut",
  ),
  osmosisPoolmanagerV1beta1EstimateSwapExactAmountOutResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.EstimateSwapExactAmountOutResponse',
  ),
  osmosisPoolmanagerV1beta1NumPoolsRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.NumPoolsRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/NumPools",
  ),
  osmosisPoolmanagerV1beta1NumPoolsResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.NumPoolsResponse',
  ),
  osmosisPoolmanagerV1beta1PoolRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.PoolRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/Pool",
  ),
  osmosisPoolmanagerV1beta1PoolResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.PoolResponse',
  ),
  osmosisPoolmanagerV1beta1AllPoolsRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.AllPoolsRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/AllPools",
  ),
  osmosisPoolmanagerV1beta1AllPoolsResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.AllPoolsResponse',
  ),
  osmosisPoolmanagerV1beta1ListPoolsByDenomRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.ListPoolsByDenomRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/ListPoolsByDenom",
  ),
  osmosisPoolmanagerV1beta1ListPoolsByDenomResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.ListPoolsByDenomResponse',
  ),
  osmosisPoolmanagerV1beta1SpotPriceRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.SpotPriceRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/SpotPrice",
  ),
  osmosisPoolmanagerV1beta1SpotPriceResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.SpotPriceResponse',
  ),
  osmosisPoolmanagerV1beta1TotalPoolLiquidityRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.TotalPoolLiquidityRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/TotalPoolLiquidity",
  ),
  osmosisPoolmanagerV1beta1TotalPoolLiquidityResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.TotalPoolLiquidityResponse',
  ),
  osmosisPoolmanagerV1beta1TotalLiquidityRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.TotalLiquidityRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/TotalLiquidity",
  ),
  osmosisPoolmanagerV1beta1TotalLiquidityResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.TotalLiquidityResponse',
  ),
  osmosisPoolmanagerV1beta1TotalVolumeForPoolRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.TotalVolumeForPoolRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/TotalVolumeForPool",
  ),
  osmosisPoolmanagerV1beta1TotalVolumeForPoolResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.TotalVolumeForPoolResponse',
  ),
  osmosisPoolmanagerV1beta1TradingPairTakerFeeRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.TradingPairTakerFeeRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/TradingPairTakerFee",
  ),
  osmosisPoolmanagerV1beta1TradingPairTakerFeeResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.TradingPairTakerFeeResponse',
  ),
  osmosisPoolmanagerV1beta1EstimateTradeBasedOnPriceImpactRequest(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.EstimateTradeBasedOnPriceImpactRequest',
    serviceUrl:
        "/osmosis.poolmanager.v1beta1.Query/EstimateTradeBasedOnPriceImpact",
  ),
  osmosisPoolmanagerV1beta1EstimateTradeBasedOnPriceImpactResponse(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.EstimateTradeBasedOnPriceImpactResponse',
  ),
  osmosisPoolmanagerV1beta1AllTakerFeeShareAgreementsRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.AllTakerFeeShareAgreementsRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/AllTakerFeeShareAgreements",
  ),
  osmosisPoolmanagerV1beta1AllTakerFeeShareAgreementsResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.AllTakerFeeShareAgreementsResponse',
  ),
  osmosisPoolmanagerV1beta1TakerFeeShareAgreementFromDenomRequest(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.TakerFeeShareAgreementFromDenomRequest',
    serviceUrl:
        "/osmosis.poolmanager.v1beta1.Query/TakerFeeShareAgreementFromDenom",
  ),
  osmosisPoolmanagerV1beta1TakerFeeShareAgreementFromDenomResponse(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.TakerFeeShareAgreementFromDenomResponse',
  ),
  osmosisPoolmanagerV1beta1TakerFeeShareDenomsToAccruedValueRequest(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.TakerFeeShareDenomsToAccruedValueRequest',
    serviceUrl:
        "/osmosis.poolmanager.v1beta1.Query/TakerFeeShareDenomsToAccruedValue",
  ),
  osmosisPoolmanagerV1beta1TakerFeeShareDenomsToAccruedValueResponse(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.TakerFeeShareDenomsToAccruedValueResponse',
  ),
  osmosisPoolmanagerV1beta1AllTakerFeeShareAccumulatorsRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.AllTakerFeeShareAccumulatorsRequest',
    serviceUrl:
        "/osmosis.poolmanager.v1beta1.Query/AllTakerFeeShareAccumulators",
  ),
  osmosisPoolmanagerV1beta1AllTakerFeeShareAccumulatorsResponse(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.AllTakerFeeShareAccumulatorsResponse',
  ),
  osmosisPoolmanagerV1beta1RegisteredAlloyedPoolFromDenomRequest(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.RegisteredAlloyedPoolFromDenomRequest',
    serviceUrl:
        "/osmosis.poolmanager.v1beta1.Query/RegisteredAlloyedPoolFromDenom",
  ),
  osmosisPoolmanagerV1beta1RegisteredAlloyedPoolFromDenomResponse(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.RegisteredAlloyedPoolFromDenomResponse',
  ),
  osmosisPoolmanagerV1beta1RegisteredAlloyedPoolFromPoolIdRequest(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.RegisteredAlloyedPoolFromPoolIdRequest',
    serviceUrl:
        "/osmosis.poolmanager.v1beta1.Query/RegisteredAlloyedPoolFromPoolId",
  ),
  osmosisPoolmanagerV1beta1RegisteredAlloyedPoolFromPoolIdResponse(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.RegisteredAlloyedPoolFromPoolIdResponse',
  ),
  osmosisPoolmanagerV1beta1AllRegisteredAlloyedPoolsRequest(
    typeUrl: '/osmosis.poolmanager.v1beta1.AllRegisteredAlloyedPoolsRequest',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Query/AllRegisteredAlloyedPools",
  ),
  osmosisPoolmanagerV1beta1AllRegisteredAlloyedPoolsResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.AllRegisteredAlloyedPoolsResponse',
  ),
  osmosisPoolmanagerV1beta1SwapAmountInRoute(
    typeUrl: '/osmosis.poolmanager.v1beta1.SwapAmountInRoute',
  ),
  osmosisPoolmanagerV1beta1SwapAmountOutRoute(
    typeUrl: '/osmosis.poolmanager.v1beta1.SwapAmountOutRoute',
  ),
  osmosisPoolmanagerV1beta1SwapAmountInSplitRoute(
    typeUrl: '/osmosis.poolmanager.v1beta1.SwapAmountInSplitRoute',
  ),
  osmosisPoolmanagerV1beta1SwapAmountOutSplitRoute(
    typeUrl: '/osmosis.poolmanager.v1beta1.SwapAmountOutSplitRoute',
  ),
  osmosisPoolmanagerV1beta1Params(
    typeUrl: '/osmosis.poolmanager.v1beta1.Params',
  ),
  osmosisPoolmanagerV1beta1TakerFeeParams(
    typeUrl: '/osmosis.poolmanager.v1beta1.TakerFeeParams',
  ),
  osmosisPoolmanagerV1beta1TakerFeeDistributionPercentage(
    typeUrl: '/osmosis.poolmanager.v1beta1.TakerFeeDistributionPercentage',
  ),
  osmosisPoolmanagerV1beta1TakerFeesTracker(
    typeUrl: '/osmosis.poolmanager.v1beta1.TakerFeesTracker',
  ),
  osmosisPoolmanagerV1beta1TakerFeeShareAgreement(
    typeUrl: '/osmosis.poolmanager.v1beta1.TakerFeeShareAgreement',
  ),
  osmosisPoolmanagerV1beta1TakerFeeSkimAccumulator(
    typeUrl: '/osmosis.poolmanager.v1beta1.TakerFeeSkimAccumulator',
  ),
  osmosisPoolmanagerV1beta1AlloyContractTakerFeeShareState(
    typeUrl: '/osmosis.poolmanager.v1beta1.AlloyContractTakerFeeShareState',
  ),
  osmosisPoolmanagerV1beta1MsgSwapExactAmountIn(
    typeUrl: '/osmosis.poolmanager.v1beta1.MsgSwapExactAmountIn',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Msg/SwapExactAmountIn",
    aminoType: "osmosis/poolmanager/swap-exact-amount-in",
  ),
  osmosisPoolmanagerV1beta1MsgSwapExactAmountInResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.MsgSwapExactAmountInResponse',
  ),
  osmosisPoolmanagerV1beta1MsgSplitRouteSwapExactAmountIn(
    typeUrl: '/osmosis.poolmanager.v1beta1.MsgSplitRouteSwapExactAmountIn',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Msg/SplitRouteSwapExactAmountIn",
    aminoType: "osmosis/poolmanager/split-amount-in",
  ),
  osmosisPoolmanagerV1beta1MsgSplitRouteSwapExactAmountInResponse(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.MsgSplitRouteSwapExactAmountInResponse',
  ),
  osmosisPoolmanagerV1beta1MsgSwapExactAmountOut(
    typeUrl: '/osmosis.poolmanager.v1beta1.MsgSwapExactAmountOut',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Msg/SwapExactAmountOut",
    aminoType: "osmosis/poolmanager/swap-exact-amount-out",
  ),
  osmosisPoolmanagerV1beta1MsgSwapExactAmountOutResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.MsgSwapExactAmountOutResponse',
  ),
  osmosisPoolmanagerV1beta1MsgSplitRouteSwapExactAmountOut(
    typeUrl: '/osmosis.poolmanager.v1beta1.MsgSplitRouteSwapExactAmountOut',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Msg/SplitRouteSwapExactAmountOut",
    aminoType: "osmosis/poolmanager/split-amount-out",
  ),
  osmosisPoolmanagerV1beta1MsgSplitRouteSwapExactAmountOutResponse(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.MsgSplitRouteSwapExactAmountOutResponse',
  ),
  osmosisPoolmanagerV1beta1MsgSetDenomPairTakerFee(
    typeUrl: '/osmosis.poolmanager.v1beta1.MsgSetDenomPairTakerFee',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Msg/SetDenomPairTakerFee",
    aminoType: "osmosis/poolmanager/set-denom-pair-taker-fee",
  ),
  osmosisPoolmanagerV1beta1MsgSetDenomPairTakerFeeResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.MsgSetDenomPairTakerFeeResponse',
  ),
  osmosisPoolmanagerV1beta1MsgSetTakerFeeShareAgreementForDenom(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.MsgSetTakerFeeShareAgreementForDenom',
    serviceUrl:
        "/osmosis.poolmanager.v1beta1.Msg/SetTakerFeeShareAgreementForDenom",
    aminoType: "osmosis/poolmanager/set-taker-fee-share-agreement-for-denom",
  ),
  osmosisPoolmanagerV1beta1MsgSetTakerFeeShareAgreementForDenomResponse(
    typeUrl:
        '/osmosis.poolmanager.v1beta1.MsgSetTakerFeeShareAgreementForDenomResponse',
  ),
  osmosisPoolmanagerV1beta1MsgSetRegisteredAlloyedPool(
    typeUrl: '/osmosis.poolmanager.v1beta1.MsgSetRegisteredAlloyedPool',
    serviceUrl: "/osmosis.poolmanager.v1beta1.Msg/SetRegisteredAlloyedPool",
    aminoType: "osmosis/poolmanager/set-registered-alloyed-pool",
  ),
  osmosisPoolmanagerV1beta1MsgSetRegisteredAlloyedPoolResponse(
    typeUrl: '/osmosis.poolmanager.v1beta1.MsgSetRegisteredAlloyedPoolResponse',
  ),
  osmosisPoolmanagerV1beta1DenomPairTakerFee(
    typeUrl: '/osmosis.poolmanager.v1beta1.DenomPairTakerFee',
  ),
  osmosisEpochsV1beta1QueryEpochsInfoRequest(
    typeUrl: '/osmosis.epochs.v1beta1.QueryEpochsInfoRequest',
    serviceUrl: "/osmosis.epochs.v1beta1.Query/EpochInfos",
  ),
  osmosisEpochsV1beta1QueryEpochsInfoResponse(
    typeUrl: '/osmosis.epochs.v1beta1.QueryEpochsInfoResponse',
  ),
  osmosisEpochsV1beta1QueryCurrentEpochRequest(
    typeUrl: '/osmosis.epochs.v1beta1.QueryCurrentEpochRequest',
    serviceUrl: "/osmosis.epochs.v1beta1.Query/CurrentEpoch",
  ),
  osmosisEpochsV1beta1QueryCurrentEpochResponse(
    typeUrl: '/osmosis.epochs.v1beta1.QueryCurrentEpochResponse',
  ),
  osmosisEpochsV1beta1EpochInfo(typeUrl: '/osmosis.epochs.v1beta1.EpochInfo'),
  osmosisTwapV1beta1ArithmeticTwapRequest(
    typeUrl: '/osmosis.twap.v1beta1.ArithmeticTwapRequest',
    serviceUrl: "/osmosis.twap.v1beta1.Query/ArithmeticTwap",
  ),
  osmosisTwapV1beta1ArithmeticTwapResponse(
    typeUrl: '/osmosis.twap.v1beta1.ArithmeticTwapResponse',
  ),
  osmosisTwapV1beta1ArithmeticTwapToNowRequest(
    typeUrl: '/osmosis.twap.v1beta1.ArithmeticTwapToNowRequest',
    serviceUrl: "/osmosis.twap.v1beta1.Query/ArithmeticTwapToNow",
  ),
  osmosisTwapV1beta1ArithmeticTwapToNowResponse(
    typeUrl: '/osmosis.twap.v1beta1.ArithmeticTwapToNowResponse',
  ),
  osmosisTwapV1beta1GeometricTwapRequest(
    typeUrl: '/osmosis.twap.v1beta1.GeometricTwapRequest',
    serviceUrl: "/osmosis.twap.v1beta1.Query/GeometricTwap",
  ),
  osmosisTwapV1beta1GeometricTwapResponse(
    typeUrl: '/osmosis.twap.v1beta1.GeometricTwapResponse',
  ),
  osmosisTwapV1beta1GeometricTwapToNowRequest(
    typeUrl: '/osmosis.twap.v1beta1.GeometricTwapToNowRequest',
    serviceUrl: "/osmosis.twap.v1beta1.Query/GeometricTwapToNow",
  ),
  osmosisTwapV1beta1GeometricTwapToNowResponse(
    typeUrl: '/osmosis.twap.v1beta1.GeometricTwapToNowResponse',
  ),
  osmosisTwapV1beta1ParamsRequest(
    typeUrl: '/osmosis.twap.v1beta1.ParamsRequest',
    serviceUrl: "/osmosis.twap.v1beta1.Query/Params",
  ),
  osmosisTwapV1beta1ParamsResponse(
    typeUrl: '/osmosis.twap.v1beta1.ParamsResponse',
  ),
  osmosisTwapV1beta1Params(typeUrl: '/osmosis.twap.v1beta1.Params'),
  cosmwasmWasmV1QueryContractInfoRequest(
    typeUrl: '/cosmwasm.wasm.v1.QueryContractInfoRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/ContractInfo",
  ),
  cosmwasmWasmV1QueryContractInfoResponse(
    typeUrl: '/cosmwasm.wasm.v1.QueryContractInfoResponse',
  ),
  cosmwasmWasmV1QueryContractHistoryRequest(
    typeUrl: '/cosmwasm.wasm.v1.QueryContractHistoryRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/ContractHistory",
  ),
  cosmwasmWasmV1QueryContractHistoryResponse(
    typeUrl: '/cosmwasm.wasm.v1.QueryContractHistoryResponse',
  ),
  cosmwasmWasmV1QueryContractsByCodeRequest(
    typeUrl: '/cosmwasm.wasm.v1.QueryContractsByCodeRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/ContractsByCode",
  ),
  cosmwasmWasmV1QueryContractsByCodeResponse(
    typeUrl: '/cosmwasm.wasm.v1.QueryContractsByCodeResponse',
  ),
  cosmwasmWasmV1QueryAllContractStateRequest(
    typeUrl: '/cosmwasm.wasm.v1.QueryAllContractStateRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/AllContractState",
  ),
  cosmwasmWasmV1QueryAllContractStateResponse(
    typeUrl: '/cosmwasm.wasm.v1.QueryAllContractStateResponse',
  ),
  cosmwasmWasmV1QueryRawContractStateRequest(
    typeUrl: '/cosmwasm.wasm.v1.QueryRawContractStateRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/RawContractState",
  ),
  cosmwasmWasmV1QueryRawContractStateResponse(
    typeUrl: '/cosmwasm.wasm.v1.QueryRawContractStateResponse',
  ),
  cosmwasmWasmV1QuerySmartContractStateRequest(
    typeUrl: '/cosmwasm.wasm.v1.QuerySmartContractStateRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/SmartContractState",
  ),
  cosmwasmWasmV1QuerySmartContractStateResponse(
    typeUrl: '/cosmwasm.wasm.v1.QuerySmartContractStateResponse',
  ),
  cosmwasmWasmV1QueryCodeRequest(
    typeUrl: '/cosmwasm.wasm.v1.QueryCodeRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/Code",
  ),
  cosmwasmWasmV1QueryCodeInfoRequest(
    typeUrl: '/cosmwasm.wasm.v1.QueryCodeInfoRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/CodeInfo",
  ),
  cosmwasmWasmV1QueryCodeInfoResponse(
    typeUrl: '/cosmwasm.wasm.v1.QueryCodeInfoResponse',
  ),
  cosmwasmWasmV1CodeInfoResponse(typeUrl: '/cosmwasm.wasm.v1.CodeInfoResponse'),
  cosmwasmWasmV1QueryCodeResponse(
    typeUrl: '/cosmwasm.wasm.v1.QueryCodeResponse',
  ),
  cosmwasmWasmV1QueryCodesRequest(
    typeUrl: '/cosmwasm.wasm.v1.QueryCodesRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/Codes",
  ),
  cosmwasmWasmV1QueryCodesResponse(
    typeUrl: '/cosmwasm.wasm.v1.QueryCodesResponse',
  ),
  cosmwasmWasmV1QueryPinnedCodesRequest(
    typeUrl: '/cosmwasm.wasm.v1.QueryPinnedCodesRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/PinnedCodes",
  ),
  cosmwasmWasmV1QueryPinnedCodesResponse(
    typeUrl: '/cosmwasm.wasm.v1.QueryPinnedCodesResponse',
  ),
  cosmwasmWasmV1QueryParamsRequest(
    typeUrl: '/cosmwasm.wasm.v1.QueryParamsRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/Params",
  ),
  cosmwasmWasmV1QueryParamsResponse(
    typeUrl: '/cosmwasm.wasm.v1.QueryParamsResponse',
  ),
  cosmwasmWasmV1QueryContractsByCreatorRequest(
    typeUrl: '/cosmwasm.wasm.v1.QueryContractsByCreatorRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/ContractsByCreator",
  ),
  cosmwasmWasmV1QueryContractsByCreatorResponse(
    typeUrl: '/cosmwasm.wasm.v1.QueryContractsByCreatorResponse',
  ),
  cosmwasmWasmV1QueryWasmLimitsConfigRequest(
    typeUrl: '/cosmwasm.wasm.v1.QueryWasmLimitsConfigRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/WasmLimitsConfig",
  ),
  cosmwasmWasmV1QueryWasmLimitsConfigResponse(
    typeUrl: '/cosmwasm.wasm.v1.QueryWasmLimitsConfigResponse',
  ),
  cosmwasmWasmV1QueryBuildAddressRequest(
    typeUrl: '/cosmwasm.wasm.v1.QueryBuildAddressRequest',
    serviceUrl: "/cosmwasm.wasm.v1.Query/BuildAddress",
  ),
  cosmwasmWasmV1QueryBuildAddressResponse(
    typeUrl: '/cosmwasm.wasm.v1.QueryBuildAddressResponse',
  ),
  cosmwasmWasmV1AccessConfig(typeUrl: '/cosmwasm.wasm.v1.AccessConfig'),
  cosmwasmWasmV1Params(typeUrl: '/cosmwasm.wasm.v1.Params'),
  cosmwasmWasmV1ContractInfo(typeUrl: '/cosmwasm.wasm.v1.ContractInfo'),
  cosmwasmWasmV1ContractCodeHistoryEntry(
    typeUrl: '/cosmwasm.wasm.v1.ContractCodeHistoryEntry',
  ),
  cosmwasmWasmV1AbsoluteTxPosition(
    typeUrl: '/cosmwasm.wasm.v1.AbsoluteTxPosition',
  ),
  cosmwasmWasmV1Model(typeUrl: '/cosmwasm.wasm.v1.Model'),
  cosmwasmWasmV1MsgStoreCode(
    typeUrl: '/cosmwasm.wasm.v1.MsgStoreCode',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/StoreCode",
    aminoType: "wasm/MsgStoreCode",
  ),
  cosmwasmWasmV1MsgStoreCodeResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgStoreCodeResponse',
  ),
  cosmwasmWasmV1MsgInstantiateContract(
    typeUrl: '/cosmwasm.wasm.v1.MsgInstantiateContract',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/InstantiateContract",
    aminoType: "wasm/MsgInstantiateContract",
  ),
  cosmwasmWasmV1MsgInstantiateContractResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgInstantiateContractResponse',
  ),
  cosmwasmWasmV1MsgInstantiateContract2(
    typeUrl: '/cosmwasm.wasm.v1.MsgInstantiateContract2',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/InstantiateContract2",
    aminoType: "wasm/MsgInstantiateContract2",
  ),
  cosmwasmWasmV1MsgInstantiateContract2Response(
    typeUrl: '/cosmwasm.wasm.v1.MsgInstantiateContract2Response',
  ),
  cosmwasmWasmV1MsgExecuteContract(
    typeUrl: '/cosmwasm.wasm.v1.MsgExecuteContract',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/ExecuteContract",
    aminoType: "wasm/MsgExecuteContract",
  ),
  cosmwasmWasmV1MsgExecuteContractResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgExecuteContractResponse',
  ),
  cosmwasmWasmV1MsgMigrateContract(
    typeUrl: '/cosmwasm.wasm.v1.MsgMigrateContract',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/MigrateContract",
    aminoType: "wasm/MsgMigrateContract",
  ),
  cosmwasmWasmV1MsgMigrateContractResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgMigrateContractResponse',
  ),
  cosmwasmWasmV1MsgUpdateAdmin(
    typeUrl: '/cosmwasm.wasm.v1.MsgUpdateAdmin',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/UpdateAdmin",
    aminoType: "wasm/MsgUpdateAdmin",
  ),
  cosmwasmWasmV1MsgUpdateAdminResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgUpdateAdminResponse',
  ),
  cosmwasmWasmV1MsgClearAdmin(
    typeUrl: '/cosmwasm.wasm.v1.MsgClearAdmin',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/ClearAdmin",
    aminoType: "wasm/MsgClearAdmin",
  ),
  cosmwasmWasmV1MsgClearAdminResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgClearAdminResponse',
  ),
  cosmwasmWasmV1MsgUpdateInstantiateConfig(
    typeUrl: '/cosmwasm.wasm.v1.MsgUpdateInstantiateConfig',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/UpdateInstantiateConfig",
    aminoType: "wasm/MsgUpdateInstantiateConfig",
  ),
  cosmwasmWasmV1MsgUpdateInstantiateConfigResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgUpdateInstantiateConfigResponse',
  ),
  cosmwasmWasmV1MsgUpdateParams(
    typeUrl: '/cosmwasm.wasm.v1.MsgUpdateParams',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/UpdateParams",
    aminoType: "wasm/MsgUpdateParams",
  ),
  cosmwasmWasmV1MsgUpdateParamsResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgUpdateParamsResponse',
  ),
  cosmwasmWasmV1MsgSudoContract(
    typeUrl: '/cosmwasm.wasm.v1.MsgSudoContract',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/SudoContract",
    aminoType: "wasm/MsgSudoContract",
  ),
  cosmwasmWasmV1MsgSudoContractResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgSudoContractResponse',
  ),
  cosmwasmWasmV1MsgPinCodes(
    typeUrl: '/cosmwasm.wasm.v1.MsgPinCodes',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/PinCodes",
    aminoType: "wasm/MsgPinCodes",
  ),
  cosmwasmWasmV1MsgPinCodesResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgPinCodesResponse',
  ),
  cosmwasmWasmV1MsgUnpinCodes(
    typeUrl: '/cosmwasm.wasm.v1.MsgUnpinCodes',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/UnpinCodes",
    aminoType: "wasm/MsgUnpinCodes",
  ),
  cosmwasmWasmV1MsgUnpinCodesResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgUnpinCodesResponse',
  ),
  cosmwasmWasmV1MsgStoreAndInstantiateContract(
    typeUrl: '/cosmwasm.wasm.v1.MsgStoreAndInstantiateContract',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/StoreAndInstantiateContract",
    aminoType: "wasm/MsgStoreAndInstantiateContract",
  ),
  cosmwasmWasmV1MsgStoreAndInstantiateContractResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgStoreAndInstantiateContractResponse',
  ),
  cosmwasmWasmV1MsgAddCodeUploadParamsAddresses(
    typeUrl: '/cosmwasm.wasm.v1.MsgAddCodeUploadParamsAddresses',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/AddCodeUploadParamsAddresses",
    aminoType: "wasm/MsgAddCodeUploadParamsAddresses",
  ),
  cosmwasmWasmV1MsgAddCodeUploadParamsAddressesResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgAddCodeUploadParamsAddressesResponse',
  ),
  cosmwasmWasmV1MsgRemoveCodeUploadParamsAddresses(
    typeUrl: '/cosmwasm.wasm.v1.MsgRemoveCodeUploadParamsAddresses',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/RemoveCodeUploadParamsAddresses",
    aminoType: "wasm/MsgRemoveCodeUploadParamsAddresses",
  ),
  cosmwasmWasmV1MsgRemoveCodeUploadParamsAddressesResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgRemoveCodeUploadParamsAddressesResponse',
  ),
  cosmwasmWasmV1MsgStoreAndMigrateContract(
    typeUrl: '/cosmwasm.wasm.v1.MsgStoreAndMigrateContract',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/StoreAndMigrateContract",
    aminoType: "wasm/MsgStoreAndMigrateContract",
  ),
  cosmwasmWasmV1MsgStoreAndMigrateContractResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgStoreAndMigrateContractResponse',
  ),
  cosmwasmWasmV1MsgUpdateContractLabel(
    typeUrl: '/cosmwasm.wasm.v1.MsgUpdateContractLabel',
    serviceUrl: "/cosmwasm.wasm.v1.Msg/UpdateContractLabel",
    aminoType: "wasm/MsgUpdateContractLabel",
  ),
  cosmwasmWasmV1MsgUpdateContractLabelResponse(
    typeUrl: '/cosmwasm.wasm.v1.MsgUpdateContractLabelResponse',
  ),
  stratosPotV1QueryVolumeReportRequest(
    typeUrl: '/stratos.pot.v1.QueryVolumeReportRequest',
    serviceUrl: "/stratos.pot.v1.Query/VolumeReport",
  ),
  stratosPotV1QueryVolumeReportResponse(
    typeUrl: '/stratos.pot.v1.QueryVolumeReportResponse',
  ),
  stratosPotV1ReportInfo(typeUrl: '/stratos.pot.v1.ReportInfo'),
  stratosPotV1QueryParamsRequest(
    typeUrl: '/stratos.pot.v1.QueryParamsRequest',
    serviceUrl: "/stratos.pot.v1.Query/Params",
  ),
  stratosPotV1QueryParamsResponse(
    typeUrl: '/stratos.pot.v1.QueryParamsResponse',
  ),
  stratosPotV1QueryRewardsByEpochRequest(
    typeUrl: '/stratos.pot.v1.QueryRewardsByEpochRequest',
    serviceUrl: "/stratos.pot.v1.Query/RewardsByEpoch",
  ),
  stratosPotV1QueryRewardsByEpochResponse(
    typeUrl: '/stratos.pot.v1.QueryRewardsByEpochResponse',
  ),
  stratosPotV1QueryRewardsByWalletRequest(
    typeUrl: '/stratos.pot.v1.QueryRewardsByWalletRequest',
    serviceUrl: "/stratos.pot.v1.Query/RewardsByWallet",
  ),
  stratosPotV1QueryRewardsByWalletResponse(
    typeUrl: '/stratos.pot.v1.QueryRewardsByWalletResponse',
  ),
  stratosPotV1QueryRewardsByWalletAndEpochRequest(
    typeUrl: '/stratos.pot.v1.QueryRewardsByWalletAndEpochRequest',
    serviceUrl: "/stratos.pot.v1.Query/RewardsByWalletAndEpoch",
  ),
  stratosPotV1QueryRewardsByWalletAndEpochResponse(
    typeUrl: '/stratos.pot.v1.QueryRewardsByWalletAndEpochResponse',
  ),
  stratosPotV1RewardByWallet(typeUrl: '/stratos.pot.v1.RewardByWallet'),
  stratosPotV1QuerySlashingByOwnerRequest(
    typeUrl: '/stratos.pot.v1.QuerySlashingByOwnerRequest',
    serviceUrl: "/stratos.pot.v1.Query/SlashingByOwner",
  ),
  stratosPotV1QuerySlashingByOwnerResponse(
    typeUrl: '/stratos.pot.v1.QuerySlashingByOwnerResponse',
  ),
  stratosPotV1QueryTotalMinedTokenRequest(
    typeUrl: '/stratos.pot.v1.QueryTotalMinedTokenRequest',
    serviceUrl: "/stratos.pot.v1.Query/TotalMinedToken",
  ),
  stratosPotV1QueryTotalMinedTokenResponse(
    typeUrl: '/stratos.pot.v1.QueryTotalMinedTokenResponse',
  ),
  stratosPotV1QueryCirculationSupplyRequest(
    typeUrl: '/stratos.pot.v1.QueryCirculationSupplyRequest',
    serviceUrl: "/stratos.pot.v1.Query/CirculationSupply",
  ),
  stratosPotV1QueryCirculationSupplyResponse(
    typeUrl: '/stratos.pot.v1.QueryCirculationSupplyResponse',
  ),
  stratosPotV1QueryTotalRewardByEpochRequest(
    typeUrl: '/stratos.pot.v1.QueryTotalRewardByEpochRequest',
    serviceUrl: "/stratos.pot.v1.Query/TotalRewardByEpoch",
  ),
  stratosPotV1QueryTotalRewardByEpochResponse(
    typeUrl: '/stratos.pot.v1.QueryTotalRewardByEpochResponse',
  ),
  stratosPotV1QueryMetricsRequest(
    typeUrl: '/stratos.pot.v1.QueryMetricsRequest',
    serviceUrl: "/stratos.pot.v1.Query/Metrics",
  ),
  stratosPotV1QueryMetricsResponse(
    typeUrl: '/stratos.pot.v1.QueryMetricsResponse',
  ),
  stratosPotV1Params(
    typeUrl: '/stratos.pot.v1.Params',
    aminoType: "stratos/x/pot/Params",
  ),
  stratosPotV1MiningRewardParam(typeUrl: '/stratos.pot.v1.MiningRewardParam'),
  stratosPotV1Reward(typeUrl: '/stratos.pot.v1.Reward'),
  stratosPotV1SingleWalletVolume(typeUrl: '/stratos.pot.v1.SingleWalletVolume'),
  stratosPotV1TotalReward(typeUrl: '/stratos.pot.v1.TotalReward'),
  stratosPotV1Metrics(typeUrl: '/stratos.pot.v1.Metrics'),
  stratosPotV1MsgVolumeReport(
    typeUrl: '/stratos.pot.v1.MsgVolumeReport',
    serviceUrl: "/stratos.pot.v1.Msg/HandleMsgVolumeReport",
    aminoType: "stratos/MsgVolumeReport",
  ),
  stratosPotV1MsgVolumeReportResponse(
    typeUrl: '/stratos.pot.v1.MsgVolumeReportResponse',
  ),
  stratosPotV1MsgWithdraw(
    typeUrl: '/stratos.pot.v1.MsgWithdraw',
    serviceUrl: "/stratos.pot.v1.Msg/HandleMsgWithdraw",
    aminoType: "stratos/MsgWithdraw",
  ),
  stratosPotV1MsgWithdrawResponse(
    typeUrl: '/stratos.pot.v1.MsgWithdrawResponse',
  ),
  stratosPotV1MsgFoundationDeposit(
    typeUrl: '/stratos.pot.v1.MsgFoundationDeposit',
    serviceUrl: "/stratos.pot.v1.Msg/HandleMsgFoundationDeposit",
    aminoType: "stratos/MsgFoundationDeposit",
  ),
  stratosPotV1MsgFoundationDepositResponse(
    typeUrl: '/stratos.pot.v1.MsgFoundationDepositResponse',
  ),
  stratosPotV1MsgSlashingResourceNode(
    typeUrl: '/stratos.pot.v1.MsgSlashingResourceNode',
    serviceUrl: "/stratos.pot.v1.Msg/HandleMsgSlashingResourceNode",
    aminoType: "stratos/MsgSlashingResourceNode",
  ),
  stratosPotV1MsgSlashingResourceNodeResponse(
    typeUrl: '/stratos.pot.v1.MsgSlashingResourceNodeResponse',
  ),
  stratosPotV1BLSSignatureInfo(typeUrl: '/stratos.pot.v1.BLSSignatureInfo'),
  stratosPotV1MsgUpdateParams(
    typeUrl: '/stratos.pot.v1.MsgUpdateParams',
    serviceUrl: "/stratos.pot.v1.Msg/UpdateParams",
    aminoType: "stratos/x/pot/MsgUpdateParams",
  ),
  stratosPotV1MsgUpdateParamsResponse(
    typeUrl: '/stratos.pot.v1.MsgUpdateParamsResponse',
  ),
  stratosSdsV1Params(
    typeUrl: '/stratos.sds.v1.Params',
    aminoType: "stratos/x/sds/Params",
  ),
  stratosSdsV1FileInfo(typeUrl: '/stratos.sds.v1.FileInfo'),
  stratosSdsV1QueryFileUploadRequest(
    typeUrl: '/stratos.sds.v1.QueryFileUploadRequest',
    serviceUrl: "/stratos.sds.v1.Query/Fileupload",
  ),
  stratosSdsV1QueryFileUploadResponse(
    typeUrl: '/stratos.sds.v1.QueryFileUploadResponse',
  ),
  stratosSdsV1QuerySimPrepayRequest(
    typeUrl: '/stratos.sds.v1.QuerySimPrepayRequest',
    serviceUrl: "/stratos.sds.v1.Query/SimPrepay",
  ),
  stratosSdsV1QuerySimPrepayResponse(
    typeUrl: '/stratos.sds.v1.QuerySimPrepayResponse',
  ),
  stratosSdsV1QueryNozPriceRequest(
    typeUrl: '/stratos.sds.v1.QueryNozPriceRequest',
    serviceUrl: "/stratos.sds.v1.Query/NozPrice",
  ),
  stratosSdsV1QueryNozPriceResponse(
    typeUrl: '/stratos.sds.v1.QueryNozPriceResponse',
  ),
  stratosSdsV1QueryNozSupplyRequest(
    typeUrl: '/stratos.sds.v1.QueryNozSupplyRequest',
    serviceUrl: "/stratos.sds.v1.Query/NozSupply",
  ),
  stratosSdsV1QueryNozSupplyResponse(
    typeUrl: '/stratos.sds.v1.QueryNozSupplyResponse',
  ),
  stratosSdsV1QueryParamsRequest(
    typeUrl: '/stratos.sds.v1.QueryParamsRequest',
    serviceUrl: "/stratos.sds.v1.Query/Params",
  ),
  stratosSdsV1QueryParamsResponse(
    typeUrl: '/stratos.sds.v1.QueryParamsResponse',
  ),
  stratosSdsV1MsgFileUpload(
    typeUrl: '/stratos.sds.v1.MsgFileUpload',
    serviceUrl: "/stratos.sds.v1.Msg/HandleMsgFileUpload",
    aminoType: "stratos/MsgFileUpload",
  ),
  stratosSdsV1MsgFileUploadResponse(
    typeUrl: '/stratos.sds.v1.MsgFileUploadResponse',
  ),
  stratosSdsV1MsgPrepay(
    typeUrl: '/stratos.sds.v1.MsgPrepay',
    serviceUrl: "/stratos.sds.v1.Msg/HandleMsgPrepay",
    aminoType: "stratos/MsgPrepay",
  ),
  stratosSdsV1MsgPrepayResponse(typeUrl: '/stratos.sds.v1.MsgPrepayResponse'),
  stratosSdsV1MsgUpdateParams(
    typeUrl: '/stratos.sds.v1.MsgUpdateParams',
    serviceUrl: "/stratos.sds.v1.Msg/UpdateParams",
    aminoType: "stratos/x/sds/MsgUpdateParams",
  ),
  stratosSdsV1MsgUpdateParamsResponse(
    typeUrl: '/stratos.sds.v1.MsgUpdateParamsResponse',
  ),
  stratosRegisterV1QueryResourceNodeRequest(
    typeUrl: '/stratos.register.v1.QueryResourceNodeRequest',
    serviceUrl: "/stratos.register.v1.Query/ResourceNode",
  ),
  stratosRegisterV1QueryResourceNodeResponse(
    typeUrl: '/stratos.register.v1.QueryResourceNodeResponse',
  ),
  stratosRegisterV1QueryMetaNodeRequest(
    typeUrl: '/stratos.register.v1.QueryMetaNodeRequest',
    serviceUrl: "/stratos.register.v1.Query/MetaNode",
  ),
  stratosRegisterV1QueryMetaNodeResponse(
    typeUrl: '/stratos.register.v1.QueryMetaNodeResponse',
  ),
  stratosRegisterV1QueryDepositByNodeRequest(
    typeUrl: '/stratos.register.v1.QueryDepositByNodeRequest',
    serviceUrl: "/stratos.register.v1.Query/DepositByNode",
  ),
  stratosRegisterV1QueryDepositByNodeResponse(
    typeUrl: '/stratos.register.v1.QueryDepositByNodeResponse',
  ),
  stratosRegisterV1QueryDepositByOwnerRequest(
    typeUrl: '/stratos.register.v1.QueryDepositByOwnerRequest',
    serviceUrl: "/stratos.register.v1.Query/DepositByOwner",
  ),
  stratosRegisterV1QueryDepositByOwnerResponse(
    typeUrl: '/stratos.register.v1.QueryDepositByOwnerResponse',
  ),
  stratosRegisterV1QueryDepositTotalRequest(
    typeUrl: '/stratos.register.v1.QueryDepositTotalRequest',
    serviceUrl: "/stratos.register.v1.Query/DepositTotal",
  ),
  stratosRegisterV1QueryDepositTotalResponse(
    typeUrl: '/stratos.register.v1.QueryDepositTotalResponse',
  ),
  stratosRegisterV1QueryParamsRequest(
    typeUrl: '/stratos.register.v1.QueryParamsRequest',
    serviceUrl: "/stratos.register.v1.Query/Params",
  ),
  stratosRegisterV1QueryParamsResponse(
    typeUrl: '/stratos.register.v1.QueryParamsResponse',
  ),
  stratosRegisterV1QueryBondedResourceNodeCountRequest(
    typeUrl: '/stratos.register.v1.QueryBondedResourceNodeCountRequest',
    serviceUrl: "/stratos.register.v1.Query/BondedResourceNodeCount",
  ),
  stratosRegisterV1QueryBondedResourceNodeCountResponse(
    typeUrl: '/stratos.register.v1.QueryBondedResourceNodeCountResponse',
  ),
  stratosRegisterV1QueryBondedMetaNodeCountRequest(
    typeUrl: '/stratos.register.v1.QueryBondedMetaNodeCountRequest',
    serviceUrl: "/stratos.register.v1.Query/BondedMetaNodeCount",
  ),
  stratosRegisterV1QueryBondedMetaNodeCountResponse(
    typeUrl: '/stratos.register.v1.QueryBondedMetaNodeCountResponse',
  ),
  stratosRegisterV1QueryRemainingOzoneLimitRequest(
    typeUrl: '/stratos.register.v1.QueryRemainingOzoneLimitRequest',
    serviceUrl: "/stratos.register.v1.Query/RemainingOzoneLimit",
  ),
  stratosRegisterV1QueryRemainingOzoneLimitResponse(
    typeUrl: '/stratos.register.v1.QueryRemainingOzoneLimitResponse',
  ),
  stratosRegisterV1DepositInfo(typeUrl: '/stratos.register.v1.DepositInfo'),
  stratosRegisterV1MsgCreateResourceNode(
    typeUrl: '/stratos.register.v1.MsgCreateResourceNode',
    serviceUrl: "/stratos.register.v1.Msg/HandleMsgCreateResourceNode",
    aminoType: "stratos/MsgCreateResourceNode",
  ),
  stratosRegisterV1MsgCreateResourceNodeResponse(
    typeUrl: '/stratos.register.v1.MsgCreateResourceNodeResponse',
  ),
  stratosRegisterV1MsgCreateMetaNode(
    typeUrl: '/stratos.register.v1.MsgCreateMetaNode',
    serviceUrl: "/stratos.register.v1.Msg/HandleMsgCreateMetaNode",
    aminoType: "stratos/MsgCreateMetaNode",
  ),
  stratosRegisterV1MsgCreateMetaNodeResponse(
    typeUrl: '/stratos.register.v1.MsgCreateMetaNodeResponse',
  ),
  stratosRegisterV1MsgRemoveResourceNode(
    typeUrl: '/stratos.register.v1.MsgRemoveResourceNode',
    serviceUrl: "/stratos.register.v1.Msg/HandleMsgRemoveResourceNode",
    aminoType: "stratos/MsgRemoveResourceNode",
  ),
  stratosRegisterV1MsgRemoveResourceNodeResponse(
    typeUrl: '/stratos.register.v1.MsgRemoveResourceNodeResponse',
  ),
  stratosRegisterV1MsgRemoveMetaNode(
    typeUrl: '/stratos.register.v1.MsgRemoveMetaNode',
    serviceUrl: "/stratos.register.v1.Msg/HandleMsgRemoveMetaNode",
    aminoType: "stratos/MsgRemoveMetaNode",
  ),
  stratosRegisterV1MsgRemoveMetaNodeResponse(
    typeUrl: '/stratos.register.v1.MsgRemoveMetaNodeResponse',
  ),
  stratosRegisterV1MsgUpdateResourceNode(
    typeUrl: '/stratos.register.v1.MsgUpdateResourceNode',
    serviceUrl: "/stratos.register.v1.Msg/HandleMsgUpdateResourceNode",
    aminoType: "stratos/MsgUpdateResourceNode",
  ),
  stratosRegisterV1MsgUpdateResourceNodeResponse(
    typeUrl: '/stratos.register.v1.MsgUpdateResourceNodeResponse',
  ),
  stratosRegisterV1MsgUpdateMetaNode(
    typeUrl: '/stratos.register.v1.MsgUpdateMetaNode',
    serviceUrl: "/stratos.register.v1.Msg/HandleMsgUpdateMetaNode",
    aminoType: "stratos/MsgUpdateMetaNode",
  ),
  stratosRegisterV1MsgUpdateMetaNodeResponse(
    typeUrl: '/stratos.register.v1.MsgUpdateMetaNodeResponse',
  ),
  stratosRegisterV1MsgUpdateResourceNodeDeposit(
    typeUrl: '/stratos.register.v1.MsgUpdateResourceNodeDeposit',
    serviceUrl: "/stratos.register.v1.Msg/HandleMsgUpdateResourceNodeDeposit",
    aminoType: "stratos/MsgUpdateResourceNodeDeposit",
  ),
  stratosRegisterV1MsgUpdateResourceNodeDepositResponse(
    typeUrl: '/stratos.register.v1.MsgUpdateResourceNodeDepositResponse',
  ),
  stratosRegisterV1MsgUpdateEffectiveDeposit(
    typeUrl: '/stratos.register.v1.MsgUpdateEffectiveDeposit',
    serviceUrl: "/stratos.register.v1.Msg/HandleMsgUpdateEffectiveDeposit",
    aminoType: "stratos/MsgUpdateEffectiveDeposit",
  ),
  stratosRegisterV1MsgUpdateEffectiveDepositResponse(
    typeUrl: '/stratos.register.v1.MsgUpdateEffectiveDepositResponse',
  ),
  stratosRegisterV1MsgUpdateMetaNodeDeposit(
    typeUrl: '/stratos.register.v1.MsgUpdateMetaNodeDeposit',
    serviceUrl: "/stratos.register.v1.Msg/HandleMsgUpdateMetaNodeDeposit",
    aminoType: "stratos/MsgUpdateMetaNodeDeposit",
  ),
  stratosRegisterV1MsgUpdateMetaNodeDepositResponse(
    typeUrl: '/stratos.register.v1.MsgUpdateMetaNodeDepositResponse',
  ),
  stratosRegisterV1MsgMetaNodeRegistrationVote(
    typeUrl: '/stratos.register.v1.MsgMetaNodeRegistrationVote',
    serviceUrl: "/stratos.register.v1.Msg/HandleMsgMetaNodeRegistrationVote",
    aminoType: "stratos/MsgMetaNodeRegistrationVote",
  ),
  stratosRegisterV1MsgMetaNodeRegistrationVoteResponse(
    typeUrl: '/stratos.register.v1.MsgMetaNodeRegistrationVoteResponse',
  ),
  stratosRegisterV1MsgKickMetaNodeVote(
    typeUrl: '/stratos.register.v1.MsgKickMetaNodeVote',
    serviceUrl: "/stratos.register.v1.Msg/HandleMsgKickMetaNodeVote",
    aminoType: "stratos/MsgKickMetaNodeVote",
  ),
  stratosRegisterV1MsgKickMetaNodeVoteResponse(
    typeUrl: '/stratos.register.v1.MsgKickMetaNodeVoteResponse',
  ),
  stratosRegisterV1MsgUpdateParams(
    typeUrl: '/stratos.register.v1.MsgUpdateParams',
    serviceUrl: "/stratos.register.v1.Msg/UpdateParams",
    aminoType: "stratos/x/register/MsgUpdateParams",
  ),
  stratosRegisterV1MsgUpdateParamsResponse(
    typeUrl: '/stratos.register.v1.MsgUpdateParamsResponse',
  ),
  stratosRegisterV1Params(
    typeUrl: '/stratos.register.v1.Params',
    aminoType: "stratos/x/register/Params",
  ),
  stratosRegisterV1ResourceNode(typeUrl: '/stratos.register.v1.ResourceNode'),
  stratosRegisterV1MetaNode(typeUrl: '/stratos.register.v1.MetaNode'),
  stratosRegisterV1Description(typeUrl: '/stratos.register.v1.Description'),
  stratosEvmV1QueryAccountRequest(
    typeUrl: '/stratos.evm.v1.QueryAccountRequest',
    serviceUrl: "/stratos.evm.v1.Query/Account",
  ),
  stratosEvmV1QueryAccountResponse(
    typeUrl: '/stratos.evm.v1.QueryAccountResponse',
  ),
  stratosEvmV1QueryCosmosAccountRequest(
    typeUrl: '/stratos.evm.v1.QueryCosmosAccountRequest',
    serviceUrl: "/stratos.evm.v1.Query/CosmosAccount",
  ),
  stratosEvmV1QueryCosmosAccountResponse(
    typeUrl: '/stratos.evm.v1.QueryCosmosAccountResponse',
  ),
  stratosEvmV1QueryValidatorAccountRequest(
    typeUrl: '/stratos.evm.v1.QueryValidatorAccountRequest',
    serviceUrl: "/stratos.evm.v1.Query/ValidatorAccount",
  ),
  stratosEvmV1QueryValidatorAccountResponse(
    typeUrl: '/stratos.evm.v1.QueryValidatorAccountResponse',
  ),
  stratosEvmV1QueryBalanceRequest(
    typeUrl: '/stratos.evm.v1.QueryBalanceRequest',
    serviceUrl: "/stratos.evm.v1.Query/Balance",
  ),
  stratosEvmV1QueryBalanceResponse(
    typeUrl: '/stratos.evm.v1.QueryBalanceResponse',
  ),
  stratosEvmV1QueryStorageRequest(
    typeUrl: '/stratos.evm.v1.QueryStorageRequest',
    serviceUrl: "/stratos.evm.v1.Query/Storage",
  ),
  stratosEvmV1QueryStorageResponse(
    typeUrl: '/stratos.evm.v1.QueryStorageResponse',
  ),
  stratosEvmV1QueryCodeRequest(
    typeUrl: '/stratos.evm.v1.QueryCodeRequest',
    serviceUrl: "/stratos.evm.v1.Query/Code",
  ),
  stratosEvmV1QueryCodeResponse(typeUrl: '/stratos.evm.v1.QueryCodeResponse'),
  stratosEvmV1QueryParamsRequest(
    typeUrl: '/stratos.evm.v1.QueryParamsRequest',
    serviceUrl: "/stratos.evm.v1.Query/Params",
  ),
  stratosEvmV1QueryParamsResponse(
    typeUrl: '/stratos.evm.v1.QueryParamsResponse',
  ),
  stratosEvmV1EthCallRequest(
    typeUrl: '/stratos.evm.v1.EthCallRequest',
    serviceUrl: "/stratos.evm.v1.Query/EthCall",
  ),
  stratosEvmV1EstimateGasResponse(
    typeUrl: '/stratos.evm.v1.EstimateGasResponse',
  ),
  stratosEvmV1QueryTraceTxRequest(
    typeUrl: '/stratos.evm.v1.QueryTraceTxRequest',
    serviceUrl: "/stratos.evm.v1.Query/TraceTx",
  ),
  stratosEvmV1QueryTraceTxResponse(
    typeUrl: '/stratos.evm.v1.QueryTraceTxResponse',
  ),
  stratosEvmV1QueryTraceBlockRequest(
    typeUrl: '/stratos.evm.v1.QueryTraceBlockRequest',
    serviceUrl: "/stratos.evm.v1.Query/TraceBlock",
  ),
  stratosEvmV1QueryTraceBlockResponse(
    typeUrl: '/stratos.evm.v1.QueryTraceBlockResponse',
  ),
  stratosEvmV1QueryBaseFeeRequest(
    typeUrl: '/stratos.evm.v1.QueryBaseFeeRequest',
    serviceUrl: "/stratos.evm.v1.Query/BaseFee",
  ),
  stratosEvmV1QueryBaseFeeResponse(
    typeUrl: '/stratos.evm.v1.QueryBaseFeeResponse',
  ),
  stratosEvmV1QueryBlockGasRequest(
    typeUrl: '/stratos.evm.v1.QueryBlockGasRequest',
    serviceUrl: "/stratos.evm.v1.Query/BlockGas",
  ),
  stratosEvmV1QueryBlockGasResponse(
    typeUrl: '/stratos.evm.v1.QueryBlockGasResponse',
  ),
  stratosEvmV1QueryAddressConvertRequest(
    typeUrl: '/stratos.evm.v1.QueryAddressConvertRequest',
    serviceUrl: "/stratos.evm.v1.Query/AddressConvert",
  ),
  stratosEvmV1QueryAddressConvertResponse(
    typeUrl: '/stratos.evm.v1.QueryAddressConvertResponse',
  ),
  stratosEvmV1Params(
    typeUrl: '/stratos.evm.v1.Params',
    aminoType: "stratos/x/evm/Params",
  ),
  stratosEvmV1ChainConfig(typeUrl: '/stratos.evm.v1.ChainConfig'),
  stratosEvmV1Log(typeUrl: '/stratos.evm.v1.Log'),
  stratosEvmV1TraceConfig(typeUrl: '/stratos.evm.v1.TraceConfig'),
  stratosEvmV1FeeMarketParams(typeUrl: '/stratos.evm.v1.FeeMarketParams'),
  stratosEvmV1MsgEthereumTx(
    typeUrl: '/stratos.evm.v1.MsgEthereumTx',
    serviceUrl: "/stratos.evm.v1.Msg/EthereumTx",
  ),
  stratosEvmV1MsgEthereumTxResponse(
    typeUrl: '/stratos.evm.v1.MsgEthereumTxResponse',
  ),
  stratosEvmV1MsgUpdateParams(
    typeUrl: '/stratos.evm.v1.MsgUpdateParams',
    serviceUrl: "/stratos.evm.v1.Msg/UpdateParams",
  ),
  stratosEvmV1MsgUpdateParamsResponse(
    typeUrl: '/stratos.evm.v1.MsgUpdateParamsResponse',
  ),
  stratosEvmV1MsgUpdateImplmentationProposal(
    typeUrl: '/stratos.evm.v1.MsgUpdateImplmentationProposal',
    serviceUrl: "/stratos.evm.v1.Msg/UpdateImplmentationProposal",
  ),
  stratosEvmV1MsgUpdateImplmentationProposalResponse(
    typeUrl: '/stratos.evm.v1.MsgUpdateImplmentationProposalResponse',
  ),
  stratosCryptoV1Ethsecp256k1PubKey(
    typeUrl: '/stratos.crypto.v1.ethsecp256k1.PubKey',
  ),
  stratosCryptoV1Ethsecp256k1PrivKey(
    typeUrl: '/stratos.crypto.v1.ethsecp256k1.PrivKey',
  ),
  chain4energyC4echainCfevestingQueryParamsRequest(
    typeUrl: '/chain4energy.c4echain.cfevesting.QueryParamsRequest',
    serviceUrl: "/chain4energy.c4echain.cfevesting.Query/Params",
  ),
  chain4energyC4echainCfevestingQueryParamsResponse(
    typeUrl: '/chain4energy.c4echain.cfevesting.QueryParamsResponse',
  ),
  chain4energyC4echainCfevestingQueryVestingTypeRequest(
    typeUrl: '/chain4energy.c4echain.cfevesting.QueryVestingTypeRequest',
    serviceUrl: "/chain4energy.c4echain.cfevesting.Query/VestingType",
  ),
  chain4energyC4echainCfevestingQueryVestingTypeResponse(
    typeUrl: '/chain4energy.c4echain.cfevesting.QueryVestingTypeResponse',
  ),
  chain4energyC4echainCfevestingQueryVestingPoolsRequest(
    typeUrl: '/chain4energy.c4echain.cfevesting.QueryVestingPoolsRequest',
    serviceUrl: "/chain4energy.c4echain.cfevesting.Query/VestingPools",
  ),
  chain4energyC4echainCfevestingQueryVestingPoolsResponse(
    typeUrl: '/chain4energy.c4echain.cfevesting.QueryVestingPoolsResponse',
  ),
  chain4energyC4echainCfevestingVestingPoolInfo(
    typeUrl: '/chain4energy.c4echain.cfevesting.VestingPoolInfo',
  ),
  chain4energyC4echainCfevestingQueryVestingsSummaryRequest(
    typeUrl: '/chain4energy.c4echain.cfevesting.QueryVestingsSummaryRequest',
    serviceUrl: "/chain4energy.c4echain.cfevesting.Query/VestingsSummary",
  ),
  chain4energyC4echainCfevestingQueryVestingsSummaryResponse(
    typeUrl: '/chain4energy.c4echain.cfevesting.QueryVestingsSummaryResponse',
  ),
  chain4energyC4echainCfevestingQueryGenesisVestingsSummaryRequest(
    typeUrl:
        '/chain4energy.c4echain.cfevesting.QueryGenesisVestingsSummaryRequest',
    serviceUrl:
        "/chain4energy.c4echain.cfevesting.Query/GenesisVestingsSummary",
  ),
  chain4energyC4echainCfevestingQueryGenesisVestingsSummaryResponse(
    typeUrl:
        '/chain4energy.c4echain.cfevesting.QueryGenesisVestingsSummaryResponse',
  ),
  chain4energyC4echainCfevestingVestingPoolReservation(
    typeUrl: '/chain4energy.c4echain.cfevesting.VestingPoolReservation',
  ),
  chain4energyC4echainCfevestingGenesisVestingType(
    typeUrl: '/chain4energy.c4echain.cfevesting.GenesisVestingType',
  ),
  chain4energyC4echainCfevestingParams(
    typeUrl: '/chain4energy.c4echain.cfevesting.Params',
  ),
  chain4energyC4echainCfevestingMsgCreateVestingPool(
    typeUrl: '/chain4energy.c4echain.cfevesting.MsgCreateVestingPool',
    serviceUrl: "/chain4energy.c4echain.cfevesting.Msg/CreateVestingPool",
  ),
  chain4energyC4echainCfevestingMsgCreateVestingPoolResponse(
    typeUrl: '/chain4energy.c4echain.cfevesting.MsgCreateVestingPoolResponse',
  ),
  chain4energyC4echainCfevestingMsgWithdrawAllAvailable(
    typeUrl: '/chain4energy.c4echain.cfevesting.MsgWithdrawAllAvailable',
    serviceUrl: "/chain4energy.c4echain.cfevesting.Msg/WithdrawAllAvailable",
  ),
  chain4energyC4echainCfevestingMsgWithdrawAllAvailableResponse(
    typeUrl:
        '/chain4energy.c4echain.cfevesting.MsgWithdrawAllAvailableResponse',
  ),
  chain4energyC4echainCfevestingMsgCreateVestingAccount(
    typeUrl: '/chain4energy.c4echain.cfevesting.MsgCreateVestingAccount',
    serviceUrl: "/chain4energy.c4echain.cfevesting.Msg/CreateVestingAccount",
  ),
  chain4energyC4echainCfevestingMsgCreateVestingAccountResponse(
    typeUrl:
        '/chain4energy.c4echain.cfevesting.MsgCreateVestingAccountResponse',
  ),
  chain4energyC4echainCfevestingMsgSendToVestingAccount(
    typeUrl: '/chain4energy.c4echain.cfevesting.MsgSendToVestingAccount',
    serviceUrl: "/chain4energy.c4echain.cfevesting.Msg/SendToVestingAccount",
  ),
  chain4energyC4echainCfevestingMsgSendToVestingAccountResponse(
    typeUrl:
        '/chain4energy.c4echain.cfevesting.MsgSendToVestingAccountResponse',
  ),
  chain4energyC4echainCfevestingMsgSplitVesting(
    typeUrl: '/chain4energy.c4echain.cfevesting.MsgSplitVesting',
    serviceUrl: "/chain4energy.c4echain.cfevesting.Msg/SplitVesting",
  ),
  chain4energyC4echainCfevestingMsgSplitVestingResponse(
    typeUrl: '/chain4energy.c4echain.cfevesting.MsgSplitVestingResponse',
  ),
  chain4energyC4echainCfevestingMsgMoveAvailableVesting(
    typeUrl: '/chain4energy.c4echain.cfevesting.MsgMoveAvailableVesting',
    serviceUrl: "/chain4energy.c4echain.cfevesting.Msg/MoveAvailableVesting",
  ),
  chain4energyC4echainCfevestingMsgMoveAvailableVestingResponse(
    typeUrl:
        '/chain4energy.c4echain.cfevesting.MsgMoveAvailableVestingResponse',
  ),
  chain4energyC4echainCfevestingMsgMoveAvailableVestingByDenoms(
    typeUrl:
        '/chain4energy.c4echain.cfevesting.MsgMoveAvailableVestingByDenoms',
    serviceUrl:
        "/chain4energy.c4echain.cfevesting.Msg/MoveAvailableVestingByDenoms",
  ),
  chain4energyC4echainCfevestingMsgMoveAvailableVestingByDenomsResponse(
    typeUrl:
        '/chain4energy.c4echain.cfevesting.MsgMoveAvailableVestingByDenomsResponse',
  ),
  chain4energyC4echainCfevestingMsgUpdateDenomParam(
    typeUrl: '/chain4energy.c4echain.cfevesting.MsgUpdateDenomParam',
    serviceUrl: "/chain4energy.c4echain.cfevesting.Msg/UpdateDenomParam",
  ),
  chain4energyC4echainCfevestingMsgUpdateDenomParamResponse(
    typeUrl: '/chain4energy.c4echain.cfevesting.MsgUpdateDenomParamResponse',
  ),
  chain4energyC4echainCfedistributorQueryParamsRequest(
    typeUrl: '/chain4energy.c4echain.cfedistributor.QueryParamsRequest',
    serviceUrl: "/chain4energy.c4echain.cfedistributor.Query/Params",
  ),
  chain4energyC4echainCfedistributorQueryParamsResponse(
    typeUrl: '/chain4energy.c4echain.cfedistributor.QueryParamsResponse',
  ),
  chain4energyC4echainCfedistributorQueryStatesRequest(
    typeUrl: '/chain4energy.c4echain.cfedistributor.QueryStatesRequest',
    serviceUrl: "/chain4energy.c4echain.cfedistributor.Query/States",
  ),
  chain4energyC4echainCfedistributorQueryStatesResponse(
    typeUrl: '/chain4energy.c4echain.cfedistributor.QueryStatesResponse',
  ),
  chain4energyC4echainCfedistributorState(
    typeUrl: '/chain4energy.c4echain.cfedistributor.State',
  ),
  chain4energyC4echainCfedistributorSubDistributor(
    typeUrl: '/chain4energy.c4echain.cfedistributor.SubDistributor',
  ),
  chain4energyC4echainCfedistributorDestinations(
    typeUrl: '/chain4energy.c4echain.cfedistributor.Destinations',
  ),
  chain4energyC4echainCfedistributorDestinationShare(
    typeUrl: '/chain4energy.c4echain.cfedistributor.DestinationShare',
  ),
  chain4energyC4echainCfedistributorAccount(
    typeUrl: '/chain4energy.c4echain.cfedistributor.Account',
  ),
  chain4energyC4echainCfedistributorParams(
    typeUrl: '/chain4energy.c4echain.cfedistributor.Params',
  ),
  chain4energyC4echainCfedistributorMsgUpdateParams(
    typeUrl: '/chain4energy.c4echain.cfedistributor.MsgUpdateParams',
    serviceUrl: "/chain4energy.c4echain.cfedistributor.Msg/UpdateParams",
  ),
  chain4energyC4echainCfedistributorMsgUpdateParamsResponse(
    typeUrl: '/chain4energy.c4echain.cfedistributor.MsgUpdateParamsResponse',
  ),
  chain4energyC4echainCfedistributorMsgUpdateSubDistributorParam(
    typeUrl:
        '/chain4energy.c4echain.cfedistributor.MsgUpdateSubDistributorParam',
    serviceUrl:
        "/chain4energy.c4echain.cfedistributor.Msg/UpdateSubDistributorParam",
  ),
  chain4energyC4echainCfedistributorMsgUpdateSubDistributorParamResponse(
    typeUrl:
        '/chain4energy.c4echain.cfedistributor.MsgUpdateSubDistributorParamResponse',
  ),
  chain4energyC4echainCfedistributorMsgUpdateSubDistributorDestinationShareParam(
    typeUrl:
        '/chain4energy.c4echain.cfedistributor.MsgUpdateSubDistributorDestinationShareParam',
    serviceUrl:
        "/chain4energy.c4echain.cfedistributor.Msg/UpdateSubDistributorDestinationShareParam",
  ),
  chain4energyC4echainCfedistributorMsgUpdateSubDistributorDestinationShareParamResponse(
    typeUrl:
        '/chain4energy.c4echain.cfedistributor.MsgUpdateSubDistributorDestinationShareParamResponse',
  ),
  chain4energyC4echainCfedistributorMsgUpdateSubDistributorBurnShareParam(
    typeUrl:
        '/chain4energy.c4echain.cfedistributor.MsgUpdateSubDistributorBurnShareParam',
    serviceUrl:
        "/chain4energy.c4echain.cfedistributor.Msg/UpdateSubDistributorBurnShareParam",
  ),
  chain4energyC4echainCfedistributorMsgUpdateSubDistributorBurnShareParamResponse(
    typeUrl:
        '/chain4energy.c4echain.cfedistributor.MsgUpdateSubDistributorBurnShareParamResponse',
  ),
  chain4energyC4echainCfeminterQueryParamsRequest(
    typeUrl: '/chain4energy.c4echain.cfeminter.QueryParamsRequest',
    serviceUrl: "/chain4energy.c4echain.cfeminter.Query/Params",
  ),
  chain4energyC4echainCfeminterQueryParamsResponse(
    typeUrl: '/chain4energy.c4echain.cfeminter.QueryParamsResponse',
  ),
  chain4energyC4echainCfeminterQueryInflationRequest(
    typeUrl: '/chain4energy.c4echain.cfeminter.QueryInflationRequest',
    serviceUrl: "/chain4energy.c4echain.cfeminter.Query/Inflation",
  ),
  chain4energyC4echainCfeminterQueryInflationResponse(
    typeUrl: '/chain4energy.c4echain.cfeminter.QueryInflationResponse',
  ),
  chain4energyC4echainCfeminterQueryStateRequest(
    typeUrl: '/chain4energy.c4echain.cfeminter.QueryStateRequest',
    serviceUrl: "/chain4energy.c4echain.cfeminter.Query/State",
  ),
  chain4energyC4echainCfeminterQueryStateResponse(
    typeUrl: '/chain4energy.c4echain.cfeminter.QueryStateResponse',
  ),
  chain4energyC4echainCfeminterMinter(
    typeUrl: '/chain4energy.c4echain.cfeminter.Minter',
  ),
  chain4energyC4echainCfeminterMinterState(
    typeUrl: '/chain4energy.c4echain.cfeminter.MinterState',
  ),
  chain4energyC4echainCfeminterParams(
    typeUrl: '/chain4energy.c4echain.cfeminter.Params',
  ),
  chain4energyC4echainCfeminterMsgBurn(
    typeUrl: '/chain4energy.c4echain.cfeminter.MsgBurn',
    serviceUrl: "/chain4energy.c4echain.cfeminter.Msg/Burn",
  ),
  chain4energyC4echainCfeminterMsgBurnResponse(
    typeUrl: '/chain4energy.c4echain.cfeminter.MsgBurnResponse',
  ),
  chain4energyC4echainCfeminterMsgUpdateParams(
    typeUrl: '/chain4energy.c4echain.cfeminter.MsgUpdateParams',
    serviceUrl: "/chain4energy.c4echain.cfeminter.Msg/UpdateParams",
  ),
  chain4energyC4echainCfeminterMsgUpdateParamsResponse(
    typeUrl: '/chain4energy.c4echain.cfeminter.MsgUpdateParamsResponse',
  ),
  chain4energyC4echainCfeminterMsgUpdateMintersParams(
    typeUrl: '/chain4energy.c4echain.cfeminter.MsgUpdateMintersParams',
    serviceUrl: "/chain4energy.c4echain.cfeminter.Msg/UpdateMintersParams",
  ),
  chain4energyC4echainCfeminterMsgUpdateMintersParamsResponse(
    typeUrl: '/chain4energy.c4echain.cfeminter.MsgUpdateMintersParamsResponse',
  ),
  chain4energyC4echainCfeclaimQueryUserEntryRequest(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryUserEntryRequest',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Query/UserEntry",
  ),
  chain4energyC4echainCfeclaimQueryUserEntryResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryUserEntryResponse',
  ),
  chain4energyC4echainCfeclaimQueryUsersEntriesRequest(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryUsersEntriesRequest',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Query/UsersEntries",
  ),
  chain4energyC4echainCfeclaimQueryUsersEntriesResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryUsersEntriesResponse',
  ),
  chain4energyC4echainCfeclaimQueryMissionRequest(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryMissionRequest',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Query/Mission",
  ),
  chain4energyC4echainCfeclaimQueryMissionResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryMissionResponse',
  ),
  chain4energyC4echainCfeclaimQueryMissionsRequest(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryMissionsRequest',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Query/Missions",
  ),
  chain4energyC4echainCfeclaimQueryMissionsResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryMissionsResponse',
  ),
  chain4energyC4echainCfeclaimQueryCampaignMissionsRequest(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryCampaignMissionsRequest',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Query/CampaignMissions",
  ),
  chain4energyC4echainCfeclaimQueryCampaignMissionsResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryCampaignMissionsResponse',
  ),
  chain4energyC4echainCfeclaimQueryCampaignsRequest(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryCampaignsRequest',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Query/Campaigns",
  ),
  chain4energyC4echainCfeclaimQueryCampaignsResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryCampaignsResponse',
  ),
  chain4energyC4echainCfeclaimQueryCampaignRequest(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryCampaignRequest',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Query/Campaign",
  ),
  chain4energyC4echainCfeclaimQueryCampaignResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.QueryCampaignResponse',
  ),
  chain4energyC4echainCfeclaimCampaign(
    typeUrl: '/chain4energy.c4echain.cfeclaim.Campaign',
  ),
  chain4energyC4echainCfeclaimUserEntry(
    typeUrl: '/chain4energy.c4echain.cfeclaim.UserEntry',
  ),
  chain4energyC4echainCfeclaimClaimRecord(
    typeUrl: '/chain4energy.c4echain.cfeclaim.ClaimRecord',
  ),
  chain4energyC4echainCfeclaimClaimRecordEntry(
    typeUrl: '/chain4energy.c4echain.cfeclaim.ClaimRecordEntry',
  ),
  chain4energyC4echainCfeclaimMsgClaim(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgClaim',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Msg/Claim",
  ),
  chain4energyC4echainCfeclaimMsgClaimResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgClaimResponse',
  ),
  chain4energyC4echainCfeclaimMsgInitialClaim(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgInitialClaim',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Msg/InitialClaim",
  ),
  chain4energyC4echainCfeclaimMsgInitialClaimResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgInitialClaimResponse',
  ),
  chain4energyC4echainCfeclaimMsgCreateCampaign(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgCreateCampaign',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Msg/CreateCampaign",
  ),
  chain4energyC4echainCfeclaimMsgCreateCampaignResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgCreateCampaignResponse',
  ),
  chain4energyC4echainCfeclaimMsgAddMission(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgAddMission',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Msg/AddMission",
  ),
  chain4energyC4echainCfeclaimMsgAddMissionResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgAddMissionResponse',
  ),
  chain4energyC4echainCfeclaimMsgAddClaimRecords(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgAddClaimRecords',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Msg/AddClaimRecords",
  ),
  chain4energyC4echainCfeclaimMsgAddClaimRecordsResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgAddClaimRecordsResponse',
  ),
  chain4energyC4echainCfeclaimMsgDeleteClaimRecord(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgDeleteClaimRecord',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Msg/DeleteClaimRecord",
  ),
  chain4energyC4echainCfeclaimMsgDeleteClaimRecordResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgDeleteClaimRecordResponse',
  ),
  chain4energyC4echainCfeclaimMsgCloseCampaign(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgCloseCampaign',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Msg/CloseCampaign",
  ),
  chain4energyC4echainCfeclaimMsgCloseCampaignResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgCloseCampaignResponse',
  ),
  chain4energyC4echainCfeclaimMsgEnableCampaign(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgEnableCampaign',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Msg/EnableCampaign",
  ),
  chain4energyC4echainCfeclaimMsgEnableCampaignResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgEnableCampaignResponse',
  ),
  chain4energyC4echainCfeclaimMsgRemoveCampaign(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgRemoveCampaign',
    serviceUrl: "/chain4energy.c4echain.cfeclaim.Msg/RemoveCampaign",
  ),
  chain4energyC4echainCfeclaimMsgRemoveCampaignResponse(
    typeUrl: '/chain4energy.c4echain.cfeclaim.MsgRemoveCampaignResponse',
  ),
  chain4energyC4echainCfeclaimMission(
    typeUrl: '/chain4energy.c4echain.cfeclaim.Mission',
  ),
  injectiveExchangeV2Subaccount(typeUrl: '/injective.exchange.v2.Subaccount'),
  injectiveExchangeV2QuerySubaccountOrdersRequest(
    typeUrl: '/injective.exchange.v2.QuerySubaccountOrdersRequest',
    serviceUrl: "/injective.exchange.v2.Query/SubaccountOrders",
  ),
  injectiveExchangeV2QuerySubaccountOrdersResponse(
    typeUrl: '/injective.exchange.v2.QuerySubaccountOrdersResponse',
  ),
  injectiveExchangeV2SubaccountOrderbookMetadataWithMarket(
    typeUrl: '/injective.exchange.v2.SubaccountOrderbookMetadataWithMarket',
  ),
  injectiveExchangeV2QueryExchangeParamsRequest(
    typeUrl: '/injective.exchange.v2.QueryExchangeParamsRequest',
    serviceUrl: "/injective.exchange.v2.Query/QueryExchangeParams",
  ),
  injectiveExchangeV2QueryExchangeParamsResponse(
    typeUrl: '/injective.exchange.v2.QueryExchangeParamsResponse',
  ),
  injectiveExchangeV2QuerySubaccountDepositsRequest(
    typeUrl: '/injective.exchange.v2.QuerySubaccountDepositsRequest',
    serviceUrl: "/injective.exchange.v2.Query/SubaccountDeposits",
  ),
  injectiveExchangeV2QuerySubaccountDepositsResponse(
    typeUrl: '/injective.exchange.v2.QuerySubaccountDepositsResponse',
  ),
  injectiveExchangeV2QueryExchangeBalancesRequest(
    typeUrl: '/injective.exchange.v2.QueryExchangeBalancesRequest',
    serviceUrl: "/injective.exchange.v2.Query/ExchangeBalances",
  ),
  injectiveExchangeV2QueryExchangeBalancesResponse(
    typeUrl: '/injective.exchange.v2.QueryExchangeBalancesResponse',
  ),
  injectiveExchangeV2QueryAggregateVolumeRequest(
    typeUrl: '/injective.exchange.v2.QueryAggregateVolumeRequest',
    serviceUrl: "/injective.exchange.v2.Query/AggregateVolume",
  ),
  injectiveExchangeV2QueryAggregateVolumeResponse(
    typeUrl: '/injective.exchange.v2.QueryAggregateVolumeResponse',
  ),
  injectiveExchangeV2QueryAggregateVolumesRequest(
    typeUrl: '/injective.exchange.v2.QueryAggregateVolumesRequest',
    serviceUrl: "/injective.exchange.v2.Query/AggregateVolumes",
  ),
  injectiveExchangeV2QueryAggregateVolumesResponse(
    typeUrl: '/injective.exchange.v2.QueryAggregateVolumesResponse',
  ),
  injectiveExchangeV2QueryAggregateMarketVolumeRequest(
    typeUrl: '/injective.exchange.v2.QueryAggregateMarketVolumeRequest',
    serviceUrl: "/injective.exchange.v2.Query/AggregateMarketVolume",
  ),
  injectiveExchangeV2QueryAggregateMarketVolumeResponse(
    typeUrl: '/injective.exchange.v2.QueryAggregateMarketVolumeResponse',
  ),
  injectiveExchangeV2QueryAuctionExchangeTransferDenomDecimalRequest(
    typeUrl:
        '/injective.exchange.v2.QueryAuctionExchangeTransferDenomDecimalRequest',
    serviceUrl:
        "/injective.exchange.v2.Query/AuctionExchangeTransferDenomDecimal",
  ),
  injectiveExchangeV2QueryAuctionExchangeTransferDenomDecimalResponse(
    typeUrl:
        '/injective.exchange.v2.QueryAuctionExchangeTransferDenomDecimalResponse',
  ),
  injectiveExchangeV2QueryAuctionExchangeTransferDenomDecimalsRequest(
    typeUrl:
        '/injective.exchange.v2.QueryAuctionExchangeTransferDenomDecimalsRequest',
    serviceUrl:
        "/injective.exchange.v2.Query/AuctionExchangeTransferDenomDecimals",
  ),
  injectiveExchangeV2QueryAuctionExchangeTransferDenomDecimalsResponse(
    typeUrl:
        '/injective.exchange.v2.QueryAuctionExchangeTransferDenomDecimalsResponse',
  ),
  injectiveExchangeV2QueryAggregateMarketVolumesRequest(
    typeUrl: '/injective.exchange.v2.QueryAggregateMarketVolumesRequest',
    serviceUrl: "/injective.exchange.v2.Query/AggregateMarketVolumes",
  ),
  injectiveExchangeV2QueryAggregateMarketVolumesResponse(
    typeUrl: '/injective.exchange.v2.QueryAggregateMarketVolumesResponse',
  ),
  injectiveExchangeV2QuerySubaccountDepositRequest(
    typeUrl: '/injective.exchange.v2.QuerySubaccountDepositRequest',
    serviceUrl: "/injective.exchange.v2.Query/SubaccountDeposit",
  ),
  injectiveExchangeV2QuerySubaccountDepositResponse(
    typeUrl: '/injective.exchange.v2.QuerySubaccountDepositResponse',
  ),
  injectiveExchangeV2QuerySpotMarketsRequest(
    typeUrl: '/injective.exchange.v2.QuerySpotMarketsRequest',
    serviceUrl: "/injective.exchange.v2.Query/SpotMarkets",
  ),
  injectiveExchangeV2QuerySpotMarketsResponse(
    typeUrl: '/injective.exchange.v2.QuerySpotMarketsResponse',
  ),
  injectiveExchangeV2QuerySpotMarketRequest(
    typeUrl: '/injective.exchange.v2.QuerySpotMarketRequest',
    serviceUrl: "/injective.exchange.v2.Query/SpotMarket",
  ),
  injectiveExchangeV2QuerySpotMarketResponse(
    typeUrl: '/injective.exchange.v2.QuerySpotMarketResponse',
  ),
  injectiveExchangeV2QuerySpotOrderbookRequest(
    typeUrl: '/injective.exchange.v2.QuerySpotOrderbookRequest',
    serviceUrl: "/injective.exchange.v2.Query/SpotOrderbook",
  ),
  injectiveExchangeV2QuerySpotOrderbookResponse(
    typeUrl: '/injective.exchange.v2.QuerySpotOrderbookResponse',
  ),
  injectiveExchangeV2FullSpotMarket(
    typeUrl: '/injective.exchange.v2.FullSpotMarket',
  ),
  injectiveExchangeV2QueryFullSpotMarketsRequest(
    typeUrl: '/injective.exchange.v2.QueryFullSpotMarketsRequest',
    serviceUrl: "/injective.exchange.v2.Query/FullSpotMarkets",
  ),
  injectiveExchangeV2QueryFullSpotMarketsResponse(
    typeUrl: '/injective.exchange.v2.QueryFullSpotMarketsResponse',
  ),
  injectiveExchangeV2QueryFullSpotMarketRequest(
    typeUrl: '/injective.exchange.v2.QueryFullSpotMarketRequest',
    serviceUrl: "/injective.exchange.v2.Query/FullSpotMarket",
  ),
  injectiveExchangeV2QueryFullSpotMarketResponse(
    typeUrl: '/injective.exchange.v2.QueryFullSpotMarketResponse',
  ),
  injectiveExchangeV2QuerySpotOrdersByHashesRequest(
    typeUrl: '/injective.exchange.v2.QuerySpotOrdersByHashesRequest',
    serviceUrl: "/injective.exchange.v2.Query/SpotOrdersByHashes",
  ),
  injectiveExchangeV2QuerySpotOrdersByHashesResponse(
    typeUrl: '/injective.exchange.v2.QuerySpotOrdersByHashesResponse',
  ),
  injectiveExchangeV2QueryTraderSpotOrdersRequest(
    typeUrl: '/injective.exchange.v2.QueryTraderSpotOrdersRequest',
    serviceUrl: "/injective.exchange.v2.Query/TraderSpotOrders",
  ),
  injectiveExchangeV2QueryAccountAddressSpotOrdersRequest(
    typeUrl: '/injective.exchange.v2.QueryAccountAddressSpotOrdersRequest',
    serviceUrl: "/injective.exchange.v2.Query/AccountAddressSpotOrders",
  ),
  injectiveExchangeV2TrimmedSpotLimitOrder(
    typeUrl: '/injective.exchange.v2.TrimmedSpotLimitOrder',
  ),
  injectiveExchangeV2QueryTraderSpotOrdersResponse(
    typeUrl: '/injective.exchange.v2.QueryTraderSpotOrdersResponse',
  ),
  injectiveExchangeV2QueryAccountAddressSpotOrdersResponse(
    typeUrl: '/injective.exchange.v2.QueryAccountAddressSpotOrdersResponse',
  ),
  injectiveExchangeV2QuerySpotMidPriceAndTOBRequest(
    typeUrl: '/injective.exchange.v2.QuerySpotMidPriceAndTOBRequest',
    serviceUrl: "/injective.exchange.v2.Query/SpotMidPriceAndTOB",
  ),
  injectiveExchangeV2QuerySpotMidPriceAndTOBResponse(
    typeUrl: '/injective.exchange.v2.QuerySpotMidPriceAndTOBResponse',
  ),
  injectiveExchangeV2QueryDerivativeMidPriceAndTOBRequest(
    typeUrl: '/injective.exchange.v2.QueryDerivativeMidPriceAndTOBRequest',
    serviceUrl: "/injective.exchange.v2.Query/DerivativeMidPriceAndTOB",
  ),
  injectiveExchangeV2QueryDerivativeMidPriceAndTOBResponse(
    typeUrl: '/injective.exchange.v2.QueryDerivativeMidPriceAndTOBResponse',
  ),
  injectiveExchangeV2QueryDerivativeOrderbookRequest(
    typeUrl: '/injective.exchange.v2.QueryDerivativeOrderbookRequest',
    serviceUrl: "/injective.exchange.v2.Query/DerivativeOrderbook",
  ),
  injectiveExchangeV2QueryDerivativeOrderbookResponse(
    typeUrl: '/injective.exchange.v2.QueryDerivativeOrderbookResponse',
  ),
  injectiveExchangeV2QueryTraderDerivativeOrdersRequest(
    typeUrl: '/injective.exchange.v2.QueryTraderDerivativeOrdersRequest',
    serviceUrl: "/injective.exchange.v2.Query/TraderDerivativeOrders",
  ),
  injectiveExchangeV2QueryAccountAddressDerivativeOrdersRequest(
    typeUrl:
        '/injective.exchange.v2.QueryAccountAddressDerivativeOrdersRequest',
    serviceUrl: "/injective.exchange.v2.Query/AccountAddressDerivativeOrders",
  ),
  injectiveExchangeV2TrimmedDerivativeLimitOrder(
    typeUrl: '/injective.exchange.v2.TrimmedDerivativeLimitOrder',
  ),
  injectiveExchangeV2QueryTraderDerivativeOrdersResponse(
    typeUrl: '/injective.exchange.v2.QueryTraderDerivativeOrdersResponse',
  ),
  injectiveExchangeV2QueryAccountAddressDerivativeOrdersResponse(
    typeUrl:
        '/injective.exchange.v2.QueryAccountAddressDerivativeOrdersResponse',
  ),
  injectiveExchangeV2QueryDerivativeOrdersByHashesRequest(
    typeUrl: '/injective.exchange.v2.QueryDerivativeOrdersByHashesRequest',
    serviceUrl: "/injective.exchange.v2.Query/DerivativeOrdersByHashes",
  ),
  injectiveExchangeV2QueryDerivativeOrdersByHashesResponse(
    typeUrl: '/injective.exchange.v2.QueryDerivativeOrdersByHashesResponse',
  ),
  injectiveExchangeV2QueryDerivativeMarketsRequest(
    typeUrl: '/injective.exchange.v2.QueryDerivativeMarketsRequest',
    serviceUrl: "/injective.exchange.v2.Query/DerivativeMarkets",
  ),
  injectiveExchangeV2PerpetualMarketState(
    typeUrl: '/injective.exchange.v2.PerpetualMarketState',
  ),
  injectiveExchangeV2FullDerivativeMarket(
    typeUrl: '/injective.exchange.v2.FullDerivativeMarket',
  ),
  injectiveExchangeV2QueryDerivativeMarketsResponse(
    typeUrl: '/injective.exchange.v2.QueryDerivativeMarketsResponse',
  ),
  injectiveExchangeV2QueryDerivativeMarketRequest(
    typeUrl: '/injective.exchange.v2.QueryDerivativeMarketRequest',
    serviceUrl: "/injective.exchange.v2.Query/DerivativeMarket",
  ),
  injectiveExchangeV2QueryDerivativeMarketResponse(
    typeUrl: '/injective.exchange.v2.QueryDerivativeMarketResponse',
  ),
  injectiveExchangeV2QueryDerivativeMarketAddressRequest(
    typeUrl: '/injective.exchange.v2.QueryDerivativeMarketAddressRequest',
    serviceUrl: "/injective.exchange.v2.Query/DerivativeMarketAddress",
  ),
  injectiveExchangeV2QueryDerivativeMarketAddressResponse(
    typeUrl: '/injective.exchange.v2.QueryDerivativeMarketAddressResponse',
  ),
  injectiveExchangeV2QuerySubaccountTradeNonceRequest(
    typeUrl: '/injective.exchange.v2.QuerySubaccountTradeNonceRequest',
    serviceUrl: "/injective.exchange.v2.Query/SubaccountTradeNonce",
  ),
  injectiveExchangeV2QueryPositionsInMarketRequest(
    typeUrl: '/injective.exchange.v2.QueryPositionsInMarketRequest',
    serviceUrl: "/injective.exchange.v2.Query/PositionsInMarket",
  ),
  injectiveExchangeV2QueryPositionsInMarketResponse(
    typeUrl: '/injective.exchange.v2.QueryPositionsInMarketResponse',
  ),
  injectiveExchangeV2QuerySubaccountPositionsRequest(
    typeUrl: '/injective.exchange.v2.QuerySubaccountPositionsRequest',
    serviceUrl: "/injective.exchange.v2.Query/SubaccountPositions",
  ),
  injectiveExchangeV2QuerySubaccountPositionInMarketRequest(
    typeUrl: '/injective.exchange.v2.QuerySubaccountPositionInMarketRequest',
    serviceUrl: "/injective.exchange.v2.Query/SubaccountPositionInMarket",
  ),
  injectiveExchangeV2QuerySubaccountEffectivePositionInMarketRequest(
    typeUrl:
        '/injective.exchange.v2.QuerySubaccountEffectivePositionInMarketRequest',
    serviceUrl:
        "/injective.exchange.v2.Query/SubaccountEffectivePositionInMarket",
  ),
  injectiveExchangeV2QuerySubaccountOrderMetadataRequest(
    typeUrl: '/injective.exchange.v2.QuerySubaccountOrderMetadataRequest',
    serviceUrl: "/injective.exchange.v2.Query/SubaccountOrderMetadata",
  ),
  injectiveExchangeV2QuerySubaccountPositionsResponse(
    typeUrl: '/injective.exchange.v2.QuerySubaccountPositionsResponse',
  ),
  injectiveExchangeV2QuerySubaccountPositionInMarketResponse(
    typeUrl: '/injective.exchange.v2.QuerySubaccountPositionInMarketResponse',
  ),
  injectiveExchangeV2EffectivePosition(
    typeUrl: '/injective.exchange.v2.EffectivePosition',
  ),
  injectiveExchangeV2QuerySubaccountEffectivePositionInMarketResponse(
    typeUrl:
        '/injective.exchange.v2.QuerySubaccountEffectivePositionInMarketResponse',
  ),
  injectiveExchangeV2QueryPerpetualMarketInfoRequest(
    typeUrl: '/injective.exchange.v2.QueryPerpetualMarketInfoRequest',
    serviceUrl: "/injective.exchange.v2.Query/PerpetualMarketInfo",
  ),
  injectiveExchangeV2QueryPerpetualMarketInfoResponse(
    typeUrl: '/injective.exchange.v2.QueryPerpetualMarketInfoResponse',
  ),
  injectiveExchangeV2QueryExpiryFuturesMarketInfoRequest(
    typeUrl: '/injective.exchange.v2.QueryExpiryFuturesMarketInfoRequest',
    serviceUrl: "/injective.exchange.v2.Query/ExpiryFuturesMarketInfo",
  ),
  injectiveExchangeV2QueryExpiryFuturesMarketInfoResponse(
    typeUrl: '/injective.exchange.v2.QueryExpiryFuturesMarketInfoResponse',
  ),
  injectiveExchangeV2QueryPerpetualMarketFundingRequest(
    typeUrl: '/injective.exchange.v2.QueryPerpetualMarketFundingRequest',
    serviceUrl: "/injective.exchange.v2.Query/PerpetualMarketFunding",
  ),
  injectiveExchangeV2QueryPerpetualMarketFundingResponse(
    typeUrl: '/injective.exchange.v2.QueryPerpetualMarketFundingResponse',
  ),
  injectiveExchangeV2QuerySubaccountOrderMetadataResponse(
    typeUrl: '/injective.exchange.v2.QuerySubaccountOrderMetadataResponse',
  ),
  injectiveExchangeV2QuerySubaccountTradeNonceResponse(
    typeUrl: '/injective.exchange.v2.QuerySubaccountTradeNonceResponse',
  ),
  injectiveExchangeV2QuerySubaccountRiskProfileRequest(
    typeUrl: '/injective.exchange.v2.QuerySubaccountRiskProfileRequest',
    serviceUrl: "/injective.exchange.v2.Query/SubaccountRiskProfile",
  ),
  injectiveExchangeV2QuerySubaccountRiskProfileResponse(
    typeUrl: '/injective.exchange.v2.QuerySubaccountRiskProfileResponse',
  ),
  injectiveExchangeV2QueryCrossMarginPoolSnapshotRequest(
    typeUrl: '/injective.exchange.v2.QueryCrossMarginPoolSnapshotRequest',
    serviceUrl: "/injective.exchange.v2.Query/CrossMarginPoolSnapshot",
  ),
  injectiveExchangeV2QueryCrossMarginPoolSnapshotResponse(
    typeUrl: '/injective.exchange.v2.QueryCrossMarginPoolSnapshotResponse',
  ),
  injectiveExchangeV2QueryModuleStateRequest(
    typeUrl: '/injective.exchange.v2.QueryModuleStateRequest',
    serviceUrl: "/injective.exchange.v2.Query/ExchangeModuleState",
  ),
  injectiveExchangeV2QueryModuleStateResponse(
    typeUrl: '/injective.exchange.v2.QueryModuleStateResponse',
  ),
  injectiveExchangeV2QueryPositionsRequest(
    typeUrl: '/injective.exchange.v2.QueryPositionsRequest',
    serviceUrl: "/injective.exchange.v2.Query/Positions",
  ),
  injectiveExchangeV2QueryPositionsResponse(
    typeUrl: '/injective.exchange.v2.QueryPositionsResponse',
  ),
  injectiveExchangeV2QueryTradeRewardPointsRequest(
    typeUrl: '/injective.exchange.v2.QueryTradeRewardPointsRequest',
    serviceUrl: "/injective.exchange.v2.Query/TradeRewardPoints",
  ),
  injectiveExchangeV2QueryTradeRewardPointsResponse(
    typeUrl: '/injective.exchange.v2.QueryTradeRewardPointsResponse',
  ),
  injectiveExchangeV2QueryTradeRewardCampaignRequest(
    typeUrl: '/injective.exchange.v2.QueryTradeRewardCampaignRequest',
    serviceUrl: "/injective.exchange.v2.Query/TradeRewardCampaign",
  ),
  injectiveExchangeV2QueryTradeRewardCampaignResponse(
    typeUrl: '/injective.exchange.v2.QueryTradeRewardCampaignResponse',
  ),
  injectiveExchangeV2QueryIsOptedOutOfRewardsRequest(
    typeUrl: '/injective.exchange.v2.QueryIsOptedOutOfRewardsRequest',
    serviceUrl: "/injective.exchange.v2.Query/IsOptedOutOfRewards",
  ),
  injectiveExchangeV2QueryIsOptedOutOfRewardsResponse(
    typeUrl: '/injective.exchange.v2.QueryIsOptedOutOfRewardsResponse',
  ),
  injectiveExchangeV2QueryOptedOutOfRewardsAccountsRequest(
    typeUrl: '/injective.exchange.v2.QueryOptedOutOfRewardsAccountsRequest',
    serviceUrl: "/injective.exchange.v2.Query/OptedOutOfRewardsAccounts",
  ),
  injectiveExchangeV2QueryOptedOutOfRewardsAccountsResponse(
    typeUrl: '/injective.exchange.v2.QueryOptedOutOfRewardsAccountsResponse',
  ),
  injectiveExchangeV2QueryFeeDiscountAccountInfoRequest(
    typeUrl: '/injective.exchange.v2.QueryFeeDiscountAccountInfoRequest',
    serviceUrl: "/injective.exchange.v2.Query/FeeDiscountAccountInfo",
  ),
  injectiveExchangeV2QueryFeeDiscountAccountInfoResponse(
    typeUrl: '/injective.exchange.v2.QueryFeeDiscountAccountInfoResponse',
  ),
  injectiveExchangeV2QueryFeeDiscountScheduleRequest(
    typeUrl: '/injective.exchange.v2.QueryFeeDiscountScheduleRequest',
    serviceUrl: "/injective.exchange.v2.Query/FeeDiscountSchedule",
  ),
  injectiveExchangeV2QueryFeeDiscountScheduleResponse(
    typeUrl: '/injective.exchange.v2.QueryFeeDiscountScheduleResponse',
  ),
  injectiveExchangeV2QueryBalanceMismatchesRequest(
    typeUrl: '/injective.exchange.v2.QueryBalanceMismatchesRequest',
    serviceUrl: "/injective.exchange.v2.Query/BalanceMismatches",
  ),
  injectiveExchangeV2BalanceMismatch(
    typeUrl: '/injective.exchange.v2.BalanceMismatch',
  ),
  injectiveExchangeV2QueryBalanceMismatchesResponse(
    typeUrl: '/injective.exchange.v2.QueryBalanceMismatchesResponse',
  ),
  injectiveExchangeV2QueryBalanceWithBalanceHoldsRequest(
    typeUrl: '/injective.exchange.v2.QueryBalanceWithBalanceHoldsRequest',
    serviceUrl: "/injective.exchange.v2.Query/BalanceWithBalanceHolds",
  ),
  injectiveExchangeV2BalanceWithMarginHold(
    typeUrl: '/injective.exchange.v2.BalanceWithMarginHold',
  ),
  injectiveExchangeV2QueryBalanceWithBalanceHoldsResponse(
    typeUrl: '/injective.exchange.v2.QueryBalanceWithBalanceHoldsResponse',
  ),
  injectiveExchangeV2QueryFeeDiscountTierStatisticsRequest(
    typeUrl: '/injective.exchange.v2.QueryFeeDiscountTierStatisticsRequest',
    serviceUrl: "/injective.exchange.v2.Query/FeeDiscountTierStatistics",
  ),
  injectiveExchangeV2TierStatistic(
    typeUrl: '/injective.exchange.v2.TierStatistic',
  ),
  injectiveExchangeV2QueryFeeDiscountTierStatisticsResponse(
    typeUrl: '/injective.exchange.v2.QueryFeeDiscountTierStatisticsResponse',
  ),
  injectiveExchangeV2MitoVaultInfosRequest(
    typeUrl: '/injective.exchange.v2.MitoVaultInfosRequest',
    serviceUrl: "/injective.exchange.v2.Query/MitoVaultInfos",
  ),
  injectiveExchangeV2MitoVaultInfosResponse(
    typeUrl: '/injective.exchange.v2.MitoVaultInfosResponse',
  ),
  injectiveExchangeV2QueryMarketIDFromVaultRequest(
    typeUrl: '/injective.exchange.v2.QueryMarketIDFromVaultRequest',
    serviceUrl: "/injective.exchange.v2.Query/QueryMarketIDFromVault",
  ),
  injectiveExchangeV2QueryMarketIDFromVaultResponse(
    typeUrl: '/injective.exchange.v2.QueryMarketIDFromVaultResponse',
  ),
  injectiveExchangeV2QueryHistoricalTradeRecordsRequest(
    typeUrl: '/injective.exchange.v2.QueryHistoricalTradeRecordsRequest',
    serviceUrl: "/injective.exchange.v2.Query/HistoricalTradeRecords",
  ),
  injectiveExchangeV2QueryHistoricalTradeRecordsResponse(
    typeUrl: '/injective.exchange.v2.QueryHistoricalTradeRecordsResponse',
  ),
  injectiveExchangeV2TradeHistoryOptions(
    typeUrl: '/injective.exchange.v2.TradeHistoryOptions',
  ),
  injectiveExchangeV2QueryMarketVolatilityRequest(
    typeUrl: '/injective.exchange.v2.QueryMarketVolatilityRequest',
    serviceUrl: "/injective.exchange.v2.Query/MarketVolatility",
  ),
  injectiveExchangeV2QueryMarketVolatilityResponse(
    typeUrl: '/injective.exchange.v2.QueryMarketVolatilityResponse',
  ),
  injectiveExchangeV2QueryBinaryMarketsRequest(
    typeUrl: '/injective.exchange.v2.QueryBinaryMarketsRequest',
    serviceUrl: "/injective.exchange.v2.Query/BinaryOptionsMarkets",
  ),
  injectiveExchangeV2QueryBinaryMarketsResponse(
    typeUrl: '/injective.exchange.v2.QueryBinaryMarketsResponse',
  ),
  injectiveExchangeV2QueryTraderDerivativeConditionalOrdersRequest(
    typeUrl:
        '/injective.exchange.v2.QueryTraderDerivativeConditionalOrdersRequest',
    serviceUrl:
        "/injective.exchange.v2.Query/TraderDerivativeConditionalOrders",
  ),
  injectiveExchangeV2TrimmedDerivativeConditionalOrder(
    typeUrl: '/injective.exchange.v2.TrimmedDerivativeConditionalOrder',
  ),
  injectiveExchangeV2QueryTraderDerivativeConditionalOrdersResponse(
    typeUrl:
        '/injective.exchange.v2.QueryTraderDerivativeConditionalOrdersResponse',
  ),
  injectiveExchangeV2QueryFullSpotOrderbookRequest(
    typeUrl: '/injective.exchange.v2.QueryFullSpotOrderbookRequest',
    serviceUrl: "/injective.exchange.v2.Query/L3SpotOrderBook",
  ),
  injectiveExchangeV2QueryFullSpotOrderbookResponse(
    typeUrl: '/injective.exchange.v2.QueryFullSpotOrderbookResponse',
  ),
  injectiveExchangeV2QueryFullDerivativeOrderbookRequest(
    typeUrl: '/injective.exchange.v2.QueryFullDerivativeOrderbookRequest',
    serviceUrl: "/injective.exchange.v2.Query/L3DerivativeOrderBook",
  ),
  injectiveExchangeV2QueryFullDerivativeOrderbookResponse(
    typeUrl: '/injective.exchange.v2.QueryFullDerivativeOrderbookResponse',
  ),
  injectiveExchangeV2TrimmedLimitOrder(
    typeUrl: '/injective.exchange.v2.TrimmedLimitOrder',
  ),
  injectiveExchangeV2QueryMarketAtomicExecutionFeeMultiplierRequest(
    typeUrl:
        '/injective.exchange.v2.QueryMarketAtomicExecutionFeeMultiplierRequest',
    serviceUrl:
        "/injective.exchange.v2.Query/MarketAtomicExecutionFeeMultiplier",
  ),
  injectiveExchangeV2QueryMarketAtomicExecutionFeeMultiplierResponse(
    typeUrl:
        '/injective.exchange.v2.QueryMarketAtomicExecutionFeeMultiplierResponse',
  ),
  injectiveExchangeV2QueryActiveStakeGrantRequest(
    typeUrl: '/injective.exchange.v2.QueryActiveStakeGrantRequest',
    serviceUrl: "/injective.exchange.v2.Query/ActiveStakeGrant",
  ),
  injectiveExchangeV2QueryActiveStakeGrantResponse(
    typeUrl: '/injective.exchange.v2.QueryActiveStakeGrantResponse',
  ),
  injectiveExchangeV2QueryGrantAuthorizationRequest(
    typeUrl: '/injective.exchange.v2.QueryGrantAuthorizationRequest',
    serviceUrl: "/injective.exchange.v2.Query/GrantAuthorization",
  ),
  injectiveExchangeV2QueryGrantAuthorizationResponse(
    typeUrl: '/injective.exchange.v2.QueryGrantAuthorizationResponse',
  ),
  injectiveExchangeV2QueryGrantAuthorizationsRequest(
    typeUrl: '/injective.exchange.v2.QueryGrantAuthorizationsRequest',
    serviceUrl: "/injective.exchange.v2.Query/GrantAuthorizations",
  ),
  injectiveExchangeV2QueryGrantAuthorizationsResponse(
    typeUrl: '/injective.exchange.v2.QueryGrantAuthorizationsResponse',
  ),
  injectiveExchangeV2QueryMarketBalanceRequest(
    typeUrl: '/injective.exchange.v2.QueryMarketBalanceRequest',
    serviceUrl: "/injective.exchange.v2.Query/MarketBalance",
  ),
  injectiveExchangeV2QueryMarketBalanceResponse(
    typeUrl: '/injective.exchange.v2.QueryMarketBalanceResponse',
  ),
  injectiveExchangeV2QueryMarketBalancesRequest(
    typeUrl: '/injective.exchange.v2.QueryMarketBalancesRequest',
    serviceUrl: "/injective.exchange.v2.Query/MarketBalances",
  ),
  injectiveExchangeV2QueryMarketBalancesResponse(
    typeUrl: '/injective.exchange.v2.QueryMarketBalancesResponse',
  ),
  injectiveExchangeV2MarketBalance(
    typeUrl: '/injective.exchange.v2.MarketBalance',
  ),
  injectiveExchangeV2QueryDenomMinNotionalRequest(
    typeUrl: '/injective.exchange.v2.QueryDenomMinNotionalRequest',
    serviceUrl: "/injective.exchange.v2.Query/DenomMinNotional",
  ),
  injectiveExchangeV2QueryDenomMinNotionalResponse(
    typeUrl: '/injective.exchange.v2.QueryDenomMinNotionalResponse',
  ),
  injectiveExchangeV2QueryDenomMinNotionalsRequest(
    typeUrl: '/injective.exchange.v2.QueryDenomMinNotionalsRequest',
    serviceUrl: "/injective.exchange.v2.Query/DenomMinNotionals",
  ),
  injectiveExchangeV2QueryDenomMinNotionalsResponse(
    typeUrl: '/injective.exchange.v2.QueryDenomMinNotionalsResponse',
  ),
  injectiveExchangeV2OpenInterest(
    typeUrl: '/injective.exchange.v2.OpenInterest',
  ),
  injectiveExchangeV2QueryOpenInterestRequest(
    typeUrl: '/injective.exchange.v2.QueryOpenInterestRequest',
    serviceUrl: "/injective.exchange.v2.Query/OpenInterest",
  ),
  injectiveExchangeV2QueryOpenInterestResponse(
    typeUrl: '/injective.exchange.v2.QueryOpenInterestResponse',
  ),
  injectiveExchangeV2GenesisState(
    typeUrl: '/injective.exchange.v2.GenesisState',
  ),
  injectiveExchangeV2OrderbookSequence(
    typeUrl: '/injective.exchange.v2.OrderbookSequence',
  ),
  injectiveExchangeV2FeeDiscountAccountTierTTL(
    typeUrl: '/injective.exchange.v2.FeeDiscountAccountTierTTL',
  ),
  injectiveExchangeV2FeeDiscountBucketVolumeAccounts(
    typeUrl: '/injective.exchange.v2.FeeDiscountBucketVolumeAccounts',
  ),
  injectiveExchangeV2AccountVolume(
    typeUrl: '/injective.exchange.v2.AccountVolume',
  ),
  injectiveExchangeV2TradingRewardCampaignAccountPoints(
    typeUrl: '/injective.exchange.v2.TradingRewardCampaignAccountPoints',
  ),
  injectiveExchangeV2TradingRewardCampaignAccountPendingPoints(
    typeUrl: '/injective.exchange.v2.TradingRewardCampaignAccountPendingPoints',
  ),
  injectiveExchangeV2SubaccountNonce(
    typeUrl: '/injective.exchange.v2.SubaccountNonce',
  ),
  injectiveExchangeV2FullGrantAuthorizations(
    typeUrl: '/injective.exchange.v2.FullGrantAuthorizations',
  ),
  injectiveExchangeV2FullActiveGrant(
    typeUrl: '/injective.exchange.v2.FullActiveGrant',
  ),
  injectiveExchangeV2SubaccountRiskProfileRecord(
    typeUrl: '/injective.exchange.v2.SubaccountRiskProfileRecord',
  ),
  injectiveExchangeV2OrderInfo(typeUrl: '/injective.exchange.v2.OrderInfo'),
  injectiveExchangeV2SpotOrder(typeUrl: '/injective.exchange.v2.SpotOrder'),
  injectiveExchangeV2SpotLimitOrder(
    typeUrl: '/injective.exchange.v2.SpotLimitOrder',
  ),
  injectiveExchangeV2DerivativeOrder(
    typeUrl: '/injective.exchange.v2.DerivativeOrder',
  ),
  injectiveExchangeV2DerivativeMarketOrder(
    typeUrl: '/injective.exchange.v2.DerivativeMarketOrder',
  ),
  injectiveExchangeV2DerivativeLimitOrder(
    typeUrl: '/injective.exchange.v2.DerivativeLimitOrder',
  ),
  injectiveExchangeV2SpotMarketParamUpdateProposal(
    typeUrl: '/injective.exchange.v2.SpotMarketParamUpdateProposal',
    aminoType: "exchange/SpotMarketParamUpdateProposal",
  ),
  injectiveExchangeV2ExchangeEnableProposal(
    typeUrl: '/injective.exchange.v2.ExchangeEnableProposal',
    aminoType: "exchange/ExchangeEnableProposal",
  ),
  injectiveExchangeV2BatchExchangeModificationProposal(
    typeUrl: '/injective.exchange.v2.BatchExchangeModificationProposal',
    aminoType: "exchange/BatchExchangeModificationProposal",
  ),
  injectiveExchangeV2SpotMarketLaunchProposal(
    typeUrl: '/injective.exchange.v2.SpotMarketLaunchProposal',
    aminoType: "exchange/SpotMarketLaunchProposal",
  ),
  injectiveExchangeV2PerpetualMarketLaunchProposal(
    typeUrl: '/injective.exchange.v2.PerpetualMarketLaunchProposal',
    aminoType: "exchange/PerpetualMarketLaunchProposal",
  ),
  injectiveExchangeV2BinaryOptionsMarketLaunchProposal(
    typeUrl: '/injective.exchange.v2.BinaryOptionsMarketLaunchProposal',
    aminoType: "exchange/BinaryOptionsMarketLaunchProposal",
  ),
  injectiveExchangeV2ExpiryFuturesMarketLaunchProposal(
    typeUrl: '/injective.exchange.v2.ExpiryFuturesMarketLaunchProposal',
    aminoType: "exchange/ExpiryFuturesMarketLaunchProposal",
  ),
  injectiveExchangeV2DerivativeMarketParamUpdateProposal(
    typeUrl: '/injective.exchange.v2.DerivativeMarketParamUpdateProposal',
    aminoType: "exchange/DerivativeMarketParamUpdateProposal",
  ),
  injectiveExchangeV2AdminInfo(typeUrl: '/injective.exchange.v2.AdminInfo'),
  injectiveExchangeV2MarketForcedSettlementProposal(
    typeUrl: '/injective.exchange.v2.MarketForcedSettlementProposal',
    aminoType: "exchange/MarketForcedSettlementProposal",
  ),
  injectiveExchangeV2UpdateAuctionExchangeTransferDenomDecimalsProposal(
    typeUrl:
        '/injective.exchange.v2.UpdateAuctionExchangeTransferDenomDecimalsProposal',
    aminoType: "exchange/UpdateAuctionExchangeTransferDenomDecimalsProposal",
  ),
  injectiveExchangeV2BinaryOptionsMarketParamUpdateProposal(
    typeUrl: '/injective.exchange.v2.BinaryOptionsMarketParamUpdateProposal',
    aminoType: "exchange/BinaryOptionsMarketParamUpdateProposal",
  ),
  injectiveExchangeV2ProviderOracleParams(
    typeUrl: '/injective.exchange.v2.ProviderOracleParams',
  ),
  injectiveExchangeV2OracleParams(
    typeUrl: '/injective.exchange.v2.OracleParams',
  ),
  injectiveExchangeV2TradingRewardCampaignLaunchProposal(
    typeUrl: '/injective.exchange.v2.TradingRewardCampaignLaunchProposal',
    aminoType: "exchange/TradingRewardCampaignLaunchProposal",
  ),
  injectiveExchangeV2TradingRewardCampaignUpdateProposal(
    typeUrl: '/injective.exchange.v2.TradingRewardCampaignUpdateProposal',
    aminoType: "exchange/TradingRewardCampaignUpdateProposal",
  ),
  injectiveExchangeV2RewardPointUpdate(
    typeUrl: '/injective.exchange.v2.RewardPointUpdate',
  ),
  injectiveExchangeV2TradingRewardPendingPointsUpdateProposal(
    typeUrl: '/injective.exchange.v2.TradingRewardPendingPointsUpdateProposal',
    aminoType: "exchange/TradingRewardPendingPointsUpdateProposal",
  ),
  injectiveExchangeV2FeeDiscountProposal(
    typeUrl: '/injective.exchange.v2.FeeDiscountProposal',
    aminoType: "exchange/FeeDiscountProposal",
  ),
  injectiveExchangeV2BatchCommunityPoolSpendProposal(
    typeUrl: '/injective.exchange.v2.BatchCommunityPoolSpendProposal',
    aminoType: "exchange/BatchCommunityPoolSpendProposal",
  ),
  injectiveExchangeV2AtomicMarketOrderFeeMultiplierScheduleProposal(
    typeUrl:
        '/injective.exchange.v2.AtomicMarketOrderFeeMultiplierScheduleProposal',
    aminoType: "exchange/AtomicMarketOrderFeeMultiplierScheduleProposal",
  ),
  injectiveExchangeV2DenomMinNotionalProposal(
    typeUrl: '/injective.exchange.v2.DenomMinNotionalProposal',
    aminoType: "exchange/DenomMinNotionalProposal",
  ),
  injectiveExchangeV2EnforcedRestrictionsContract(
    typeUrl: '/injective.exchange.v2.EnforcedRestrictionsContract',
  ),
  injectiveExchangeV2Params(
    typeUrl: '/injective.exchange.v2.Params',
    aminoType: "exchange/Params",
  ),
  injectiveExchangeV2CrossMarginParams(
    typeUrl: '/injective.exchange.v2.CrossMarginParams',
  ),
  injectiveExchangeV2MidPriceAndTOB(
    typeUrl: '/injective.exchange.v2.MidPriceAndTOB',
  ),
  injectiveExchangeV2Deposit(typeUrl: '/injective.exchange.v2.Deposit'),
  injectiveExchangeV2SubaccountTradeNonce(
    typeUrl: '/injective.exchange.v2.SubaccountTradeNonce',
  ),
  injectiveExchangeV2SubaccountOrder(
    typeUrl: '/injective.exchange.v2.SubaccountOrder',
  ),
  injectiveExchangeV2SubaccountOrderData(
    typeUrl: '/injective.exchange.v2.SubaccountOrderData',
  ),
  injectiveExchangeV2Position(typeUrl: '/injective.exchange.v2.Position'),
  injectiveExchangeV2Balance(typeUrl: '/injective.exchange.v2.Balance'),
  injectiveExchangeV2DerivativePosition(
    typeUrl: '/injective.exchange.v2.DerivativePosition',
  ),
  injectiveExchangeV2PositionDelta(
    typeUrl: '/injective.exchange.v2.PositionDelta',
  ),
  injectiveExchangeV2PointsMultiplier(
    typeUrl: '/injective.exchange.v2.PointsMultiplier',
  ),
  injectiveExchangeV2TradingRewardCampaignBoostInfo(
    typeUrl: '/injective.exchange.v2.TradingRewardCampaignBoostInfo',
  ),
  injectiveExchangeV2CampaignRewardPool(
    typeUrl: '/injective.exchange.v2.CampaignRewardPool',
  ),
  injectiveExchangeV2TradingRewardCampaignInfo(
    typeUrl: '/injective.exchange.v2.TradingRewardCampaignInfo',
  ),
  injectiveExchangeV2FeeDiscountTierInfo(
    typeUrl: '/injective.exchange.v2.FeeDiscountTierInfo',
  ),
  injectiveExchangeV2FeeDiscountSchedule(
    typeUrl: '/injective.exchange.v2.FeeDiscountSchedule',
  ),
  injectiveExchangeV2FeeDiscountTierTTL(
    typeUrl: '/injective.exchange.v2.FeeDiscountTierTTL',
  ),
  injectiveExchangeV2TradeRecords(
    typeUrl: '/injective.exchange.v2.TradeRecords',
  ),
  injectiveExchangeV2TradeRecord(typeUrl: '/injective.exchange.v2.TradeRecord'),
  injectiveExchangeV2Level(typeUrl: '/injective.exchange.v2.Level'),
  injectiveExchangeV2AggregateSubaccountVolumeRecord(
    typeUrl: '/injective.exchange.v2.AggregateSubaccountVolumeRecord',
  ),
  injectiveExchangeV2AggregateAccountVolumeRecord(
    typeUrl: '/injective.exchange.v2.AggregateAccountVolumeRecord',
  ),
  injectiveExchangeV2DenomDecimals(
    typeUrl: '/injective.exchange.v2.DenomDecimals',
  ),
  injectiveExchangeV2GrantAuthorization(
    typeUrl: '/injective.exchange.v2.GrantAuthorization',
  ),
  injectiveExchangeV2ActiveGrant(typeUrl: '/injective.exchange.v2.ActiveGrant'),
  injectiveExchangeV2EffectiveGrant(
    typeUrl: '/injective.exchange.v2.EffectiveGrant',
  ),
  injectiveExchangeV2DenomMinNotional(
    typeUrl: '/injective.exchange.v2.DenomMinNotional',
  ),
  injectiveExchangeV2SubaccountRiskProfile(
    typeUrl: '/injective.exchange.v2.SubaccountRiskProfile',
  ),
  injectiveExchangeV2ForcePausedInfo(
    typeUrl: '/injective.exchange.v2.ForcePausedInfo',
  ),
  injectiveExchangeV2OpenNotionalCap(
    typeUrl: '/injective.exchange.v2.OpenNotionalCap',
    aminoType: "injective.exchange.v2.OpenNotionalCap",
  ),
  injectiveExchangeV2OpenNotionalCapUncapped(
    typeUrl: '/injective.exchange.v2.OpenNotionalCapUncapped',
    aminoType: "injective.exchange.v2.OpenNotionalCapUncapped",
  ),
  injectiveExchangeV2OpenNotionalCapCapped(
    typeUrl: '/injective.exchange.v2.OpenNotionalCapCapped',
    aminoType: "injective.exchange.v2.OpenNotionalCapCapped",
  ),
  injectiveExchangeV2MarketFeeMultiplier(
    typeUrl: '/injective.exchange.v2.MarketFeeMultiplier',
  ),
  injectiveExchangeV2SpotMarket(typeUrl: '/injective.exchange.v2.SpotMarket'),
  injectiveExchangeV2BinaryOptionsMarket(
    typeUrl: '/injective.exchange.v2.BinaryOptionsMarket',
  ),
  injectiveExchangeV2DerivativeMarket(
    typeUrl: '/injective.exchange.v2.DerivativeMarket',
  ),
  injectiveExchangeV2DerivativeMarketSettlementInfo(
    typeUrl: '/injective.exchange.v2.DerivativeMarketSettlementInfo',
  ),
  injectiveExchangeV2MarketVolume(
    typeUrl: '/injective.exchange.v2.MarketVolume',
  ),
  injectiveExchangeV2VolumeRecord(
    typeUrl: '/injective.exchange.v2.VolumeRecord',
  ),
  injectiveExchangeV2ExpiryFuturesMarketInfoState(
    typeUrl: '/injective.exchange.v2.ExpiryFuturesMarketInfoState',
  ),
  injectiveExchangeV2PerpetualMarketFundingState(
    typeUrl: '/injective.exchange.v2.PerpetualMarketFundingState',
  ),
  injectiveExchangeV2ExpiryFuturesMarketInfo(
    typeUrl: '/injective.exchange.v2.ExpiryFuturesMarketInfo',
  ),
  injectiveExchangeV2PerpetualMarketInfo(
    typeUrl: '/injective.exchange.v2.PerpetualMarketInfo',
  ),
  injectiveExchangeV2PerpetualMarketFunding(
    typeUrl: '/injective.exchange.v2.PerpetualMarketFunding',
  ),
  injectiveExchangeV2MsgUpdateSpotMarket(
    typeUrl: '/injective.exchange.v2.MsgUpdateSpotMarket',
    serviceUrl: "/injective.exchange.v2.Msg/UpdateSpotMarket",
    aminoType: "exchange/MsgUpdateSpotMarket",
  ),
  injectiveExchangeV2MsgUpdateSpotMarketResponse(
    typeUrl: '/injective.exchange.v2.MsgUpdateSpotMarketResponse',
  ),
  injectiveExchangeV2MsgUpdateDerivativeMarket(
    typeUrl: '/injective.exchange.v2.MsgUpdateDerivativeMarket',
    serviceUrl: "/injective.exchange.v2.Msg/UpdateDerivativeMarket",
    aminoType: "exchange/MsgUpdateDerivativeMarket",
  ),
  injectiveExchangeV2MsgUpdateDerivativeMarketResponse(
    typeUrl: '/injective.exchange.v2.MsgUpdateDerivativeMarketResponse',
  ),
  injectiveExchangeV2MsgUpdateParams(
    typeUrl: '/injective.exchange.v2.MsgUpdateParams',
    serviceUrl: "/injective.exchange.v2.Msg/UpdateParams",
    aminoType: "exchange/MsgUpdateParams",
  ),
  injectiveExchangeV2MsgUpdateParamsResponse(
    typeUrl: '/injective.exchange.v2.MsgUpdateParamsResponse',
  ),
  injectiveExchangeV2MsgDeposit(
    typeUrl: '/injective.exchange.v2.MsgDeposit',
    serviceUrl: "/injective.exchange.v2.Msg/Deposit",
    aminoType: "exchange/MsgDeposit",
  ),
  injectiveExchangeV2MsgDepositResponse(
    typeUrl: '/injective.exchange.v2.MsgDepositResponse',
  ),
  injectiveExchangeV2MsgWithdraw(
    typeUrl: '/injective.exchange.v2.MsgWithdraw',
    serviceUrl: "/injective.exchange.v2.Msg/Withdraw",
    aminoType: "exchange/MsgWithdraw",
  ),
  injectiveExchangeV2MsgWithdrawResponse(
    typeUrl: '/injective.exchange.v2.MsgWithdrawResponse',
  ),
  injectiveExchangeV2MsgUpdateSubaccountRiskProfile(
    typeUrl: '/injective.exchange.v2.MsgUpdateSubaccountRiskProfile',
    serviceUrl: "/injective.exchange.v2.Msg/UpdateSubaccountRiskProfile",
    aminoType: "exchange/MsgUpdateSubaccountRiskProfile",
  ),
  injectiveExchangeV2MsgUpdateSubaccountRiskProfileResponse(
    typeUrl: '/injective.exchange.v2.MsgUpdateSubaccountRiskProfileResponse',
  ),
  injectiveExchangeV2MsgCreateSpotLimitOrder(
    typeUrl: '/injective.exchange.v2.MsgCreateSpotLimitOrder',
    serviceUrl: "/injective.exchange.v2.Msg/CreateSpotLimitOrder",
    aminoType: "exchange/MsgCreateSpotLimitOrder",
  ),
  injectiveExchangeV2MsgCreateSpotLimitOrderResponse(
    typeUrl: '/injective.exchange.v2.MsgCreateSpotLimitOrderResponse',
  ),
  injectiveExchangeV2MsgBatchCreateSpotLimitOrders(
    typeUrl: '/injective.exchange.v2.MsgBatchCreateSpotLimitOrders',
    serviceUrl: "/injective.exchange.v2.Msg/BatchCreateSpotLimitOrders",
    aminoType: "exchange/MsgBatchCreateSpotLimitOrders",
  ),
  injectiveExchangeV2MsgBatchCreateSpotLimitOrdersResponse(
    typeUrl: '/injective.exchange.v2.MsgBatchCreateSpotLimitOrdersResponse',
  ),
  injectiveExchangeV2MsgInstantSpotMarketLaunch(
    typeUrl: '/injective.exchange.v2.MsgInstantSpotMarketLaunch',
    serviceUrl: "/injective.exchange.v2.Msg/InstantSpotMarketLaunch",
    aminoType: "exchange/MsgInstantSpotMarketLaunch",
  ),
  injectiveExchangeV2MsgInstantSpotMarketLaunchResponse(
    typeUrl: '/injective.exchange.v2.MsgInstantSpotMarketLaunchResponse',
  ),
  injectiveExchangeV2MsgInstantPerpetualMarketLaunch(
    typeUrl: '/injective.exchange.v2.MsgInstantPerpetualMarketLaunch',
    serviceUrl: "/injective.exchange.v2.Msg/InstantPerpetualMarketLaunch",
    aminoType: "exchange/MsgInstantPerpetualMarketLaunch",
  ),
  injectiveExchangeV2MsgInstantPerpetualMarketLaunchResponse(
    typeUrl: '/injective.exchange.v2.MsgInstantPerpetualMarketLaunchResponse',
  ),
  injectiveExchangeV2MsgInstantBinaryOptionsMarketLaunch(
    typeUrl: '/injective.exchange.v2.MsgInstantBinaryOptionsMarketLaunch',
    serviceUrl: "/injective.exchange.v2.Msg/InstantBinaryOptionsMarketLaunch",
    aminoType: "exchange/MsgInstantBinaryOptionsMarketLaunch",
  ),
  injectiveExchangeV2MsgInstantBinaryOptionsMarketLaunchResponse(
    typeUrl:
        '/injective.exchange.v2.MsgInstantBinaryOptionsMarketLaunchResponse',
  ),
  injectiveExchangeV2MsgInstantExpiryFuturesMarketLaunch(
    typeUrl: '/injective.exchange.v2.MsgInstantExpiryFuturesMarketLaunch',
    serviceUrl: "/injective.exchange.v2.Msg/InstantExpiryFuturesMarketLaunch",
    aminoType: "exchange/MsgInstantExpiryFuturesMarketLaunch",
  ),
  injectiveExchangeV2MsgInstantExpiryFuturesMarketLaunchResponse(
    typeUrl:
        '/injective.exchange.v2.MsgInstantExpiryFuturesMarketLaunchResponse',
  ),
  injectiveExchangeV2MsgCreateSpotMarketOrder(
    typeUrl: '/injective.exchange.v2.MsgCreateSpotMarketOrder',
    serviceUrl: "/injective.exchange.v2.Msg/CreateSpotMarketOrder",
    aminoType: "exchange/MsgCreateSpotMarketOrder",
  ),
  injectiveExchangeV2MsgCreateSpotMarketOrderResponse(
    typeUrl: '/injective.exchange.v2.MsgCreateSpotMarketOrderResponse',
  ),
  injectiveExchangeV2SpotMarketOrderResults(
    typeUrl: '/injective.exchange.v2.SpotMarketOrderResults',
  ),
  injectiveExchangeV2MsgCreateDerivativeLimitOrder(
    typeUrl: '/injective.exchange.v2.MsgCreateDerivativeLimitOrder',
    serviceUrl: "/injective.exchange.v2.Msg/CreateDerivativeLimitOrder",
    aminoType: "exchange/MsgCreateDerivativeLimitOrder",
  ),
  injectiveExchangeV2MsgCreateDerivativeLimitOrderResponse(
    typeUrl: '/injective.exchange.v2.MsgCreateDerivativeLimitOrderResponse',
  ),
  injectiveExchangeV2MsgCreateBinaryOptionsLimitOrder(
    typeUrl: '/injective.exchange.v2.MsgCreateBinaryOptionsLimitOrder',
    serviceUrl: "/injective.exchange.v2.Msg/CreateBinaryOptionsLimitOrder",
    aminoType: "exchange/MsgCreateBinaryOptionsLimitOrder",
  ),
  injectiveExchangeV2MsgCreateBinaryOptionsLimitOrderResponse(
    typeUrl: '/injective.exchange.v2.MsgCreateBinaryOptionsLimitOrderResponse',
  ),
  injectiveExchangeV2MsgBatchCreateDerivativeLimitOrders(
    typeUrl: '/injective.exchange.v2.MsgBatchCreateDerivativeLimitOrders',
    serviceUrl: "/injective.exchange.v2.Msg/BatchCreateDerivativeLimitOrders",
    aminoType: "exchange/MsgBatchCreateDerivativeLimitOrders",
  ),
  injectiveExchangeV2MsgBatchCreateDerivativeLimitOrdersResponse(
    typeUrl:
        '/injective.exchange.v2.MsgBatchCreateDerivativeLimitOrdersResponse',
  ),
  injectiveExchangeV2MsgCancelSpotOrder(
    typeUrl: '/injective.exchange.v2.MsgCancelSpotOrder',
    serviceUrl: "/injective.exchange.v2.Msg/CancelSpotOrder",
    aminoType: "exchange/MsgCancelSpotOrder",
  ),
  injectiveExchangeV2MsgCancelSpotOrderResponse(
    typeUrl: '/injective.exchange.v2.MsgCancelSpotOrderResponse',
  ),
  injectiveExchangeV2MsgBatchCancelSpotOrders(
    typeUrl: '/injective.exchange.v2.MsgBatchCancelSpotOrders',
    serviceUrl: "/injective.exchange.v2.Msg/BatchCancelSpotOrders",
    aminoType: "exchange/MsgBatchCancelSpotOrders",
  ),
  injectiveExchangeV2MsgBatchCancelSpotOrdersResponse(
    typeUrl: '/injective.exchange.v2.MsgBatchCancelSpotOrdersResponse',
  ),
  injectiveExchangeV2MsgBatchCancelBinaryOptionsOrders(
    typeUrl: '/injective.exchange.v2.MsgBatchCancelBinaryOptionsOrders',
    serviceUrl: "/injective.exchange.v2.Msg/BatchCancelBinaryOptionsOrders",
    aminoType: "exchange/MsgBatchCancelBinaryOptionsOrders",
  ),
  injectiveExchangeV2MsgBatchCancelBinaryOptionsOrdersResponse(
    typeUrl: '/injective.exchange.v2.MsgBatchCancelBinaryOptionsOrdersResponse',
  ),
  injectiveExchangeV2MsgBatchUpdateOrders(
    typeUrl: '/injective.exchange.v2.MsgBatchUpdateOrders',
    serviceUrl: "/injective.exchange.v2.Msg/BatchUpdateOrders",
    aminoType: "exchange/MsgBatchUpdateOrders",
  ),
  injectiveExchangeV2MsgBatchUpdateOrdersResponse(
    typeUrl: '/injective.exchange.v2.MsgBatchUpdateOrdersResponse',
  ),
  injectiveExchangeV2MsgCreateDerivativeMarketOrder(
    typeUrl: '/injective.exchange.v2.MsgCreateDerivativeMarketOrder',
    serviceUrl: "/injective.exchange.v2.Msg/CreateDerivativeMarketOrder",
    aminoType: "exchange/MsgCreateDerivativeMarketOrder",
  ),
  injectiveExchangeV2MsgCreateDerivativeMarketOrderResponse(
    typeUrl: '/injective.exchange.v2.MsgCreateDerivativeMarketOrderResponse',
  ),
  injectiveExchangeV2DerivativeMarketOrderResults(
    typeUrl: '/injective.exchange.v2.DerivativeMarketOrderResults',
  ),
  injectiveExchangeV2MsgCreateBinaryOptionsMarketOrder(
    typeUrl: '/injective.exchange.v2.MsgCreateBinaryOptionsMarketOrder',
    serviceUrl: "/injective.exchange.v2.Msg/CreateBinaryOptionsMarketOrder",
    aminoType: "exchange/MsgCreateBinaryOptionsMarketOrder",
  ),
  injectiveExchangeV2MsgCreateBinaryOptionsMarketOrderResponse(
    typeUrl: '/injective.exchange.v2.MsgCreateBinaryOptionsMarketOrderResponse',
  ),
  injectiveExchangeV2MsgCancelDerivativeOrder(
    typeUrl: '/injective.exchange.v2.MsgCancelDerivativeOrder',
    serviceUrl: "/injective.exchange.v2.Msg/CancelDerivativeOrder",
    aminoType: "exchange/MsgCancelDerivativeOrder",
  ),
  injectiveExchangeV2MsgCancelDerivativeOrderResponse(
    typeUrl: '/injective.exchange.v2.MsgCancelDerivativeOrderResponse',
  ),
  injectiveExchangeV2MsgCancelBinaryOptionsOrder(
    typeUrl: '/injective.exchange.v2.MsgCancelBinaryOptionsOrder',
    serviceUrl: "/injective.exchange.v2.Msg/CancelBinaryOptionsOrder",
    aminoType: "exchange/MsgCancelBinaryOptionsOrder",
  ),
  injectiveExchangeV2MsgCancelBinaryOptionsOrderResponse(
    typeUrl: '/injective.exchange.v2.MsgCancelBinaryOptionsOrderResponse',
  ),
  injectiveExchangeV2OrderData(typeUrl: '/injective.exchange.v2.OrderData'),
  injectiveExchangeV2MsgBatchCancelDerivativeOrders(
    typeUrl: '/injective.exchange.v2.MsgBatchCancelDerivativeOrders',
    serviceUrl: "/injective.exchange.v2.Msg/BatchCancelDerivativeOrders",
    aminoType: "exchange/MsgBatchCancelDerivativeOrders",
  ),
  injectiveExchangeV2MsgBatchCancelDerivativeOrdersResponse(
    typeUrl: '/injective.exchange.v2.MsgBatchCancelDerivativeOrdersResponse',
  ),
  injectiveExchangeV2MsgSubaccountTransfer(
    typeUrl: '/injective.exchange.v2.MsgSubaccountTransfer',
    serviceUrl: "/injective.exchange.v2.Msg/SubaccountTransfer",
    aminoType: "exchange/MsgSubaccountTransfer",
  ),
  injectiveExchangeV2MsgSubaccountTransferResponse(
    typeUrl: '/injective.exchange.v2.MsgSubaccountTransferResponse',
  ),
  injectiveExchangeV2MsgExternalTransfer(
    typeUrl: '/injective.exchange.v2.MsgExternalTransfer',
    serviceUrl: "/injective.exchange.v2.Msg/ExternalTransfer",
    aminoType: "exchange/MsgExternalTransfer",
  ),
  injectiveExchangeV2MsgExternalTransferResponse(
    typeUrl: '/injective.exchange.v2.MsgExternalTransferResponse',
  ),
  injectiveExchangeV2MsgLiquidatePosition(
    typeUrl: '/injective.exchange.v2.MsgLiquidatePosition',
    serviceUrl: "/injective.exchange.v2.Msg/LiquidatePosition",
    aminoType: "exchange/MsgLiquidatePosition",
  ),
  injectiveExchangeV2MsgLiquidatePositionResponse(
    typeUrl: '/injective.exchange.v2.MsgLiquidatePositionResponse',
  ),
  injectiveExchangeV2LiquidatePositionData(
    typeUrl: '/injective.exchange.v2.LiquidatePositionData',
  ),
  injectiveExchangeV2MsgBatchLiquidatePositions(
    typeUrl: '/injective.exchange.v2.MsgBatchLiquidatePositions',
    serviceUrl: "/injective.exchange.v2.Msg/BatchLiquidatePositions",
    aminoType: "exchange/MsgBatchLiquidatePositions",
  ),
  injectiveExchangeV2LiquidatePositionResult(
    typeUrl: '/injective.exchange.v2.LiquidatePositionResult',
  ),
  injectiveExchangeV2MsgBatchLiquidatePositionsResponse(
    typeUrl: '/injective.exchange.v2.MsgBatchLiquidatePositionsResponse',
  ),
  injectiveExchangeV2MsgOffsetPosition(
    typeUrl: '/injective.exchange.v2.MsgOffsetPosition',
    serviceUrl: "/injective.exchange.v2.Msg/OffsetPosition",
    aminoType: "exchange/MsgOffsetPosition",
  ),
  injectiveExchangeV2MsgOffsetPositionResponse(
    typeUrl: '/injective.exchange.v2.MsgOffsetPositionResponse',
  ),
  injectiveExchangeV2MsgEmergencySettleMarket(
    typeUrl: '/injective.exchange.v2.MsgEmergencySettleMarket',
    serviceUrl: "/injective.exchange.v2.Msg/EmergencySettleMarket",
    aminoType: "exchange/MsgEmergencySettleMarket",
  ),
  injectiveExchangeV2MsgEmergencySettleMarketResponse(
    typeUrl: '/injective.exchange.v2.MsgEmergencySettleMarketResponse',
  ),
  injectiveExchangeV2MsgIncreasePositionMargin(
    typeUrl: '/injective.exchange.v2.MsgIncreasePositionMargin',
    serviceUrl: "/injective.exchange.v2.Msg/IncreasePositionMargin",
    aminoType: "exchange/MsgIncreasePositionMargin",
  ),
  injectiveExchangeV2MsgIncreasePositionMarginResponse(
    typeUrl: '/injective.exchange.v2.MsgIncreasePositionMarginResponse',
  ),
  injectiveExchangeV2MsgDecreasePositionMargin(
    typeUrl: '/injective.exchange.v2.MsgDecreasePositionMargin',
    serviceUrl: "/injective.exchange.v2.Msg/DecreasePositionMargin",
    aminoType: "exchange/MsgDecreasePositionMargin",
  ),
  injectiveExchangeV2MsgDecreasePositionMarginResponse(
    typeUrl: '/injective.exchange.v2.MsgDecreasePositionMarginResponse',
  ),
  injectiveExchangeV2MsgPrivilegedExecuteContract(
    typeUrl: '/injective.exchange.v2.MsgPrivilegedExecuteContract',
    serviceUrl: "/injective.exchange.v2.Msg/PrivilegedExecuteContract",
    aminoType: "exchange/MsgPrivilegedExecuteContract",
  ),
  injectiveExchangeV2MsgPrivilegedExecuteContractResponse(
    typeUrl: '/injective.exchange.v2.MsgPrivilegedExecuteContractResponse',
  ),
  injectiveExchangeV2MsgRewardsOptOut(
    typeUrl: '/injective.exchange.v2.MsgRewardsOptOut',
    serviceUrl: "/injective.exchange.v2.Msg/RewardsOptOut",
    aminoType: "exchange/MsgRewardsOptOut",
  ),
  injectiveExchangeV2MsgRewardsOptOutResponse(
    typeUrl: '/injective.exchange.v2.MsgRewardsOptOutResponse',
  ),
  injectiveExchangeV2MsgAdminUpdateBinaryOptionsMarket(
    typeUrl: '/injective.exchange.v2.MsgAdminUpdateBinaryOptionsMarket',
    serviceUrl: "/injective.exchange.v2.Msg/AdminUpdateBinaryOptionsMarket",
    aminoType: "exchange/MsgAdminUpdateBinaryOptionsMarket",
  ),
  injectiveExchangeV2MsgAdminUpdateBinaryOptionsMarketResponse(
    typeUrl: '/injective.exchange.v2.MsgAdminUpdateBinaryOptionsMarketResponse',
  ),
  injectiveExchangeV2MsgAuthorizeStakeGrants(
    typeUrl: '/injective.exchange.v2.MsgAuthorizeStakeGrants',
    serviceUrl: "/injective.exchange.v2.Msg/AuthorizeStakeGrants",
    aminoType: "exchange/MsgAuthorizeStakeGrants",
  ),
  injectiveExchangeV2MsgAuthorizeStakeGrantsResponse(
    typeUrl: '/injective.exchange.v2.MsgAuthorizeStakeGrantsResponse',
  ),
  injectiveExchangeV2MsgActivateStakeGrant(
    typeUrl: '/injective.exchange.v2.MsgActivateStakeGrant',
    serviceUrl: "/injective.exchange.v2.Msg/ActivateStakeGrant",
    aminoType: "exchange/MsgActivateStakeGrant",
  ),
  injectiveExchangeV2MsgActivateStakeGrantResponse(
    typeUrl: '/injective.exchange.v2.MsgActivateStakeGrantResponse',
  ),
  injectiveExchangeV2MsgBatchExchangeModification(
    typeUrl: '/injective.exchange.v2.MsgBatchExchangeModification',
    serviceUrl: "/injective.exchange.v2.Msg/BatchExchangeModification",
    aminoType: "exchange/MsgBatchExchangeModification",
  ),
  injectiveExchangeV2MsgBatchExchangeModificationResponse(
    typeUrl: '/injective.exchange.v2.MsgBatchExchangeModificationResponse',
  ),
  injectiveExchangeV2MsgSpotMarketLaunch(
    typeUrl: '/injective.exchange.v2.MsgSpotMarketLaunch',
    serviceUrl: "/injective.exchange.v2.Msg/LaunchSpotMarket",
    aminoType: "exchange/MsgSpotMarketLaunch",
  ),
  injectiveExchangeV2MsgSpotMarketLaunchResponse(
    typeUrl: '/injective.exchange.v2.MsgSpotMarketLaunchResponse',
  ),
  injectiveExchangeV2MsgPerpetualMarketLaunch(
    typeUrl: '/injective.exchange.v2.MsgPerpetualMarketLaunch',
    serviceUrl: "/injective.exchange.v2.Msg/LaunchPerpetualMarket",
    aminoType: "exchange/MsgPerpetualMarketLaunch",
  ),
  injectiveExchangeV2MsgPerpetualMarketLaunchResponse(
    typeUrl: '/injective.exchange.v2.MsgPerpetualMarketLaunchResponse',
  ),
  injectiveExchangeV2MsgExpiryFuturesMarketLaunch(
    typeUrl: '/injective.exchange.v2.MsgExpiryFuturesMarketLaunch',
    serviceUrl: "/injective.exchange.v2.Msg/LaunchExpiryFuturesMarket",
    aminoType: "exchange/MsgExpiryFuturesMarketLaunch",
  ),
  injectiveExchangeV2MsgExpiryFuturesMarketLaunchResponse(
    typeUrl: '/injective.exchange.v2.MsgExpiryFuturesMarketLaunchResponse',
  ),
  injectiveExchangeV2MsgBinaryOptionsMarketLaunch(
    typeUrl: '/injective.exchange.v2.MsgBinaryOptionsMarketLaunch',
    serviceUrl: "/injective.exchange.v2.Msg/LaunchBinaryOptionsMarket",
    aminoType: "exchange/MsgBinaryOptionsMarketLaunch",
  ),
  injectiveExchangeV2MsgBinaryOptionsMarketLaunchResponse(
    typeUrl: '/injective.exchange.v2.MsgBinaryOptionsMarketLaunchResponse',
  ),
  injectiveExchangeV2MsgBatchCommunityPoolSpend(
    typeUrl: '/injective.exchange.v2.MsgBatchCommunityPoolSpend',
    serviceUrl: "/injective.exchange.v2.Msg/BatchSpendCommunityPool",
    aminoType: "exchange/MsgBatchCommunityPoolSpend",
  ),
  injectiveExchangeV2MsgBatchCommunityPoolSpendResponse(
    typeUrl: '/injective.exchange.v2.MsgBatchCommunityPoolSpendResponse',
  ),
  injectiveExchangeV2MsgSpotMarketParamUpdate(
    typeUrl: '/injective.exchange.v2.MsgSpotMarketParamUpdate',
    serviceUrl: "/injective.exchange.v2.Msg/SpotMarketParamUpdate",
    aminoType: "exchange/MsgSpotMarketParamUpdate",
  ),
  injectiveExchangeV2MsgSpotMarketParamUpdateResponse(
    typeUrl: '/injective.exchange.v2.MsgSpotMarketParamUpdateResponse',
  ),
  injectiveExchangeV2MsgDerivativeMarketParamUpdate(
    typeUrl: '/injective.exchange.v2.MsgDerivativeMarketParamUpdate',
    serviceUrl: "/injective.exchange.v2.Msg/DerivativeMarketParamUpdate",
    aminoType: "exchange/MsgDerivativeMarketParamUpdate",
  ),
  injectiveExchangeV2MsgDerivativeMarketParamUpdateResponse(
    typeUrl: '/injective.exchange.v2.MsgDerivativeMarketParamUpdateResponse',
  ),
  injectiveExchangeV2MsgBinaryOptionsMarketParamUpdate(
    typeUrl: '/injective.exchange.v2.MsgBinaryOptionsMarketParamUpdate',
    serviceUrl: "/injective.exchange.v2.Msg/BinaryOptionsMarketParamUpdate",
    aminoType: "exchange/MsgBinaryOptionsMarketParamUpdate",
  ),
  injectiveExchangeV2MsgBinaryOptionsMarketParamUpdateResponse(
    typeUrl: '/injective.exchange.v2.MsgBinaryOptionsMarketParamUpdateResponse',
  ),
  injectiveExchangeV2MsgMarketForcedSettlement(
    typeUrl: '/injective.exchange.v2.MsgMarketForcedSettlement',
    serviceUrl: "/injective.exchange.v2.Msg/ForceSettleMarket",
    aminoType: "exchange/MsgMarketForcedSettlement",
  ),
  injectiveExchangeV2MsgMarketForcedSettlementResponse(
    typeUrl: '/injective.exchange.v2.MsgMarketForcedSettlementResponse',
  ),
  injectiveExchangeV2MsgTradingRewardCampaignLaunch(
    typeUrl: '/injective.exchange.v2.MsgTradingRewardCampaignLaunch',
    serviceUrl: "/injective.exchange.v2.Msg/LaunchTradingRewardCampaign",
    aminoType: "exchange/MsgTradingRewardCampaignLaunch",
  ),
  injectiveExchangeV2MsgTradingRewardCampaignLaunchResponse(
    typeUrl: '/injective.exchange.v2.MsgTradingRewardCampaignLaunchResponse',
  ),
  injectiveExchangeV2MsgExchangeEnable(
    typeUrl: '/injective.exchange.v2.MsgExchangeEnable',
    serviceUrl: "/injective.exchange.v2.Msg/EnableExchange",
    aminoType: "exchange/MsgExchangeEnable",
  ),
  injectiveExchangeV2MsgExchangeEnableResponse(
    typeUrl: '/injective.exchange.v2.MsgExchangeEnableResponse',
  ),
  injectiveExchangeV2MsgTradingRewardCampaignUpdate(
    typeUrl: '/injective.exchange.v2.MsgTradingRewardCampaignUpdate',
    serviceUrl: "/injective.exchange.v2.Msg/UpdateTradingRewardCampaign",
    aminoType: "exchange/MsgTradingRewardCampaignUpdate",
  ),
  injectiveExchangeV2MsgTradingRewardCampaignUpdateResponse(
    typeUrl: '/injective.exchange.v2.MsgTradingRewardCampaignUpdateResponse',
  ),
  injectiveExchangeV2MsgTradingRewardPendingPointsUpdate(
    typeUrl: '/injective.exchange.v2.MsgTradingRewardPendingPointsUpdate',
    serviceUrl: "/injective.exchange.v2.Msg/UpdateTradingRewardPendingPoints",
    aminoType: "exchange/MsgTradingRewardPendingPointsUpdate",
  ),
  injectiveExchangeV2MsgTradingRewardPendingPointsUpdateResponse(
    typeUrl:
        '/injective.exchange.v2.MsgTradingRewardPendingPointsUpdateResponse',
  ),
  injectiveExchangeV2MsgFeeDiscount(
    typeUrl: '/injective.exchange.v2.MsgFeeDiscount',
    serviceUrl: "/injective.exchange.v2.Msg/UpdateFeeDiscount",
    aminoType: "exchange/MsgFeeDiscount",
  ),
  injectiveExchangeV2MsgFeeDiscountResponse(
    typeUrl: '/injective.exchange.v2.MsgFeeDiscountResponse',
  ),
  injectiveExchangeV2MsgAtomicMarketOrderFeeMultiplierSchedule(
    typeUrl: '/injective.exchange.v2.MsgAtomicMarketOrderFeeMultiplierSchedule',
    serviceUrl:
        "/injective.exchange.v2.Msg/UpdateAtomicMarketOrderFeeMultiplierSchedule",
    aminoType: "exchange/MsgAtomicMarketOrderFeeMultiplierSchedule",
  ),
  injectiveExchangeV2MsgAtomicMarketOrderFeeMultiplierScheduleResponse(
    typeUrl:
        '/injective.exchange.v2.MsgAtomicMarketOrderFeeMultiplierScheduleResponse',
  ),
  injectiveExchangeV2MsgCancelPostOnlyMode(
    typeUrl: '/injective.exchange.v2.MsgCancelPostOnlyMode',
    serviceUrl: "/injective.exchange.v2.Msg/CancelPostOnlyMode",
    aminoType: "exchange/MsgCancelPostOnlyMode",
  ),
  injectiveExchangeV2MsgCancelPostOnlyModeResponse(
    typeUrl: '/injective.exchange.v2.MsgCancelPostOnlyModeResponse',
  ),
  injectiveExchangeV2MsgActivatePostOnlyMode(
    typeUrl: '/injective.exchange.v2.MsgActivatePostOnlyMode',
    serviceUrl: "/injective.exchange.v2.Msg/ActivatePostOnlyMode",
    aminoType: "exchange/MsgActivatePostOnlyMode",
  ),
  injectiveExchangeV2MsgActivatePostOnlyModeResponse(
    typeUrl: '/injective.exchange.v2.MsgActivatePostOnlyModeResponse',
  ),
  injectiveExchangeV2MsgLiquidateCrossMarginPool(
    typeUrl: '/injective.exchange.v2.MsgLiquidateCrossMarginPool',
    serviceUrl: "/injective.exchange.v2.Msg/LiquidateCrossMarginPool",
    aminoType: "exchange/MsgLiquidateCrossMarginPool",
  ),
  injectiveExchangeV2MsgLiquidateCrossMarginPoolResponse(
    typeUrl: '/injective.exchange.v2.MsgLiquidateCrossMarginPoolResponse',
  ),
  injectiveExchangeV2SpotOrderBook(
    typeUrl: '/injective.exchange.v2.SpotOrderBook',
  ),
  injectiveExchangeV2DerivativeOrderBook(
    typeUrl: '/injective.exchange.v2.DerivativeOrderBook',
  ),
  injectiveExchangeV2ConditionalDerivativeOrderBook(
    typeUrl: '/injective.exchange.v2.ConditionalDerivativeOrderBook',
  ),
  injectiveExchangeV2SubaccountOrderbookMetadata(
    typeUrl: '/injective.exchange.v2.SubaccountOrderbookMetadata',
  ),
  injectiveExchangeV1beta1Subaccount(
    typeUrl: '/injective.exchange.v1beta1.Subaccount',
  ),
  injectiveExchangeV1beta1QuerySubaccountOrdersRequest(
    typeUrl: '/injective.exchange.v1beta1.QuerySubaccountOrdersRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/SubaccountOrders",
  ),
  injectiveExchangeV1beta1QuerySubaccountOrdersResponse(
    typeUrl: '/injective.exchange.v1beta1.QuerySubaccountOrdersResponse',
  ),
  injectiveExchangeV1beta1SubaccountOrderbookMetadataWithMarket(
    typeUrl:
        '/injective.exchange.v1beta1.SubaccountOrderbookMetadataWithMarket',
  ),
  injectiveExchangeV1beta1QueryExchangeParamsRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryExchangeParamsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/QueryExchangeParams",
  ),
  injectiveExchangeV1beta1QueryExchangeParamsResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryExchangeParamsResponse',
  ),
  injectiveExchangeV1beta1QuerySubaccountDepositsRequest(
    typeUrl: '/injective.exchange.v1beta1.QuerySubaccountDepositsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/SubaccountDeposits",
  ),
  injectiveExchangeV1beta1QuerySubaccountDepositsResponse(
    typeUrl: '/injective.exchange.v1beta1.QuerySubaccountDepositsResponse',
  ),
  injectiveExchangeV1beta1QueryExchangeBalancesRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryExchangeBalancesRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/ExchangeBalances",
  ),
  injectiveExchangeV1beta1QueryExchangeBalancesResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryExchangeBalancesResponse',
  ),
  injectiveExchangeV1beta1QueryAggregateVolumeRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryAggregateVolumeRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/AggregateVolume",
  ),
  injectiveExchangeV1beta1QueryAggregateVolumeResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryAggregateVolumeResponse',
  ),
  injectiveExchangeV1beta1QueryAggregateVolumesRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryAggregateVolumesRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/AggregateVolumes",
  ),
  injectiveExchangeV1beta1QueryAggregateVolumesResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryAggregateVolumesResponse',
  ),
  injectiveExchangeV1beta1QueryAggregateMarketVolumeRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryAggregateMarketVolumeRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/AggregateMarketVolume",
  ),
  injectiveExchangeV1beta1QueryAggregateMarketVolumeResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryAggregateMarketVolumeResponse',
  ),
  injectiveExchangeV1beta1QueryDenomDecimalRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryDenomDecimalRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/DenomDecimal",
  ),
  injectiveExchangeV1beta1QueryDenomDecimalResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryDenomDecimalResponse',
  ),
  injectiveExchangeV1beta1QueryDenomDecimalsRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryDenomDecimalsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/DenomDecimals",
  ),
  injectiveExchangeV1beta1QueryDenomDecimalsResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryDenomDecimalsResponse',
  ),
  injectiveExchangeV1beta1QueryAggregateMarketVolumesRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryAggregateMarketVolumesRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/AggregateMarketVolumes",
  ),
  injectiveExchangeV1beta1QueryAggregateMarketVolumesResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryAggregateMarketVolumesResponse',
  ),
  injectiveExchangeV1beta1QuerySubaccountDepositRequest(
    typeUrl: '/injective.exchange.v1beta1.QuerySubaccountDepositRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/SubaccountDeposit",
  ),
  injectiveExchangeV1beta1QuerySubaccountDepositResponse(
    typeUrl: '/injective.exchange.v1beta1.QuerySubaccountDepositResponse',
  ),
  injectiveExchangeV1beta1QuerySpotMarketsRequest(
    typeUrl: '/injective.exchange.v1beta1.QuerySpotMarketsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/SpotMarkets",
  ),
  injectiveExchangeV1beta1QuerySpotMarketsResponse(
    typeUrl: '/injective.exchange.v1beta1.QuerySpotMarketsResponse',
  ),
  injectiveExchangeV1beta1QuerySpotMarketRequest(
    typeUrl: '/injective.exchange.v1beta1.QuerySpotMarketRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/SpotMarket",
  ),
  injectiveExchangeV1beta1QuerySpotMarketResponse(
    typeUrl: '/injective.exchange.v1beta1.QuerySpotMarketResponse',
  ),
  injectiveExchangeV1beta1QuerySpotOrderbookRequest(
    typeUrl: '/injective.exchange.v1beta1.QuerySpotOrderbookRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/SpotOrderbook",
  ),
  injectiveExchangeV1beta1QuerySpotOrderbookResponse(
    typeUrl: '/injective.exchange.v1beta1.QuerySpotOrderbookResponse',
  ),
  injectiveExchangeV1beta1FullSpotMarket(
    typeUrl: '/injective.exchange.v1beta1.FullSpotMarket',
  ),
  injectiveExchangeV1beta1QueryFullSpotMarketsRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryFullSpotMarketsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/FullSpotMarkets",
  ),
  injectiveExchangeV1beta1QueryFullSpotMarketsResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryFullSpotMarketsResponse',
  ),
  injectiveExchangeV1beta1QueryFullSpotMarketRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryFullSpotMarketRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/FullSpotMarket",
  ),
  injectiveExchangeV1beta1QueryFullSpotMarketResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryFullSpotMarketResponse',
  ),
  injectiveExchangeV1beta1QuerySpotOrdersByHashesRequest(
    typeUrl: '/injective.exchange.v1beta1.QuerySpotOrdersByHashesRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/SpotOrdersByHashes",
  ),
  injectiveExchangeV1beta1QuerySpotOrdersByHashesResponse(
    typeUrl: '/injective.exchange.v1beta1.QuerySpotOrdersByHashesResponse',
  ),
  injectiveExchangeV1beta1QueryTraderSpotOrdersRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryTraderSpotOrdersRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/TraderSpotOrders",
  ),
  injectiveExchangeV1beta1QueryAccountAddressSpotOrdersRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryAccountAddressSpotOrdersRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/AccountAddressSpotOrders",
  ),
  injectiveExchangeV1beta1TrimmedSpotLimitOrder(
    typeUrl: '/injective.exchange.v1beta1.TrimmedSpotLimitOrder',
  ),
  injectiveExchangeV1beta1QueryTraderSpotOrdersResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryTraderSpotOrdersResponse',
  ),
  injectiveExchangeV1beta1QueryAccountAddressSpotOrdersResponse(
    typeUrl:
        '/injective.exchange.v1beta1.QueryAccountAddressSpotOrdersResponse',
  ),
  injectiveExchangeV1beta1QuerySpotMidPriceAndTOBRequest(
    typeUrl: '/injective.exchange.v1beta1.QuerySpotMidPriceAndTOBRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/SpotMidPriceAndTOB",
  ),
  injectiveExchangeV1beta1QuerySpotMidPriceAndTOBResponse(
    typeUrl: '/injective.exchange.v1beta1.QuerySpotMidPriceAndTOBResponse',
  ),
  injectiveExchangeV1beta1QueryDerivativeMidPriceAndTOBRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryDerivativeMidPriceAndTOBRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/DerivativeMidPriceAndTOB",
  ),
  injectiveExchangeV1beta1QueryDerivativeMidPriceAndTOBResponse(
    typeUrl:
        '/injective.exchange.v1beta1.QueryDerivativeMidPriceAndTOBResponse',
  ),
  injectiveExchangeV1beta1QueryDerivativeOrderbookRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryDerivativeOrderbookRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/DerivativeOrderbook",
  ),
  injectiveExchangeV1beta1QueryDerivativeOrderbookResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryDerivativeOrderbookResponse',
  ),
  injectiveExchangeV1beta1QueryTraderDerivativeOrdersRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryTraderDerivativeOrdersRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/TraderDerivativeOrders",
  ),
  injectiveExchangeV1beta1QueryAccountAddressDerivativeOrdersRequest(
    typeUrl:
        '/injective.exchange.v1beta1.QueryAccountAddressDerivativeOrdersRequest',
    serviceUrl:
        "/injective.exchange.v1beta1.Query/AccountAddressDerivativeOrders",
  ),
  injectiveExchangeV1beta1TrimmedDerivativeLimitOrder(
    typeUrl: '/injective.exchange.v1beta1.TrimmedDerivativeLimitOrder',
  ),
  injectiveExchangeV1beta1QueryTraderDerivativeOrdersResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryTraderDerivativeOrdersResponse',
  ),
  injectiveExchangeV1beta1QueryAccountAddressDerivativeOrdersResponse(
    typeUrl:
        '/injective.exchange.v1beta1.QueryAccountAddressDerivativeOrdersResponse',
  ),
  injectiveExchangeV1beta1QueryDerivativeOrdersByHashesRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryDerivativeOrdersByHashesRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/DerivativeOrdersByHashes",
  ),
  injectiveExchangeV1beta1QueryDerivativeOrdersByHashesResponse(
    typeUrl:
        '/injective.exchange.v1beta1.QueryDerivativeOrdersByHashesResponse',
  ),
  injectiveExchangeV1beta1QueryDerivativeMarketsRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryDerivativeMarketsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/DerivativeMarkets",
  ),
  injectiveExchangeV1beta1PerpetualMarketState(
    typeUrl: '/injective.exchange.v1beta1.PerpetualMarketState',
  ),
  injectiveExchangeV1beta1FullDerivativeMarket(
    typeUrl: '/injective.exchange.v1beta1.FullDerivativeMarket',
  ),
  injectiveExchangeV1beta1QueryDerivativeMarketsResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryDerivativeMarketsResponse',
  ),
  injectiveExchangeV1beta1QueryDerivativeMarketRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryDerivativeMarketRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/DerivativeMarket",
  ),
  injectiveExchangeV1beta1QueryDerivativeMarketResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryDerivativeMarketResponse',
  ),
  injectiveExchangeV1beta1QueryDerivativeMarketAddressRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryDerivativeMarketAddressRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/DerivativeMarketAddress",
  ),
  injectiveExchangeV1beta1QueryDerivativeMarketAddressResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryDerivativeMarketAddressResponse',
  ),
  injectiveExchangeV1beta1QuerySubaccountTradeNonceRequest(
    typeUrl: '/injective.exchange.v1beta1.QuerySubaccountTradeNonceRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/SubaccountTradeNonce",
  ),
  injectiveExchangeV1beta1QuerySubaccountPositionsRequest(
    typeUrl: '/injective.exchange.v1beta1.QuerySubaccountPositionsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/SubaccountPositions",
  ),
  injectiveExchangeV1beta1QuerySubaccountPositionInMarketRequest(
    typeUrl:
        '/injective.exchange.v1beta1.QuerySubaccountPositionInMarketRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/SubaccountPositionInMarket",
  ),
  injectiveExchangeV1beta1QuerySubaccountEffectivePositionInMarketRequest(
    typeUrl:
        '/injective.exchange.v1beta1.QuerySubaccountEffectivePositionInMarketRequest',
    serviceUrl:
        "/injective.exchange.v1beta1.Query/SubaccountEffectivePositionInMarket",
  ),
  injectiveExchangeV1beta1QuerySubaccountOrderMetadataRequest(
    typeUrl: '/injective.exchange.v1beta1.QuerySubaccountOrderMetadataRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/SubaccountOrderMetadata",
  ),
  injectiveExchangeV1beta1QuerySubaccountPositionsResponse(
    typeUrl: '/injective.exchange.v1beta1.QuerySubaccountPositionsResponse',
  ),
  injectiveExchangeV1beta1QuerySubaccountPositionInMarketResponse(
    typeUrl:
        '/injective.exchange.v1beta1.QuerySubaccountPositionInMarketResponse',
  ),
  injectiveExchangeV1beta1EffectivePosition(
    typeUrl: '/injective.exchange.v1beta1.EffectivePosition',
  ),
  injectiveExchangeV1beta1QuerySubaccountEffectivePositionInMarketResponse(
    typeUrl:
        '/injective.exchange.v1beta1.QuerySubaccountEffectivePositionInMarketResponse',
  ),
  injectiveExchangeV1beta1QueryPerpetualMarketInfoRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryPerpetualMarketInfoRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/PerpetualMarketInfo",
  ),
  injectiveExchangeV1beta1QueryPerpetualMarketInfoResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryPerpetualMarketInfoResponse',
  ),
  injectiveExchangeV1beta1QueryExpiryFuturesMarketInfoRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryExpiryFuturesMarketInfoRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/ExpiryFuturesMarketInfo",
  ),
  injectiveExchangeV1beta1QueryExpiryFuturesMarketInfoResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryExpiryFuturesMarketInfoResponse',
  ),
  injectiveExchangeV1beta1QueryPerpetualMarketFundingRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryPerpetualMarketFundingRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/PerpetualMarketFunding",
  ),
  injectiveExchangeV1beta1QueryPerpetualMarketFundingResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryPerpetualMarketFundingResponse',
  ),
  injectiveExchangeV1beta1QuerySubaccountOrderMetadataResponse(
    typeUrl: '/injective.exchange.v1beta1.QuerySubaccountOrderMetadataResponse',
  ),
  injectiveExchangeV1beta1QuerySubaccountTradeNonceResponse(
    typeUrl: '/injective.exchange.v1beta1.QuerySubaccountTradeNonceResponse',
  ),
  injectiveExchangeV1beta1QueryModuleStateRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryModuleStateRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/ExchangeModuleState",
  ),
  injectiveExchangeV1beta1QueryModuleStateResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryModuleStateResponse',
  ),
  injectiveExchangeV1beta1QueryPositionsRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryPositionsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/Positions",
  ),
  injectiveExchangeV1beta1QueryPositionsResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryPositionsResponse',
  ),
  injectiveExchangeV1beta1QueryTradeRewardPointsRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryTradeRewardPointsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/TradeRewardPoints",
  ),
  injectiveExchangeV1beta1QueryTradeRewardPointsResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryTradeRewardPointsResponse',
  ),
  injectiveExchangeV1beta1QueryTradeRewardCampaignRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryTradeRewardCampaignRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/TradeRewardCampaign",
  ),
  injectiveExchangeV1beta1QueryTradeRewardCampaignResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryTradeRewardCampaignResponse',
  ),
  injectiveExchangeV1beta1QueryIsOptedOutOfRewardsRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryIsOptedOutOfRewardsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/IsOptedOutOfRewards",
  ),
  injectiveExchangeV1beta1QueryIsOptedOutOfRewardsResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryIsOptedOutOfRewardsResponse',
  ),
  injectiveExchangeV1beta1QueryOptedOutOfRewardsAccountsRequest(
    typeUrl:
        '/injective.exchange.v1beta1.QueryOptedOutOfRewardsAccountsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/OptedOutOfRewardsAccounts",
  ),
  injectiveExchangeV1beta1QueryOptedOutOfRewardsAccountsResponse(
    typeUrl:
        '/injective.exchange.v1beta1.QueryOptedOutOfRewardsAccountsResponse',
  ),
  injectiveExchangeV1beta1QueryFeeDiscountAccountInfoRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryFeeDiscountAccountInfoRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/FeeDiscountAccountInfo",
  ),
  injectiveExchangeV1beta1QueryFeeDiscountAccountInfoResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryFeeDiscountAccountInfoResponse',
  ),
  injectiveExchangeV1beta1QueryFeeDiscountScheduleRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryFeeDiscountScheduleRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/FeeDiscountSchedule",
  ),
  injectiveExchangeV1beta1QueryFeeDiscountScheduleResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryFeeDiscountScheduleResponse',
  ),
  injectiveExchangeV1beta1QueryBalanceMismatchesRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryBalanceMismatchesRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/BalanceMismatches",
  ),
  injectiveExchangeV1beta1BalanceMismatch(
    typeUrl: '/injective.exchange.v1beta1.BalanceMismatch',
  ),
  injectiveExchangeV1beta1QueryBalanceMismatchesResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryBalanceMismatchesResponse',
  ),
  injectiveExchangeV1beta1QueryBalanceWithBalanceHoldsRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryBalanceWithBalanceHoldsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/BalanceWithBalanceHolds",
  ),
  injectiveExchangeV1beta1BalanceWithMarginHold(
    typeUrl: '/injective.exchange.v1beta1.BalanceWithMarginHold',
  ),
  injectiveExchangeV1beta1QueryBalanceWithBalanceHoldsResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryBalanceWithBalanceHoldsResponse',
  ),
  injectiveExchangeV1beta1QueryFeeDiscountTierStatisticsRequest(
    typeUrl:
        '/injective.exchange.v1beta1.QueryFeeDiscountTierStatisticsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/FeeDiscountTierStatistics",
  ),
  injectiveExchangeV1beta1TierStatistic(
    typeUrl: '/injective.exchange.v1beta1.TierStatistic',
  ),
  injectiveExchangeV1beta1QueryFeeDiscountTierStatisticsResponse(
    typeUrl:
        '/injective.exchange.v1beta1.QueryFeeDiscountTierStatisticsResponse',
  ),
  injectiveExchangeV1beta1MitoVaultInfosRequest(
    typeUrl: '/injective.exchange.v1beta1.MitoVaultInfosRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/MitoVaultInfos",
  ),
  injectiveExchangeV1beta1MitoVaultInfosResponse(
    typeUrl: '/injective.exchange.v1beta1.MitoVaultInfosResponse',
  ),
  injectiveExchangeV1beta1QueryMarketIDFromVaultRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryMarketIDFromVaultRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/QueryMarketIDFromVault",
  ),
  injectiveExchangeV1beta1QueryMarketIDFromVaultResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryMarketIDFromVaultResponse',
  ),
  injectiveExchangeV1beta1QueryHistoricalTradeRecordsRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryHistoricalTradeRecordsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/HistoricalTradeRecords",
  ),
  injectiveExchangeV1beta1QueryHistoricalTradeRecordsResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryHistoricalTradeRecordsResponse',
  ),
  injectiveExchangeV1beta1TradeHistoryOptions(
    typeUrl: '/injective.exchange.v1beta1.TradeHistoryOptions',
  ),
  injectiveExchangeV1beta1QueryMarketVolatilityRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryMarketVolatilityRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/MarketVolatility",
  ),
  injectiveExchangeV1beta1QueryMarketVolatilityResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryMarketVolatilityResponse',
  ),
  injectiveExchangeV1beta1QueryBinaryMarketsRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryBinaryMarketsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/BinaryOptionsMarkets",
  ),
  injectiveExchangeV1beta1QueryBinaryMarketsResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryBinaryMarketsResponse',
  ),
  injectiveExchangeV1beta1QueryTraderDerivativeConditionalOrdersRequest(
    typeUrl:
        '/injective.exchange.v1beta1.QueryTraderDerivativeConditionalOrdersRequest',
    serviceUrl:
        "/injective.exchange.v1beta1.Query/TraderDerivativeConditionalOrders",
  ),
  injectiveExchangeV1beta1TrimmedDerivativeConditionalOrder(
    typeUrl: '/injective.exchange.v1beta1.TrimmedDerivativeConditionalOrder',
  ),
  injectiveExchangeV1beta1QueryTraderDerivativeConditionalOrdersResponse(
    typeUrl:
        '/injective.exchange.v1beta1.QueryTraderDerivativeConditionalOrdersResponse',
  ),
  injectiveExchangeV1beta1QueryFullSpotOrderbookRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryFullSpotOrderbookRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/L3SpotOrderBook",
  ),
  injectiveExchangeV1beta1QueryFullSpotOrderbookResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryFullSpotOrderbookResponse',
  ),
  injectiveExchangeV1beta1QueryFullDerivativeOrderbookRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryFullDerivativeOrderbookRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/L3DerivativeOrderBook",
  ),
  injectiveExchangeV1beta1QueryFullDerivativeOrderbookResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryFullDerivativeOrderbookResponse',
  ),
  injectiveExchangeV1beta1TrimmedLimitOrder(
    typeUrl: '/injective.exchange.v1beta1.TrimmedLimitOrder',
  ),
  injectiveExchangeV1beta1QueryMarketAtomicExecutionFeeMultiplierRequest(
    typeUrl:
        '/injective.exchange.v1beta1.QueryMarketAtomicExecutionFeeMultiplierRequest',
    serviceUrl:
        "/injective.exchange.v1beta1.Query/MarketAtomicExecutionFeeMultiplier",
  ),
  injectiveExchangeV1beta1QueryMarketAtomicExecutionFeeMultiplierResponse(
    typeUrl:
        '/injective.exchange.v1beta1.QueryMarketAtomicExecutionFeeMultiplierResponse',
  ),
  injectiveExchangeV1beta1QueryActiveStakeGrantRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryActiveStakeGrantRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/ActiveStakeGrant",
  ),
  injectiveExchangeV1beta1QueryActiveStakeGrantResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryActiveStakeGrantResponse',
  ),
  injectiveExchangeV1beta1QueryGrantAuthorizationRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryGrantAuthorizationRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/GrantAuthorization",
  ),
  injectiveExchangeV1beta1QueryGrantAuthorizationResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryGrantAuthorizationResponse',
  ),
  injectiveExchangeV1beta1QueryGrantAuthorizationsRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryGrantAuthorizationsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/GrantAuthorizations",
  ),
  injectiveExchangeV1beta1QueryGrantAuthorizationsResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryGrantAuthorizationsResponse',
  ),
  injectiveExchangeV1beta1QueryMarketBalanceRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryMarketBalanceRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/MarketBalance",
  ),
  injectiveExchangeV1beta1QueryMarketBalanceResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryMarketBalanceResponse',
  ),
  injectiveExchangeV1beta1QueryMarketBalancesRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryMarketBalancesRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/MarketBalances",
  ),
  injectiveExchangeV1beta1QueryMarketBalancesResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryMarketBalancesResponse',
  ),
  injectiveExchangeV1beta1MarketBalance(
    typeUrl: '/injective.exchange.v1beta1.MarketBalance',
  ),
  injectiveExchangeV1beta1QueryDenomMinNotionalRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryDenomMinNotionalRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/DenomMinNotional",
  ),
  injectiveExchangeV1beta1QueryDenomMinNotionalResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryDenomMinNotionalResponse',
  ),
  injectiveExchangeV1beta1QueryDenomMinNotionalsRequest(
    typeUrl: '/injective.exchange.v1beta1.QueryDenomMinNotionalsRequest',
    serviceUrl: "/injective.exchange.v1beta1.Query/DenomMinNotionals",
  ),
  injectiveExchangeV1beta1QueryDenomMinNotionalsResponse(
    typeUrl: '/injective.exchange.v1beta1.QueryDenomMinNotionalsResponse',
  ),
  injectiveExchangeV1beta1GenesisState(
    typeUrl: '/injective.exchange.v1beta1.GenesisState',
  ),
  injectiveExchangeV1beta1OrderbookSequence(
    typeUrl: '/injective.exchange.v1beta1.OrderbookSequence',
  ),
  injectiveExchangeV1beta1FeeDiscountAccountTierTTL(
    typeUrl: '/injective.exchange.v1beta1.FeeDiscountAccountTierTTL',
  ),
  injectiveExchangeV1beta1FeeDiscountBucketVolumeAccounts(
    typeUrl: '/injective.exchange.v1beta1.FeeDiscountBucketVolumeAccounts',
  ),
  injectiveExchangeV1beta1AccountVolume(
    typeUrl: '/injective.exchange.v1beta1.AccountVolume',
  ),
  injectiveExchangeV1beta1TradingRewardCampaignAccountPoints(
    typeUrl: '/injective.exchange.v1beta1.TradingRewardCampaignAccountPoints',
  ),
  injectiveExchangeV1beta1TradingRewardCampaignAccountPendingPoints(
    typeUrl:
        '/injective.exchange.v1beta1.TradingRewardCampaignAccountPendingPoints',
  ),
  injectiveExchangeV1beta1SpotOrderBook(
    typeUrl: '/injective.exchange.v1beta1.SpotOrderBook',
  ),
  injectiveExchangeV1beta1DerivativeOrderBook(
    typeUrl: '/injective.exchange.v1beta1.DerivativeOrderBook',
  ),
  injectiveExchangeV1beta1ConditionalDerivativeOrderBook(
    typeUrl: '/injective.exchange.v1beta1.ConditionalDerivativeOrderBook',
  ),
  injectiveExchangeV1beta1Balance(
    typeUrl: '/injective.exchange.v1beta1.Balance',
  ),
  injectiveExchangeV1beta1DerivativePosition(
    typeUrl: '/injective.exchange.v1beta1.DerivativePosition',
  ),
  injectiveExchangeV1beta1SubaccountNonce(
    typeUrl: '/injective.exchange.v1beta1.SubaccountNonce',
  ),
  injectiveExchangeV1beta1ExpiryFuturesMarketInfoState(
    typeUrl: '/injective.exchange.v1beta1.ExpiryFuturesMarketInfoState',
  ),
  injectiveExchangeV1beta1PerpetualMarketFundingState(
    typeUrl: '/injective.exchange.v1beta1.PerpetualMarketFundingState',
  ),
  injectiveExchangeV1beta1FullGrantAuthorizations(
    typeUrl: '/injective.exchange.v1beta1.FullGrantAuthorizations',
  ),
  injectiveExchangeV1beta1FullActiveGrant(
    typeUrl: '/injective.exchange.v1beta1.FullActiveGrant',
  ),
  injectiveExchangeV1beta1SpotMarketParamUpdateProposal(
    typeUrl: '/injective.exchange.v1beta1.SpotMarketParamUpdateProposal',
    aminoType: "exchange/SpotMarketParamUpdateProposal",
  ),
  injectiveExchangeV1beta1BatchExchangeModificationProposal(
    typeUrl: '/injective.exchange.v1beta1.BatchExchangeModificationProposal',
    aminoType: "exchange/BatchExchangeModificationProposal",
  ),
  injectiveExchangeV1beta1SpotMarketLaunchProposal(
    typeUrl: '/injective.exchange.v1beta1.SpotMarketLaunchProposal',
    aminoType: "exchange/SpotMarketLaunchProposal",
  ),
  injectiveExchangeV1beta1PerpetualMarketLaunchProposal(
    typeUrl: '/injective.exchange.v1beta1.PerpetualMarketLaunchProposal',
    aminoType: "exchange/PerpetualMarketLaunchProposal",
  ),
  injectiveExchangeV1beta1BinaryOptionsMarketLaunchProposal(
    typeUrl: '/injective.exchange.v1beta1.BinaryOptionsMarketLaunchProposal',
    aminoType: "exchange/BinaryOptionsMarketLaunchProposal",
  ),
  injectiveExchangeV1beta1ExpiryFuturesMarketLaunchProposal(
    typeUrl: '/injective.exchange.v1beta1.ExpiryFuturesMarketLaunchProposal',
    aminoType: "exchange/ExpiryFuturesMarketLaunchProposal",
  ),
  injectiveExchangeV1beta1DerivativeMarketParamUpdateProposal(
    typeUrl: '/injective.exchange.v1beta1.DerivativeMarketParamUpdateProposal',
    aminoType: "exchange/DerivativeMarketParamUpdateProposal",
  ),
  injectiveExchangeV1beta1AdminInfo(
    typeUrl: '/injective.exchange.v1beta1.AdminInfo',
  ),
  injectiveExchangeV1beta1MarketForcedSettlementProposal(
    typeUrl: '/injective.exchange.v1beta1.MarketForcedSettlementProposal',
    aminoType: "exchange/MarketForcedSettlementProposal",
  ),
  injectiveExchangeV1beta1UpdateDenomDecimalsProposal(
    typeUrl: '/injective.exchange.v1beta1.UpdateDenomDecimalsProposal',
    aminoType: "exchange/UpdateDenomDecimalsProposal",
  ),
  injectiveExchangeV1beta1BinaryOptionsMarketParamUpdateProposal(
    typeUrl:
        '/injective.exchange.v1beta1.BinaryOptionsMarketParamUpdateProposal',
    aminoType: "exchange/BinaryOptionsMarketParamUpdateProposal",
  ),
  injectiveExchangeV1beta1ProviderOracleParams(
    typeUrl: '/injective.exchange.v1beta1.ProviderOracleParams',
  ),
  injectiveExchangeV1beta1OracleParams(
    typeUrl: '/injective.exchange.v1beta1.OracleParams',
  ),
  injectiveExchangeV1beta1TradingRewardCampaignUpdateProposal(
    typeUrl: '/injective.exchange.v1beta1.TradingRewardCampaignUpdateProposal',
    aminoType: "exchange/TradingRewardCampaignUpdateProposal",
  ),
  injectiveExchangeV1beta1FeeDiscountProposal(
    typeUrl: '/injective.exchange.v1beta1.FeeDiscountProposal',
    aminoType: "exchange/FeeDiscountProposal",
  ),
  injectiveExchangeV1beta1DenomMinNotionalProposal(
    typeUrl: '/injective.exchange.v1beta1.DenomMinNotionalProposal',
    aminoType: "exchange/DenomMinNotionalProposal",
  ),
  injectiveExchangeV1beta1OpenNotionalCap(
    typeUrl: '/injective.exchange.v1beta1.OpenNotionalCap',
    aminoType: "injective.exchange.v1beta1.OpenNotionalCap",
  ),
  injectiveExchangeV1beta1OpenNotionalCapUncapped(
    typeUrl: '/injective.exchange.v1beta1.OpenNotionalCapUncapped',
    aminoType: "injective.exchange.v1beta1.OpenNotionalCapUncapped",
  ),
  injectiveExchangeV1beta1OpenNotionalCapCapped(
    typeUrl: '/injective.exchange.v1beta1.OpenNotionalCapCapped',
    aminoType: "injective.exchange.v1beta1.OpenNotionalCapCapped",
  ),
  injectiveExchangeV1beta1Params(
    typeUrl: '/injective.exchange.v1beta1.Params',
    aminoType: "exchange/Params",
  ),
  injectiveExchangeV1beta1MarketFeeMultiplier(
    typeUrl: '/injective.exchange.v1beta1.MarketFeeMultiplier',
  ),
  injectiveExchangeV1beta1DerivativeMarket(
    typeUrl: '/injective.exchange.v1beta1.DerivativeMarket',
  ),
  injectiveExchangeV1beta1BinaryOptionsMarket(
    typeUrl: '/injective.exchange.v1beta1.BinaryOptionsMarket',
  ),
  injectiveExchangeV1beta1ExpiryFuturesMarketInfo(
    typeUrl: '/injective.exchange.v1beta1.ExpiryFuturesMarketInfo',
  ),
  injectiveExchangeV1beta1PerpetualMarketInfo(
    typeUrl: '/injective.exchange.v1beta1.PerpetualMarketInfo',
  ),
  injectiveExchangeV1beta1PerpetualMarketFunding(
    typeUrl: '/injective.exchange.v1beta1.PerpetualMarketFunding',
  ),
  injectiveExchangeV1beta1DerivativeMarketSettlementInfo(
    typeUrl: '/injective.exchange.v1beta1.DerivativeMarketSettlementInfo',
  ),
  injectiveExchangeV1beta1MidPriceAndTOB(
    typeUrl: '/injective.exchange.v1beta1.MidPriceAndTOB',
  ),
  injectiveExchangeV1beta1SpotMarket(
    typeUrl: '/injective.exchange.v1beta1.SpotMarket',
  ),
  injectiveExchangeV1beta1Deposit(
    typeUrl: '/injective.exchange.v1beta1.Deposit',
  ),
  injectiveExchangeV1beta1SubaccountTradeNonce(
    typeUrl: '/injective.exchange.v1beta1.SubaccountTradeNonce',
  ),
  injectiveExchangeV1beta1OrderInfo(
    typeUrl: '/injective.exchange.v1beta1.OrderInfo',
  ),
  injectiveExchangeV1beta1SpotOrder(
    typeUrl: '/injective.exchange.v1beta1.SpotOrder',
  ),
  injectiveExchangeV1beta1SpotLimitOrder(
    typeUrl: '/injective.exchange.v1beta1.SpotLimitOrder',
  ),
  injectiveExchangeV1beta1DerivativeOrder(
    typeUrl: '/injective.exchange.v1beta1.DerivativeOrder',
  ),
  injectiveExchangeV1beta1SubaccountOrderbookMetadata(
    typeUrl: '/injective.exchange.v1beta1.SubaccountOrderbookMetadata',
  ),
  injectiveExchangeV1beta1SubaccountOrder(
    typeUrl: '/injective.exchange.v1beta1.SubaccountOrder',
  ),
  injectiveExchangeV1beta1SubaccountOrderData(
    typeUrl: '/injective.exchange.v1beta1.SubaccountOrderData',
  ),
  injectiveExchangeV1beta1DerivativeLimitOrder(
    typeUrl: '/injective.exchange.v1beta1.DerivativeLimitOrder',
  ),
  injectiveExchangeV1beta1DerivativeMarketOrder(
    typeUrl: '/injective.exchange.v1beta1.DerivativeMarketOrder',
  ),
  injectiveExchangeV1beta1Position(
    typeUrl: '/injective.exchange.v1beta1.Position',
  ),
  injectiveExchangeV1beta1PositionDelta(
    typeUrl: '/injective.exchange.v1beta1.PositionDelta',
  ),
  injectiveExchangeV1beta1PointsMultiplier(
    typeUrl: '/injective.exchange.v1beta1.PointsMultiplier',
  ),
  injectiveExchangeV1beta1TradingRewardCampaignBoostInfo(
    typeUrl: '/injective.exchange.v1beta1.TradingRewardCampaignBoostInfo',
  ),
  injectiveExchangeV1beta1CampaignRewardPool(
    typeUrl: '/injective.exchange.v1beta1.CampaignRewardPool',
  ),
  injectiveExchangeV1beta1TradingRewardCampaignInfo(
    typeUrl: '/injective.exchange.v1beta1.TradingRewardCampaignInfo',
  ),
  injectiveExchangeV1beta1FeeDiscountTierInfo(
    typeUrl: '/injective.exchange.v1beta1.FeeDiscountTierInfo',
  ),
  injectiveExchangeV1beta1FeeDiscountSchedule(
    typeUrl: '/injective.exchange.v1beta1.FeeDiscountSchedule',
  ),
  injectiveExchangeV1beta1FeeDiscountTierTTL(
    typeUrl: '/injective.exchange.v1beta1.FeeDiscountTierTTL',
  ),
  injectiveExchangeV1beta1VolumeRecord(
    typeUrl: '/injective.exchange.v1beta1.VolumeRecord',
  ),
  injectiveExchangeV1beta1TradeRecords(
    typeUrl: '/injective.exchange.v1beta1.TradeRecords',
  ),
  injectiveExchangeV1beta1TradeRecord(
    typeUrl: '/injective.exchange.v1beta1.TradeRecord',
  ),
  injectiveExchangeV1beta1Level(typeUrl: '/injective.exchange.v1beta1.Level'),
  injectiveExchangeV1beta1AggregateSubaccountVolumeRecord(
    typeUrl: '/injective.exchange.v1beta1.AggregateSubaccountVolumeRecord',
  ),
  injectiveExchangeV1beta1AggregateAccountVolumeRecord(
    typeUrl: '/injective.exchange.v1beta1.AggregateAccountVolumeRecord',
  ),
  injectiveExchangeV1beta1MarketVolume(
    typeUrl: '/injective.exchange.v1beta1.MarketVolume',
  ),
  injectiveExchangeV1beta1DenomDecimals(
    typeUrl: '/injective.exchange.v1beta1.DenomDecimals',
  ),
  injectiveExchangeV1beta1GrantAuthorization(
    typeUrl: '/injective.exchange.v1beta1.GrantAuthorization',
  ),
  injectiveExchangeV1beta1ActiveGrant(
    typeUrl: '/injective.exchange.v1beta1.ActiveGrant',
  ),
  injectiveExchangeV1beta1EffectiveGrant(
    typeUrl: '/injective.exchange.v1beta1.EffectiveGrant',
  ),
  injectiveExchangeV1beta1DenomMinNotional(
    typeUrl: '/injective.exchange.v1beta1.DenomMinNotional',
  ),
  injectiveExchangeV1beta1MsgUpdateSpotMarket(
    typeUrl: '/injective.exchange.v1beta1.MsgUpdateSpotMarket',
    serviceUrl: "/injective.exchange.v1beta1.Msg/UpdateSpotMarket",
    aminoType: "exchange/MsgUpdateSpotMarket",
  ),
  injectiveExchangeV1beta1MsgUpdateSpotMarketResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgUpdateSpotMarketResponse',
  ),
  injectiveExchangeV1beta1MsgUpdateDerivativeMarket(
    typeUrl: '/injective.exchange.v1beta1.MsgUpdateDerivativeMarket',
    serviceUrl: "/injective.exchange.v1beta1.Msg/UpdateDerivativeMarket",
    aminoType: "exchange/MsgUpdateDerivativeMarket",
  ),
  injectiveExchangeV1beta1MsgUpdateDerivativeMarketResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgUpdateDerivativeMarketResponse',
  ),
  injectiveExchangeV1beta1MsgDeposit(
    typeUrl: '/injective.exchange.v1beta1.MsgDeposit',
    serviceUrl: "/injective.exchange.v1beta1.Msg/Deposit",
    aminoType: "exchange/MsgDeposit",
  ),
  injectiveExchangeV1beta1MsgDepositResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgDepositResponse',
  ),
  injectiveExchangeV1beta1MsgWithdraw(
    typeUrl: '/injective.exchange.v1beta1.MsgWithdraw',
    serviceUrl: "/injective.exchange.v1beta1.Msg/Withdraw",
    aminoType: "exchange/MsgWithdraw",
  ),
  injectiveExchangeV1beta1MsgWithdrawResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgWithdrawResponse',
  ),
  injectiveExchangeV1beta1MsgCreateSpotLimitOrder(
    typeUrl: '/injective.exchange.v1beta1.MsgCreateSpotLimitOrder',
    serviceUrl: "/injective.exchange.v1beta1.Msg/CreateSpotLimitOrder",
    aminoType: "exchange/MsgCreateSpotLimitOrder",
  ),
  injectiveExchangeV1beta1MsgCreateSpotLimitOrderResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgCreateSpotLimitOrderResponse',
  ),
  injectiveExchangeV1beta1MsgBatchCreateSpotLimitOrders(
    typeUrl: '/injective.exchange.v1beta1.MsgBatchCreateSpotLimitOrders',
    serviceUrl: "/injective.exchange.v1beta1.Msg/BatchCreateSpotLimitOrders",
    aminoType: "exchange/MsgBatchCreateSpotLimitOrders",
  ),
  injectiveExchangeV1beta1MsgBatchCreateSpotLimitOrdersResponse(
    typeUrl:
        '/injective.exchange.v1beta1.MsgBatchCreateSpotLimitOrdersResponse',
  ),
  injectiveExchangeV1beta1MsgInstantSpotMarketLaunch(
    typeUrl: '/injective.exchange.v1beta1.MsgInstantSpotMarketLaunch',
    serviceUrl: "/injective.exchange.v1beta1.Msg/InstantSpotMarketLaunch",
    aminoType: "exchange/MsgInstantSpotMarketLaunch",
  ),
  injectiveExchangeV1beta1MsgInstantSpotMarketLaunchResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgInstantSpotMarketLaunchResponse',
  ),
  injectiveExchangeV1beta1MsgInstantBinaryOptionsMarketLaunch(
    typeUrl: '/injective.exchange.v1beta1.MsgInstantBinaryOptionsMarketLaunch',
    serviceUrl:
        "/injective.exchange.v1beta1.Msg/InstantBinaryOptionsMarketLaunch",
    aminoType: "exchange/MsgInstantBinaryOptionsMarketLaunch",
  ),
  injectiveExchangeV1beta1MsgInstantBinaryOptionsMarketLaunchResponse(
    typeUrl:
        '/injective.exchange.v1beta1.MsgInstantBinaryOptionsMarketLaunchResponse',
  ),
  injectiveExchangeV1beta1MsgCreateSpotMarketOrder(
    typeUrl: '/injective.exchange.v1beta1.MsgCreateSpotMarketOrder',
    serviceUrl: "/injective.exchange.v1beta1.Msg/CreateSpotMarketOrder",
    aminoType: "exchange/MsgCreateSpotMarketOrder",
  ),
  injectiveExchangeV1beta1MsgCreateSpotMarketOrderResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgCreateSpotMarketOrderResponse',
  ),
  injectiveExchangeV1beta1SpotMarketOrderResults(
    typeUrl: '/injective.exchange.v1beta1.SpotMarketOrderResults',
  ),
  injectiveExchangeV1beta1MsgCreateDerivativeLimitOrder(
    typeUrl: '/injective.exchange.v1beta1.MsgCreateDerivativeLimitOrder',
    serviceUrl: "/injective.exchange.v1beta1.Msg/CreateDerivativeLimitOrder",
    aminoType: "exchange/MsgCreateDerivativeLimitOrder",
  ),
  injectiveExchangeV1beta1MsgCreateDerivativeLimitOrderResponse(
    typeUrl:
        '/injective.exchange.v1beta1.MsgCreateDerivativeLimitOrderResponse',
  ),
  injectiveExchangeV1beta1MsgCreateBinaryOptionsLimitOrder(
    typeUrl: '/injective.exchange.v1beta1.MsgCreateBinaryOptionsLimitOrder',
    serviceUrl: "/injective.exchange.v1beta1.Msg/CreateBinaryOptionsLimitOrder",
    aminoType: "exchange/MsgCreateBinaryOptionsLimitOrder",
  ),
  injectiveExchangeV1beta1MsgCreateBinaryOptionsLimitOrderResponse(
    typeUrl:
        '/injective.exchange.v1beta1.MsgCreateBinaryOptionsLimitOrderResponse',
  ),
  injectiveExchangeV1beta1MsgBatchCreateDerivativeLimitOrders(
    typeUrl: '/injective.exchange.v1beta1.MsgBatchCreateDerivativeLimitOrders',
    serviceUrl:
        "/injective.exchange.v1beta1.Msg/BatchCreateDerivativeLimitOrders",
    aminoType: "exchange/MsgBatchCreateDerivativeLimitOrders",
  ),
  injectiveExchangeV1beta1MsgBatchCreateDerivativeLimitOrdersResponse(
    typeUrl:
        '/injective.exchange.v1beta1.MsgBatchCreateDerivativeLimitOrdersResponse',
  ),
  injectiveExchangeV1beta1MsgCancelSpotOrder(
    typeUrl: '/injective.exchange.v1beta1.MsgCancelSpotOrder',
    serviceUrl: "/injective.exchange.v1beta1.Msg/CancelSpotOrder",
    aminoType: "exchange/MsgCancelSpotOrder",
  ),
  injectiveExchangeV1beta1MsgCancelSpotOrderResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgCancelSpotOrderResponse',
  ),
  injectiveExchangeV1beta1MsgBatchCancelSpotOrders(
    typeUrl: '/injective.exchange.v1beta1.MsgBatchCancelSpotOrders',
    serviceUrl: "/injective.exchange.v1beta1.Msg/BatchCancelSpotOrders",
    aminoType: "exchange/MsgBatchCancelSpotOrders",
  ),
  injectiveExchangeV1beta1MsgBatchCancelSpotOrdersResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgBatchCancelSpotOrdersResponse',
  ),
  injectiveExchangeV1beta1MsgBatchCancelBinaryOptionsOrders(
    typeUrl: '/injective.exchange.v1beta1.MsgBatchCancelBinaryOptionsOrders',
    serviceUrl:
        "/injective.exchange.v1beta1.Msg/BatchCancelBinaryOptionsOrders",
    aminoType: "exchange/MsgBatchCancelBinaryOptionsOrders",
  ),
  injectiveExchangeV1beta1MsgBatchCancelBinaryOptionsOrdersResponse(
    typeUrl:
        '/injective.exchange.v1beta1.MsgBatchCancelBinaryOptionsOrdersResponse',
  ),
  injectiveExchangeV1beta1MsgBatchUpdateOrders(
    typeUrl: '/injective.exchange.v1beta1.MsgBatchUpdateOrders',
    serviceUrl: "/injective.exchange.v1beta1.Msg/BatchUpdateOrders",
    aminoType: "exchange/MsgBatchUpdateOrders",
  ),
  injectiveExchangeV1beta1MsgBatchUpdateOrdersResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgBatchUpdateOrdersResponse',
  ),
  injectiveExchangeV1beta1MsgCreateDerivativeMarketOrder(
    typeUrl: '/injective.exchange.v1beta1.MsgCreateDerivativeMarketOrder',
    serviceUrl: "/injective.exchange.v1beta1.Msg/CreateDerivativeMarketOrder",
    aminoType: "exchange/MsgCreateDerivativeMarketOrder",
  ),
  injectiveExchangeV1beta1MsgCreateDerivativeMarketOrderResponse(
    typeUrl:
        '/injective.exchange.v1beta1.MsgCreateDerivativeMarketOrderResponse',
  ),
  injectiveExchangeV1beta1DerivativeMarketOrderResults(
    typeUrl: '/injective.exchange.v1beta1.DerivativeMarketOrderResults',
  ),
  injectiveExchangeV1beta1MsgCreateBinaryOptionsMarketOrder(
    typeUrl: '/injective.exchange.v1beta1.MsgCreateBinaryOptionsMarketOrder',
    serviceUrl:
        "/injective.exchange.v1beta1.Msg/CreateBinaryOptionsMarketOrder",
    aminoType: "exchange/MsgCreateBinaryOptionsMarketOrder",
  ),
  injectiveExchangeV1beta1MsgCreateBinaryOptionsMarketOrderResponse(
    typeUrl:
        '/injective.exchange.v1beta1.MsgCreateBinaryOptionsMarketOrderResponse',
  ),
  injectiveExchangeV1beta1MsgCancelDerivativeOrder(
    typeUrl: '/injective.exchange.v1beta1.MsgCancelDerivativeOrder',
    serviceUrl: "/injective.exchange.v1beta1.Msg/CancelDerivativeOrder",
    aminoType: "exchange/MsgCancelDerivativeOrder",
  ),
  injectiveExchangeV1beta1MsgCancelDerivativeOrderResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgCancelDerivativeOrderResponse',
  ),
  injectiveExchangeV1beta1MsgCancelBinaryOptionsOrder(
    typeUrl: '/injective.exchange.v1beta1.MsgCancelBinaryOptionsOrder',
    serviceUrl: "/injective.exchange.v1beta1.Msg/CancelBinaryOptionsOrder",
    aminoType: "exchange/MsgCancelBinaryOptionsOrder",
  ),
  injectiveExchangeV1beta1MsgCancelBinaryOptionsOrderResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgCancelBinaryOptionsOrderResponse',
  ),
  injectiveExchangeV1beta1OrderData(
    typeUrl: '/injective.exchange.v1beta1.OrderData',
  ),
  injectiveExchangeV1beta1MsgBatchCancelDerivativeOrders(
    typeUrl: '/injective.exchange.v1beta1.MsgBatchCancelDerivativeOrders',
    serviceUrl: "/injective.exchange.v1beta1.Msg/BatchCancelDerivativeOrders",
    aminoType: "exchange/MsgBatchCancelDerivativeOrders",
  ),
  injectiveExchangeV1beta1MsgBatchCancelDerivativeOrdersResponse(
    typeUrl:
        '/injective.exchange.v1beta1.MsgBatchCancelDerivativeOrdersResponse',
  ),
  injectiveExchangeV1beta1MsgSubaccountTransfer(
    typeUrl: '/injective.exchange.v1beta1.MsgSubaccountTransfer',
    serviceUrl: "/injective.exchange.v1beta1.Msg/SubaccountTransfer",
    aminoType: "exchange/MsgSubaccountTransfer",
  ),
  injectiveExchangeV1beta1MsgSubaccountTransferResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgSubaccountTransferResponse',
  ),
  injectiveExchangeV1beta1MsgExternalTransfer(
    typeUrl: '/injective.exchange.v1beta1.MsgExternalTransfer',
    serviceUrl: "/injective.exchange.v1beta1.Msg/ExternalTransfer",
    aminoType: "exchange/MsgExternalTransfer",
  ),
  injectiveExchangeV1beta1MsgExternalTransferResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgExternalTransferResponse',
  ),
  injectiveExchangeV1beta1MsgLiquidatePosition(
    typeUrl: '/injective.exchange.v1beta1.MsgLiquidatePosition',
    serviceUrl: "/injective.exchange.v1beta1.Msg/LiquidatePosition",
    aminoType: "exchange/MsgLiquidatePosition",
  ),
  injectiveExchangeV1beta1MsgLiquidatePositionResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgLiquidatePositionResponse',
  ),
  injectiveExchangeV1beta1MsgEmergencySettleMarket(
    typeUrl: '/injective.exchange.v1beta1.MsgEmergencySettleMarket',
    serviceUrl: "/injective.exchange.v1beta1.Msg/EmergencySettleMarket",
    aminoType: "exchange/MsgEmergencySettleMarket",
  ),
  injectiveExchangeV1beta1MsgEmergencySettleMarketResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgEmergencySettleMarketResponse',
  ),
  injectiveExchangeV1beta1MsgIncreasePositionMargin(
    typeUrl: '/injective.exchange.v1beta1.MsgIncreasePositionMargin',
    serviceUrl: "/injective.exchange.v1beta1.Msg/IncreasePositionMargin",
    aminoType: "exchange/MsgIncreasePositionMargin",
  ),
  injectiveExchangeV1beta1MsgIncreasePositionMarginResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgIncreasePositionMarginResponse',
  ),
  injectiveExchangeV1beta1MsgDecreasePositionMargin(
    typeUrl: '/injective.exchange.v1beta1.MsgDecreasePositionMargin',
    serviceUrl: "/injective.exchange.v1beta1.Msg/DecreasePositionMargin",
    aminoType: "exchange/MsgDecreasePositionMargin",
  ),
  injectiveExchangeV1beta1MsgDecreasePositionMarginResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgDecreasePositionMarginResponse',
  ),
  injectiveExchangeV1beta1MsgPrivilegedExecuteContract(
    typeUrl: '/injective.exchange.v1beta1.MsgPrivilegedExecuteContract',
    serviceUrl: "/injective.exchange.v1beta1.Msg/PrivilegedExecuteContract",
    aminoType: "exchange/MsgPrivilegedExecuteContract",
  ),
  injectiveExchangeV1beta1MsgPrivilegedExecuteContractResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgPrivilegedExecuteContractResponse',
  ),
  injectiveExchangeV1beta1MsgRewardsOptOut(
    typeUrl: '/injective.exchange.v1beta1.MsgRewardsOptOut',
    serviceUrl: "/injective.exchange.v1beta1.Msg/RewardsOptOut",
    aminoType: "exchange/MsgRewardsOptOut",
  ),
  injectiveExchangeV1beta1MsgRewardsOptOutResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgRewardsOptOutResponse',
  ),
  injectiveExchangeV1beta1MsgAdminUpdateBinaryOptionsMarket(
    typeUrl: '/injective.exchange.v1beta1.MsgAdminUpdateBinaryOptionsMarket',
    serviceUrl:
        "/injective.exchange.v1beta1.Msg/AdminUpdateBinaryOptionsMarket",
    aminoType: "exchange/MsgAdminUpdateBinaryOptionsMarket",
  ),
  injectiveExchangeV1beta1MsgAdminUpdateBinaryOptionsMarketResponse(
    typeUrl:
        '/injective.exchange.v1beta1.MsgAdminUpdateBinaryOptionsMarketResponse',
  ),
  injectiveExchangeV1beta1MsgAuthorizeStakeGrants(
    typeUrl: '/injective.exchange.v1beta1.MsgAuthorizeStakeGrants',
    serviceUrl: "/injective.exchange.v1beta1.Msg/AuthorizeStakeGrants",
    aminoType: "exchange/MsgAuthorizeStakeGrants",
  ),
  injectiveExchangeV1beta1MsgAuthorizeStakeGrantsResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgAuthorizeStakeGrantsResponse',
  ),
  injectiveExchangeV1beta1MsgActivateStakeGrant(
    typeUrl: '/injective.exchange.v1beta1.MsgActivateStakeGrant',
    serviceUrl: "/injective.exchange.v1beta1.Msg/ActivateStakeGrant",
    aminoType: "exchange/MsgActivateStakeGrant",
  ),
  injectiveExchangeV1beta1MsgActivateStakeGrantResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgActivateStakeGrantResponse',
  ),
  injectiveExchangeV1beta1MsgBatchExchangeModification(
    typeUrl: '/injective.exchange.v1beta1.MsgBatchExchangeModification',
    serviceUrl: "/injective.exchange.v1beta1.Msg/BatchExchangeModification",
    aminoType: "exchange/MsgBatchExchangeModification",
  ),
  injectiveExchangeV1beta1MsgBatchExchangeModificationResponse(
    typeUrl: '/injective.exchange.v1beta1.MsgBatchExchangeModificationResponse',
  ),
  injectiveCommonVouchersV1AddressVoucher(
    typeUrl: '/injective.common.vouchers.v1.AddressVoucher',
  ),
  injectiveOracleV1beta1QueryPythPriceRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryPythPriceRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/PythPrice",
  ),
  injectiveOracleV1beta1QueryPythPriceResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryPythPriceResponse',
  ),
  injectiveOracleV1beta1QueryParamsRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryParamsRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/Params",
  ),
  injectiveOracleV1beta1QueryParamsResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryParamsResponse',
  ),
  injectiveOracleV1beta1QueryBandRelayersRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryBandRelayersRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/BandRelayers",
  ),
  injectiveOracleV1beta1QueryBandRelayersResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryBandRelayersResponse',
  ),
  injectiveOracleV1beta1QueryBandPriceStatesRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryBandPriceStatesRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/BandPriceStates",
  ),
  injectiveOracleV1beta1QueryBandPriceStatesResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryBandPriceStatesResponse',
  ),
  injectiveOracleV1beta1QueryBandIBCPriceStatesRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryBandIBCPriceStatesRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/BandIBCPriceStates",
  ),
  injectiveOracleV1beta1QueryBandIBCPriceStatesResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryBandIBCPriceStatesResponse',
  ),
  injectiveOracleV1beta1QueryPriceFeedPriceStatesRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryPriceFeedPriceStatesRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/PriceFeedPriceStates",
  ),
  injectiveOracleV1beta1QueryPriceFeedPriceStatesResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryPriceFeedPriceStatesResponse',
  ),
  injectiveOracleV1beta1QueryCoinbasePriceStatesRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryCoinbasePriceStatesRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/CoinbasePriceStates",
  ),
  injectiveOracleV1beta1QueryCoinbasePriceStatesResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryCoinbasePriceStatesResponse',
  ),
  injectiveOracleV1beta1QueryPythPriceStatesRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryPythPriceStatesRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/PythPriceStates",
  ),
  injectiveOracleV1beta1QueryPythPriceStatesResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryPythPriceStatesResponse',
  ),
  injectiveOracleV1beta1QueryPythProPriceStatesRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryPythProPriceStatesRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/PythProPriceStates",
  ),
  injectiveOracleV1beta1QueryPythProPriceStatesResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryPythProPriceStatesResponse',
  ),
  injectiveOracleV1beta1QuerySedaFastPriceStatesRequest(
    typeUrl: '/injective.oracle.v1beta1.QuerySedaFastPriceStatesRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/SedaFastPriceStates",
  ),
  injectiveOracleV1beta1QuerySedaFastPriceStatesResponse(
    typeUrl: '/injective.oracle.v1beta1.QuerySedaFastPriceStatesResponse',
  ),
  injectiveOracleV1beta1QueryStorkPriceStatesRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryStorkPriceStatesRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/StorkPriceStates",
  ),
  injectiveOracleV1beta1QueryStorkPriceStatesResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryStorkPriceStatesResponse',
  ),
  injectiveOracleV1beta1QueryStorkPublishersRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryStorkPublishersRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/StorkPublishers",
  ),
  injectiveOracleV1beta1QueryStorkPublishersResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryStorkPublishersResponse',
  ),
  injectiveOracleV1beta1QueryProviderPriceStateRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryProviderPriceStateRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/ProviderPriceState",
  ),
  injectiveOracleV1beta1QueryProviderPriceStateResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryProviderPriceStateResponse',
  ),
  injectiveOracleV1beta1QueryChainlinkDataStreamsPriceStatesRequest(
    typeUrl:
        '/injective.oracle.v1beta1.QueryChainlinkDataStreamsPriceStatesRequest',
    serviceUrl:
        "/injective.oracle.v1beta1.Query/ChainlinkDataStreamsPriceStates",
  ),
  injectiveOracleV1beta1QueryChainlinkDataStreamsPriceStatesResponse(
    typeUrl:
        '/injective.oracle.v1beta1.QueryChainlinkDataStreamsPriceStatesResponse',
  ),
  injectiveOracleV1beta1QueryModuleStateRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryModuleStateRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/OracleModuleState",
  ),
  injectiveOracleV1beta1QueryModuleStateResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryModuleStateResponse',
  ),
  injectiveOracleV1beta1QueryHistoricalPriceRecordsRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryHistoricalPriceRecordsRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/HistoricalPriceRecords",
  ),
  injectiveOracleV1beta1QueryHistoricalPriceRecordsResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryHistoricalPriceRecordsResponse',
  ),
  injectiveOracleV1beta1OracleHistoryOptions(
    typeUrl: '/injective.oracle.v1beta1.OracleHistoryOptions',
  ),
  injectiveOracleV1beta1QueryOracleVolatilityRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryOracleVolatilityRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/OracleVolatility",
  ),
  injectiveOracleV1beta1QueryOracleVolatilityResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryOracleVolatilityResponse',
  ),
  injectiveOracleV1beta1QueryOracleProvidersInfoRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryOracleProvidersInfoRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/OracleProvidersInfo",
  ),
  injectiveOracleV1beta1QueryOracleProvidersInfoResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryOracleProvidersInfoResponse',
  ),
  injectiveOracleV1beta1QueryOracleProviderPricesRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryOracleProviderPricesRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/OracleProviderPrices",
  ),
  injectiveOracleV1beta1QueryOracleProviderPricesResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryOracleProviderPricesResponse',
  ),
  injectiveOracleV1beta1ScalingOptions(
    typeUrl: '/injective.oracle.v1beta1.ScalingOptions',
  ),
  injectiveOracleV1beta1QueryOraclePriceRequest(
    typeUrl: '/injective.oracle.v1beta1.QueryOraclePriceRequest',
    serviceUrl: "/injective.oracle.v1beta1.Query/OraclePrice",
  ),
  injectiveOracleV1beta1PricePairState(
    typeUrl: '/injective.oracle.v1beta1.PricePairState',
  ),
  injectiveOracleV1beta1QueryOraclePriceResponse(
    typeUrl: '/injective.oracle.v1beta1.QueryOraclePriceResponse',
  ),
  injectiveOracleV1beta1Params(
    typeUrl: '/injective.oracle.v1beta1.Params',
    aminoType: "oracle/Params",
  ),
  injectiveOracleV1beta1SedaFastParams(
    typeUrl: '/injective.oracle.v1beta1.SedaFastParams',
  ),
  injectiveOracleV1beta1OracleInfo(
    typeUrl: '/injective.oracle.v1beta1.OracleInfo',
  ),
  injectiveOracleV1beta1ChainlinkPriceState(
    typeUrl: '/injective.oracle.v1beta1.ChainlinkPriceState',
  ),
  injectiveOracleV1beta1BandPriceState(
    typeUrl: '/injective.oracle.v1beta1.BandPriceState',
  ),
  injectiveOracleV1beta1PriceFeedState(
    typeUrl: '/injective.oracle.v1beta1.PriceFeedState',
  ),
  injectiveOracleV1beta1ProviderInfo(
    typeUrl: '/injective.oracle.v1beta1.ProviderInfo',
  ),
  injectiveOracleV1beta1ProviderState(
    typeUrl: '/injective.oracle.v1beta1.ProviderState',
  ),
  injectiveOracleV1beta1ProviderPriceState(
    typeUrl: '/injective.oracle.v1beta1.ProviderPriceState',
  ),
  injectiveOracleV1beta1CoinbasePriceState(
    typeUrl: '/injective.oracle.v1beta1.CoinbasePriceState',
  ),
  injectiveOracleV1beta1StorkPriceState(
    typeUrl: '/injective.oracle.v1beta1.StorkPriceState',
  ),
  injectiveOracleV1beta1PriceState(
    typeUrl: '/injective.oracle.v1beta1.PriceState',
  ),
  injectiveOracleV1beta1PythPriceState(
    typeUrl: '/injective.oracle.v1beta1.PythPriceState',
  ),
  injectiveOracleV1beta1ChainlinkDataStreamsPriceState(
    typeUrl: '/injective.oracle.v1beta1.ChainlinkDataStreamsPriceState',
  ),
  injectiveOracleV1beta1BandOracleRequest(
    typeUrl: '/injective.oracle.v1beta1.BandOracleRequest',
  ),
  injectiveOracleV1beta1BandIBCParams(
    typeUrl: '/injective.oracle.v1beta1.BandIBCParams',
  ),
  injectiveOracleV1beta1PriceRecords(
    typeUrl: '/injective.oracle.v1beta1.PriceRecords',
  ),
  injectiveOracleV1beta1PriceRecord(
    typeUrl: '/injective.oracle.v1beta1.PriceRecord',
  ),
  injectiveOracleV1beta1MetadataStatistics(
    typeUrl: '/injective.oracle.v1beta1.MetadataStatistics',
  ),
  injectiveOracleV1beta1PriceAttestation(
    typeUrl: '/injective.oracle.v1beta1.PriceAttestation',
  ),
  injectiveOracleV1beta1AssetPair(
    typeUrl: '/injective.oracle.v1beta1.AssetPair',
  ),
  injectiveOracleV1beta1SignedPriceOfAssetPair(
    typeUrl: '/injective.oracle.v1beta1.SignedPriceOfAssetPair',
  ),
  injectiveOracleV1beta1ChainlinkReport(
    typeUrl: '/injective.oracle.v1beta1.ChainlinkReport',
  ),
  injectiveOracleV1beta1PythProPriceState(
    typeUrl: '/injective.oracle.v1beta1.PythProPriceState',
  ),
  injectiveOracleV1beta1SedaFastPriceState(
    typeUrl: '/injective.oracle.v1beta1.SedaFastPriceState',
  ),
  injectiveOracleV1beta1GenesisState(
    typeUrl: '/injective.oracle.v1beta1.GenesisState',
  ),
  injectiveOracleV1beta1CalldataRecord(
    typeUrl: '/injective.oracle.v1beta1.CalldataRecord',
  ),
  injectiveOracleV1beta1MsgRelayProviderPrices(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayProviderPrices',
    serviceUrl: "/injective.oracle.v1beta1.Msg/RelayProviderPrices",
    aminoType: "oracle/MsgRelayProviderPrices",
  ),
  injectiveOracleV1beta1MsgRelayProviderPricesResponse(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayProviderPricesResponse',
  ),
  injectiveOracleV1beta1MsgRelayPriceFeedPrice(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayPriceFeedPrice',
    serviceUrl: "/injective.oracle.v1beta1.Msg/RelayPriceFeedPrice",
    aminoType: "oracle/MsgRelayPriceFeedPrice",
  ),
  injectiveOracleV1beta1MsgRelayPriceFeedPriceResponse(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayPriceFeedPriceResponse',
  ),
  injectiveOracleV1beta1MsgRelayCoinbaseMessages(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayCoinbaseMessages',
    serviceUrl: "/injective.oracle.v1beta1.Msg/RelayCoinbaseMessages",
    aminoType: "oracle/MsgRelayCoinbaseMessages",
  ),
  injectiveOracleV1beta1MsgRelayCoinbaseMessagesResponse(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayCoinbaseMessagesResponse',
  ),
  injectiveOracleV1beta1MsgRelayStorkPrices(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayStorkPrices',
    serviceUrl: "/injective.oracle.v1beta1.Msg/RelayStorkMessage",
  ),
  injectiveOracleV1beta1MsgRelayStorkPricesResponse(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayStorkPricesResponse',
  ),
  injectiveOracleV1beta1MsgRelayPythPrices(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayPythPrices',
    serviceUrl: "/injective.oracle.v1beta1.Msg/RelayPythPrices",
    aminoType: "oracle/MsgRelayPythPrices",
  ),
  injectiveOracleV1beta1MsgRelayPythPricesResponse(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayPythPricesResponse',
  ),
  injectiveOracleV1beta1MsgRelayChainlinkPrices(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayChainlinkPrices',
    serviceUrl: "/injective.oracle.v1beta1.Msg/RelayChainlinkPrices",
    aminoType: "oracle/MsgRelayChainlinkPrices",
  ),
  injectiveOracleV1beta1MsgRelayChainlinkPricesResponse(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayChainlinkPricesResponse',
  ),
  injectiveOracleV1beta1MsgRelayPythProPrices(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayPythProPrices',
    serviceUrl: "/injective.oracle.v1beta1.Msg/RelayPythProPrices",
    aminoType: "oracle/MsgRelayPythProPrices",
  ),
  injectiveOracleV1beta1MsgRelayPythProPricesResponse(
    typeUrl: '/injective.oracle.v1beta1.MsgRelayPythProPricesResponse',
  ),
  injectiveOracleV1beta1MsgRelaySedaFastPrices(
    typeUrl: '/injective.oracle.v1beta1.MsgRelaySedaFastPrices',
    serviceUrl: "/injective.oracle.v1beta1.Msg/RelaySedaFastPrices",
    aminoType: "oracle/MsgRelaySedaFastPrices",
  ),
  injectiveOracleV1beta1MsgRelaySedaFastPricesResponse(
    typeUrl: '/injective.oracle.v1beta1.MsgRelaySedaFastPricesResponse',
  ),
  injectiveOracleV1beta1MsgUpdateParams(
    typeUrl: '/injective.oracle.v1beta1.MsgUpdateParams',
    serviceUrl: "/injective.oracle.v1beta1.Msg/UpdateParams",
    aminoType: "oracle/MsgUpdateParams",
  ),
  injectiveOracleV1beta1MsgUpdateParamsResponse(
    typeUrl: '/injective.oracle.v1beta1.MsgUpdateParamsResponse',
  ),
  injectiveInsuranceV1beta1QueryInsuranceParamsRequest(
    typeUrl: '/injective.insurance.v1beta1.QueryInsuranceParamsRequest',
    serviceUrl: "/injective.insurance.v1beta1.Query/InsuranceParams",
  ),
  injectiveInsuranceV1beta1QueryInsuranceParamsResponse(
    typeUrl: '/injective.insurance.v1beta1.QueryInsuranceParamsResponse',
  ),
  injectiveInsuranceV1beta1QueryInsuranceFundRequest(
    typeUrl: '/injective.insurance.v1beta1.QueryInsuranceFundRequest',
    serviceUrl: "/injective.insurance.v1beta1.Query/InsuranceFund",
  ),
  injectiveInsuranceV1beta1QueryInsuranceFundResponse(
    typeUrl: '/injective.insurance.v1beta1.QueryInsuranceFundResponse',
  ),
  injectiveInsuranceV1beta1QueryInsuranceFundsRequest(
    typeUrl: '/injective.insurance.v1beta1.QueryInsuranceFundsRequest',
    serviceUrl: "/injective.insurance.v1beta1.Query/InsuranceFunds",
  ),
  injectiveInsuranceV1beta1QueryInsuranceFundsResponse(
    typeUrl: '/injective.insurance.v1beta1.QueryInsuranceFundsResponse',
  ),
  injectiveInsuranceV1beta1QueryEstimatedRedemptionsRequest(
    typeUrl: '/injective.insurance.v1beta1.QueryEstimatedRedemptionsRequest',
    serviceUrl: "/injective.insurance.v1beta1.Query/EstimatedRedemptions",
  ),
  injectiveInsuranceV1beta1QueryEstimatedRedemptionsResponse(
    typeUrl: '/injective.insurance.v1beta1.QueryEstimatedRedemptionsResponse',
  ),
  injectiveInsuranceV1beta1QueryPendingRedemptionsRequest(
    typeUrl: '/injective.insurance.v1beta1.QueryPendingRedemptionsRequest',
    serviceUrl: "/injective.insurance.v1beta1.Query/PendingRedemptions",
  ),
  injectiveInsuranceV1beta1QueryPendingRedemptionsResponse(
    typeUrl: '/injective.insurance.v1beta1.QueryPendingRedemptionsResponse',
  ),
  injectiveInsuranceV1beta1QueryModuleStateRequest(
    typeUrl: '/injective.insurance.v1beta1.QueryModuleStateRequest',
    serviceUrl: "/injective.insurance.v1beta1.Query/InsuranceModuleState",
  ),
  injectiveInsuranceV1beta1QueryModuleStateResponse(
    typeUrl: '/injective.insurance.v1beta1.QueryModuleStateResponse',
  ),
  injectiveInsuranceV1beta1QueryFailedRedemptionsRequest(
    typeUrl: '/injective.insurance.v1beta1.QueryFailedRedemptionsRequest',
    serviceUrl: "/injective.insurance.v1beta1.Query/FailedRedemptions",
  ),
  injectiveInsuranceV1beta1QueryFailedRedemptionsResponse(
    typeUrl: '/injective.insurance.v1beta1.QueryFailedRedemptionsResponse',
  ),
  injectiveInsuranceV1beta1QueryVouchersRequest(
    typeUrl: '/injective.insurance.v1beta1.QueryVouchersRequest',
    serviceUrl: "/injective.insurance.v1beta1.Query/Vouchers",
  ),
  injectiveInsuranceV1beta1QueryVouchersResponse(
    typeUrl: '/injective.insurance.v1beta1.QueryVouchersResponse',
  ),
  injectiveInsuranceV1beta1QueryVoucherRequest(
    typeUrl: '/injective.insurance.v1beta1.QueryVoucherRequest',
    serviceUrl: "/injective.insurance.v1beta1.Query/Voucher",
  ),
  injectiveInsuranceV1beta1QueryVoucherResponse(
    typeUrl: '/injective.insurance.v1beta1.QueryVoucherResponse',
  ),
  injectiveInsuranceV1beta1GenesisState(
    typeUrl: '/injective.insurance.v1beta1.GenesisState',
  ),
  injectiveInsuranceV1beta1MsgCreateInsuranceFund(
    typeUrl: '/injective.insurance.v1beta1.MsgCreateInsuranceFund',
    serviceUrl: "/injective.insurance.v1beta1.Msg/CreateInsuranceFund",
    aminoType: "insurance/MsgCreateInsuranceFund",
  ),
  injectiveInsuranceV1beta1MsgCreateInsuranceFundResponse(
    typeUrl: '/injective.insurance.v1beta1.MsgCreateInsuranceFundResponse',
  ),
  injectiveInsuranceV1beta1MsgUnderwrite(
    typeUrl: '/injective.insurance.v1beta1.MsgUnderwrite',
    serviceUrl: "/injective.insurance.v1beta1.Msg/Underwrite",
    aminoType: "insurance/MsgUnderwrite",
  ),
  injectiveInsuranceV1beta1MsgUnderwriteResponse(
    typeUrl: '/injective.insurance.v1beta1.MsgUnderwriteResponse',
  ),
  injectiveInsuranceV1beta1MsgRequestRedemption(
    typeUrl: '/injective.insurance.v1beta1.MsgRequestRedemption',
    serviceUrl: "/injective.insurance.v1beta1.Msg/RequestRedemption",
    aminoType: "insurance/MsgRequestRedemption",
  ),
  injectiveInsuranceV1beta1MsgRequestRedemptionResponse(
    typeUrl: '/injective.insurance.v1beta1.MsgRequestRedemptionResponse',
  ),
  injectiveInsuranceV1beta1MsgUpdateParams(
    typeUrl: '/injective.insurance.v1beta1.MsgUpdateParams',
    serviceUrl: "/injective.insurance.v1beta1.Msg/UpdateParams",
    aminoType: "insurance/MsgUpdateParams",
  ),
  injectiveInsuranceV1beta1MsgUpdateParamsResponse(
    typeUrl: '/injective.insurance.v1beta1.MsgUpdateParamsResponse',
  ),
  injectiveInsuranceV1beta1MsgClaimVoucher(
    typeUrl: '/injective.insurance.v1beta1.MsgClaimVoucher',
    serviceUrl: "/injective.insurance.v1beta1.Msg/ClaimVoucher",
    aminoType: "insurance/MsgClaimVoucher",
  ),
  injectiveInsuranceV1beta1MsgClaimVoucherResponse(
    typeUrl: '/injective.insurance.v1beta1.MsgClaimVoucherResponse',
  ),
  injectiveInsuranceV1beta1Params(
    typeUrl: '/injective.insurance.v1beta1.Params',
    aminoType: "insurance/Params",
  ),
  injectiveInsuranceV1beta1InsuranceFund(
    typeUrl: '/injective.insurance.v1beta1.InsuranceFund',
  ),
  injectiveInsuranceV1beta1RedemptionSchedule(
    typeUrl: '/injective.insurance.v1beta1.RedemptionSchedule',
  ),
  injectiveInsuranceV1beta1FailedRedemptionSchedule(
    typeUrl: '/injective.insurance.v1beta1.FailedRedemptionSchedule',
  ),
  injectiveErc20V1beta1QueryParamsRequest(
    typeUrl: '/injective.erc20.v1beta1.QueryParamsRequest',
    serviceUrl: "/injective.erc20.v1beta1.Query/Params",
  ),
  injectiveErc20V1beta1QueryParamsResponse(
    typeUrl: '/injective.erc20.v1beta1.QueryParamsResponse',
  ),
  injectiveErc20V1beta1QueryAllTokenPairsRequest(
    typeUrl: '/injective.erc20.v1beta1.QueryAllTokenPairsRequest',
    serviceUrl: "/injective.erc20.v1beta1.Query/AllTokenPairs",
  ),
  injectiveErc20V1beta1QueryAllTokenPairsResponse(
    typeUrl: '/injective.erc20.v1beta1.QueryAllTokenPairsResponse',
  ),
  injectiveErc20V1beta1QueryTokenPairByDenomRequest(
    typeUrl: '/injective.erc20.v1beta1.QueryTokenPairByDenomRequest',
    serviceUrl: "/injective.erc20.v1beta1.Query/TokenPairByDenom",
  ),
  injectiveErc20V1beta1QueryTokenPairByDenomResponse(
    typeUrl: '/injective.erc20.v1beta1.QueryTokenPairByDenomResponse',
  ),
  injectiveErc20V1beta1QueryTokenPairByERC20AddressRequest(
    typeUrl: '/injective.erc20.v1beta1.QueryTokenPairByERC20AddressRequest',
    serviceUrl: "/injective.erc20.v1beta1.Query/TokenPairByERC20Address",
  ),
  injectiveErc20V1beta1QueryTokenPairByERC20AddressResponse(
    typeUrl: '/injective.erc20.v1beta1.QueryTokenPairByERC20AddressResponse',
  ),
  injectiveErc20V1beta1TokenPair(typeUrl: '/injective.erc20.v1beta1.TokenPair'),
  injectiveErc20V1beta1Params(
    typeUrl: '/injective.erc20.v1beta1.Params',
    aminoType: "erc20/Params",
  ),
  injectiveErc20V1beta1MsgUpdateParams(
    typeUrl: '/injective.erc20.v1beta1.MsgUpdateParams',
    serviceUrl: "/injective.erc20.v1beta1.Msg/UpdateParams",
    aminoType: "erc20/MsgUpdateParams",
  ),
  injectiveErc20V1beta1MsgUpdateParamsResponse(
    typeUrl: '/injective.erc20.v1beta1.MsgUpdateParamsResponse',
  ),
  injectiveErc20V1beta1MsgCreateTokenPair(
    typeUrl: '/injective.erc20.v1beta1.MsgCreateTokenPair',
    serviceUrl: "/injective.erc20.v1beta1.Msg/CreateTokenPair",
    aminoType: "erc20/MsgCreateTokenPair",
  ),
  injectiveErc20V1beta1MsgCreateTokenPairResponse(
    typeUrl: '/injective.erc20.v1beta1.MsgCreateTokenPairResponse',
  ),
  injectiveErc20V1beta1MsgDeleteTokenPair(
    typeUrl: '/injective.erc20.v1beta1.MsgDeleteTokenPair',
    serviceUrl: "/injective.erc20.v1beta1.Msg/DeleteTokenPair",
    aminoType: "erc20/MsgDeleteTokenPair",
  ),
  injectiveErc20V1beta1MsgDeleteTokenPairResponse(
    typeUrl: '/injective.erc20.v1beta1.MsgDeleteTokenPairResponse',
  ),
  injectiveWasmxV1QueryWasmxParamsRequest(
    typeUrl: '/injective.wasmx.v1.QueryWasmxParamsRequest',
    serviceUrl: "/injective.wasmx.v1.Query/WasmxParams",
  ),
  injectiveWasmxV1QueryWasmxParamsResponse(
    typeUrl: '/injective.wasmx.v1.QueryWasmxParamsResponse',
  ),
  injectiveWasmxV1QueryModuleStateRequest(
    typeUrl: '/injective.wasmx.v1.QueryModuleStateRequest',
    serviceUrl: "/injective.wasmx.v1.Query/WasmxModuleState",
  ),
  injectiveWasmxV1QueryModuleStateResponse(
    typeUrl: '/injective.wasmx.v1.QueryModuleStateResponse',
  ),
  injectiveWasmxV1QueryContractRegistrationInfoRequest(
    typeUrl: '/injective.wasmx.v1.QueryContractRegistrationInfoRequest',
    serviceUrl: "/injective.wasmx.v1.Query/ContractRegistrationInfo",
  ),
  injectiveWasmxV1QueryContractRegistrationInfoResponse(
    typeUrl: '/injective.wasmx.v1.QueryContractRegistrationInfoResponse',
  ),
  injectiveWasmxV1RegisteredContractWithAddress(
    typeUrl: '/injective.wasmx.v1.RegisteredContractWithAddress',
  ),
  injectiveWasmxV1GenesisState(typeUrl: '/injective.wasmx.v1.GenesisState'),
  injectiveWasmxV1ContractRegistrationRequest(
    typeUrl: '/injective.wasmx.v1.ContractRegistrationRequest',
  ),
  injectiveWasmxV1Params(
    typeUrl: '/injective.wasmx.v1.Params',
    aminoType: "wasmx/Params",
  ),
  injectiveWasmxV1RegisteredContract(
    typeUrl: '/injective.wasmx.v1.RegisteredContract',
  ),
  injectiveWasmxV1MsgExecuteContractCompat(
    typeUrl: '/injective.wasmx.v1.MsgExecuteContractCompat',
    serviceUrl: "/injective.wasmx.v1.Msg/ExecuteContractCompat",
    aminoType: "wasmx/MsgExecuteContractCompat",
  ),
  injectiveWasmxV1MsgExecuteContractCompatResponse(
    typeUrl: '/injective.wasmx.v1.MsgExecuteContractCompatResponse',
  ),
  injectiveWasmxV1MsgUpdateContract(
    typeUrl: '/injective.wasmx.v1.MsgUpdateContract',
    serviceUrl: "/injective.wasmx.v1.Msg/UpdateRegistryContractParams",
    aminoType: "wasmx/MsgUpdateContract",
  ),
  injectiveWasmxV1MsgUpdateContractResponse(
    typeUrl: '/injective.wasmx.v1.MsgUpdateContractResponse',
  ),
  injectiveWasmxV1MsgActivateContract(
    typeUrl: '/injective.wasmx.v1.MsgActivateContract',
    serviceUrl: "/injective.wasmx.v1.Msg/ActivateRegistryContract",
    aminoType: "wasmx/MsgActivateContract",
  ),
  injectiveWasmxV1MsgActivateContractResponse(
    typeUrl: '/injective.wasmx.v1.MsgActivateContractResponse',
  ),
  injectiveWasmxV1MsgDeactivateContract(
    typeUrl: '/injective.wasmx.v1.MsgDeactivateContract',
    serviceUrl: "/injective.wasmx.v1.Msg/DeactivateRegistryContract",
    aminoType: "wasmx/MsgDeactivateContract",
  ),
  injectiveWasmxV1MsgDeactivateContractResponse(
    typeUrl: '/injective.wasmx.v1.MsgDeactivateContractResponse',
  ),
  injectiveWasmxV1MsgUpdateParams(
    typeUrl: '/injective.wasmx.v1.MsgUpdateParams',
    serviceUrl: "/injective.wasmx.v1.Msg/UpdateParams",
    aminoType: "wasmx/MsgUpdateParams",
  ),
  injectiveWasmxV1MsgUpdateParamsResponse(
    typeUrl: '/injective.wasmx.v1.MsgUpdateParamsResponse',
  ),
  injectiveWasmxV1MsgRegisterContract(
    typeUrl: '/injective.wasmx.v1.MsgRegisterContract',
    serviceUrl: "/injective.wasmx.v1.Msg/RegisterContract",
    aminoType: "wasmx/MsgRegisterContract",
  ),
  injectiveWasmxV1MsgRegisterContractResponse(
    typeUrl: '/injective.wasmx.v1.MsgRegisterContractResponse',
  ),
  injectiveDowntimedetectorV1beta1RecoveredSinceDowntimeOfLengthRequest(
    typeUrl:
        '/injective.downtimedetector.v1beta1.RecoveredSinceDowntimeOfLengthRequest',
    serviceUrl:
        "/injective.downtimedetector.v1beta1.Query/RecoveredSinceDowntimeOfLength",
  ),
  injectiveDowntimedetectorV1beta1RecoveredSinceDowntimeOfLengthResponse(
    typeUrl:
        '/injective.downtimedetector.v1beta1.RecoveredSinceDowntimeOfLengthResponse',
  ),
  injectiveTxfeesV1beta1Params(
    typeUrl: '/injective.txfees.v1beta1.Params',
    aminoType: "txfees/Params",
  ),
  injectiveTxfeesV1beta1EipBaseFee(
    typeUrl: '/injective.txfees.v1beta1.EipBaseFee',
  ),
  injectiveTxfeesV1beta1QueryParamsRequest(
    typeUrl: '/injective.txfees.v1beta1.QueryParamsRequest',
    serviceUrl: "/injective.txfees.v1beta1.Query/Params",
  ),
  injectiveTxfeesV1beta1QueryParamsResponse(
    typeUrl: '/injective.txfees.v1beta1.QueryParamsResponse',
  ),
  injectiveTxfeesV1beta1QueryEipBaseFeeRequest(
    typeUrl: '/injective.txfees.v1beta1.QueryEipBaseFeeRequest',
    serviceUrl: "/injective.txfees.v1beta1.Query/GetEipBaseFee",
  ),
  injectiveTxfeesV1beta1QueryEipBaseFeeResponse(
    typeUrl: '/injective.txfees.v1beta1.QueryEipBaseFeeResponse',
  ),
  injectiveTxfeesV1beta1MsgUpdateParams(
    typeUrl: '/injective.txfees.v1beta1.MsgUpdateParams',
    serviceUrl: "/injective.txfees.v1beta1.Msg/UpdateParams",
    aminoType: "txfees/MsgUpdateParams",
  ),
  injectiveTxfeesV1beta1MsgUpdateParamsResponse(
    typeUrl: '/injective.txfees.v1beta1.MsgUpdateParamsResponse',
  ),
  injectivePermissionsV1beta1QueryParamsRequest(
    typeUrl: '/injective.permissions.v1beta1.QueryParamsRequest',
    serviceUrl: "/injective.permissions.v1beta1.Query/Params",
  ),
  injectivePermissionsV1beta1QueryParamsResponse(
    typeUrl: '/injective.permissions.v1beta1.QueryParamsResponse',
  ),
  injectivePermissionsV1beta1QueryNamespaceDenomsRequest(
    typeUrl: '/injective.permissions.v1beta1.QueryNamespaceDenomsRequest',
    serviceUrl: "/injective.permissions.v1beta1.Query/NamespaceDenoms",
  ),
  injectivePermissionsV1beta1QueryNamespaceDenomsResponse(
    typeUrl: '/injective.permissions.v1beta1.QueryNamespaceDenomsResponse',
  ),
  injectivePermissionsV1beta1QueryNamespacesRequest(
    typeUrl: '/injective.permissions.v1beta1.QueryNamespacesRequest',
    serviceUrl: "/injective.permissions.v1beta1.Query/Namespaces",
  ),
  injectivePermissionsV1beta1QueryNamespacesResponse(
    typeUrl: '/injective.permissions.v1beta1.QueryNamespacesResponse',
  ),
  injectivePermissionsV1beta1QueryNamespaceRequest(
    typeUrl: '/injective.permissions.v1beta1.QueryNamespaceRequest',
    serviceUrl: "/injective.permissions.v1beta1.Query/Namespace",
  ),
  injectivePermissionsV1beta1QueryNamespaceResponse(
    typeUrl: '/injective.permissions.v1beta1.QueryNamespaceResponse',
  ),
  injectivePermissionsV1beta1QueryActorsByRoleRequest(
    typeUrl: '/injective.permissions.v1beta1.QueryActorsByRoleRequest',
    serviceUrl: "/injective.permissions.v1beta1.Query/ActorsByRole",
  ),
  injectivePermissionsV1beta1QueryActorsByRoleResponse(
    typeUrl: '/injective.permissions.v1beta1.QueryActorsByRoleResponse',
  ),
  injectivePermissionsV1beta1QueryRolesByActorRequest(
    typeUrl: '/injective.permissions.v1beta1.QueryRolesByActorRequest',
    serviceUrl: "/injective.permissions.v1beta1.Query/RolesByActor",
  ),
  injectivePermissionsV1beta1QueryRolesByActorResponse(
    typeUrl: '/injective.permissions.v1beta1.QueryRolesByActorResponse',
  ),
  injectivePermissionsV1beta1QueryRoleManagersRequest(
    typeUrl: '/injective.permissions.v1beta1.QueryRoleManagersRequest',
    serviceUrl: "/injective.permissions.v1beta1.Query/RoleManagers",
  ),
  injectivePermissionsV1beta1QueryRoleManagersResponse(
    typeUrl: '/injective.permissions.v1beta1.QueryRoleManagersResponse',
  ),
  injectivePermissionsV1beta1QueryRoleManagerRequest(
    typeUrl: '/injective.permissions.v1beta1.QueryRoleManagerRequest',
    serviceUrl: "/injective.permissions.v1beta1.Query/RoleManager",
  ),
  injectivePermissionsV1beta1QueryRoleManagerResponse(
    typeUrl: '/injective.permissions.v1beta1.QueryRoleManagerResponse',
  ),
  injectivePermissionsV1beta1QueryPolicyStatusesRequest(
    typeUrl: '/injective.permissions.v1beta1.QueryPolicyStatusesRequest',
    serviceUrl: "/injective.permissions.v1beta1.Query/PolicyStatuses",
  ),
  injectivePermissionsV1beta1QueryPolicyStatusesResponse(
    typeUrl: '/injective.permissions.v1beta1.QueryPolicyStatusesResponse',
  ),
  injectivePermissionsV1beta1QueryPolicyManagerCapabilitiesRequest(
    typeUrl:
        '/injective.permissions.v1beta1.QueryPolicyManagerCapabilitiesRequest',
    serviceUrl:
        "/injective.permissions.v1beta1.Query/PolicyManagerCapabilities",
  ),
  injectivePermissionsV1beta1QueryPolicyManagerCapabilitiesResponse(
    typeUrl:
        '/injective.permissions.v1beta1.QueryPolicyManagerCapabilitiesResponse',
  ),
  injectivePermissionsV1beta1QueryVouchersRequest(
    typeUrl: '/injective.permissions.v1beta1.QueryVouchersRequest',
    serviceUrl: "/injective.permissions.v1beta1.Query/Vouchers",
  ),
  injectivePermissionsV1beta1QueryVouchersResponse(
    typeUrl: '/injective.permissions.v1beta1.QueryVouchersResponse',
  ),
  injectivePermissionsV1beta1QueryVoucherRequest(
    typeUrl: '/injective.permissions.v1beta1.QueryVoucherRequest',
    serviceUrl: "/injective.permissions.v1beta1.Query/Voucher",
  ),
  injectivePermissionsV1beta1QueryVoucherResponse(
    typeUrl: '/injective.permissions.v1beta1.QueryVoucherResponse',
  ),
  injectivePermissionsV1beta1QueryModuleStateRequest(
    typeUrl: '/injective.permissions.v1beta1.QueryModuleStateRequest',
    serviceUrl: "/injective.permissions.v1beta1.Query/PermissionsModuleState",
  ),
  injectivePermissionsV1beta1QueryModuleStateResponse(
    typeUrl: '/injective.permissions.v1beta1.QueryModuleStateResponse',
  ),
  injectivePermissionsV1beta1GenesisState(
    typeUrl: '/injective.permissions.v1beta1.GenesisState',
  ),
  injectivePermissionsV1beta1Namespace(
    typeUrl: '/injective.permissions.v1beta1.Namespace',
  ),
  injectivePermissionsV1beta1ActorRoles(
    typeUrl: '/injective.permissions.v1beta1.ActorRoles',
  ),
  injectivePermissionsV1beta1RoleActors(
    typeUrl: '/injective.permissions.v1beta1.RoleActors',
  ),
  injectivePermissionsV1beta1RoleManager(
    typeUrl: '/injective.permissions.v1beta1.RoleManager',
  ),
  injectivePermissionsV1beta1PolicyStatus(
    typeUrl: '/injective.permissions.v1beta1.PolicyStatus',
  ),
  injectivePermissionsV1beta1Role(
    typeUrl: '/injective.permissions.v1beta1.Role',
  ),
  injectivePermissionsV1beta1PolicyManagerCapability(
    typeUrl: '/injective.permissions.v1beta1.PolicyManagerCapability',
  ),
  injectivePermissionsV1beta1EnforcedRestrictionsEVMContract(
    typeUrl: '/injective.permissions.v1beta1.EnforcedRestrictionsEVMContract',
  ),
  injectivePermissionsV1beta1Params(
    typeUrl: '/injective.permissions.v1beta1.Params',
    aminoType: "permissions/Params",
  ),
  injectivePermissionsV1beta1MsgUpdateParams(
    typeUrl: '/injective.permissions.v1beta1.MsgUpdateParams',
    serviceUrl: "/injective.permissions.v1beta1.Msg/UpdateParams",
    aminoType: "permissions/MsgUpdateParams",
  ),
  injectivePermissionsV1beta1MsgUpdateParamsResponse(
    typeUrl: '/injective.permissions.v1beta1.MsgUpdateParamsResponse',
  ),
  injectivePermissionsV1beta1MsgCreateNamespace(
    typeUrl: '/injective.permissions.v1beta1.MsgCreateNamespace',
    serviceUrl: "/injective.permissions.v1beta1.Msg/CreateNamespace",
    aminoType: "permissions/MsgCreateNamespace",
  ),
  injectivePermissionsV1beta1MsgCreateNamespaceResponse(
    typeUrl: '/injective.permissions.v1beta1.MsgCreateNamespaceResponse',
  ),
  injectivePermissionsV1beta1MsgUpdateNamespace(
    typeUrl: '/injective.permissions.v1beta1.MsgUpdateNamespace',
    serviceUrl: "/injective.permissions.v1beta1.Msg/UpdateNamespace",
    aminoType: "permissions/MsgUpdateNamespace",
  ),
  injectivePermissionsV1beta1MsgUpdateNamespaceSetContractHook(
    typeUrl:
        '/injective.permissions.v1beta1.MsgUpdateNamespace.SetContractHook',
  ),
  injectivePermissionsV1beta1MsgUpdateNamespaceResponse(
    typeUrl: '/injective.permissions.v1beta1.MsgUpdateNamespaceResponse',
  ),
  injectivePermissionsV1beta1MsgUpdateActorRoles(
    typeUrl: '/injective.permissions.v1beta1.MsgUpdateActorRoles',
    serviceUrl: "/injective.permissions.v1beta1.Msg/UpdateActorRoles",
    aminoType: "permissions/MsgUpdateActorRoles",
  ),
  injectivePermissionsV1beta1MsgUpdateActorRolesResponse(
    typeUrl: '/injective.permissions.v1beta1.MsgUpdateActorRolesResponse',
  ),
  injectivePermissionsV1beta1MsgClaimVoucher(
    typeUrl: '/injective.permissions.v1beta1.MsgClaimVoucher',
    serviceUrl: "/injective.permissions.v1beta1.Msg/ClaimVoucher",
    aminoType: "permissions/MsgClaimVoucher",
  ),
  injectivePermissionsV1beta1MsgClaimVoucherResponse(
    typeUrl: '/injective.permissions.v1beta1.MsgClaimVoucherResponse',
  ),
  injectiveTokenfactoryV1beta1QueryParamsRequest(
    typeUrl: '/injective.tokenfactory.v1beta1.QueryParamsRequest',
    serviceUrl: "/injective.tokenfactory.v1beta1.Query/Params",
  ),
  injectiveTokenfactoryV1beta1QueryParamsResponse(
    typeUrl: '/injective.tokenfactory.v1beta1.QueryParamsResponse',
  ),
  injectiveTokenfactoryV1beta1QueryDenomAuthorityMetadataRequest(
    typeUrl:
        '/injective.tokenfactory.v1beta1.QueryDenomAuthorityMetadataRequest',
    serviceUrl: "/injective.tokenfactory.v1beta1.Query/DenomAuthorityMetadata",
  ),
  injectiveTokenfactoryV1beta1QueryDenomAuthorityMetadataResponse(
    typeUrl:
        '/injective.tokenfactory.v1beta1.QueryDenomAuthorityMetadataResponse',
  ),
  injectiveTokenfactoryV1beta1QueryDenomsFromCreatorRequest(
    typeUrl: '/injective.tokenfactory.v1beta1.QueryDenomsFromCreatorRequest',
    serviceUrl: "/injective.tokenfactory.v1beta1.Query/DenomsFromCreator",
  ),
  injectiveTokenfactoryV1beta1QueryDenomsFromCreatorResponse(
    typeUrl: '/injective.tokenfactory.v1beta1.QueryDenomsFromCreatorResponse',
  ),
  injectiveTokenfactoryV1beta1QueryModuleStateRequest(
    typeUrl: '/injective.tokenfactory.v1beta1.QueryModuleStateRequest',
    serviceUrl: "/injective.tokenfactory.v1beta1.Query/TokenfactoryModuleState",
  ),
  injectiveTokenfactoryV1beta1QueryModuleStateResponse(
    typeUrl: '/injective.tokenfactory.v1beta1.QueryModuleStateResponse',
  ),
  injectiveTokenfactoryV1beta1GenesisState(
    typeUrl: '/injective.tokenfactory.v1beta1.GenesisState',
  ),
  injectiveTokenfactoryV1beta1GenesisDenom(
    typeUrl: '/injective.tokenfactory.v1beta1.GenesisDenom',
  ),
  injectiveTokenfactoryV1beta1DenomAuthorityMetadata(
    typeUrl: '/injective.tokenfactory.v1beta1.DenomAuthorityMetadata',
  ),
  injectiveTokenfactoryV1beta1Params(
    typeUrl: '/injective.tokenfactory.v1beta1.Params',
    aminoType: "injective/tokenfactory/Params",
  ),
  injectiveTokenfactoryV1beta1MsgCreateDenom(
    typeUrl: '/injective.tokenfactory.v1beta1.MsgCreateDenom',
    serviceUrl: "/injective.tokenfactory.v1beta1.Msg/CreateDenom",
    aminoType: "injective/tokenfactory/create-denom",
  ),
  injectiveTokenfactoryV1beta1MsgCreateDenomResponse(
    typeUrl: '/injective.tokenfactory.v1beta1.MsgCreateDenomResponse',
  ),
  injectiveTokenfactoryV1beta1MsgMint(
    typeUrl: '/injective.tokenfactory.v1beta1.MsgMint',
    serviceUrl: "/injective.tokenfactory.v1beta1.Msg/Mint",
    aminoType: "injective/tokenfactory/mint",
  ),
  injectiveTokenfactoryV1beta1MsgMintResponse(
    typeUrl: '/injective.tokenfactory.v1beta1.MsgMintResponse',
  ),
  injectiveTokenfactoryV1beta1MsgBurn(
    typeUrl: '/injective.tokenfactory.v1beta1.MsgBurn',
    serviceUrl: "/injective.tokenfactory.v1beta1.Msg/Burn",
    aminoType: "injective/tokenfactory/burn",
  ),
  injectiveTokenfactoryV1beta1MsgBurnResponse(
    typeUrl: '/injective.tokenfactory.v1beta1.MsgBurnResponse',
  ),
  injectiveTokenfactoryV1beta1MsgChangeAdmin(
    typeUrl: '/injective.tokenfactory.v1beta1.MsgChangeAdmin',
    serviceUrl: "/injective.tokenfactory.v1beta1.Msg/ChangeAdmin",
    aminoType: "injective/tokenfactory/change-admin",
  ),
  injectiveTokenfactoryV1beta1MsgChangeAdminResponse(
    typeUrl: '/injective.tokenfactory.v1beta1.MsgChangeAdminResponse',
  ),
  injectiveTokenfactoryV1beta1MsgSetDenomMetadata(
    typeUrl: '/injective.tokenfactory.v1beta1.MsgSetDenomMetadata',
    serviceUrl: "/injective.tokenfactory.v1beta1.Msg/SetDenomMetadata",
    aminoType: "injective/tokenfactory/set-denom-metadata",
  ),
  injectiveTokenfactoryV1beta1MsgSetDenomMetadataAdminBurnDisabled(
    typeUrl:
        '/injective.tokenfactory.v1beta1.MsgSetDenomMetadata.AdminBurnDisabled',
  ),
  injectiveTokenfactoryV1beta1MsgSetDenomMetadataResponse(
    typeUrl: '/injective.tokenfactory.v1beta1.MsgSetDenomMetadataResponse',
  ),
  injectiveTokenfactoryV1beta1MsgUpdateParams(
    typeUrl: '/injective.tokenfactory.v1beta1.MsgUpdateParams',
    serviceUrl: "/injective.tokenfactory.v1beta1.Msg/UpdateParams",
    aminoType: "injective/tokenfactory/update-params",
  ),
  injectiveTokenfactoryV1beta1MsgUpdateParamsResponse(
    typeUrl: '/injective.tokenfactory.v1beta1.MsgUpdateParamsResponse',
  ),
  injectivePeggyV1QueryParamsRequest(
    typeUrl: '/injective.peggy.v1.QueryParamsRequest',
    serviceUrl: "/injective.peggy.v1.Query/Params",
  ),
  injectivePeggyV1QueryParamsResponse(
    typeUrl: '/injective.peggy.v1.QueryParamsResponse',
  ),
  injectivePeggyV1QueryCurrentValsetRequest(
    typeUrl: '/injective.peggy.v1.QueryCurrentValsetRequest',
    serviceUrl: "/injective.peggy.v1.Query/CurrentValset",
  ),
  injectivePeggyV1QueryCurrentValsetResponse(
    typeUrl: '/injective.peggy.v1.QueryCurrentValsetResponse',
  ),
  injectivePeggyV1QueryValsetRequestRequest(
    typeUrl: '/injective.peggy.v1.QueryValsetRequestRequest',
    serviceUrl: "/injective.peggy.v1.Query/ValsetRequest",
  ),
  injectivePeggyV1QueryValsetRequestResponse(
    typeUrl: '/injective.peggy.v1.QueryValsetRequestResponse',
  ),
  injectivePeggyV1QueryValsetConfirmRequest(
    typeUrl: '/injective.peggy.v1.QueryValsetConfirmRequest',
    serviceUrl: "/injective.peggy.v1.Query/ValsetConfirm",
  ),
  injectivePeggyV1QueryValsetConfirmResponse(
    typeUrl: '/injective.peggy.v1.QueryValsetConfirmResponse',
  ),
  injectivePeggyV1QueryValsetConfirmsByNonceRequest(
    typeUrl: '/injective.peggy.v1.QueryValsetConfirmsByNonceRequest',
    serviceUrl: "/injective.peggy.v1.Query/ValsetConfirmsByNonce",
  ),
  injectivePeggyV1QueryValsetConfirmsByNonceResponse(
    typeUrl: '/injective.peggy.v1.QueryValsetConfirmsByNonceResponse',
  ),
  injectivePeggyV1QueryLastValsetRequestsRequest(
    typeUrl: '/injective.peggy.v1.QueryLastValsetRequestsRequest',
    serviceUrl: "/injective.peggy.v1.Query/LastValsetRequests",
  ),
  injectivePeggyV1QueryLastValsetRequestsResponse(
    typeUrl: '/injective.peggy.v1.QueryLastValsetRequestsResponse',
  ),
  injectivePeggyV1QueryLastPendingValsetRequestByAddrRequest(
    typeUrl: '/injective.peggy.v1.QueryLastPendingValsetRequestByAddrRequest',
    serviceUrl: "/injective.peggy.v1.Query/LastPendingValsetRequestByAddr",
  ),
  injectivePeggyV1QueryLastPendingValsetRequestByAddrResponse(
    typeUrl: '/injective.peggy.v1.QueryLastPendingValsetRequestByAddrResponse',
  ),
  injectivePeggyV1QueryBatchFeeRequest(
    typeUrl: '/injective.peggy.v1.QueryBatchFeeRequest',
    serviceUrl: "/injective.peggy.v1.Query/BatchFees",
  ),
  injectivePeggyV1QueryBatchFeeResponse(
    typeUrl: '/injective.peggy.v1.QueryBatchFeeResponse',
  ),
  injectivePeggyV1QueryLastPendingBatchRequestByAddrRequest(
    typeUrl: '/injective.peggy.v1.QueryLastPendingBatchRequestByAddrRequest',
    serviceUrl: "/injective.peggy.v1.Query/LastPendingBatchRequestByAddr",
  ),
  injectivePeggyV1QueryLastPendingBatchRequestByAddrResponse(
    typeUrl: '/injective.peggy.v1.QueryLastPendingBatchRequestByAddrResponse',
  ),
  injectivePeggyV1QueryOutgoingTxBatchesRequest(
    typeUrl: '/injective.peggy.v1.QueryOutgoingTxBatchesRequest',
    serviceUrl: "/injective.peggy.v1.Query/OutgoingTxBatches",
  ),
  injectivePeggyV1QueryOutgoingTxBatchesResponse(
    typeUrl: '/injective.peggy.v1.QueryOutgoingTxBatchesResponse',
  ),
  injectivePeggyV1QueryBatchRequestByNonceRequest(
    typeUrl: '/injective.peggy.v1.QueryBatchRequestByNonceRequest',
    serviceUrl: "/injective.peggy.v1.Query/BatchRequestByNonce",
  ),
  injectivePeggyV1QueryBatchRequestByNonceResponse(
    typeUrl: '/injective.peggy.v1.QueryBatchRequestByNonceResponse',
  ),
  injectivePeggyV1QueryBatchConfirmsRequest(
    typeUrl: '/injective.peggy.v1.QueryBatchConfirmsRequest',
    serviceUrl: "/injective.peggy.v1.Query/BatchConfirms",
  ),
  injectivePeggyV1QueryBatchConfirmsResponse(
    typeUrl: '/injective.peggy.v1.QueryBatchConfirmsResponse',
  ),
  injectivePeggyV1QueryLastEventByAddrRequest(
    typeUrl: '/injective.peggy.v1.QueryLastEventByAddrRequest',
    serviceUrl: "/injective.peggy.v1.Query/LastEventByAddr",
  ),
  injectivePeggyV1QueryLastEventByAddrResponse(
    typeUrl: '/injective.peggy.v1.QueryLastEventByAddrResponse',
  ),
  injectivePeggyV1QueryERC20ToDenomRequest(
    typeUrl: '/injective.peggy.v1.QueryERC20ToDenomRequest',
    serviceUrl: "/injective.peggy.v1.Query/ERC20ToDenom",
  ),
  injectivePeggyV1QueryERC20ToDenomResponse(
    typeUrl: '/injective.peggy.v1.QueryERC20ToDenomResponse',
  ),
  injectivePeggyV1QueryDenomToERC20Request(
    typeUrl: '/injective.peggy.v1.QueryDenomToERC20Request',
    serviceUrl: "/injective.peggy.v1.Query/DenomToERC20",
  ),
  injectivePeggyV1QueryDenomToERC20Response(
    typeUrl: '/injective.peggy.v1.QueryDenomToERC20Response',
  ),
  injectivePeggyV1QueryDelegateKeysByValidatorAddress(
    typeUrl: '/injective.peggy.v1.QueryDelegateKeysByValidatorAddress',
    serviceUrl: "/injective.peggy.v1.Query/GetDelegateKeyByValidator",
  ),
  injectivePeggyV1QueryDelegateKeysByValidatorAddressResponse(
    typeUrl: '/injective.peggy.v1.QueryDelegateKeysByValidatorAddressResponse',
  ),
  injectivePeggyV1QueryDelegateKeysByEthAddress(
    typeUrl: '/injective.peggy.v1.QueryDelegateKeysByEthAddress',
    serviceUrl: "/injective.peggy.v1.Query/GetDelegateKeyByEth",
  ),
  injectivePeggyV1QueryDelegateKeysByEthAddressResponse(
    typeUrl: '/injective.peggy.v1.QueryDelegateKeysByEthAddressResponse',
  ),
  injectivePeggyV1QueryDelegateKeysByOrchestratorAddress(
    typeUrl: '/injective.peggy.v1.QueryDelegateKeysByOrchestratorAddress',
    serviceUrl: "/injective.peggy.v1.Query/GetDelegateKeyByOrchestrator",
  ),
  injectivePeggyV1QueryDelegateKeysByOrchestratorAddressResponse(
    typeUrl:
        '/injective.peggy.v1.QueryDelegateKeysByOrchestratorAddressResponse',
  ),
  injectivePeggyV1QueryPendingSendToEth(
    typeUrl: '/injective.peggy.v1.QueryPendingSendToEth',
    serviceUrl: "/injective.peggy.v1.Query/GetPendingSendToEth",
  ),
  injectivePeggyV1QueryPendingSendToEthResponse(
    typeUrl: '/injective.peggy.v1.QueryPendingSendToEthResponse',
  ),
  injectivePeggyV1QueryModuleStateRequest(
    typeUrl: '/injective.peggy.v1.QueryModuleStateRequest',
    serviceUrl: "/injective.peggy.v1.Query/PeggyModuleState",
  ),
  injectivePeggyV1QueryModuleStateResponse(
    typeUrl: '/injective.peggy.v1.QueryModuleStateResponse',
  ),
  injectivePeggyV1MissingNoncesRequest(
    typeUrl: '/injective.peggy.v1.MissingNoncesRequest',
    serviceUrl: "/injective.peggy.v1.Query/MissingPeggoNonces",
  ),
  injectivePeggyV1MissingNoncesResponse(
    typeUrl: '/injective.peggy.v1.MissingNoncesResponse',
  ),
  injectivePeggyV1BatchFees(typeUrl: '/injective.peggy.v1.BatchFees'),
  injectivePeggyV1GenesisState(typeUrl: '/injective.peggy.v1.GenesisState'),
  injectivePeggyV1Attestation(typeUrl: '/injective.peggy.v1.Attestation'),
  injectivePeggyV1ERC20Token(typeUrl: '/injective.peggy.v1.ERC20Token'),
  injectivePeggyV1RateLimit(typeUrl: '/injective.peggy.v1.RateLimit'),
  injectivePeggyV1BridgeTransfer(typeUrl: '/injective.peggy.v1.BridgeTransfer'),
  injectivePeggyV1RateLimitTransfers(
    typeUrl: '/injective.peggy.v1.RateLimitTransfers',
  ),
  injectivePeggyV1BlockTransferRecord(
    typeUrl: '/injective.peggy.v1.BlockTransferRecord',
  ),
  injectivePeggyV1MintAmount(typeUrl: '/injective.peggy.v1.MintAmount'),
  injectivePeggyV1Params(
    typeUrl: '/injective.peggy.v1.Params',
    aminoType: "peggy/Params",
  ),
  injectivePeggyV1BridgeValidator(
    typeUrl: '/injective.peggy.v1.BridgeValidator',
  ),
  injectivePeggyV1Valset(typeUrl: '/injective.peggy.v1.Valset'),
  injectivePeggyV1LastClaimEvent(typeUrl: '/injective.peggy.v1.LastClaimEvent'),
  injectivePeggyV1ERC20ToDenom(typeUrl: '/injective.peggy.v1.ERC20ToDenom'),
  injectivePeggyV1MsgSetOrchestratorAddresses(
    typeUrl: '/injective.peggy.v1.MsgSetOrchestratorAddresses',
    serviceUrl: "/injective.peggy.v1.Msg/SetOrchestratorAddresses",
    aminoType: "peggy/MsgSetOrchestratorAddresses",
  ),
  injectivePeggyV1MsgSetOrchestratorAddressesResponse(
    typeUrl: '/injective.peggy.v1.MsgSetOrchestratorAddressesResponse',
  ),
  injectivePeggyV1MsgValsetConfirm(
    typeUrl: '/injective.peggy.v1.MsgValsetConfirm',
    serviceUrl: "/injective.peggy.v1.Msg/ValsetConfirm",
    aminoType: "peggy/MsgValsetConfirm",
  ),
  injectivePeggyV1MsgValsetConfirmResponse(
    typeUrl: '/injective.peggy.v1.MsgValsetConfirmResponse',
  ),
  injectivePeggyV1MsgSendToEth(
    typeUrl: '/injective.peggy.v1.MsgSendToEth',
    serviceUrl: "/injective.peggy.v1.Msg/SendToEth",
    aminoType: "peggy/MsgSendToEth",
  ),
  injectivePeggyV1MsgSendToEthResponse(
    typeUrl: '/injective.peggy.v1.MsgSendToEthResponse',
  ),
  injectivePeggyV1MsgRequestBatch(
    typeUrl: '/injective.peggy.v1.MsgRequestBatch',
    serviceUrl: "/injective.peggy.v1.Msg/RequestBatch",
    aminoType: "peggy/MsgRequestBatch",
  ),
  injectivePeggyV1MsgRequestBatchResponse(
    typeUrl: '/injective.peggy.v1.MsgRequestBatchResponse',
  ),
  injectivePeggyV1MsgConfirmBatch(
    typeUrl: '/injective.peggy.v1.MsgConfirmBatch',
    serviceUrl: "/injective.peggy.v1.Msg/ConfirmBatch",
    aminoType: "peggy/MsgConfirmBatch",
  ),
  injectivePeggyV1MsgConfirmBatchResponse(
    typeUrl: '/injective.peggy.v1.MsgConfirmBatchResponse',
  ),
  injectivePeggyV1MsgDepositClaim(
    typeUrl: '/injective.peggy.v1.MsgDepositClaim',
    serviceUrl: "/injective.peggy.v1.Msg/DepositClaim",
    aminoType: "peggy/MsgDepositClaim",
  ),
  injectivePeggyV1MsgDepositClaimResponse(
    typeUrl: '/injective.peggy.v1.MsgDepositClaimResponse',
  ),
  injectivePeggyV1MsgWithdrawClaim(
    typeUrl: '/injective.peggy.v1.MsgWithdrawClaim',
    serviceUrl: "/injective.peggy.v1.Msg/WithdrawClaim",
    aminoType: "peggy/MsgWithdrawClaim",
  ),
  injectivePeggyV1MsgWithdrawClaimResponse(
    typeUrl: '/injective.peggy.v1.MsgWithdrawClaimResponse',
  ),
  injectivePeggyV1MsgERC20DeployedClaim(
    typeUrl: '/injective.peggy.v1.MsgERC20DeployedClaim',
    serviceUrl: "/injective.peggy.v1.Msg/ERC20DeployedClaim",
    aminoType: "peggy/MsgERC20DeployedClaim",
  ),
  injectivePeggyV1MsgERC20DeployedClaimResponse(
    typeUrl: '/injective.peggy.v1.MsgERC20DeployedClaimResponse',
  ),
  injectivePeggyV1MsgCancelSendToEth(
    typeUrl: '/injective.peggy.v1.MsgCancelSendToEth',
    serviceUrl: "/injective.peggy.v1.Msg/CancelSendToEth",
    aminoType: "peggy/MsgCancelSendToEth",
  ),
  injectivePeggyV1MsgCancelSendToEthResponse(
    typeUrl: '/injective.peggy.v1.MsgCancelSendToEthResponse',
  ),
  injectivePeggyV1MsgSubmitBadSignatureEvidence(
    typeUrl: '/injective.peggy.v1.MsgSubmitBadSignatureEvidence',
    serviceUrl: "/injective.peggy.v1.Msg/SubmitBadSignatureEvidence",
    aminoType: "peggy/MsgSubmitBadSignatureEvidence",
  ),
  injectivePeggyV1MsgSubmitBadSignatureEvidenceResponse(
    typeUrl: '/injective.peggy.v1.MsgSubmitBadSignatureEvidenceResponse',
  ),
  injectivePeggyV1MsgValsetUpdatedClaim(
    typeUrl: '/injective.peggy.v1.MsgValsetUpdatedClaim',
    serviceUrl: "/injective.peggy.v1.Msg/ValsetUpdateClaim",
    aminoType: "peggy/MsgValsetUpdatedClaim",
  ),
  injectivePeggyV1MsgValsetUpdatedClaimResponse(
    typeUrl: '/injective.peggy.v1.MsgValsetUpdatedClaimResponse',
  ),
  injectivePeggyV1MsgUpdateParams(
    typeUrl: '/injective.peggy.v1.MsgUpdateParams',
    serviceUrl: "/injective.peggy.v1.Msg/UpdateParams",
    aminoType: "peggy/MsgUpdateParams",
  ),
  injectivePeggyV1MsgUpdateParamsResponse(
    typeUrl: '/injective.peggy.v1.MsgUpdateParamsResponse',
  ),
  injectivePeggyV1MsgBlacklistEthereumAddresses(
    typeUrl: '/injective.peggy.v1.MsgBlacklistEthereumAddresses',
    serviceUrl: "/injective.peggy.v1.Msg/BlacklistEthereumAddresses",
    aminoType: "peggy/MsgBlacklistEthereumAddresses",
  ),
  injectivePeggyV1MsgBlacklistEthereumAddressesResponse(
    typeUrl: '/injective.peggy.v1.MsgBlacklistEthereumAddressesResponse',
  ),
  injectivePeggyV1MsgRevokeEthereumBlacklist(
    typeUrl: '/injective.peggy.v1.MsgRevokeEthereumBlacklist',
    serviceUrl: "/injective.peggy.v1.Msg/RevokeEthereumBlacklist",
    aminoType: "peggy/MsgRevokeEthereumBlacklist",
  ),
  injectivePeggyV1MsgRevokeEthereumBlacklistResponse(
    typeUrl: '/injective.peggy.v1.MsgRevokeEthereumBlacklistResponse',
  ),
  injectivePeggyV1MsgCreateRateLimit(
    typeUrl: '/injective.peggy.v1.MsgCreateRateLimit',
    serviceUrl: "/injective.peggy.v1.Msg/CreateRateLimit",
    aminoType: "peggy/MsgCreateRateLimit",
  ),
  injectivePeggyV1MsgCreateRateLimitResponse(
    typeUrl: '/injective.peggy.v1.MsgCreateRateLimitResponse',
  ),
  injectivePeggyV1MsgUpdateRateLimit(
    typeUrl: '/injective.peggy.v1.MsgUpdateRateLimit',
    serviceUrl: "/injective.peggy.v1.Msg/UpdateRateLimit",
    aminoType: "peggy/MsgUpdateRateLimit",
  ),
  injectivePeggyV1MsgUpdateRateLimitResponse(
    typeUrl: '/injective.peggy.v1.MsgUpdateRateLimitResponse',
  ),
  injectivePeggyV1MsgRemoveRateLimit(
    typeUrl: '/injective.peggy.v1.MsgRemoveRateLimit',
    serviceUrl: "/injective.peggy.v1.Msg/RemoveRateLimit",
    aminoType: "peggy/MsgRemoveRateLimit",
  ),
  injectivePeggyV1MsgRemoveRateLimitResponse(
    typeUrl: '/injective.peggy.v1.MsgRemoveRateLimitResponse',
  ),
  injectivePeggyV1OutgoingTxBatch(
    typeUrl: '/injective.peggy.v1.OutgoingTxBatch',
  ),
  injectivePeggyV1OutgoingTransferTx(
    typeUrl: '/injective.peggy.v1.OutgoingTransferTx',
  ),
  injectiveEvmV1ChainConfig(typeUrl: '/injective.evm.v1.ChainConfig'),
  injectiveEvmV1BlobScheduleConfig(
    typeUrl: '/injective.evm.v1.BlobScheduleConfig',
  ),
  injectiveEvmV1BlobConfig(typeUrl: '/injective.evm.v1.BlobConfig'),
  injectiveEvmV1QueryAccountRequest(
    typeUrl: '/injective.evm.v1.QueryAccountRequest',
    serviceUrl: "/injective.evm.v1.Query/Account",
  ),
  injectiveEvmV1QueryAccountResponse(
    typeUrl: '/injective.evm.v1.QueryAccountResponse',
  ),
  injectiveEvmV1QueryCosmosAccountRequest(
    typeUrl: '/injective.evm.v1.QueryCosmosAccountRequest',
    serviceUrl: "/injective.evm.v1.Query/CosmosAccount",
  ),
  injectiveEvmV1QueryCosmosAccountResponse(
    typeUrl: '/injective.evm.v1.QueryCosmosAccountResponse',
  ),
  injectiveEvmV1QueryValidatorAccountRequest(
    typeUrl: '/injective.evm.v1.QueryValidatorAccountRequest',
    serviceUrl: "/injective.evm.v1.Query/ValidatorAccount",
  ),
  injectiveEvmV1QueryValidatorAccountResponse(
    typeUrl: '/injective.evm.v1.QueryValidatorAccountResponse',
  ),
  injectiveEvmV1QueryBalanceRequest(
    typeUrl: '/injective.evm.v1.QueryBalanceRequest',
    serviceUrl: "/injective.evm.v1.Query/Balance",
  ),
  injectiveEvmV1QueryBalanceResponse(
    typeUrl: '/injective.evm.v1.QueryBalanceResponse',
  ),
  injectiveEvmV1QueryStorageRequest(
    typeUrl: '/injective.evm.v1.QueryStorageRequest',
    serviceUrl: "/injective.evm.v1.Query/Storage",
  ),
  injectiveEvmV1QueryStorageResponse(
    typeUrl: '/injective.evm.v1.QueryStorageResponse',
  ),
  injectiveEvmV1QueryCodeRequest(
    typeUrl: '/injective.evm.v1.QueryCodeRequest',
    serviceUrl: "/injective.evm.v1.Query/Code",
  ),
  injectiveEvmV1QueryCodeResponse(
    typeUrl: '/injective.evm.v1.QueryCodeResponse',
  ),
  injectiveEvmV1QueryParamsRequest(
    typeUrl: '/injective.evm.v1.QueryParamsRequest',
    serviceUrl: "/injective.evm.v1.Query/Params",
  ),
  injectiveEvmV1QueryParamsResponse(
    typeUrl: '/injective.evm.v1.QueryParamsResponse',
  ),
  injectiveEvmV1EthCallRequest(
    typeUrl: '/injective.evm.v1.EthCallRequest',
    serviceUrl: "/injective.evm.v1.Query/EthCall",
  ),
  injectiveEvmV1EstimateGasResponse(
    typeUrl: '/injective.evm.v1.EstimateGasResponse',
  ),
  injectiveEvmV1QueryTraceTxRequest(
    typeUrl: '/injective.evm.v1.QueryTraceTxRequest',
    serviceUrl: "/injective.evm.v1.Query/TraceTx",
  ),
  injectiveEvmV1QueryTraceTxResponse(
    typeUrl: '/injective.evm.v1.QueryTraceTxResponse',
  ),
  injectiveEvmV1QueryTraceCallRequest(
    typeUrl: '/injective.evm.v1.QueryTraceCallRequest',
    serviceUrl: "/injective.evm.v1.Query/TraceCall",
  ),
  injectiveEvmV1QueryTraceCallResponse(
    typeUrl: '/injective.evm.v1.QueryTraceCallResponse',
  ),
  injectiveEvmV1QueryTraceBlockRequest(
    typeUrl: '/injective.evm.v1.QueryTraceBlockRequest',
    serviceUrl: "/injective.evm.v1.Query/TraceBlock",
  ),
  injectiveEvmV1QueryTraceBlockResponse(
    typeUrl: '/injective.evm.v1.QueryTraceBlockResponse',
  ),
  injectiveEvmV1QueryBaseFeeRequest(
    typeUrl: '/injective.evm.v1.QueryBaseFeeRequest',
    serviceUrl: "/injective.evm.v1.Query/BaseFee",
  ),
  injectiveEvmV1QueryBaseFeeResponse(
    typeUrl: '/injective.evm.v1.QueryBaseFeeResponse',
  ),
  injectiveEvmV1TraceConfig(typeUrl: '/injective.evm.v1.TraceConfig'),
  injectiveEvmV1Params(typeUrl: '/injective.evm.v1.Params'),
  injectiveEvmV1Log(typeUrl: '/injective.evm.v1.Log'),
  injectiveEvmV1MsgEthereumTx(
    typeUrl: '/injective.evm.v1.MsgEthereumTx',
    serviceUrl: "/injective.evm.v1.Msg/EthereumTx",
  ),
  injectiveEvmV1MsgEthereumTxResponse(
    typeUrl: '/injective.evm.v1.MsgEthereumTxResponse',
  ),
  injectiveEvmV1MsgUpdateParams(
    typeUrl: '/injective.evm.v1.MsgUpdateParams',
    serviceUrl: "/injective.evm.v1.Msg/UpdateParams",
  ),
  injectiveEvmV1MsgUpdateParamsResponse(
    typeUrl: '/injective.evm.v1.MsgUpdateParamsResponse',
  ),
  injectiveStreamV2StreamRequest(
    typeUrl: '/injective.stream.v2.StreamRequest',
    serviceUrl: "/injective.stream.v2.Stream/StreamV2",
  ),
  injectiveStreamV2StreamResponse(
    typeUrl: '/injective.stream.v2.StreamResponse',
  ),
  injectiveStreamV2OrderbookUpdate(
    typeUrl: '/injective.stream.v2.OrderbookUpdate',
  ),
  injectiveStreamV2Orderbook(typeUrl: '/injective.stream.v2.Orderbook'),
  injectiveStreamV2BankBalance(typeUrl: '/injective.stream.v2.BankBalance'),
  injectiveStreamV2SubaccountDeposits(
    typeUrl: '/injective.stream.v2.SubaccountDeposits',
  ),
  injectiveStreamV2SubaccountDeposit(
    typeUrl: '/injective.stream.v2.SubaccountDeposit',
  ),
  injectiveStreamV2SpotOrderUpdate(
    typeUrl: '/injective.stream.v2.SpotOrderUpdate',
  ),
  injectiveStreamV2SpotOrder(typeUrl: '/injective.stream.v2.SpotOrder'),
  injectiveStreamV2DerivativeOrderUpdate(
    typeUrl: '/injective.stream.v2.DerivativeOrderUpdate',
  ),
  injectiveStreamV2DerivativeOrder(
    typeUrl: '/injective.stream.v2.DerivativeOrder',
  ),
  injectiveStreamV2Position(typeUrl: '/injective.stream.v2.Position'),
  injectiveStreamV2OraclePrice(typeUrl: '/injective.stream.v2.OraclePrice'),
  injectiveStreamV2SpotTrade(typeUrl: '/injective.stream.v2.SpotTrade'),
  injectiveStreamV2DerivativeTrade(
    typeUrl: '/injective.stream.v2.DerivativeTrade',
  ),
  injectiveStreamV2OrderFailureUpdate(
    typeUrl: '/injective.stream.v2.OrderFailureUpdate',
  ),
  injectiveStreamV2ConditionalOrderTriggerFailureUpdate(
    typeUrl: '/injective.stream.v2.ConditionalOrderTriggerFailureUpdate',
  ),
  injectiveStreamV2TradesFilter(typeUrl: '/injective.stream.v2.TradesFilter'),
  injectiveStreamV2PositionsFilter(
    typeUrl: '/injective.stream.v2.PositionsFilter',
  ),
  injectiveStreamV2OrdersFilter(typeUrl: '/injective.stream.v2.OrdersFilter'),
  injectiveStreamV2OrderbookFilter(
    typeUrl: '/injective.stream.v2.OrderbookFilter',
  ),
  injectiveStreamV2BankBalancesFilter(
    typeUrl: '/injective.stream.v2.BankBalancesFilter',
  ),
  injectiveStreamV2SubaccountDepositsFilter(
    typeUrl: '/injective.stream.v2.SubaccountDepositsFilter',
  ),
  injectiveStreamV2OraclePriceFilter(
    typeUrl: '/injective.stream.v2.OraclePriceFilter',
  ),
  injectiveStreamV2OrderFailuresFilter(
    typeUrl: '/injective.stream.v2.OrderFailuresFilter',
  ),
  injectiveStreamV2ConditionalOrderTriggerFailuresFilter(
    typeUrl: '/injective.stream.v2.ConditionalOrderTriggerFailuresFilter',
  ),
  injectiveStreamV1beta1StreamRequest(
    typeUrl: '/injective.stream.v1beta1.StreamRequest',
    serviceUrl: "/injective.stream.v1beta1.Stream/Stream",
  ),
  injectiveStreamV1beta1StreamResponse(
    typeUrl: '/injective.stream.v1beta1.StreamResponse',
  ),
  injectiveStreamV1beta1OrderbookUpdate(
    typeUrl: '/injective.stream.v1beta1.OrderbookUpdate',
  ),
  injectiveStreamV1beta1Orderbook(
    typeUrl: '/injective.stream.v1beta1.Orderbook',
  ),
  injectiveStreamV1beta1BankBalance(
    typeUrl: '/injective.stream.v1beta1.BankBalance',
  ),
  injectiveStreamV1beta1SubaccountDeposits(
    typeUrl: '/injective.stream.v1beta1.SubaccountDeposits',
  ),
  injectiveStreamV1beta1SubaccountDeposit(
    typeUrl: '/injective.stream.v1beta1.SubaccountDeposit',
  ),
  injectiveStreamV1beta1SpotOrderUpdate(
    typeUrl: '/injective.stream.v1beta1.SpotOrderUpdate',
  ),
  injectiveStreamV1beta1SpotOrder(
    typeUrl: '/injective.stream.v1beta1.SpotOrder',
  ),
  injectiveStreamV1beta1DerivativeOrderUpdate(
    typeUrl: '/injective.stream.v1beta1.DerivativeOrderUpdate',
  ),
  injectiveStreamV1beta1DerivativeOrder(
    typeUrl: '/injective.stream.v1beta1.DerivativeOrder',
  ),
  injectiveStreamV1beta1Position(typeUrl: '/injective.stream.v1beta1.Position'),
  injectiveStreamV1beta1OraclePrice(
    typeUrl: '/injective.stream.v1beta1.OraclePrice',
  ),
  injectiveStreamV1beta1SpotTrade(
    typeUrl: '/injective.stream.v1beta1.SpotTrade',
  ),
  injectiveStreamV1beta1DerivativeTrade(
    typeUrl: '/injective.stream.v1beta1.DerivativeTrade',
  ),
  injectiveStreamV1beta1TradesFilter(
    typeUrl: '/injective.stream.v1beta1.TradesFilter',
  ),
  injectiveStreamV1beta1PositionsFilter(
    typeUrl: '/injective.stream.v1beta1.PositionsFilter',
  ),
  injectiveStreamV1beta1OrdersFilter(
    typeUrl: '/injective.stream.v1beta1.OrdersFilter',
  ),
  injectiveStreamV1beta1OrderbookFilter(
    typeUrl: '/injective.stream.v1beta1.OrderbookFilter',
  ),
  injectiveStreamV1beta1BankBalancesFilter(
    typeUrl: '/injective.stream.v1beta1.BankBalancesFilter',
  ),
  injectiveStreamV1beta1SubaccountDepositsFilter(
    typeUrl: '/injective.stream.v1beta1.SubaccountDepositsFilter',
  ),
  injectiveStreamV1beta1OraclePriceFilter(
    typeUrl: '/injective.stream.v1beta1.OraclePriceFilter',
  ),
  injectiveCryptoV1beta1Ethsecp256k1PubKey(
    typeUrl: '/injective.crypto.v1beta1.ethsecp256k1.PubKey',
    aminoType: "injective/PubKeyEthSecp256k1",
  ),
  injectiveCryptoV1beta1Ethsecp256k1PrivKey(
    typeUrl: '/injective.crypto.v1beta1.ethsecp256k1.PrivKey',
    aminoType: "injective/PrivKeyEthSecp256k1",
  ),
  injectiveAuctionV1beta1QueryAuctionParamsRequest(
    typeUrl: '/injective.auction.v1beta1.QueryAuctionParamsRequest',
    serviceUrl: "/injective.auction.v1beta1.Query/AuctionParams",
  ),
  injectiveAuctionV1beta1QueryAuctionParamsResponse(
    typeUrl: '/injective.auction.v1beta1.QueryAuctionParamsResponse',
  ),
  injectiveAuctionV1beta1QueryCurrentAuctionBasketRequest(
    typeUrl: '/injective.auction.v1beta1.QueryCurrentAuctionBasketRequest',
    serviceUrl: "/injective.auction.v1beta1.Query/CurrentAuctionBasket",
  ),
  injectiveAuctionV1beta1QueryCurrentAuctionBasketResponse(
    typeUrl: '/injective.auction.v1beta1.QueryCurrentAuctionBasketResponse',
  ),
  injectiveAuctionV1beta1QueryModuleStateRequest(
    typeUrl: '/injective.auction.v1beta1.QueryModuleStateRequest',
    serviceUrl: "/injective.auction.v1beta1.Query/AuctionModuleState",
  ),
  injectiveAuctionV1beta1QueryModuleStateResponse(
    typeUrl: '/injective.auction.v1beta1.QueryModuleStateResponse',
  ),
  injectiveAuctionV1beta1QueryLastAuctionResultRequest(
    typeUrl: '/injective.auction.v1beta1.QueryLastAuctionResultRequest',
    serviceUrl: "/injective.auction.v1beta1.Query/LastAuctionResult",
  ),
  injectiveAuctionV1beta1QueryLastAuctionResultResponse(
    typeUrl: '/injective.auction.v1beta1.QueryLastAuctionResultResponse',
  ),
  injectiveAuctionV1beta1QueryVouchersRequest(
    typeUrl: '/injective.auction.v1beta1.QueryVouchersRequest',
    serviceUrl: "/injective.auction.v1beta1.Query/Vouchers",
  ),
  injectiveAuctionV1beta1QueryVouchersResponse(
    typeUrl: '/injective.auction.v1beta1.QueryVouchersResponse',
  ),
  injectiveAuctionV1beta1QueryVoucherRequest(
    typeUrl: '/injective.auction.v1beta1.QueryVoucherRequest',
    serviceUrl: "/injective.auction.v1beta1.Query/Voucher",
  ),
  injectiveAuctionV1beta1QueryVoucherResponse(
    typeUrl: '/injective.auction.v1beta1.QueryVoucherResponse',
  ),
  injectiveAuctionV1beta1GenesisState(
    typeUrl: '/injective.auction.v1beta1.GenesisState',
  ),
  injectiveAuctionV1beta1Params(
    typeUrl: '/injective.auction.v1beta1.Params',
    aminoType: "auction/Params",
  ),
  injectiveAuctionV1beta1Bid(typeUrl: '/injective.auction.v1beta1.Bid'),
  injectiveAuctionV1beta1LastAuctionResult(
    typeUrl: '/injective.auction.v1beta1.LastAuctionResult',
  ),
  injectiveAuctionV1beta1MsgBid(
    typeUrl: '/injective.auction.v1beta1.MsgBid',
    serviceUrl: "/injective.auction.v1beta1.Msg/Bid",
    aminoType: "auction/MsgBid",
  ),
  injectiveAuctionV1beta1MsgBidResponse(
    typeUrl: '/injective.auction.v1beta1.MsgBidResponse',
  ),
  injectiveAuctionV1beta1MsgUpdateParams(
    typeUrl: '/injective.auction.v1beta1.MsgUpdateParams',
    serviceUrl: "/injective.auction.v1beta1.Msg/UpdateParams",
    aminoType: "auction/MsgUpdateParams",
  ),
  injectiveAuctionV1beta1MsgUpdateParamsResponse(
    typeUrl: '/injective.auction.v1beta1.MsgUpdateParamsResponse',
  ),
  injectiveAuctionV1beta1MsgClaimVoucher(
    typeUrl: '/injective.auction.v1beta1.MsgClaimVoucher',
    serviceUrl: "/injective.auction.v1beta1.Msg/ClaimVoucher",
    aminoType: "auction/MsgClaimVoucher",
  ),
  injectiveAuctionV1beta1MsgClaimVoucherResponse(
    typeUrl: '/injective.auction.v1beta1.MsgClaimVoucherResponse',
  ),
  cosmosUpgradeV1beta1QueryCurrentPlanRequest(
    typeUrl: '/cosmos.upgrade.v1beta1.QueryCurrentPlanRequest',
    serviceUrl: "/cosmos.upgrade.v1beta1.Query/CurrentPlan",
  ),
  cosmosUpgradeV1beta1QueryCurrentPlanResponse(
    typeUrl: '/cosmos.upgrade.v1beta1.QueryCurrentPlanResponse',
  ),
  cosmosUpgradeV1beta1QueryAppliedPlanRequest(
    typeUrl: '/cosmos.upgrade.v1beta1.QueryAppliedPlanRequest',
    serviceUrl: "/cosmos.upgrade.v1beta1.Query/AppliedPlan",
  ),
  cosmosUpgradeV1beta1QueryAppliedPlanResponse(
    typeUrl: '/cosmos.upgrade.v1beta1.QueryAppliedPlanResponse',
  ),
  cosmosUpgradeV1beta1QueryUpgradedConsensusStateRequest(
    typeUrl: '/cosmos.upgrade.v1beta1.QueryUpgradedConsensusStateRequest',
    serviceUrl: "/cosmos.upgrade.v1beta1.Query/UpgradedConsensusState",
  ),
  cosmosUpgradeV1beta1QueryUpgradedConsensusStateResponse(
    typeUrl: '/cosmos.upgrade.v1beta1.QueryUpgradedConsensusStateResponse',
  ),
  cosmosUpgradeV1beta1QueryModuleVersionsRequest(
    typeUrl: '/cosmos.upgrade.v1beta1.QueryModuleVersionsRequest',
    serviceUrl: "/cosmos.upgrade.v1beta1.Query/ModuleVersions",
  ),
  cosmosUpgradeV1beta1QueryModuleVersionsResponse(
    typeUrl: '/cosmos.upgrade.v1beta1.QueryModuleVersionsResponse',
  ),
  cosmosUpgradeV1beta1QueryAuthorityRequest(
    typeUrl: '/cosmos.upgrade.v1beta1.QueryAuthorityRequest',
    serviceUrl: "/cosmos.upgrade.v1beta1.Query/Authority",
  ),
  cosmosUpgradeV1beta1QueryAuthorityResponse(
    typeUrl: '/cosmos.upgrade.v1beta1.QueryAuthorityResponse',
  ),
  cosmosUpgradeV1beta1Plan(
    typeUrl: '/cosmos.upgrade.v1beta1.Plan',
    aminoType: "cosmos-sdk/Plan",
  ),
  cosmosUpgradeV1beta1ModuleVersion(
    typeUrl: '/cosmos.upgrade.v1beta1.ModuleVersion',
  ),
  cosmosUpgradeV1beta1MsgSoftwareUpgrade(
    typeUrl: '/cosmos.upgrade.v1beta1.MsgSoftwareUpgrade',
    serviceUrl: "/cosmos.upgrade.v1beta1.Msg/SoftwareUpgrade",
    aminoType: "cosmos-sdk/MsgSoftwareUpgrade",
  ),
  cosmosUpgradeV1beta1MsgSoftwareUpgradeResponse(
    typeUrl: '/cosmos.upgrade.v1beta1.MsgSoftwareUpgradeResponse',
  ),
  cosmosUpgradeV1beta1MsgCancelUpgrade(
    typeUrl: '/cosmos.upgrade.v1beta1.MsgCancelUpgrade',
    serviceUrl: "/cosmos.upgrade.v1beta1.Msg/CancelUpgrade",
    aminoType: "cosmos-sdk/MsgCancelUpgrade",
  ),
  cosmosUpgradeV1beta1MsgCancelUpgradeResponse(
    typeUrl: '/cosmos.upgrade.v1beta1.MsgCancelUpgradeResponse',
  ),
  cosmosParamsV1beta1QueryParamsRequest(
    typeUrl: '/cosmos.params.v1beta1.QueryParamsRequest',
    serviceUrl: "/cosmos.params.v1beta1.Query/Params",
  ),
  cosmosParamsV1beta1QueryParamsResponse(
    typeUrl: '/cosmos.params.v1beta1.QueryParamsResponse',
  ),
  cosmosParamsV1beta1QuerySubspacesRequest(
    typeUrl: '/cosmos.params.v1beta1.QuerySubspacesRequest',
    serviceUrl: "/cosmos.params.v1beta1.Query/Subspaces",
  ),
  cosmosParamsV1beta1QuerySubspacesResponse(
    typeUrl: '/cosmos.params.v1beta1.QuerySubspacesResponse',
  ),
  cosmosParamsV1beta1Subspace(typeUrl: '/cosmos.params.v1beta1.Subspace'),
  cosmosParamsV1beta1ParamChange(typeUrl: '/cosmos.params.v1beta1.ParamChange'),
  cosmosProtocolpoolV1QueryCommunityPoolRequest(
    typeUrl: '/cosmos.protocolpool.v1.QueryCommunityPoolRequest',
    serviceUrl: "/cosmos.protocolpool.v1.Query/CommunityPool",
  ),
  cosmosProtocolpoolV1QueryCommunityPoolResponse(
    typeUrl: '/cosmos.protocolpool.v1.QueryCommunityPoolResponse',
  ),
  cosmosProtocolpoolV1QueryContinuousFundRequest(
    typeUrl: '/cosmos.protocolpool.v1.QueryContinuousFundRequest',
    serviceUrl: "/cosmos.protocolpool.v1.Query/ContinuousFund",
  ),
  cosmosProtocolpoolV1QueryContinuousFundResponse(
    typeUrl: '/cosmos.protocolpool.v1.QueryContinuousFundResponse',
  ),
  cosmosProtocolpoolV1QueryContinuousFundsRequest(
    typeUrl: '/cosmos.protocolpool.v1.QueryContinuousFundsRequest',
    serviceUrl: "/cosmos.protocolpool.v1.Query/ContinuousFunds",
  ),
  cosmosProtocolpoolV1QueryContinuousFundsResponse(
    typeUrl: '/cosmos.protocolpool.v1.QueryContinuousFundsResponse',
  ),
  cosmosProtocolpoolV1QueryParamsRequest(
    typeUrl: '/cosmos.protocolpool.v1.QueryParamsRequest',
    serviceUrl: "/cosmos.protocolpool.v1.Query/Params",
  ),
  cosmosProtocolpoolV1QueryParamsResponse(
    typeUrl: '/cosmos.protocolpool.v1.QueryParamsResponse',
  ),
  cosmosProtocolpoolV1ContinuousFund(
    typeUrl: '/cosmos.protocolpool.v1.ContinuousFund',
  ),
  cosmosProtocolpoolV1Params(typeUrl: '/cosmos.protocolpool.v1.Params'),
  cosmosProtocolpoolV1MsgFundCommunityPool(
    typeUrl: '/cosmos.protocolpool.v1.MsgFundCommunityPool',
    serviceUrl: "/cosmos.protocolpool.v1.Msg/FundCommunityPool",
  ),
  cosmosProtocolpoolV1MsgFundCommunityPoolResponse(
    typeUrl: '/cosmos.protocolpool.v1.MsgFundCommunityPoolResponse',
  ),
  cosmosProtocolpoolV1MsgCommunityPoolSpend(
    typeUrl: '/cosmos.protocolpool.v1.MsgCommunityPoolSpend',
    serviceUrl: "/cosmos.protocolpool.v1.Msg/CommunityPoolSpend",
  ),
  cosmosProtocolpoolV1MsgCommunityPoolSpendResponse(
    typeUrl: '/cosmos.protocolpool.v1.MsgCommunityPoolSpendResponse',
  ),
  cosmosProtocolpoolV1MsgCreateContinuousFund(
    typeUrl: '/cosmos.protocolpool.v1.MsgCreateContinuousFund',
    serviceUrl: "/cosmos.protocolpool.v1.Msg/CreateContinuousFund",
  ),
  cosmosProtocolpoolV1MsgCreateContinuousFundResponse(
    typeUrl: '/cosmos.protocolpool.v1.MsgCreateContinuousFundResponse',
  ),
  cosmosProtocolpoolV1MsgCancelContinuousFund(
    typeUrl: '/cosmos.protocolpool.v1.MsgCancelContinuousFund',
    serviceUrl: "/cosmos.protocolpool.v1.Msg/CancelContinuousFund",
  ),
  cosmosProtocolpoolV1MsgCancelContinuousFundResponse(
    typeUrl: '/cosmos.protocolpool.v1.MsgCancelContinuousFundResponse',
  ),
  cosmosProtocolpoolV1MsgUpdateParams(
    typeUrl: '/cosmos.protocolpool.v1.MsgUpdateParams',
    serviceUrl: "/cosmos.protocolpool.v1.Msg/UpdateParams",
  ),
  cosmosProtocolpoolV1MsgUpdateParamsResponse(
    typeUrl: '/cosmos.protocolpool.v1.MsgUpdateParamsResponse',
  ),
  cosmosSlashingV1beta1QueryParamsRequest(
    typeUrl: '/cosmos.slashing.v1beta1.QueryParamsRequest',
    serviceUrl: "/cosmos.slashing.v1beta1.Query/Params",
  ),
  cosmosSlashingV1beta1QueryParamsResponse(
    typeUrl: '/cosmos.slashing.v1beta1.QueryParamsResponse',
  ),
  cosmosSlashingV1beta1QuerySigningInfoRequest(
    typeUrl: '/cosmos.slashing.v1beta1.QuerySigningInfoRequest',
    serviceUrl: "/cosmos.slashing.v1beta1.Query/SigningInfo",
  ),
  cosmosSlashingV1beta1QuerySigningInfoResponse(
    typeUrl: '/cosmos.slashing.v1beta1.QuerySigningInfoResponse',
  ),
  cosmosSlashingV1beta1QuerySigningInfosRequest(
    typeUrl: '/cosmos.slashing.v1beta1.QuerySigningInfosRequest',
    serviceUrl: "/cosmos.slashing.v1beta1.Query/SigningInfos",
  ),
  cosmosSlashingV1beta1QuerySigningInfosResponse(
    typeUrl: '/cosmos.slashing.v1beta1.QuerySigningInfosResponse',
  ),
  cosmosSlashingV1beta1ValidatorSigningInfo(
    typeUrl: '/cosmos.slashing.v1beta1.ValidatorSigningInfo',
  ),
  cosmosSlashingV1beta1Params(
    typeUrl: '/cosmos.slashing.v1beta1.Params',
    aminoType: "cosmos-sdk/x/slashing/Params",
  ),
  cosmosSlashingV1beta1MsgUnjail(
    typeUrl: '/cosmos.slashing.v1beta1.MsgUnjail',
    serviceUrl: "/cosmos.slashing.v1beta1.Msg/Unjail",
    aminoType: "cosmos-sdk/MsgUnjail",
  ),
  cosmosSlashingV1beta1MsgUnjailResponse(
    typeUrl: '/cosmos.slashing.v1beta1.MsgUnjailResponse',
  ),
  cosmosSlashingV1beta1MsgUpdateParams(
    typeUrl: '/cosmos.slashing.v1beta1.MsgUpdateParams',
    serviceUrl: "/cosmos.slashing.v1beta1.Msg/UpdateParams",
    aminoType: "cosmos-sdk/x/slashing/MsgUpdateParams",
  ),
  cosmosSlashingV1beta1MsgUpdateParamsResponse(
    typeUrl: '/cosmos.slashing.v1beta1.MsgUpdateParamsResponse',
  ),
  cosmosDistributionV1beta1QueryParamsRequest(
    typeUrl: '/cosmos.distribution.v1beta1.QueryParamsRequest',
    serviceUrl: "/cosmos.distribution.v1beta1.Query/Params",
  ),
  cosmosDistributionV1beta1QueryParamsResponse(
    typeUrl: '/cosmos.distribution.v1beta1.QueryParamsResponse',
  ),
  cosmosDistributionV1beta1QueryValidatorDistributionInfoRequest(
    typeUrl:
        '/cosmos.distribution.v1beta1.QueryValidatorDistributionInfoRequest',
    serviceUrl: "/cosmos.distribution.v1beta1.Query/ValidatorDistributionInfo",
  ),
  cosmosDistributionV1beta1QueryValidatorDistributionInfoResponse(
    typeUrl:
        '/cosmos.distribution.v1beta1.QueryValidatorDistributionInfoResponse',
  ),
  cosmosDistributionV1beta1QueryValidatorOutstandingRewardsRequest(
    typeUrl:
        '/cosmos.distribution.v1beta1.QueryValidatorOutstandingRewardsRequest',
    serviceUrl:
        "/cosmos.distribution.v1beta1.Query/ValidatorOutstandingRewards",
  ),
  cosmosDistributionV1beta1QueryValidatorOutstandingRewardsResponse(
    typeUrl:
        '/cosmos.distribution.v1beta1.QueryValidatorOutstandingRewardsResponse',
  ),
  cosmosDistributionV1beta1QueryValidatorCommissionRequest(
    typeUrl: '/cosmos.distribution.v1beta1.QueryValidatorCommissionRequest',
    serviceUrl: "/cosmos.distribution.v1beta1.Query/ValidatorCommission",
  ),
  cosmosDistributionV1beta1QueryValidatorCommissionResponse(
    typeUrl: '/cosmos.distribution.v1beta1.QueryValidatorCommissionResponse',
  ),
  cosmosDistributionV1beta1QueryValidatorSlashesRequest(
    typeUrl: '/cosmos.distribution.v1beta1.QueryValidatorSlashesRequest',
    serviceUrl: "/cosmos.distribution.v1beta1.Query/ValidatorSlashes",
  ),
  cosmosDistributionV1beta1QueryValidatorSlashesResponse(
    typeUrl: '/cosmos.distribution.v1beta1.QueryValidatorSlashesResponse',
  ),
  cosmosDistributionV1beta1QueryDelegationRewardsRequest(
    typeUrl: '/cosmos.distribution.v1beta1.QueryDelegationRewardsRequest',
    serviceUrl: "/cosmos.distribution.v1beta1.Query/DelegationRewards",
  ),
  cosmosDistributionV1beta1QueryDelegationRewardsResponse(
    typeUrl: '/cosmos.distribution.v1beta1.QueryDelegationRewardsResponse',
  ),
  cosmosDistributionV1beta1QueryDelegationTotalRewardsRequest(
    typeUrl: '/cosmos.distribution.v1beta1.QueryDelegationTotalRewardsRequest',
    serviceUrl: "/cosmos.distribution.v1beta1.Query/DelegationTotalRewards",
  ),
  cosmosDistributionV1beta1QueryDelegationTotalRewardsResponse(
    typeUrl: '/cosmos.distribution.v1beta1.QueryDelegationTotalRewardsResponse',
  ),
  cosmosDistributionV1beta1QueryDelegatorValidatorsRequest(
    typeUrl: '/cosmos.distribution.v1beta1.QueryDelegatorValidatorsRequest',
    serviceUrl: "/cosmos.distribution.v1beta1.Query/DelegatorValidators",
  ),
  cosmosDistributionV1beta1QueryDelegatorValidatorsResponse(
    typeUrl: '/cosmos.distribution.v1beta1.QueryDelegatorValidatorsResponse',
  ),
  cosmosDistributionV1beta1QueryDelegatorWithdrawAddressRequest(
    typeUrl:
        '/cosmos.distribution.v1beta1.QueryDelegatorWithdrawAddressRequest',
    serviceUrl: "/cosmos.distribution.v1beta1.Query/DelegatorWithdrawAddress",
  ),
  cosmosDistributionV1beta1QueryDelegatorWithdrawAddressResponse(
    typeUrl:
        '/cosmos.distribution.v1beta1.QueryDelegatorWithdrawAddressResponse',
  ),
  cosmosDistributionV1beta1QueryCommunityPoolRequest(
    typeUrl: '/cosmos.distribution.v1beta1.QueryCommunityPoolRequest',
    serviceUrl: "/cosmos.distribution.v1beta1.Query/CommunityPool",
  ),
  cosmosDistributionV1beta1QueryCommunityPoolResponse(
    typeUrl: '/cosmos.distribution.v1beta1.QueryCommunityPoolResponse',
  ),
  cosmosDistributionV1beta1QueryValidatorHistoricalRewardsRequest(
    typeUrl:
        '/cosmos.distribution.v1beta1.QueryValidatorHistoricalRewardsRequest',
    serviceUrl: "/cosmos.distribution.v1beta1.Query/ValidatorHistoricalRewards",
  ),
  cosmosDistributionV1beta1QueryValidatorHistoricalRewardsResponse(
    typeUrl:
        '/cosmos.distribution.v1beta1.QueryValidatorHistoricalRewardsResponse',
  ),
  cosmosDistributionV1beta1QueryValidatorCurrentRewardsRequest(
    typeUrl: '/cosmos.distribution.v1beta1.QueryValidatorCurrentRewardsRequest',
    serviceUrl: "/cosmos.distribution.v1beta1.Query/ValidatorCurrentRewards",
  ),
  cosmosDistributionV1beta1QueryValidatorCurrentRewardsResponse(
    typeUrl:
        '/cosmos.distribution.v1beta1.QueryValidatorCurrentRewardsResponse',
  ),
  cosmosDistributionV1beta1QueryDelegatorStartingInfoRequest(
    typeUrl: '/cosmos.distribution.v1beta1.QueryDelegatorStartingInfoRequest',
    serviceUrl: "/cosmos.distribution.v1beta1.Query/DelegatorStartingInfo",
  ),
  cosmosDistributionV1beta1QueryDelegatorStartingInfoResponse(
    typeUrl: '/cosmos.distribution.v1beta1.QueryDelegatorStartingInfoResponse',
  ),
  cosmosDistributionV1beta1MsgSetWithdrawAddress(
    typeUrl: '/cosmos.distribution.v1beta1.MsgSetWithdrawAddress',
    serviceUrl: "/cosmos.distribution.v1beta1.Msg/SetWithdrawAddress",
    aminoType: "cosmos-sdk/MsgModifyWithdrawAddress",
  ),
  cosmosDistributionV1beta1MsgSetWithdrawAddressResponse(
    typeUrl: '/cosmos.distribution.v1beta1.MsgSetWithdrawAddressResponse',
  ),
  cosmosDistributionV1beta1MsgWithdrawDelegatorReward(
    typeUrl: '/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward',
    serviceUrl: "/cosmos.distribution.v1beta1.Msg/WithdrawDelegatorReward",
    aminoType: "cosmos-sdk/MsgWithdrawDelegationReward",
  ),
  cosmosDistributionV1beta1MsgWithdrawDelegatorRewardResponse(
    typeUrl: '/cosmos.distribution.v1beta1.MsgWithdrawDelegatorRewardResponse',
  ),
  cosmosDistributionV1beta1MsgWithdrawValidatorCommission(
    typeUrl: '/cosmos.distribution.v1beta1.MsgWithdrawValidatorCommission',
    serviceUrl: "/cosmos.distribution.v1beta1.Msg/WithdrawValidatorCommission",
    aminoType: "cosmos-sdk/MsgWithdrawValCommission",
  ),
  cosmosDistributionV1beta1MsgWithdrawValidatorCommissionResponse(
    typeUrl:
        '/cosmos.distribution.v1beta1.MsgWithdrawValidatorCommissionResponse',
  ),
  cosmosDistributionV1beta1MsgFundCommunityPool(
    typeUrl: '/cosmos.distribution.v1beta1.MsgFundCommunityPool',
    serviceUrl: "/cosmos.distribution.v1beta1.Msg/FundCommunityPool",
    aminoType: "cosmos-sdk/MsgFundCommunityPool",
  ),
  cosmosDistributionV1beta1MsgFundCommunityPoolResponse(
    typeUrl: '/cosmos.distribution.v1beta1.MsgFundCommunityPoolResponse',
  ),
  cosmosDistributionV1beta1MsgUpdateParams(
    typeUrl: '/cosmos.distribution.v1beta1.MsgUpdateParams',
    serviceUrl: "/cosmos.distribution.v1beta1.Msg/UpdateParams",
    aminoType: "cosmos-sdk/distribution/MsgUpdateParams",
  ),
  cosmosDistributionV1beta1MsgUpdateParamsResponse(
    typeUrl: '/cosmos.distribution.v1beta1.MsgUpdateParamsResponse',
  ),
  cosmosDistributionV1beta1MsgCommunityPoolSpend(
    typeUrl: '/cosmos.distribution.v1beta1.MsgCommunityPoolSpend',
    serviceUrl: "/cosmos.distribution.v1beta1.Msg/CommunityPoolSpend",
    aminoType: "cosmos-sdk/distr/MsgCommunityPoolSpend",
  ),
  cosmosDistributionV1beta1MsgCommunityPoolSpendResponse(
    typeUrl: '/cosmos.distribution.v1beta1.MsgCommunityPoolSpendResponse',
  ),
  cosmosDistributionV1beta1MsgDepositValidatorRewardsPool(
    typeUrl: '/cosmos.distribution.v1beta1.MsgDepositValidatorRewardsPool',
    serviceUrl: "/cosmos.distribution.v1beta1.Msg/DepositValidatorRewardsPool",
    aminoType: "cosmos-sdk/distr/MsgDepositValRewards",
  ),
  cosmosDistributionV1beta1MsgDepositValidatorRewardsPoolResponse(
    typeUrl:
        '/cosmos.distribution.v1beta1.MsgDepositValidatorRewardsPoolResponse',
  ),
  cosmosDistributionV1beta1Params(
    typeUrl: '/cosmos.distribution.v1beta1.Params',
    aminoType: "cosmos-sdk/x/distribution/Params",
  ),
  cosmosDistributionV1beta1ValidatorHistoricalRewards(
    typeUrl: '/cosmos.distribution.v1beta1.ValidatorHistoricalRewards',
  ),
  cosmosDistributionV1beta1ValidatorCurrentRewards(
    typeUrl: '/cosmos.distribution.v1beta1.ValidatorCurrentRewards',
  ),
  cosmosDistributionV1beta1ValidatorAccumulatedCommission(
    typeUrl: '/cosmos.distribution.v1beta1.ValidatorAccumulatedCommission',
  ),
  cosmosDistributionV1beta1ValidatorOutstandingRewards(
    typeUrl: '/cosmos.distribution.v1beta1.ValidatorOutstandingRewards',
  ),
  cosmosDistributionV1beta1ValidatorSlashEvent(
    typeUrl: '/cosmos.distribution.v1beta1.ValidatorSlashEvent',
  ),
  cosmosDistributionV1beta1CommunityPoolSpendProposal(
    typeUrl: '/cosmos.distribution.v1beta1.CommunityPoolSpendProposal',
  ),
  cosmosDistributionV1beta1DelegatorStartingInfo(
    typeUrl: '/cosmos.distribution.v1beta1.DelegatorStartingInfo',
  ),
  cosmosDistributionV1beta1DelegationDelegatorReward(
    typeUrl: '/cosmos.distribution.v1beta1.DelegationDelegatorReward',
  ),
  cosmosStoreStreamingAbciListenFinalizeBlockRequest(
    typeUrl: '/cosmos.store.streaming.abci.ListenFinalizeBlockRequest',
    serviceUrl:
        "/cosmos.store.streaming.abci.ABCIListenerService/ListenFinalizeBlock",
  ),
  cosmosStoreStreamingAbciListenFinalizeBlockResponse(
    typeUrl: '/cosmos.store.streaming.abci.ListenFinalizeBlockResponse',
  ),
  cosmosStoreStreamingAbciListenCommitRequest(
    typeUrl: '/cosmos.store.streaming.abci.ListenCommitRequest',
    serviceUrl: "/cosmos.store.streaming.abci.ABCIListenerService/ListenCommit",
  ),
  cosmosStoreStreamingAbciListenCommitResponse(
    typeUrl: '/cosmos.store.streaming.abci.ListenCommitResponse',
  ),
  cosmosStoreV1beta1StoreKVPair(typeUrl: '/cosmos.store.v1beta1.StoreKVPair'),
  cosmosAutocliV1AppOptionsRequest(
    typeUrl: '/cosmos.autocli.v1.AppOptionsRequest',
    serviceUrl: "/cosmos.autocli.v1.Query/AppOptions",
  ),
  cosmosAutocliV1AppOptionsResponse(
    typeUrl: '/cosmos.autocli.v1.AppOptionsResponse',
  ),
  cosmosAutocliV1ModuleOptions(typeUrl: '/cosmos.autocli.v1.ModuleOptions'),
  cosmosAutocliV1ServiceCommandDescriptor(
    typeUrl: '/cosmos.autocli.v1.ServiceCommandDescriptor',
  ),
  cosmosAutocliV1RpcCommandOptions(
    typeUrl: '/cosmos.autocli.v1.RpcCommandOptions',
  ),
  cosmosAutocliV1FlagOptions(typeUrl: '/cosmos.autocli.v1.FlagOptions'),
  cosmosAutocliV1PositionalArgDescriptor(
    typeUrl: '/cosmos.autocli.v1.PositionalArgDescriptor',
  ),
  cosmosBenchmarkV1Op(typeUrl: '/cosmos.benchmark.v1.Op'),
  cosmosBenchmarkV1MsgLoadTest(
    typeUrl: '/cosmos.benchmark.v1.MsgLoadTest',
    serviceUrl: "/cosmos.benchmark.v1.Msg/LoadTest",
    aminoType: "cosmos-sdk/tools/benchmark/v1/MsgLoadTest",
  ),
  cosmosBenchmarkV1MsgLoadTestResponse(
    typeUrl: '/cosmos.benchmark.v1.MsgLoadTestResponse',
  ),
  cosmosVestingV1beta1Period(typeUrl: '/cosmos.vesting.v1beta1.Period'),
  cosmosVestingV1beta1MsgCreateVestingAccount(
    typeUrl: '/cosmos.vesting.v1beta1.MsgCreateVestingAccount',
    serviceUrl: "/cosmos.vesting.v1beta1.Msg/CreateVestingAccount",
    aminoType: "cosmos-sdk/MsgCreateVestingAccount",
  ),
  cosmosVestingV1beta1MsgCreateVestingAccountResponse(
    typeUrl: '/cosmos.vesting.v1beta1.MsgCreateVestingAccountResponse',
  ),
  cosmosVestingV1beta1MsgCreatePermanentLockedAccount(
    typeUrl: '/cosmos.vesting.v1beta1.MsgCreatePermanentLockedAccount',
    serviceUrl: "/cosmos.vesting.v1beta1.Msg/CreatePermanentLockedAccount",
    aminoType: "cosmos-sdk/MsgCreatePermLockedAccount",
  ),
  cosmosVestingV1beta1MsgCreatePermanentLockedAccountResponse(
    typeUrl: '/cosmos.vesting.v1beta1.MsgCreatePermanentLockedAccountResponse',
  ),
  cosmosVestingV1beta1MsgCreatePeriodicVestingAccount(
    typeUrl: '/cosmos.vesting.v1beta1.MsgCreatePeriodicVestingAccount',
    serviceUrl: "/cosmos.vesting.v1beta1.Msg/CreatePeriodicVestingAccount",
    aminoType: "cosmos-sdk/MsgCreatePeriodVestAccount",
  ),
  cosmosVestingV1beta1MsgCreatePeriodicVestingAccountResponse(
    typeUrl: '/cosmos.vesting.v1beta1.MsgCreatePeriodicVestingAccountResponse',
  ),
  cosmosEvidenceV1beta1QueryEvidenceRequest(
    typeUrl: '/cosmos.evidence.v1beta1.QueryEvidenceRequest',
    serviceUrl: "/cosmos.evidence.v1beta1.Query/Evidence",
  ),
  cosmosEvidenceV1beta1QueryEvidenceResponse(
    typeUrl: '/cosmos.evidence.v1beta1.QueryEvidenceResponse',
  ),
  cosmosEvidenceV1beta1QueryAllEvidenceRequest(
    typeUrl: '/cosmos.evidence.v1beta1.QueryAllEvidenceRequest',
    serviceUrl: "/cosmos.evidence.v1beta1.Query/AllEvidence",
  ),
  cosmosEvidenceV1beta1QueryAllEvidenceResponse(
    typeUrl: '/cosmos.evidence.v1beta1.QueryAllEvidenceResponse',
  ),
  cosmosEvidenceV1beta1MsgSubmitEvidence(
    typeUrl: '/cosmos.evidence.v1beta1.MsgSubmitEvidence',
    serviceUrl: "/cosmos.evidence.v1beta1.Msg/SubmitEvidence",
    aminoType: "cosmos-sdk/MsgSubmitEvidence",
  ),
  cosmosEvidenceV1beta1MsgSubmitEvidenceResponse(
    typeUrl: '/cosmos.evidence.v1beta1.MsgSubmitEvidenceResponse',
  ),
  cosmosConsensusV1QueryParamsRequest(
    typeUrl: '/cosmos.consensus.v1.QueryParamsRequest',
    serviceUrl: "/cosmos.consensus.v1.Query/Params",
  ),
  cosmosConsensusV1QueryParamsResponse(
    typeUrl: '/cosmos.consensus.v1.QueryParamsResponse',
  ),
  cosmosConsensusV1MsgUpdateParams(
    typeUrl: '/cosmos.consensus.v1.MsgUpdateParams',
    serviceUrl: "/cosmos.consensus.v1.Msg/UpdateParams",
    aminoType: "cosmos-sdk/x/consensus/MsgUpdateParams",
  ),
  cosmosConsensusV1MsgUpdateParamsResponse(
    typeUrl: '/cosmos.consensus.v1.MsgUpdateParamsResponse',
  ),
  cosmosBaseAbciV1beta1TxResponse(
    typeUrl: '/cosmos.base.abci.v1beta1.TxResponse',
  ),
  cosmosBaseAbciV1beta1ABCIMessageLog(
    typeUrl: '/cosmos.base.abci.v1beta1.ABCIMessageLog',
  ),
  cosmosBaseAbciV1beta1StringEvent(
    typeUrl: '/cosmos.base.abci.v1beta1.StringEvent',
  ),
  cosmosBaseAbciV1beta1Attribute(
    typeUrl: '/cosmos.base.abci.v1beta1.Attribute',
  ),
  cosmosBaseAbciV1beta1GasInfo(typeUrl: '/cosmos.base.abci.v1beta1.GasInfo'),
  cosmosBaseAbciV1beta1Result(typeUrl: '/cosmos.base.abci.v1beta1.Result'),
  cosmosBaseNodeV1beta1ConfigRequest(
    typeUrl: '/cosmos.base.node.v1beta1.ConfigRequest',
    serviceUrl: "/cosmos.base.node.v1beta1.Service/Config",
  ),
  cosmosBaseNodeV1beta1ConfigResponse(
    typeUrl: '/cosmos.base.node.v1beta1.ConfigResponse',
  ),
  cosmosBaseNodeV1beta1StatusRequest(
    typeUrl: '/cosmos.base.node.v1beta1.StatusRequest',
    serviceUrl: "/cosmos.base.node.v1beta1.Service/Status",
  ),
  cosmosBaseNodeV1beta1StatusResponse(
    typeUrl: '/cosmos.base.node.v1beta1.StatusResponse',
  ),
  cosmosBaseTendermintV1beta1GetValidatorSetByHeightRequest(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetValidatorSetByHeightRequest',
    serviceUrl:
        "/cosmos.base.tendermint.v1beta1.Service/GetValidatorSetByHeight",
  ),
  cosmosBaseTendermintV1beta1GetValidatorSetByHeightResponse(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetValidatorSetByHeightResponse',
  ),
  cosmosBaseTendermintV1beta1GetLatestValidatorSetRequest(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetLatestValidatorSetRequest',
    serviceUrl: "/cosmos.base.tendermint.v1beta1.Service/GetLatestValidatorSet",
  ),
  cosmosBaseTendermintV1beta1GetLatestValidatorSetResponse(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetLatestValidatorSetResponse',
  ),
  cosmosBaseTendermintV1beta1Validator(
    typeUrl: '/cosmos.base.tendermint.v1beta1.Validator',
  ),
  cosmosBaseTendermintV1beta1GetBlockByHeightRequest(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetBlockByHeightRequest',
    serviceUrl: "/cosmos.base.tendermint.v1beta1.Service/GetBlockByHeight",
  ),
  cosmosBaseTendermintV1beta1GetBlockByHeightResponse(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetBlockByHeightResponse',
  ),
  cosmosBaseTendermintV1beta1GetLatestBlockRequest(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetLatestBlockRequest',
    serviceUrl: "/cosmos.base.tendermint.v1beta1.Service/GetLatestBlock",
  ),
  cosmosBaseTendermintV1beta1GetLatestBlockResponse(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetLatestBlockResponse',
  ),
  cosmosBaseTendermintV1beta1GetSyncingRequest(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetSyncingRequest',
    serviceUrl: "/cosmos.base.tendermint.v1beta1.Service/GetSyncing",
  ),
  cosmosBaseTendermintV1beta1GetSyncingResponse(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetSyncingResponse',
  ),
  cosmosBaseTendermintV1beta1GetNodeInfoRequest(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetNodeInfoRequest',
    serviceUrl: "/cosmos.base.tendermint.v1beta1.Service/GetNodeInfo",
  ),
  cosmosBaseTendermintV1beta1GetNodeInfoResponse(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetNodeInfoResponse',
  ),
  cosmosBaseTendermintV1beta1VersionInfo(
    typeUrl: '/cosmos.base.tendermint.v1beta1.VersionInfo',
  ),
  cosmosBaseTendermintV1beta1Module(
    typeUrl: '/cosmos.base.tendermint.v1beta1.Module',
  ),
  cosmosBaseTendermintV1beta1ABCIQueryRequest(
    typeUrl: '/cosmos.base.tendermint.v1beta1.ABCIQueryRequest',
    serviceUrl: "/cosmos.base.tendermint.v1beta1.Service/ABCIQuery",
  ),
  cosmosBaseTendermintV1beta1ABCIQueryResponse(
    typeUrl: '/cosmos.base.tendermint.v1beta1.ABCIQueryResponse',
  ),
  cosmosBaseTendermintV1beta1ProofOp(
    typeUrl: '/cosmos.base.tendermint.v1beta1.ProofOp',
  ),
  cosmosBaseTendermintV1beta1ProofOps(
    typeUrl: '/cosmos.base.tendermint.v1beta1.ProofOps',
  ),
  cosmosBaseTendermintV1beta1GetBlockResultsRequest(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetBlockResultsRequest',
    serviceUrl: "/cosmos.base.tendermint.v1beta1.Service/GetBlockResults",
  ),
  cosmosBaseTendermintV1beta1GetLatestBlockResultsRequest(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetLatestBlockResultsRequest',
    serviceUrl: "/cosmos.base.tendermint.v1beta1.Service/GetLatestBlockResults",
  ),
  cosmosBaseTendermintV1beta1GetBlockResultsResponse(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetBlockResultsResponse',
  ),
  cosmosBaseTendermintV1beta1GetLatestBlockResultsResponse(
    typeUrl: '/cosmos.base.tendermint.v1beta1.GetLatestBlockResultsResponse',
  ),
  cosmosBaseTendermintV1beta1Block(
    typeUrl: '/cosmos.base.tendermint.v1beta1.Block',
  ),
  cosmosBaseTendermintV1beta1Header(
    typeUrl: '/cosmos.base.tendermint.v1beta1.Header',
  ),
  cosmosBaseReflectionV2alpha1TxDescriptor(
    typeUrl: '/cosmos.base.reflection.v2alpha1.TxDescriptor',
  ),
  cosmosBaseReflectionV2alpha1AuthnDescriptor(
    typeUrl: '/cosmos.base.reflection.v2alpha1.AuthnDescriptor',
  ),
  cosmosBaseReflectionV2alpha1SigningModeDescriptor(
    typeUrl: '/cosmos.base.reflection.v2alpha1.SigningModeDescriptor',
  ),
  cosmosBaseReflectionV2alpha1ChainDescriptor(
    typeUrl: '/cosmos.base.reflection.v2alpha1.ChainDescriptor',
  ),
  cosmosBaseReflectionV2alpha1CodecDescriptor(
    typeUrl: '/cosmos.base.reflection.v2alpha1.CodecDescriptor',
  ),
  cosmosBaseReflectionV2alpha1InterfaceDescriptor(
    typeUrl: '/cosmos.base.reflection.v2alpha1.InterfaceDescriptor',
  ),
  cosmosBaseReflectionV2alpha1InterfaceImplementerDescriptor(
    typeUrl: '/cosmos.base.reflection.v2alpha1.InterfaceImplementerDescriptor',
  ),
  cosmosBaseReflectionV2alpha1InterfaceAcceptingMessageDescriptor(
    typeUrl:
        '/cosmos.base.reflection.v2alpha1.InterfaceAcceptingMessageDescriptor',
  ),
  cosmosBaseReflectionV2alpha1ConfigurationDescriptor(
    typeUrl: '/cosmos.base.reflection.v2alpha1.ConfigurationDescriptor',
  ),
  cosmosBaseReflectionV2alpha1MsgDescriptor(
    typeUrl: '/cosmos.base.reflection.v2alpha1.MsgDescriptor',
  ),
  cosmosBaseReflectionV2alpha1GetAuthnDescriptorRequest(
    typeUrl: '/cosmos.base.reflection.v2alpha1.GetAuthnDescriptorRequest',
    serviceUrl:
        "/cosmos.base.reflection.v2alpha1.ReflectionService/GetAuthnDescriptor",
  ),
  cosmosBaseReflectionV2alpha1GetAuthnDescriptorResponse(
    typeUrl: '/cosmos.base.reflection.v2alpha1.GetAuthnDescriptorResponse',
  ),
  cosmosBaseReflectionV2alpha1GetChainDescriptorRequest(
    typeUrl: '/cosmos.base.reflection.v2alpha1.GetChainDescriptorRequest',
    serviceUrl:
        "/cosmos.base.reflection.v2alpha1.ReflectionService/GetChainDescriptor",
  ),
  cosmosBaseReflectionV2alpha1GetChainDescriptorResponse(
    typeUrl: '/cosmos.base.reflection.v2alpha1.GetChainDescriptorResponse',
  ),
  cosmosBaseReflectionV2alpha1GetCodecDescriptorRequest(
    typeUrl: '/cosmos.base.reflection.v2alpha1.GetCodecDescriptorRequest',
    serviceUrl:
        "/cosmos.base.reflection.v2alpha1.ReflectionService/GetCodecDescriptor",
  ),
  cosmosBaseReflectionV2alpha1GetCodecDescriptorResponse(
    typeUrl: '/cosmos.base.reflection.v2alpha1.GetCodecDescriptorResponse',
  ),
  cosmosBaseReflectionV2alpha1GetConfigurationDescriptorRequest(
    typeUrl:
        '/cosmos.base.reflection.v2alpha1.GetConfigurationDescriptorRequest',
    serviceUrl:
        "/cosmos.base.reflection.v2alpha1.ReflectionService/GetConfigurationDescriptor",
  ),
  cosmosBaseReflectionV2alpha1GetConfigurationDescriptorResponse(
    typeUrl:
        '/cosmos.base.reflection.v2alpha1.GetConfigurationDescriptorResponse',
  ),
  cosmosBaseReflectionV2alpha1GetQueryServicesDescriptorRequest(
    typeUrl:
        '/cosmos.base.reflection.v2alpha1.GetQueryServicesDescriptorRequest',
    serviceUrl:
        "/cosmos.base.reflection.v2alpha1.ReflectionService/GetQueryServicesDescriptor",
  ),
  cosmosBaseReflectionV2alpha1GetQueryServicesDescriptorResponse(
    typeUrl:
        '/cosmos.base.reflection.v2alpha1.GetQueryServicesDescriptorResponse',
  ),
  cosmosBaseReflectionV2alpha1GetTxDescriptorRequest(
    typeUrl: '/cosmos.base.reflection.v2alpha1.GetTxDescriptorRequest',
    serviceUrl:
        "/cosmos.base.reflection.v2alpha1.ReflectionService/GetTxDescriptor",
  ),
  cosmosBaseReflectionV2alpha1GetTxDescriptorResponse(
    typeUrl: '/cosmos.base.reflection.v2alpha1.GetTxDescriptorResponse',
  ),
  cosmosBaseReflectionV2alpha1QueryServicesDescriptor(
    typeUrl: '/cosmos.base.reflection.v2alpha1.QueryServicesDescriptor',
  ),
  cosmosBaseReflectionV2alpha1QueryServiceDescriptor(
    typeUrl: '/cosmos.base.reflection.v2alpha1.QueryServiceDescriptor',
  ),
  cosmosBaseReflectionV2alpha1QueryMethodDescriptor(
    typeUrl: '/cosmos.base.reflection.v2alpha1.QueryMethodDescriptor',
  ),
  cosmosBaseReflectionV1beta1ListAllInterfacesRequest(
    typeUrl: '/cosmos.base.reflection.v1beta1.ListAllInterfacesRequest',
    serviceUrl:
        "/cosmos.base.reflection.v1beta1.ReflectionService/ListAllInterfaces",
  ),
  cosmosBaseReflectionV1beta1ListAllInterfacesResponse(
    typeUrl: '/cosmos.base.reflection.v1beta1.ListAllInterfacesResponse',
  ),
  cosmosBaseReflectionV1beta1ListImplementationsRequest(
    typeUrl: '/cosmos.base.reflection.v1beta1.ListImplementationsRequest',
    serviceUrl:
        "/cosmos.base.reflection.v1beta1.ReflectionService/ListImplementations",
  ),
  cosmosBaseReflectionV1beta1ListImplementationsResponse(
    typeUrl: '/cosmos.base.reflection.v1beta1.ListImplementationsResponse',
  ),
  cosmosBaseV1beta1Coin(typeUrl: '/cosmos.base.v1beta1.Coin'),
  cosmosBaseV1beta1DecCoin(typeUrl: '/cosmos.base.v1beta1.DecCoin'),
  cosmosBaseQueryV1beta1PageRequest(
    typeUrl: '/cosmos.base.query.v1beta1.PageRequest',
  ),
  cosmosBaseQueryV1beta1PageResponse(
    typeUrl: '/cosmos.base.query.v1beta1.PageResponse',
  ),
  cosmosAppV1alpha1QueryConfigRequest(
    typeUrl: '/cosmos.app.v1alpha1.QueryConfigRequest',
    serviceUrl: "/cosmos.app.v1alpha1.Query/Config",
  ),
  cosmosAppV1alpha1QueryConfigResponse(
    typeUrl: '/cosmos.app.v1alpha1.QueryConfigResponse',
  ),
  cosmosAppV1alpha1Config(typeUrl: '/cosmos.app.v1alpha1.Config'),
  cosmosAppV1alpha1ModuleConfig(typeUrl: '/cosmos.app.v1alpha1.ModuleConfig'),
  cosmosAppV1alpha1GolangBinding(typeUrl: '/cosmos.app.v1alpha1.GolangBinding'),
  cosmosAuthzV1beta1QueryGrantsRequest(
    typeUrl: '/cosmos.authz.v1beta1.QueryGrantsRequest',
    serviceUrl: "/cosmos.authz.v1beta1.Query/Grants",
  ),
  cosmosAuthzV1beta1QueryGrantsResponse(
    typeUrl: '/cosmos.authz.v1beta1.QueryGrantsResponse',
  ),
  cosmosAuthzV1beta1QueryGranterGrantsRequest(
    typeUrl: '/cosmos.authz.v1beta1.QueryGranterGrantsRequest',
    serviceUrl: "/cosmos.authz.v1beta1.Query/GranterGrants",
  ),
  cosmosAuthzV1beta1QueryGranterGrantsResponse(
    typeUrl: '/cosmos.authz.v1beta1.QueryGranterGrantsResponse',
  ),
  cosmosAuthzV1beta1QueryGranteeGrantsRequest(
    typeUrl: '/cosmos.authz.v1beta1.QueryGranteeGrantsRequest',
    serviceUrl: "/cosmos.authz.v1beta1.Query/GranteeGrants",
  ),
  cosmosAuthzV1beta1QueryGranteeGrantsResponse(
    typeUrl: '/cosmos.authz.v1beta1.QueryGranteeGrantsResponse',
  ),
  cosmosAuthzV1beta1Grant(typeUrl: '/cosmos.authz.v1beta1.Grant'),
  cosmosAuthzV1beta1GrantAuthorization(
    typeUrl: '/cosmos.authz.v1beta1.GrantAuthorization',
  ),
  cosmosAuthzV1beta1MsgGrant(
    typeUrl: '/cosmos.authz.v1beta1.MsgGrant',
    serviceUrl: "/cosmos.authz.v1beta1.Msg/Grant",
    aminoType: "cosmos-sdk/MsgGrant",
  ),
  cosmosAuthzV1beta1MsgGrantResponse(
    typeUrl: '/cosmos.authz.v1beta1.MsgGrantResponse',
  ),
  cosmosAuthzV1beta1MsgExec(
    typeUrl: '/cosmos.authz.v1beta1.MsgExec',
    serviceUrl: "/cosmos.authz.v1beta1.Msg/Exec",
    aminoType: "cosmos-sdk/MsgExec",
  ),
  cosmosAuthzV1beta1MsgExecResponse(
    typeUrl: '/cosmos.authz.v1beta1.MsgExecResponse',
  ),
  cosmosAuthzV1beta1MsgRevoke(
    typeUrl: '/cosmos.authz.v1beta1.MsgRevoke',
    serviceUrl: "/cosmos.authz.v1beta1.Msg/Revoke",
    aminoType: "cosmos-sdk/MsgRevoke",
  ),
  cosmosAuthzV1beta1MsgRevokeResponse(
    typeUrl: '/cosmos.authz.v1beta1.MsgRevokeResponse',
  ),
  cosmosGovV1QueryConstitutionRequest(
    typeUrl: '/cosmos.gov.v1.QueryConstitutionRequest',
    serviceUrl: "/cosmos.gov.v1.Query/Constitution",
  ),
  cosmosGovV1QueryConstitutionResponse(
    typeUrl: '/cosmos.gov.v1.QueryConstitutionResponse',
  ),
  cosmosGovV1QueryProposalRequest(
    typeUrl: '/cosmos.gov.v1.QueryProposalRequest',
    serviceUrl: "/cosmos.gov.v1.Query/Proposal",
  ),
  cosmosGovV1QueryProposalResponse(
    typeUrl: '/cosmos.gov.v1.QueryProposalResponse',
  ),
  cosmosGovV1QueryProposalsRequest(
    typeUrl: '/cosmos.gov.v1.QueryProposalsRequest',
    serviceUrl: "/cosmos.gov.v1.Query/Proposals",
  ),
  cosmosGovV1QueryProposalsResponse(
    typeUrl: '/cosmos.gov.v1.QueryProposalsResponse',
  ),
  cosmosGovV1QueryVoteRequest(
    typeUrl: '/cosmos.gov.v1.QueryVoteRequest',
    serviceUrl: "/cosmos.gov.v1.Query/Vote",
  ),
  cosmosGovV1QueryVoteResponse(typeUrl: '/cosmos.gov.v1.QueryVoteResponse'),
  cosmosGovV1QueryVotesRequest(
    typeUrl: '/cosmos.gov.v1.QueryVotesRequest',
    serviceUrl: "/cosmos.gov.v1.Query/Votes",
  ),
  cosmosGovV1QueryVotesResponse(typeUrl: '/cosmos.gov.v1.QueryVotesResponse'),
  cosmosGovV1QueryParamsRequest(
    typeUrl: '/cosmos.gov.v1.QueryParamsRequest',
    serviceUrl: "/cosmos.gov.v1.Query/Params",
  ),
  cosmosGovV1QueryParamsResponse(typeUrl: '/cosmos.gov.v1.QueryParamsResponse'),
  cosmosGovV1QueryDepositRequest(
    typeUrl: '/cosmos.gov.v1.QueryDepositRequest',
    serviceUrl: "/cosmos.gov.v1.Query/Deposit",
  ),
  cosmosGovV1QueryDepositResponse(
    typeUrl: '/cosmos.gov.v1.QueryDepositResponse',
  ),
  cosmosGovV1QueryDepositsRequest(
    typeUrl: '/cosmos.gov.v1.QueryDepositsRequest',
    serviceUrl: "/cosmos.gov.v1.Query/Deposits",
  ),
  cosmosGovV1QueryDepositsResponse(
    typeUrl: '/cosmos.gov.v1.QueryDepositsResponse',
  ),
  cosmosGovV1QueryTallyResultRequest(
    typeUrl: '/cosmos.gov.v1.QueryTallyResultRequest',
    serviceUrl: "/cosmos.gov.v1.Query/TallyResult",
  ),
  cosmosGovV1QueryTallyResultResponse(
    typeUrl: '/cosmos.gov.v1.QueryTallyResultResponse',
  ),
  cosmosGovV1WeightedVoteOption(typeUrl: '/cosmos.gov.v1.WeightedVoteOption'),
  cosmosGovV1Deposit(typeUrl: '/cosmos.gov.v1.Deposit'),
  cosmosGovV1Proposal(typeUrl: '/cosmos.gov.v1.Proposal'),
  cosmosGovV1TallyResult(typeUrl: '/cosmos.gov.v1.TallyResult'),
  cosmosGovV1Vote(typeUrl: '/cosmos.gov.v1.Vote'),
  cosmosGovV1DepositParams(typeUrl: '/cosmos.gov.v1.DepositParams'),
  cosmosGovV1VotingParams(typeUrl: '/cosmos.gov.v1.VotingParams'),
  cosmosGovV1TallyParams(typeUrl: '/cosmos.gov.v1.TallyParams'),
  cosmosGovV1Params(typeUrl: '/cosmos.gov.v1.Params'),
  cosmosGovV1MsgSubmitProposal(
    typeUrl: '/cosmos.gov.v1.MsgSubmitProposal',
    serviceUrl: "/cosmos.gov.v1.Msg/SubmitProposal",
    aminoType: "cosmos-sdk/v1/MsgSubmitProposal",
  ),
  cosmosGovV1MsgSubmitProposalResponse(
    typeUrl: '/cosmos.gov.v1.MsgSubmitProposalResponse',
  ),
  cosmosGovV1MsgExecLegacyContent(
    typeUrl: '/cosmos.gov.v1.MsgExecLegacyContent',
    serviceUrl: "/cosmos.gov.v1.Msg/ExecLegacyContent",
    aminoType: "cosmos-sdk/v1/MsgExecLegacyContent",
  ),
  cosmosGovV1MsgExecLegacyContentResponse(
    typeUrl: '/cosmos.gov.v1.MsgExecLegacyContentResponse',
  ),
  cosmosGovV1MsgVote(
    typeUrl: '/cosmos.gov.v1.MsgVote',
    serviceUrl: "/cosmos.gov.v1.Msg/Vote",
    aminoType: "cosmos-sdk/v1/MsgVote",
  ),
  cosmosGovV1MsgVoteResponse(typeUrl: '/cosmos.gov.v1.MsgVoteResponse'),
  cosmosGovV1MsgVoteWeighted(
    typeUrl: '/cosmos.gov.v1.MsgVoteWeighted',
    serviceUrl: "/cosmos.gov.v1.Msg/VoteWeighted",
    aminoType: "cosmos-sdk/v1/MsgVoteWeighted",
  ),
  cosmosGovV1MsgVoteWeightedResponse(
    typeUrl: '/cosmos.gov.v1.MsgVoteWeightedResponse',
  ),
  cosmosGovV1MsgDeposit(
    typeUrl: '/cosmos.gov.v1.MsgDeposit',
    serviceUrl: "/cosmos.gov.v1.Msg/Deposit",
    aminoType: "cosmos-sdk/v1/MsgDeposit",
  ),
  cosmosGovV1MsgDepositResponse(typeUrl: '/cosmos.gov.v1.MsgDepositResponse'),
  cosmosGovV1MsgUpdateParams(
    typeUrl: '/cosmos.gov.v1.MsgUpdateParams',
    serviceUrl: "/cosmos.gov.v1.Msg/UpdateParams",
    aminoType: "cosmos-sdk/x/gov/v1/MsgUpdateParams",
  ),
  cosmosGovV1MsgUpdateParamsResponse(
    typeUrl: '/cosmos.gov.v1.MsgUpdateParamsResponse',
  ),
  cosmosGovV1MsgCancelProposal(
    typeUrl: '/cosmos.gov.v1.MsgCancelProposal',
    serviceUrl: "/cosmos.gov.v1.Msg/CancelProposal",
  ),
  cosmosGovV1MsgCancelProposalResponse(
    typeUrl: '/cosmos.gov.v1.MsgCancelProposalResponse',
  ),
  cosmosGovV1beta1QueryProposalRequest(
    typeUrl: '/cosmos.gov.v1beta1.QueryProposalRequest',
    serviceUrl: "/cosmos.gov.v1beta1.Query/Proposal",
  ),
  cosmosGovV1beta1QueryProposalResponse(
    typeUrl: '/cosmos.gov.v1beta1.QueryProposalResponse',
  ),
  cosmosGovV1beta1QueryProposalsRequest(
    typeUrl: '/cosmos.gov.v1beta1.QueryProposalsRequest',
    serviceUrl: "/cosmos.gov.v1beta1.Query/Proposals",
  ),
  cosmosGovV1beta1QueryProposalsResponse(
    typeUrl: '/cosmos.gov.v1beta1.QueryProposalsResponse',
  ),
  cosmosGovV1beta1QueryVoteRequest(
    typeUrl: '/cosmos.gov.v1beta1.QueryVoteRequest',
    serviceUrl: "/cosmos.gov.v1beta1.Query/Vote",
  ),
  cosmosGovV1beta1QueryVoteResponse(
    typeUrl: '/cosmos.gov.v1beta1.QueryVoteResponse',
  ),
  cosmosGovV1beta1QueryVotesRequest(
    typeUrl: '/cosmos.gov.v1beta1.QueryVotesRequest',
    serviceUrl: "/cosmos.gov.v1beta1.Query/Votes",
  ),
  cosmosGovV1beta1QueryVotesResponse(
    typeUrl: '/cosmos.gov.v1beta1.QueryVotesResponse',
  ),
  cosmosGovV1beta1QueryParamsRequest(
    typeUrl: '/cosmos.gov.v1beta1.QueryParamsRequest',
    serviceUrl: "/cosmos.gov.v1beta1.Query/Params",
  ),
  cosmosGovV1beta1QueryParamsResponse(
    typeUrl: '/cosmos.gov.v1beta1.QueryParamsResponse',
  ),
  cosmosGovV1beta1QueryDepositRequest(
    typeUrl: '/cosmos.gov.v1beta1.QueryDepositRequest',
    serviceUrl: "/cosmos.gov.v1beta1.Query/Deposit",
  ),
  cosmosGovV1beta1QueryDepositResponse(
    typeUrl: '/cosmos.gov.v1beta1.QueryDepositResponse',
  ),
  cosmosGovV1beta1QueryDepositsRequest(
    typeUrl: '/cosmos.gov.v1beta1.QueryDepositsRequest',
    serviceUrl: "/cosmos.gov.v1beta1.Query/Deposits",
  ),
  cosmosGovV1beta1QueryDepositsResponse(
    typeUrl: '/cosmos.gov.v1beta1.QueryDepositsResponse',
  ),
  cosmosGovV1beta1QueryTallyResultRequest(
    typeUrl: '/cosmos.gov.v1beta1.QueryTallyResultRequest',
    serviceUrl: "/cosmos.gov.v1beta1.Query/TallyResult",
  ),
  cosmosGovV1beta1QueryTallyResultResponse(
    typeUrl: '/cosmos.gov.v1beta1.QueryTallyResultResponse',
  ),
  cosmosGovV1beta1WeightedVoteOption(
    typeUrl: '/cosmos.gov.v1beta1.WeightedVoteOption',
  ),
  cosmosGovV1beta1Deposit(typeUrl: '/cosmos.gov.v1beta1.Deposit'),
  cosmosGovV1beta1Proposal(typeUrl: '/cosmos.gov.v1beta1.Proposal'),
  cosmosGovV1beta1TallyResult(typeUrl: '/cosmos.gov.v1beta1.TallyResult'),
  cosmosGovV1beta1Vote(typeUrl: '/cosmos.gov.v1beta1.Vote'),
  cosmosGovV1beta1DepositParams(typeUrl: '/cosmos.gov.v1beta1.DepositParams'),
  cosmosGovV1beta1VotingParams(typeUrl: '/cosmos.gov.v1beta1.VotingParams'),
  cosmosGovV1beta1TallyParams(typeUrl: '/cosmos.gov.v1beta1.TallyParams'),
  cosmosGovV1beta1MsgSubmitProposal(
    typeUrl: '/cosmos.gov.v1beta1.MsgSubmitProposal',
    serviceUrl: "/cosmos.gov.v1beta1.Msg/SubmitProposal",
    aminoType: "cosmos-sdk/MsgSubmitProposal",
  ),
  cosmosGovV1beta1MsgSubmitProposalResponse(
    typeUrl: '/cosmos.gov.v1beta1.MsgSubmitProposalResponse',
  ),
  cosmosGovV1beta1MsgVote(
    typeUrl: '/cosmos.gov.v1beta1.MsgVote',
    serviceUrl: "/cosmos.gov.v1beta1.Msg/Vote",
    aminoType: "cosmos-sdk/MsgVote",
  ),
  cosmosGovV1beta1MsgVoteResponse(
    typeUrl: '/cosmos.gov.v1beta1.MsgVoteResponse',
  ),
  cosmosGovV1beta1MsgVoteWeighted(
    typeUrl: '/cosmos.gov.v1beta1.MsgVoteWeighted',
    serviceUrl: "/cosmos.gov.v1beta1.Msg/VoteWeighted",
    aminoType: "cosmos-sdk/MsgVoteWeighted",
  ),
  cosmosGovV1beta1MsgVoteWeightedResponse(
    typeUrl: '/cosmos.gov.v1beta1.MsgVoteWeightedResponse',
  ),
  cosmosGovV1beta1MsgDeposit(
    typeUrl: '/cosmos.gov.v1beta1.MsgDeposit',
    serviceUrl: "/cosmos.gov.v1beta1.Msg/Deposit",
    aminoType: "cosmos-sdk/MsgDeposit",
  ),
  cosmosGovV1beta1MsgDepositResponse(
    typeUrl: '/cosmos.gov.v1beta1.MsgDepositResponse',
  ),
  cosmosTxSigningV1beta1SignatureDescriptors(
    typeUrl: '/cosmos.tx.signing.v1beta1.SignatureDescriptors',
  ),
  cosmosTxSigningV1beta1SignatureDescriptor(
    typeUrl: '/cosmos.tx.signing.v1beta1.SignatureDescriptor',
  ),
  cosmosTxSigningV1beta1SignatureDescriptorData(
    typeUrl: '/cosmos.tx.signing.v1beta1.SignatureDescriptor.Data',
  ),
  cosmosTxSigningV1beta1SignatureDescriptorDataSingle(
    typeUrl: '/cosmos.tx.signing.v1beta1.SignatureDescriptor.Data.Single',
  ),
  cosmosTxSigningV1beta1SignatureDescriptorDataMulti(
    typeUrl: '/cosmos.tx.signing.v1beta1.SignatureDescriptor.Data.Multi',
  ),
  cosmosTxV1beta1GetTxsEventRequest(
    typeUrl: '/cosmos.tx.v1beta1.GetTxsEventRequest',
    serviceUrl: "/cosmos.tx.v1beta1.Service/GetTxsEvent",
  ),
  cosmosTxV1beta1GetTxsEventResponse(
    typeUrl: '/cosmos.tx.v1beta1.GetTxsEventResponse',
  ),
  cosmosTxV1beta1BroadcastTxRequest(
    typeUrl: '/cosmos.tx.v1beta1.BroadcastTxRequest',
    serviceUrl: "/cosmos.tx.v1beta1.Service/BroadcastTx",
  ),
  cosmosTxV1beta1BroadcastTxResponse(
    typeUrl: '/cosmos.tx.v1beta1.BroadcastTxResponse',
  ),
  cosmosTxV1beta1SimulateRequest(
    typeUrl: '/cosmos.tx.v1beta1.SimulateRequest',
    serviceUrl: "/cosmos.tx.v1beta1.Service/Simulate",
  ),
  cosmosTxV1beta1SimulateResponse(
    typeUrl: '/cosmos.tx.v1beta1.SimulateResponse',
  ),
  cosmosTxV1beta1GetTxRequest(
    typeUrl: '/cosmos.tx.v1beta1.GetTxRequest',
    serviceUrl: "/cosmos.tx.v1beta1.Service/GetTx",
  ),
  cosmosTxV1beta1GetTxResponse(typeUrl: '/cosmos.tx.v1beta1.GetTxResponse'),
  cosmosTxV1beta1GetBlockWithTxsRequest(
    typeUrl: '/cosmos.tx.v1beta1.GetBlockWithTxsRequest',
    serviceUrl: "/cosmos.tx.v1beta1.Service/GetBlockWithTxs",
  ),
  cosmosTxV1beta1GetBlockWithTxsResponse(
    typeUrl: '/cosmos.tx.v1beta1.GetBlockWithTxsResponse',
  ),
  cosmosTxV1beta1TxDecodeRequest(
    typeUrl: '/cosmos.tx.v1beta1.TxDecodeRequest',
    serviceUrl: "/cosmos.tx.v1beta1.Service/TxDecode",
  ),
  cosmosTxV1beta1TxDecodeResponse(
    typeUrl: '/cosmos.tx.v1beta1.TxDecodeResponse',
  ),
  cosmosTxV1beta1TxEncodeRequest(
    typeUrl: '/cosmos.tx.v1beta1.TxEncodeRequest',
    serviceUrl: "/cosmos.tx.v1beta1.Service/TxEncode",
  ),
  cosmosTxV1beta1TxEncodeResponse(
    typeUrl: '/cosmos.tx.v1beta1.TxEncodeResponse',
  ),
  cosmosTxV1beta1TxEncodeAminoRequest(
    typeUrl: '/cosmos.tx.v1beta1.TxEncodeAminoRequest',
    serviceUrl: "/cosmos.tx.v1beta1.Service/TxEncodeAmino",
  ),
  cosmosTxV1beta1TxEncodeAminoResponse(
    typeUrl: '/cosmos.tx.v1beta1.TxEncodeAminoResponse',
  ),
  cosmosTxV1beta1TxDecodeAminoRequest(
    typeUrl: '/cosmos.tx.v1beta1.TxDecodeAminoRequest',
    serviceUrl: "/cosmos.tx.v1beta1.Service/TxDecodeAmino",
  ),
  cosmosTxV1beta1TxDecodeAminoResponse(
    typeUrl: '/cosmos.tx.v1beta1.TxDecodeAminoResponse',
  ),
  cosmosTxV1beta1Tx(typeUrl: '/cosmos.tx.v1beta1.Tx'),
  cosmosTxV1beta1TxRaw(typeUrl: '/cosmos.tx.v1beta1.TxRaw'),
  cosmosTxV1beta1SignDoc(typeUrl: '/cosmos.tx.v1beta1.SignDoc'),
  cosmosTxV1beta1SignDocDirectAux(
    typeUrl: '/cosmos.tx.v1beta1.SignDocDirectAux',
  ),
  cosmosTxV1beta1TxBody(typeUrl: '/cosmos.tx.v1beta1.TxBody'),
  cosmosTxV1beta1AuthInfo(typeUrl: '/cosmos.tx.v1beta1.AuthInfo'),
  cosmosTxV1beta1SignerInfo(typeUrl: '/cosmos.tx.v1beta1.SignerInfo'),
  cosmosTxV1beta1ModeInfo(typeUrl: '/cosmos.tx.v1beta1.ModeInfo'),
  cosmosTxV1beta1ModeInfoSingle(typeUrl: '/cosmos.tx.v1beta1.ModeInfo.Single'),
  cosmosTxV1beta1ModeInfoMulti(typeUrl: '/cosmos.tx.v1beta1.ModeInfo.Multi'),
  cosmosTxV1beta1Fee(typeUrl: '/cosmos.tx.v1beta1.Fee'),
  cosmosTxV1beta1Tip(typeUrl: '/cosmos.tx.v1beta1.Tip'),
  cosmosTxV1beta1AuxSignerData(typeUrl: '/cosmos.tx.v1beta1.AuxSignerData'),
  cosmosTxConfigV1Config(typeUrl: '/cosmos.tx.config.v1.Config'),
  cosmosFeegrantV1beta1QueryAllowanceRequest(
    typeUrl: '/cosmos.feegrant.v1beta1.QueryAllowanceRequest',
    serviceUrl: "/cosmos.feegrant.v1beta1.Query/Allowance",
  ),
  cosmosFeegrantV1beta1QueryAllowanceResponse(
    typeUrl: '/cosmos.feegrant.v1beta1.QueryAllowanceResponse',
  ),
  cosmosFeegrantV1beta1QueryAllowancesRequest(
    typeUrl: '/cosmos.feegrant.v1beta1.QueryAllowancesRequest',
    serviceUrl: "/cosmos.feegrant.v1beta1.Query/Allowances",
  ),
  cosmosFeegrantV1beta1QueryAllowancesResponse(
    typeUrl: '/cosmos.feegrant.v1beta1.QueryAllowancesResponse',
  ),
  cosmosFeegrantV1beta1QueryAllowancesByGranterRequest(
    typeUrl: '/cosmos.feegrant.v1beta1.QueryAllowancesByGranterRequest',
    serviceUrl: "/cosmos.feegrant.v1beta1.Query/AllowancesByGranter",
  ),
  cosmosFeegrantV1beta1QueryAllowancesByGranterResponse(
    typeUrl: '/cosmos.feegrant.v1beta1.QueryAllowancesByGranterResponse',
  ),
  cosmosFeegrantV1beta1MsgGrantAllowance(
    typeUrl: '/cosmos.feegrant.v1beta1.MsgGrantAllowance',
    serviceUrl: "/cosmos.feegrant.v1beta1.Msg/GrantAllowance",
    aminoType: "cosmos-sdk/MsgGrantAllowance",
  ),
  cosmosFeegrantV1beta1MsgGrantAllowanceResponse(
    typeUrl: '/cosmos.feegrant.v1beta1.MsgGrantAllowanceResponse',
  ),
  cosmosFeegrantV1beta1MsgRevokeAllowance(
    typeUrl: '/cosmos.feegrant.v1beta1.MsgRevokeAllowance',
    serviceUrl: "/cosmos.feegrant.v1beta1.Msg/RevokeAllowance",
    aminoType: "cosmos-sdk/MsgRevokeAllowance",
  ),
  cosmosFeegrantV1beta1MsgRevokeAllowanceResponse(
    typeUrl: '/cosmos.feegrant.v1beta1.MsgRevokeAllowanceResponse',
  ),
  cosmosFeegrantV1beta1MsgPruneAllowances(
    typeUrl: '/cosmos.feegrant.v1beta1.MsgPruneAllowances',
    serviceUrl: "/cosmos.feegrant.v1beta1.Msg/PruneAllowances",
  ),
  cosmosFeegrantV1beta1MsgPruneAllowancesResponse(
    typeUrl: '/cosmos.feegrant.v1beta1.MsgPruneAllowancesResponse',
  ),
  cosmosFeegrantV1beta1Grant(typeUrl: '/cosmos.feegrant.v1beta1.Grant'),
  cosmosCounterV1QueryGetCountRequest(
    typeUrl: '/cosmos.counter.v1.QueryGetCountRequest',
    serviceUrl: "/cosmos.counter.v1.Query/GetCount",
  ),
  cosmosCounterV1QueryGetCountResponse(
    typeUrl: '/cosmos.counter.v1.QueryGetCountResponse',
  ),
  cosmosCounterV1MsgIncreaseCounter(
    typeUrl: '/cosmos.counter.v1.MsgIncreaseCounter',
    serviceUrl: "/cosmos.counter.v1.Msg/IncreaseCount",
    aminoType: "cosmos-sdk/increase_counter",
  ),
  cosmosCounterV1MsgIncreaseCountResponse(
    typeUrl: '/cosmos.counter.v1.MsgIncreaseCountResponse',
  ),
  cosmosReflectionV1FileDescriptorsRequest(
    typeUrl: '/cosmos.reflection.v1.FileDescriptorsRequest',
    serviceUrl: "/cosmos.reflection.v1.ReflectionService/FileDescriptors",
  ),
  cosmosReflectionV1FileDescriptorsResponse(
    typeUrl: '/cosmos.reflection.v1.FileDescriptorsResponse',
  ),
  cosmosMintV1beta1QueryParamsRequest(
    typeUrl: '/cosmos.mint.v1beta1.QueryParamsRequest',
    serviceUrl: "/cosmos.mint.v1beta1.Query/Params",
  ),
  cosmosMintV1beta1QueryParamsResponse(
    typeUrl: '/cosmos.mint.v1beta1.QueryParamsResponse',
  ),
  cosmosMintV1beta1QueryInflationRequest(
    typeUrl: '/cosmos.mint.v1beta1.QueryInflationRequest',
    serviceUrl: "/cosmos.mint.v1beta1.Query/Inflation",
  ),
  cosmosMintV1beta1QueryInflationResponse(
    typeUrl: '/cosmos.mint.v1beta1.QueryInflationResponse',
  ),
  cosmosMintV1beta1QueryAnnualProvisionsRequest(
    typeUrl: '/cosmos.mint.v1beta1.QueryAnnualProvisionsRequest',
    serviceUrl: "/cosmos.mint.v1beta1.Query/AnnualProvisions",
  ),
  cosmosMintV1beta1QueryAnnualProvisionsResponse(
    typeUrl: '/cosmos.mint.v1beta1.QueryAnnualProvisionsResponse',
  ),
  cosmosMintV1beta1Params(
    typeUrl: '/cosmos.mint.v1beta1.Params',
    aminoType: "cosmos-sdk/x/mint/Params",
  ),
  cosmosMintV1beta1MsgUpdateParams(
    typeUrl: '/cosmos.mint.v1beta1.MsgUpdateParams',
    serviceUrl: "/cosmos.mint.v1beta1.Msg/UpdateParams",
    aminoType: "cosmos-sdk/x/mint/MsgUpdateParams",
  ),
  cosmosMintV1beta1MsgUpdateParamsResponse(
    typeUrl: '/cosmos.mint.v1beta1.MsgUpdateParamsResponse',
  ),
  cosmosStakingV1beta1QueryValidatorsRequest(
    typeUrl: '/cosmos.staking.v1beta1.QueryValidatorsRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/Validators",
  ),
  cosmosStakingV1beta1QueryValidatorsResponse(
    typeUrl: '/cosmos.staking.v1beta1.QueryValidatorsResponse',
  ),
  cosmosStakingV1beta1QueryValidatorRequest(
    typeUrl: '/cosmos.staking.v1beta1.QueryValidatorRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/Validator",
  ),
  cosmosStakingV1beta1QueryValidatorResponse(
    typeUrl: '/cosmos.staking.v1beta1.QueryValidatorResponse',
  ),
  cosmosStakingV1beta1QueryValidatorDelegationsRequest(
    typeUrl: '/cosmos.staking.v1beta1.QueryValidatorDelegationsRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/ValidatorDelegations",
  ),
  cosmosStakingV1beta1QueryValidatorDelegationsResponse(
    typeUrl: '/cosmos.staking.v1beta1.QueryValidatorDelegationsResponse',
  ),
  cosmosStakingV1beta1QueryValidatorUnbondingDelegationsRequest(
    typeUrl:
        '/cosmos.staking.v1beta1.QueryValidatorUnbondingDelegationsRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/ValidatorUnbondingDelegations",
  ),
  cosmosStakingV1beta1QueryValidatorUnbondingDelegationsResponse(
    typeUrl:
        '/cosmos.staking.v1beta1.QueryValidatorUnbondingDelegationsResponse',
  ),
  cosmosStakingV1beta1QueryDelegationRequest(
    typeUrl: '/cosmos.staking.v1beta1.QueryDelegationRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/Delegation",
  ),
  cosmosStakingV1beta1QueryDelegationResponse(
    typeUrl: '/cosmos.staking.v1beta1.QueryDelegationResponse',
  ),
  cosmosStakingV1beta1QueryUnbondingDelegationRequest(
    typeUrl: '/cosmos.staking.v1beta1.QueryUnbondingDelegationRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/UnbondingDelegation",
  ),
  cosmosStakingV1beta1QueryUnbondingDelegationResponse(
    typeUrl: '/cosmos.staking.v1beta1.QueryUnbondingDelegationResponse',
  ),
  cosmosStakingV1beta1QueryDelegatorDelegationsRequest(
    typeUrl: '/cosmos.staking.v1beta1.QueryDelegatorDelegationsRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/DelegatorDelegations",
  ),
  cosmosStakingV1beta1QueryDelegatorDelegationsResponse(
    typeUrl: '/cosmos.staking.v1beta1.QueryDelegatorDelegationsResponse',
  ),
  cosmosStakingV1beta1QueryDelegatorUnbondingDelegationsRequest(
    typeUrl:
        '/cosmos.staking.v1beta1.QueryDelegatorUnbondingDelegationsRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/DelegatorUnbondingDelegations",
  ),
  cosmosStakingV1beta1QueryDelegatorUnbondingDelegationsResponse(
    typeUrl:
        '/cosmos.staking.v1beta1.QueryDelegatorUnbondingDelegationsResponse',
  ),
  cosmosStakingV1beta1QueryRedelegationsRequest(
    typeUrl: '/cosmos.staking.v1beta1.QueryRedelegationsRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/Redelegations",
  ),
  cosmosStakingV1beta1QueryRedelegationsResponse(
    typeUrl: '/cosmos.staking.v1beta1.QueryRedelegationsResponse',
  ),
  cosmosStakingV1beta1QueryDelegatorValidatorsRequest(
    typeUrl: '/cosmos.staking.v1beta1.QueryDelegatorValidatorsRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/DelegatorValidators",
  ),
  cosmosStakingV1beta1QueryDelegatorValidatorsResponse(
    typeUrl: '/cosmos.staking.v1beta1.QueryDelegatorValidatorsResponse',
  ),
  cosmosStakingV1beta1QueryDelegatorValidatorRequest(
    typeUrl: '/cosmos.staking.v1beta1.QueryDelegatorValidatorRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/DelegatorValidator",
  ),
  cosmosStakingV1beta1QueryDelegatorValidatorResponse(
    typeUrl: '/cosmos.staking.v1beta1.QueryDelegatorValidatorResponse',
  ),
  cosmosStakingV1beta1QueryHistoricalInfoRequest(
    typeUrl: '/cosmos.staking.v1beta1.QueryHistoricalInfoRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/HistoricalInfo",
  ),
  cosmosStakingV1beta1QueryHistoricalInfoResponse(
    typeUrl: '/cosmos.staking.v1beta1.QueryHistoricalInfoResponse',
  ),
  cosmosStakingV1beta1QueryPoolRequest(
    typeUrl: '/cosmos.staking.v1beta1.QueryPoolRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/Pool",
  ),
  cosmosStakingV1beta1QueryPoolResponse(
    typeUrl: '/cosmos.staking.v1beta1.QueryPoolResponse',
  ),
  cosmosStakingV1beta1QueryParamsRequest(
    typeUrl: '/cosmos.staking.v1beta1.QueryParamsRequest',
    serviceUrl: "/cosmos.staking.v1beta1.Query/Params",
  ),
  cosmosStakingV1beta1QueryParamsResponse(
    typeUrl: '/cosmos.staking.v1beta1.QueryParamsResponse',
  ),
  cosmosStakingV1beta1HistoricalInfo(
    typeUrl: '/cosmos.staking.v1beta1.HistoricalInfo',
  ),
  cosmosStakingV1beta1CommissionRates(
    typeUrl: '/cosmos.staking.v1beta1.CommissionRates',
  ),
  cosmosStakingV1beta1Commission(typeUrl: '/cosmos.staking.v1beta1.Commission'),
  cosmosStakingV1beta1Description(
    typeUrl: '/cosmos.staking.v1beta1.Description',
  ),
  cosmosStakingV1beta1Validator(typeUrl: '/cosmos.staking.v1beta1.Validator'),
  cosmosStakingV1beta1Delegation(typeUrl: '/cosmos.staking.v1beta1.Delegation'),
  cosmosStakingV1beta1UnbondingDelegation(
    typeUrl: '/cosmos.staking.v1beta1.UnbondingDelegation',
  ),
  cosmosStakingV1beta1UnbondingDelegationEntry(
    typeUrl: '/cosmos.staking.v1beta1.UnbondingDelegationEntry',
  ),
  cosmosStakingV1beta1RedelegationEntry(
    typeUrl: '/cosmos.staking.v1beta1.RedelegationEntry',
  ),
  cosmosStakingV1beta1Redelegation(
    typeUrl: '/cosmos.staking.v1beta1.Redelegation',
  ),
  cosmosStakingV1beta1Params(
    typeUrl: '/cosmos.staking.v1beta1.Params',
    aminoType: "cosmos-sdk/x/staking/Params",
  ),
  cosmosStakingV1beta1DelegationResponse(
    typeUrl: '/cosmos.staking.v1beta1.DelegationResponse',
  ),
  cosmosStakingV1beta1RedelegationEntryResponse(
    typeUrl: '/cosmos.staking.v1beta1.RedelegationEntryResponse',
  ),
  cosmosStakingV1beta1RedelegationResponse(
    typeUrl: '/cosmos.staking.v1beta1.RedelegationResponse',
  ),
  cosmosStakingV1beta1Pool(typeUrl: '/cosmos.staking.v1beta1.Pool'),
  cosmosStakingV1beta1MsgCreateValidator(
    typeUrl: '/cosmos.staking.v1beta1.MsgCreateValidator',
    serviceUrl: "/cosmos.staking.v1beta1.Msg/CreateValidator",
    aminoType: "cosmos-sdk/MsgCreateValidator",
  ),
  cosmosStakingV1beta1MsgCreateValidatorResponse(
    typeUrl: '/cosmos.staking.v1beta1.MsgCreateValidatorResponse',
  ),
  cosmosStakingV1beta1MsgEditValidator(
    typeUrl: '/cosmos.staking.v1beta1.MsgEditValidator',
    serviceUrl: "/cosmos.staking.v1beta1.Msg/EditValidator",
    aminoType: "cosmos-sdk/MsgEditValidator",
  ),
  cosmosStakingV1beta1MsgEditValidatorResponse(
    typeUrl: '/cosmos.staking.v1beta1.MsgEditValidatorResponse',
  ),
  cosmosStakingV1beta1MsgDelegate(
    typeUrl: '/cosmos.staking.v1beta1.MsgDelegate',
    serviceUrl: "/cosmos.staking.v1beta1.Msg/Delegate",
    aminoType: "cosmos-sdk/MsgDelegate",
  ),
  cosmosStakingV1beta1MsgDelegateResponse(
    typeUrl: '/cosmos.staking.v1beta1.MsgDelegateResponse',
  ),
  cosmosStakingV1beta1MsgBeginRedelegate(
    typeUrl: '/cosmos.staking.v1beta1.MsgBeginRedelegate',
    serviceUrl: "/cosmos.staking.v1beta1.Msg/BeginRedelegate",
    aminoType: "cosmos-sdk/MsgBeginRedelegate",
  ),
  cosmosStakingV1beta1MsgBeginRedelegateResponse(
    typeUrl: '/cosmos.staking.v1beta1.MsgBeginRedelegateResponse',
  ),
  cosmosStakingV1beta1MsgUndelegate(
    typeUrl: '/cosmos.staking.v1beta1.MsgUndelegate',
    serviceUrl: "/cosmos.staking.v1beta1.Msg/Undelegate",
    aminoType: "cosmos-sdk/MsgUndelegate",
  ),
  cosmosStakingV1beta1MsgUndelegateResponse(
    typeUrl: '/cosmos.staking.v1beta1.MsgUndelegateResponse',
  ),
  cosmosStakingV1beta1MsgCancelUnbondingDelegation(
    typeUrl: '/cosmos.staking.v1beta1.MsgCancelUnbondingDelegation',
    serviceUrl: "/cosmos.staking.v1beta1.Msg/CancelUnbondingDelegation",
    aminoType: "cosmos-sdk/MsgCancelUnbondingDelegation",
  ),
  cosmosStakingV1beta1MsgCancelUnbondingDelegationResponse(
    typeUrl: '/cosmos.staking.v1beta1.MsgCancelUnbondingDelegationResponse',
  ),
  cosmosStakingV1beta1MsgUpdateParams(
    typeUrl: '/cosmos.staking.v1beta1.MsgUpdateParams',
    serviceUrl: "/cosmos.staking.v1beta1.Msg/UpdateParams",
    aminoType: "cosmos-sdk/x/staking/MsgUpdateParams",
  ),
  cosmosStakingV1beta1MsgUpdateParamsResponse(
    typeUrl: '/cosmos.staking.v1beta1.MsgUpdateParamsResponse',
  ),
  cosmosBankV1beta1QueryBalanceRequest(
    typeUrl: '/cosmos.bank.v1beta1.QueryBalanceRequest',
    serviceUrl: "/cosmos.bank.v1beta1.Query/Balance",
  ),
  cosmosBankV1beta1QueryBalanceResponse(
    typeUrl: '/cosmos.bank.v1beta1.QueryBalanceResponse',
  ),
  cosmosBankV1beta1QueryAllBalancesRequest(
    typeUrl: '/cosmos.bank.v1beta1.QueryAllBalancesRequest',
    serviceUrl: "/cosmos.bank.v1beta1.Query/AllBalances",
  ),
  cosmosBankV1beta1QueryAllBalancesResponse(
    typeUrl: '/cosmos.bank.v1beta1.QueryAllBalancesResponse',
  ),
  cosmosBankV1beta1QuerySpendableBalancesRequest(
    typeUrl: '/cosmos.bank.v1beta1.QuerySpendableBalancesRequest',
    serviceUrl: "/cosmos.bank.v1beta1.Query/SpendableBalances",
  ),
  cosmosBankV1beta1QuerySpendableBalancesResponse(
    typeUrl: '/cosmos.bank.v1beta1.QuerySpendableBalancesResponse',
  ),
  cosmosBankV1beta1QuerySpendableBalanceByDenomRequest(
    typeUrl: '/cosmos.bank.v1beta1.QuerySpendableBalanceByDenomRequest',
    serviceUrl: "/cosmos.bank.v1beta1.Query/SpendableBalanceByDenom",
  ),
  cosmosBankV1beta1QuerySpendableBalanceByDenomResponse(
    typeUrl: '/cosmos.bank.v1beta1.QuerySpendableBalanceByDenomResponse',
  ),
  cosmosBankV1beta1QueryTotalSupplyRequest(
    typeUrl: '/cosmos.bank.v1beta1.QueryTotalSupplyRequest',
    serviceUrl: "/cosmos.bank.v1beta1.Query/TotalSupply",
  ),
  cosmosBankV1beta1QueryTotalSupplyResponse(
    typeUrl: '/cosmos.bank.v1beta1.QueryTotalSupplyResponse',
  ),
  cosmosBankV1beta1QuerySupplyOfRequest(
    typeUrl: '/cosmos.bank.v1beta1.QuerySupplyOfRequest',
    serviceUrl: "/cosmos.bank.v1beta1.Query/SupplyOf",
  ),
  cosmosBankV1beta1QuerySupplyOfResponse(
    typeUrl: '/cosmos.bank.v1beta1.QuerySupplyOfResponse',
  ),
  cosmosBankV1beta1QueryParamsRequest(
    typeUrl: '/cosmos.bank.v1beta1.QueryParamsRequest',
    serviceUrl: "/cosmos.bank.v1beta1.Query/Params",
  ),
  cosmosBankV1beta1QueryParamsResponse(
    typeUrl: '/cosmos.bank.v1beta1.QueryParamsResponse',
  ),
  cosmosBankV1beta1QueryDenomsMetadataRequest(
    typeUrl: '/cosmos.bank.v1beta1.QueryDenomsMetadataRequest',
    serviceUrl: "/cosmos.bank.v1beta1.Query/DenomsMetadata",
  ),
  cosmosBankV1beta1QueryDenomsMetadataResponse(
    typeUrl: '/cosmos.bank.v1beta1.QueryDenomsMetadataResponse',
  ),
  cosmosBankV1beta1QueryDenomMetadataRequest(
    typeUrl: '/cosmos.bank.v1beta1.QueryDenomMetadataRequest',
    serviceUrl: "/cosmos.bank.v1beta1.Query/DenomMetadata",
  ),
  cosmosBankV1beta1QueryDenomMetadataResponse(
    typeUrl: '/cosmos.bank.v1beta1.QueryDenomMetadataResponse',
  ),
  cosmosBankV1beta1QueryDenomMetadataByQueryStringRequest(
    typeUrl: '/cosmos.bank.v1beta1.QueryDenomMetadataByQueryStringRequest',
    serviceUrl: "/cosmos.bank.v1beta1.Query/DenomMetadataByQueryString",
  ),
  cosmosBankV1beta1QueryDenomMetadataByQueryStringResponse(
    typeUrl: '/cosmos.bank.v1beta1.QueryDenomMetadataByQueryStringResponse',
  ),
  cosmosBankV1beta1QueryDenomOwnersRequest(
    typeUrl: '/cosmos.bank.v1beta1.QueryDenomOwnersRequest',
    serviceUrl: "/cosmos.bank.v1beta1.Query/DenomOwners",
  ),
  cosmosBankV1beta1DenomOwner(typeUrl: '/cosmos.bank.v1beta1.DenomOwner'),
  cosmosBankV1beta1QueryDenomOwnersResponse(
    typeUrl: '/cosmos.bank.v1beta1.QueryDenomOwnersResponse',
  ),
  cosmosBankV1beta1QueryDenomOwnersByQueryRequest(
    typeUrl: '/cosmos.bank.v1beta1.QueryDenomOwnersByQueryRequest',
    serviceUrl: "/cosmos.bank.v1beta1.Query/DenomOwnersByQuery",
  ),
  cosmosBankV1beta1QueryDenomOwnersByQueryResponse(
    typeUrl: '/cosmos.bank.v1beta1.QueryDenomOwnersByQueryResponse',
  ),
  cosmosBankV1beta1QuerySendEnabledRequest(
    typeUrl: '/cosmos.bank.v1beta1.QuerySendEnabledRequest',
    serviceUrl: "/cosmos.bank.v1beta1.Query/SendEnabled",
  ),
  cosmosBankV1beta1QuerySendEnabledResponse(
    typeUrl: '/cosmos.bank.v1beta1.QuerySendEnabledResponse',
  ),
  cosmosBankV1beta1Params(
    typeUrl: '/cosmos.bank.v1beta1.Params',
    aminoType: "cosmos-sdk/x/bank/Params",
  ),
  cosmosBankV1beta1SendEnabled(typeUrl: '/cosmos.bank.v1beta1.SendEnabled'),
  cosmosBankV1beta1Input(typeUrl: '/cosmos.bank.v1beta1.Input'),
  cosmosBankV1beta1Output(typeUrl: '/cosmos.bank.v1beta1.Output'),
  cosmosBankV1beta1DenomUnit(typeUrl: '/cosmos.bank.v1beta1.DenomUnit'),
  cosmosBankV1beta1Metadata(typeUrl: '/cosmos.bank.v1beta1.Metadata'),
  cosmosBankV1beta1MsgSend(
    typeUrl: '/cosmos.bank.v1beta1.MsgSend',
    serviceUrl: "/cosmos.bank.v1beta1.Msg/Send",
    aminoType: "cosmos-sdk/MsgSend",
  ),
  cosmosBankV1beta1MsgSendResponse(
    typeUrl: '/cosmos.bank.v1beta1.MsgSendResponse',
  ),
  cosmosBankV1beta1MsgMultiSend(
    typeUrl: '/cosmos.bank.v1beta1.MsgMultiSend',
    serviceUrl: "/cosmos.bank.v1beta1.Msg/MultiSend",
    aminoType: "cosmos-sdk/MsgMultiSend",
  ),
  cosmosBankV1beta1MsgMultiSendResponse(
    typeUrl: '/cosmos.bank.v1beta1.MsgMultiSendResponse',
  ),
  cosmosBankV1beta1MsgUpdateParams(
    typeUrl: '/cosmos.bank.v1beta1.MsgUpdateParams',
    serviceUrl: "/cosmos.bank.v1beta1.Msg/UpdateParams",
    aminoType: "cosmos-sdk/x/bank/MsgUpdateParams",
  ),
  cosmosBankV1beta1MsgUpdateParamsResponse(
    typeUrl: '/cosmos.bank.v1beta1.MsgUpdateParamsResponse',
  ),
  cosmosBankV1beta1MsgSetSendEnabled(
    typeUrl: '/cosmos.bank.v1beta1.MsgSetSendEnabled',
    serviceUrl: "/cosmos.bank.v1beta1.Msg/SetSendEnabled",
    aminoType: "cosmos-sdk/MsgSetSendEnabled",
  ),
  cosmosBankV1beta1MsgSetSendEnabledResponse(
    typeUrl: '/cosmos.bank.v1beta1.MsgSetSendEnabledResponse',
  ),
  cosmosCryptoBls12381PubKey(
    typeUrl: '/cosmos.crypto.bls12_381.PubKey',
    aminoType: "cometbft/PubKeyBls12_381",
  ),
  cosmosCryptoBls12381PrivKey(
    typeUrl: '/cosmos.crypto.bls12_381.PrivKey',
    aminoType: "cometbft/PrivKeyBls12_381",
  ),
  cosmosCryptoEd25519PubKey(
    typeUrl: '/cosmos.crypto.ed25519.PubKey',
    aminoType: "tendermint/PubKeyEd25519",
  ),
  cosmosCryptoEd25519PrivKey(
    typeUrl: '/cosmos.crypto.ed25519.PrivKey',
    aminoType: "tendermint/PrivKeyEd25519",
  ),
  cosmosCryptoKeyringV1Record(typeUrl: '/cosmos.crypto.keyring.v1.Record'),
  cosmosCryptoKeyringV1RecordLocal(
    typeUrl: '/cosmos.crypto.keyring.v1.Record.Local',
  ),
  cosmosCryptoKeyringV1RecordLedger(
    typeUrl: '/cosmos.crypto.keyring.v1.Record.Ledger',
  ),
  cosmosCryptoKeyringV1RecordMulti(
    typeUrl: '/cosmos.crypto.keyring.v1.Record.Multi',
  ),
  cosmosCryptoKeyringV1RecordOffline(
    typeUrl: '/cosmos.crypto.keyring.v1.Record.Offline',
  ),
  cosmosCryptoSecp256r1PubKey(typeUrl: '/cosmos.crypto.secp256r1.PubKey'),
  cosmosCryptoSecp256r1PrivKey(typeUrl: '/cosmos.crypto.secp256r1.PrivKey'),
  cosmosCryptoSecp256k1PubKey(
    typeUrl: '/cosmos.crypto.secp256k1.PubKey',
    aminoType: "tendermint/PubKeySecp256k1",
  ),
  cosmosCryptoSecp256k1PrivKey(
    typeUrl: '/cosmos.crypto.secp256k1.PrivKey',
    aminoType: "tendermint/PrivKeySecp256k1",
  ),
  cosmosCryptoMultisigLegacyAminoPubKey(
    typeUrl: '/cosmos.crypto.multisig.LegacyAminoPubKey',
    aminoType: "tendermint/PubKeyMultisigThreshold",
  ),
  cosmosCryptoMultisigV1beta1MultiSignature(
    typeUrl: '/cosmos.crypto.multisig.v1beta1.MultiSignature',
  ),
  cosmosCryptoMultisigV1beta1CompactBitArray(
    typeUrl: '/cosmos.crypto.multisig.v1beta1.CompactBitArray',
  ),
  cosmosCryptoHdV1BIP44Params(
    typeUrl: '/cosmos.crypto.hd.v1.BIP44Params',
    aminoType: "crypto/keys/hd/BIP44Params",
  ),
  cosmosAuthV1beta1QueryAccountsRequest(
    typeUrl: '/cosmos.auth.v1beta1.QueryAccountsRequest',
    serviceUrl: "/cosmos.auth.v1beta1.Query/Accounts",
  ),
  cosmosAuthV1beta1QueryAccountsResponse(
    typeUrl: '/cosmos.auth.v1beta1.QueryAccountsResponse',
  ),
  cosmosAuthV1beta1QueryAccountRequest(
    typeUrl: '/cosmos.auth.v1beta1.QueryAccountRequest',
    serviceUrl: "/cosmos.auth.v1beta1.Query/Account",
  ),
  cosmosAuthV1beta1QueryAccountResponse(
    typeUrl: '/cosmos.auth.v1beta1.QueryAccountResponse',
  ),
  cosmosAuthV1beta1QueryParamsRequest(
    typeUrl: '/cosmos.auth.v1beta1.QueryParamsRequest',
    serviceUrl: "/cosmos.auth.v1beta1.Query/Params",
  ),
  cosmosAuthV1beta1QueryParamsResponse(
    typeUrl: '/cosmos.auth.v1beta1.QueryParamsResponse',
  ),
  cosmosAuthV1beta1QueryModuleAccountsRequest(
    typeUrl: '/cosmos.auth.v1beta1.QueryModuleAccountsRequest',
    serviceUrl: "/cosmos.auth.v1beta1.Query/ModuleAccounts",
  ),
  cosmosAuthV1beta1QueryModuleAccountsResponse(
    typeUrl: '/cosmos.auth.v1beta1.QueryModuleAccountsResponse',
  ),
  cosmosAuthV1beta1QueryModuleAccountByNameRequest(
    typeUrl: '/cosmos.auth.v1beta1.QueryModuleAccountByNameRequest',
    serviceUrl: "/cosmos.auth.v1beta1.Query/ModuleAccountByName",
  ),
  cosmosAuthV1beta1QueryModuleAccountByNameResponse(
    typeUrl: '/cosmos.auth.v1beta1.QueryModuleAccountByNameResponse',
  ),
  cosmosAuthV1beta1Bech32PrefixRequest(
    typeUrl: '/cosmos.auth.v1beta1.Bech32PrefixRequest',
    serviceUrl: "/cosmos.auth.v1beta1.Query/Bech32Prefix",
  ),
  cosmosAuthV1beta1Bech32PrefixResponse(
    typeUrl: '/cosmos.auth.v1beta1.Bech32PrefixResponse',
  ),
  cosmosAuthV1beta1AddressBytesToStringRequest(
    typeUrl: '/cosmos.auth.v1beta1.AddressBytesToStringRequest',
    serviceUrl: "/cosmos.auth.v1beta1.Query/AddressBytesToString",
  ),
  cosmosAuthV1beta1AddressBytesToStringResponse(
    typeUrl: '/cosmos.auth.v1beta1.AddressBytesToStringResponse',
  ),
  cosmosAuthV1beta1AddressStringToBytesRequest(
    typeUrl: '/cosmos.auth.v1beta1.AddressStringToBytesRequest',
    serviceUrl: "/cosmos.auth.v1beta1.Query/AddressStringToBytes",
  ),
  cosmosAuthV1beta1AddressStringToBytesResponse(
    typeUrl: '/cosmos.auth.v1beta1.AddressStringToBytesResponse',
  ),
  cosmosAuthV1beta1QueryAccountAddressByIDRequest(
    typeUrl: '/cosmos.auth.v1beta1.QueryAccountAddressByIDRequest',
    serviceUrl: "/cosmos.auth.v1beta1.Query/AccountAddressByID",
  ),
  cosmosAuthV1beta1QueryAccountAddressByIDResponse(
    typeUrl: '/cosmos.auth.v1beta1.QueryAccountAddressByIDResponse',
  ),
  cosmosAuthV1beta1QueryAccountInfoRequest(
    typeUrl: '/cosmos.auth.v1beta1.QueryAccountInfoRequest',
    serviceUrl: "/cosmos.auth.v1beta1.Query/AccountInfo",
  ),
  cosmosAuthV1beta1QueryAccountInfoResponse(
    typeUrl: '/cosmos.auth.v1beta1.QueryAccountInfoResponse',
  ),
  cosmosAuthV1beta1MsgUpdateParams(
    typeUrl: '/cosmos.auth.v1beta1.MsgUpdateParams',
    serviceUrl: "/cosmos.auth.v1beta1.Msg/UpdateParams",
    aminoType: "cosmos-sdk/x/auth/MsgUpdateParams",
  ),
  cosmosAuthV1beta1MsgUpdateParamsResponse(
    typeUrl: '/cosmos.auth.v1beta1.MsgUpdateParamsResponse',
  ),
  cosmosAuthV1beta1BaseAccount(
    typeUrl: '/cosmos.auth.v1beta1.BaseAccount',
    aminoType: "cosmos-sdk/BaseAccount",
  ),
  cosmosAuthV1beta1Params(
    typeUrl: '/cosmos.auth.v1beta1.Params',
    aminoType: "cosmos-sdk/x/auth/Params",
  ),
  cosmosEpochsV1beta1QueryEpochInfosRequest(
    typeUrl: '/cosmos.epochs.v1beta1.QueryEpochInfosRequest',
    serviceUrl: "/cosmos.epochs.v1beta1.Query/EpochInfos",
  ),
  cosmosEpochsV1beta1QueryEpochInfosResponse(
    typeUrl: '/cosmos.epochs.v1beta1.QueryEpochInfosResponse',
  ),
  cosmosEpochsV1beta1QueryCurrentEpochRequest(
    typeUrl: '/cosmos.epochs.v1beta1.QueryCurrentEpochRequest',
    serviceUrl: "/cosmos.epochs.v1beta1.Query/CurrentEpoch",
  ),
  cosmosEpochsV1beta1QueryCurrentEpochResponse(
    typeUrl: '/cosmos.epochs.v1beta1.QueryCurrentEpochResponse',
  ),
  cosmosEpochsV1beta1EpochInfo(typeUrl: '/cosmos.epochs.v1beta1.EpochInfo'),
  opinitOphostV1QueryBridgeRequest(
    typeUrl: '/opinit.ophost.v1.QueryBridgeRequest',
    serviceUrl: "/opinit.ophost.v1.Query/Bridge",
  ),
  opinitOphostV1QueryBridgeResponse(
    typeUrl: '/opinit.ophost.v1.QueryBridgeResponse',
  ),
  opinitOphostV1QueryBridgesRequest(
    typeUrl: '/opinit.ophost.v1.QueryBridgesRequest',
    serviceUrl: "/opinit.ophost.v1.Query/Bridges",
  ),
  opinitOphostV1QueryBridgesResponse(
    typeUrl: '/opinit.ophost.v1.QueryBridgesResponse',
  ),
  opinitOphostV1QueryTokenPairByL1DenomRequest(
    typeUrl: '/opinit.ophost.v1.QueryTokenPairByL1DenomRequest',
    serviceUrl: "/opinit.ophost.v1.Query/TokenPairByL1Denom",
  ),
  opinitOphostV1QueryTokenPairByL1DenomResponse(
    typeUrl: '/opinit.ophost.v1.QueryTokenPairByL1DenomResponse',
  ),
  opinitOphostV1QueryTokenPairByL2DenomRequest(
    typeUrl: '/opinit.ophost.v1.QueryTokenPairByL2DenomRequest',
    serviceUrl: "/opinit.ophost.v1.Query/TokenPairByL2Denom",
  ),
  opinitOphostV1QueryTokenPairByL2DenomResponse(
    typeUrl: '/opinit.ophost.v1.QueryTokenPairByL2DenomResponse',
  ),
  opinitOphostV1QueryTokenPairsRequest(
    typeUrl: '/opinit.ophost.v1.QueryTokenPairsRequest',
    serviceUrl: "/opinit.ophost.v1.Query/TokenPairs",
  ),
  opinitOphostV1QueryTokenPairsResponse(
    typeUrl: '/opinit.ophost.v1.QueryTokenPairsResponse',
  ),
  opinitOphostV1QueryLastFinalizedOutputRequest(
    typeUrl: '/opinit.ophost.v1.QueryLastFinalizedOutputRequest',
    serviceUrl: "/opinit.ophost.v1.Query/LastFinalizedOutput",
  ),
  opinitOphostV1QueryLastFinalizedOutputResponse(
    typeUrl: '/opinit.ophost.v1.QueryLastFinalizedOutputResponse',
  ),
  opinitOphostV1QueryOutputProposalRequest(
    typeUrl: '/opinit.ophost.v1.QueryOutputProposalRequest',
    serviceUrl: "/opinit.ophost.v1.Query/OutputProposal",
  ),
  opinitOphostV1QueryOutputProposalResponse(
    typeUrl: '/opinit.ophost.v1.QueryOutputProposalResponse',
  ),
  opinitOphostV1QueryOutputProposalsRequest(
    typeUrl: '/opinit.ophost.v1.QueryOutputProposalsRequest',
    serviceUrl: "/opinit.ophost.v1.Query/OutputProposals",
  ),
  opinitOphostV1QueryOutputProposalsResponse(
    typeUrl: '/opinit.ophost.v1.QueryOutputProposalsResponse',
  ),
  opinitOphostV1QueryParamsRequest(
    typeUrl: '/opinit.ophost.v1.QueryParamsRequest',
    serviceUrl: "/opinit.ophost.v1.Query/Params",
  ),
  opinitOphostV1QueryParamsResponse(
    typeUrl: '/opinit.ophost.v1.QueryParamsResponse',
  ),
  opinitOphostV1QueryClaimedRequest(
    typeUrl: '/opinit.ophost.v1.QueryClaimedRequest',
    serviceUrl: "/opinit.ophost.v1.Query/Claimed",
  ),
  opinitOphostV1QueryClaimedResponse(
    typeUrl: '/opinit.ophost.v1.QueryClaimedResponse',
  ),
  opinitOphostV1QueryNextL1SequenceRequest(
    typeUrl: '/opinit.ophost.v1.QueryNextL1SequenceRequest',
    serviceUrl: "/opinit.ophost.v1.Query/NextL1Sequence",
  ),
  opinitOphostV1QueryNextL1SequenceResponse(
    typeUrl: '/opinit.ophost.v1.QueryNextL1SequenceResponse',
  ),
  opinitOphostV1QueryBatchInfosRequest(
    typeUrl: '/opinit.ophost.v1.QueryBatchInfosRequest',
    serviceUrl: "/opinit.ophost.v1.Query/BatchInfos",
  ),
  opinitOphostV1QueryBatchInfosResponse(
    typeUrl: '/opinit.ophost.v1.QueryBatchInfosResponse',
  ),
  opinitOphostV1QueryMigrationInfoRequest(
    typeUrl: '/opinit.ophost.v1.QueryMigrationInfoRequest',
    serviceUrl: "/opinit.ophost.v1.Query/MigrationInfo",
  ),
  opinitOphostV1QueryMigrationInfoResponse(
    typeUrl: '/opinit.ophost.v1.QueryMigrationInfoResponse',
  ),
  opinitOphostV1QueryOraclePriceHashRequest(
    typeUrl: '/opinit.ophost.v1.QueryOraclePriceHashRequest',
    serviceUrl: "/opinit.ophost.v1.Query/OraclePriceHash",
  ),
  opinitOphostV1QueryOraclePriceHashResponse(
    typeUrl: '/opinit.ophost.v1.QueryOraclePriceHashResponse',
  ),
  opinitOphostV1Params(
    typeUrl: '/opinit.ophost.v1.Params',
    aminoType: "ophost/Params",
  ),
  opinitOphostV1BridgeConfig(typeUrl: '/opinit.ophost.v1.BridgeConfig'),
  opinitOphostV1BatchInfo(typeUrl: '/opinit.ophost.v1.BatchInfo'),
  opinitOphostV1TokenPair(typeUrl: '/opinit.ophost.v1.TokenPair'),
  opinitOphostV1Output(typeUrl: '/opinit.ophost.v1.Output'),
  opinitOphostV1BatchInfoWithOutput(
    typeUrl: '/opinit.ophost.v1.BatchInfoWithOutput',
  ),
  opinitOphostV1MigrationInfo(typeUrl: '/opinit.ophost.v1.MigrationInfo'),
  opinitOphostV1Attestor(
    typeUrl: '/opinit.ophost.v1.Attestor',
    aminoType: "ophost/Attestor",
  ),
  opinitOphostV1OraclePriceHash(typeUrl: '/opinit.ophost.v1.OraclePriceHash'),
  opinitOphostV1MsgRecordBatch(
    typeUrl: '/opinit.ophost.v1.MsgRecordBatch',
    serviceUrl: "/opinit.ophost.v1.Msg/RecordBatch",
    aminoType: "ophost/MsgRecordBatch",
  ),
  opinitOphostV1MsgRecordBatchResponse(
    typeUrl: '/opinit.ophost.v1.MsgRecordBatchResponse',
  ),
  opinitOphostV1MsgCreateBridge(
    typeUrl: '/opinit.ophost.v1.MsgCreateBridge',
    serviceUrl: "/opinit.ophost.v1.Msg/CreateBridge",
    aminoType: "ophost/MsgCreateBridge",
  ),
  opinitOphostV1MsgCreateBridgeResponse(
    typeUrl: '/opinit.ophost.v1.MsgCreateBridgeResponse',
  ),
  opinitOphostV1MsgProposeOutput(
    typeUrl: '/opinit.ophost.v1.MsgProposeOutput',
    serviceUrl: "/opinit.ophost.v1.Msg/ProposeOutput",
    aminoType: "ophost/MsgProposeOutput",
  ),
  opinitOphostV1MsgProposeOutputResponse(
    typeUrl: '/opinit.ophost.v1.MsgProposeOutputResponse',
  ),
  opinitOphostV1MsgDeleteOutput(
    typeUrl: '/opinit.ophost.v1.MsgDeleteOutput',
    serviceUrl: "/opinit.ophost.v1.Msg/DeleteOutput",
    aminoType: "ophost/MsgDeleteOutput",
  ),
  opinitOphostV1MsgDeleteOutputResponse(
    typeUrl: '/opinit.ophost.v1.MsgDeleteOutputResponse',
  ),
  opinitOphostV1MsgInitiateTokenDeposit(
    typeUrl: '/opinit.ophost.v1.MsgInitiateTokenDeposit',
    serviceUrl: "/opinit.ophost.v1.Msg/InitiateTokenDeposit",
    aminoType: "ophost/MsgInitiateTokenDeposit",
  ),
  opinitOphostV1MsgInitiateTokenDepositResponse(
    typeUrl: '/opinit.ophost.v1.MsgInitiateTokenDepositResponse',
  ),
  opinitOphostV1MsgFinalizeTokenWithdrawal(
    typeUrl: '/opinit.ophost.v1.MsgFinalizeTokenWithdrawal',
    serviceUrl: "/opinit.ophost.v1.Msg/FinalizeTokenWithdrawal",
    aminoType: "ophost/MsgFinalizeTokenWithdrawal",
  ),
  opinitOphostV1MsgFinalizeTokenWithdrawalResponse(
    typeUrl: '/opinit.ophost.v1.MsgFinalizeTokenWithdrawalResponse',
  ),
  opinitOphostV1MsgUpdateProposer(
    typeUrl: '/opinit.ophost.v1.MsgUpdateProposer',
    serviceUrl: "/opinit.ophost.v1.Msg/UpdateProposer",
    aminoType: "ophost/MsgUpdateProposer",
  ),
  opinitOphostV1MsgUpdateProposerResponse(
    typeUrl: '/opinit.ophost.v1.MsgUpdateProposerResponse',
  ),
  opinitOphostV1MsgUpdateChallenger(
    typeUrl: '/opinit.ophost.v1.MsgUpdateChallenger',
    serviceUrl: "/opinit.ophost.v1.Msg/UpdateChallenger",
    aminoType: "ophost/MsgUpdateChallenger",
  ),
  opinitOphostV1MsgUpdateChallengerResponse(
    typeUrl: '/opinit.ophost.v1.MsgUpdateChallengerResponse',
  ),
  opinitOphostV1MsgUpdateBatchInfo(
    typeUrl: '/opinit.ophost.v1.MsgUpdateBatchInfo',
    serviceUrl: "/opinit.ophost.v1.Msg/UpdateBatchInfo",
    aminoType: "ophost/MsgUpdateBatchInfo",
  ),
  opinitOphostV1MsgUpdateBatchInfoResponse(
    typeUrl: '/opinit.ophost.v1.MsgUpdateBatchInfoResponse',
  ),
  opinitOphostV1MsgUpdateOracleConfig(
    typeUrl: '/opinit.ophost.v1.MsgUpdateOracleConfig',
    serviceUrl: "/opinit.ophost.v1.Msg/UpdateOracleConfig",
    aminoType: "ophost/MsgUpdateOracleConfig",
  ),
  opinitOphostV1MsgUpdateOracleConfigResponse(
    typeUrl: '/opinit.ophost.v1.MsgUpdateOracleConfigResponse',
  ),
  opinitOphostV1MsgUpdateChannelId(
    typeUrl: '/opinit.ophost.v1.MsgUpdateChannelId',
    serviceUrl: "/opinit.ophost.v1.Msg/UpdateChannelId",
    aminoType: "ophost/MsgUpdateChannelId",
  ),
  opinitOphostV1MsgUpdateChannelIdResponse(
    typeUrl: '/opinit.ophost.v1.MsgUpdateChannelIdResponse',
  ),
  opinitOphostV1MsgUpdateMetadata(
    typeUrl: '/opinit.ophost.v1.MsgUpdateMetadata',
    serviceUrl: "/opinit.ophost.v1.Msg/UpdateMetadata",
    aminoType: "ophost/MsgUpdateMetadata",
  ),
  opinitOphostV1MsgUpdateMetadataResponse(
    typeUrl: '/opinit.ophost.v1.MsgUpdateMetadataResponse',
  ),
  opinitOphostV1MsgUpdateParams(
    typeUrl: '/opinit.ophost.v1.MsgUpdateParams',
    serviceUrl: "/opinit.ophost.v1.Msg/UpdateParams",
    aminoType: "ophost/MsgUpdateParams",
  ),
  opinitOphostV1MsgUpdateParamsResponse(
    typeUrl: '/opinit.ophost.v1.MsgUpdateParamsResponse',
  ),
  opinitOphostV1MsgUpdateFinalizationPeriod(
    typeUrl: '/opinit.ophost.v1.MsgUpdateFinalizationPeriod',
    serviceUrl: "/opinit.ophost.v1.Msg/UpdateFinalizationPeriod",
    aminoType: "ophost/MsgUpdateFinalizationPeriod",
  ),
  opinitOphostV1MsgUpdateFinalizationPeriodResponse(
    typeUrl: '/opinit.ophost.v1.MsgUpdateFinalizationPeriodResponse',
  ),
  opinitOphostV1MsgDisableBridge(
    typeUrl: '/opinit.ophost.v1.MsgDisableBridge',
    serviceUrl: "/opinit.ophost.v1.Msg/DisableBridge",
    aminoType: "ophost/MsgDisableBridge",
  ),
  opinitOphostV1MsgDisableBridgeResponse(
    typeUrl: '/opinit.ophost.v1.MsgDisableBridgeResponse',
  ),
  opinitOphostV1MsgRegisterAttestorSet(
    typeUrl: '/opinit.ophost.v1.MsgRegisterAttestorSet',
    serviceUrl: "/opinit.ophost.v1.Msg/RegisterAttestorSet",
    aminoType: "ophost/MsgRegisterAttestorSet",
  ),
  opinitOphostV1MsgRegisterAttestorSetResponse(
    typeUrl: '/opinit.ophost.v1.MsgRegisterAttestorSetResponse',
  ),
  opinitOphostV1MsgAddAttestor(
    typeUrl: '/opinit.ophost.v1.MsgAddAttestor',
    serviceUrl: "/opinit.ophost.v1.Msg/AddAttestor",
    aminoType: "ophost/MsgAddAttestor",
  ),
  opinitOphostV1MsgAddAttestorResponse(
    typeUrl: '/opinit.ophost.v1.MsgAddAttestorResponse',
  ),
  opinitOphostV1MsgRemoveAttestor(
    typeUrl: '/opinit.ophost.v1.MsgRemoveAttestor',
    serviceUrl: "/opinit.ophost.v1.Msg/RemoveAttestor",
    aminoType: "ophost/MsgRemoveAttestor",
  ),
  opinitOphostV1MsgRemoveAttestorResponse(
    typeUrl: '/opinit.ophost.v1.MsgRemoveAttestorResponse',
  ),
  opinitOphostV1MsgRegisterMigrationInfo(
    typeUrl: '/opinit.ophost.v1.MsgRegisterMigrationInfo',
    serviceUrl: "/opinit.ophost.v1.Msg/RegisterMigrationInfo",
    aminoType: "ophost/MsgRegisterMigrationInfo",
  ),
  opinitOphostV1MsgRegisterMigrationInfoResponse(
    typeUrl: '/opinit.ophost.v1.MsgRegisterMigrationInfoResponse',
  ),
  opinitOpchildV1QueryValidatorsRequest(
    typeUrl: '/opinit.opchild.v1.QueryValidatorsRequest',
    serviceUrl: "/opinit.opchild.v1.Query/Validators",
  ),
  opinitOpchildV1QueryValidatorsResponse(
    typeUrl: '/opinit.opchild.v1.QueryValidatorsResponse',
  ),
  opinitOpchildV1QueryValidatorRequest(
    typeUrl: '/opinit.opchild.v1.QueryValidatorRequest',
    serviceUrl: "/opinit.opchild.v1.Query/Validator",
  ),
  opinitOpchildV1QueryValidatorResponse(
    typeUrl: '/opinit.opchild.v1.QueryValidatorResponse',
  ),
  opinitOpchildV1QueryBridgeInfoRequest(
    typeUrl: '/opinit.opchild.v1.QueryBridgeInfoRequest',
    serviceUrl: "/opinit.opchild.v1.Query/BridgeInfo",
  ),
  opinitOpchildV1QueryBridgeInfoResponse(
    typeUrl: '/opinit.opchild.v1.QueryBridgeInfoResponse',
  ),
  opinitOpchildV1QueryParamsRequest(
    typeUrl: '/opinit.opchild.v1.QueryParamsRequest',
    serviceUrl: "/opinit.opchild.v1.Query/Params",
  ),
  opinitOpchildV1QueryParamsResponse(
    typeUrl: '/opinit.opchild.v1.QueryParamsResponse',
  ),
  opinitOpchildV1QueryNextL1SequenceRequest(
    typeUrl: '/opinit.opchild.v1.QueryNextL1SequenceRequest',
    serviceUrl: "/opinit.opchild.v1.Query/NextL1Sequence",
  ),
  opinitOpchildV1QueryNextL1SequenceResponse(
    typeUrl: '/opinit.opchild.v1.QueryNextL1SequenceResponse',
  ),
  opinitOpchildV1QueryNextL2SequenceRequest(
    typeUrl: '/opinit.opchild.v1.QueryNextL2SequenceRequest',
    serviceUrl: "/opinit.opchild.v1.Query/NextL2Sequence",
  ),
  opinitOpchildV1QueryNextL2SequenceResponse(
    typeUrl: '/opinit.opchild.v1.QueryNextL2SequenceResponse',
  ),
  opinitOpchildV1QueryBaseDenomRequest(
    typeUrl: '/opinit.opchild.v1.QueryBaseDenomRequest',
    serviceUrl: "/opinit.opchild.v1.Query/BaseDenom",
  ),
  opinitOpchildV1QueryBaseDenomResponse(
    typeUrl: '/opinit.opchild.v1.QueryBaseDenomResponse',
  ),
  opinitOpchildV1QueryMigrationInfoRequest(
    typeUrl: '/opinit.opchild.v1.QueryMigrationInfoRequest',
    serviceUrl: "/opinit.opchild.v1.Query/MigrationInfo",
  ),
  opinitOpchildV1QueryMigrationInfoResponse(
    typeUrl: '/opinit.opchild.v1.QueryMigrationInfoResponse',
  ),
  opinitOpchildV1Params(
    typeUrl: '/opinit.opchild.v1.Params',
    aminoType: "opchild/Params",
  ),
  opinitOpchildV1Validator(typeUrl: '/opinit.opchild.v1.Validator'),
  opinitOpchildV1BridgeInfo(typeUrl: '/opinit.opchild.v1.BridgeInfo'),
  opinitOpchildV1MigrationInfo(typeUrl: '/opinit.opchild.v1.MigrationInfo'),
  opinitOpchildV1OraclePriceData(typeUrl: '/opinit.opchild.v1.OraclePriceData'),
  opinitOpchildV1OracleData(typeUrl: '/opinit.opchild.v1.OracleData'),
  opinitOpchildV1MsgExecuteMessages(
    typeUrl: '/opinit.opchild.v1.MsgExecuteMessages',
    serviceUrl: "/opinit.opchild.v1.Msg/ExecuteMessages",
    aminoType: "opchild/MsgExecuteMessages",
  ),
  opinitOpchildV1MsgExecuteMessagesResponse(
    typeUrl: '/opinit.opchild.v1.MsgExecuteMessagesResponse',
  ),
  opinitOpchildV1MsgSetBridgeInfo(
    typeUrl: '/opinit.opchild.v1.MsgSetBridgeInfo',
    serviceUrl: "/opinit.opchild.v1.Msg/SetBridgeInfo",
    aminoType: "opchild/MsgSetBridgeInfo",
  ),
  opinitOpchildV1MsgSetBridgeInfoResponse(
    typeUrl: '/opinit.opchild.v1.MsgSetBridgeInfoResponse',
  ),
  opinitOpchildV1MsgFinalizeTokenDeposit(
    typeUrl: '/opinit.opchild.v1.MsgFinalizeTokenDeposit',
    serviceUrl: "/opinit.opchild.v1.Msg/FinalizeTokenDeposit",
    aminoType: "opchild/MsgFinalizeTokenDeposit",
  ),
  opinitOpchildV1MsgFinalizeTokenDepositResponse(
    typeUrl: '/opinit.opchild.v1.MsgFinalizeTokenDepositResponse',
  ),
  opinitOpchildV1MsgRelayOracleData(
    typeUrl: '/opinit.opchild.v1.MsgRelayOracleData',
    serviceUrl: "/opinit.opchild.v1.Msg/RelayOracleData",
    aminoType: "opchild/MsgRelayOracleData",
  ),
  opinitOpchildV1MsgRelayOracleDataResponse(
    typeUrl: '/opinit.opchild.v1.MsgRelayOracleDataResponse',
  ),
  opinitOpchildV1MsgInitiateTokenWithdrawal(
    typeUrl: '/opinit.opchild.v1.MsgInitiateTokenWithdrawal',
    serviceUrl: "/opinit.opchild.v1.Msg/InitiateTokenWithdrawal",
    aminoType: "opchild/MsgInitiateTokenWithdrawal",
  ),
  opinitOpchildV1MsgInitiateTokenWithdrawalResponse(
    typeUrl: '/opinit.opchild.v1.MsgInitiateTokenWithdrawalResponse',
  ),
  opinitOpchildV1MsgUpdateSequencer(
    typeUrl: '/opinit.opchild.v1.MsgUpdateSequencer',
    serviceUrl: "/opinit.opchild.v1.Msg/UpdateSequencer",
    aminoType: "opchild/MsgUpdateSequencer",
  ),
  opinitOpchildV1MsgUpdateSequencerResponse(
    typeUrl: '/opinit.opchild.v1.MsgUpdateSequencerResponse',
  ),
  opinitOpchildV1MsgAddFeeWhitelistAddresses(
    typeUrl: '/opinit.opchild.v1.MsgAddFeeWhitelistAddresses',
    serviceUrl: "/opinit.opchild.v1.Msg/AddFeeWhitelistAddresses",
    aminoType: "opchild/MsgAddFeeWhitelistAddresses",
  ),
  opinitOpchildV1MsgAddFeeWhitelistAddressesResponse(
    typeUrl: '/opinit.opchild.v1.MsgAddFeeWhitelistAddressesResponse',
  ),
  opinitOpchildV1MsgRemoveFeeWhitelistAddresses(
    typeUrl: '/opinit.opchild.v1.MsgRemoveFeeWhitelistAddresses',
    serviceUrl: "/opinit.opchild.v1.Msg/RemoveFeeWhitelistAddresses",
    aminoType: "opchild/MsgRemoveFeeWhitelistAddresses",
  ),
  opinitOpchildV1MsgRemoveFeeWhitelistAddressesResponse(
    typeUrl: '/opinit.opchild.v1.MsgRemoveFeeWhitelistAddressesResponse',
  ),
  opinitOpchildV1MsgAddBridgeExecutor(
    typeUrl: '/opinit.opchild.v1.MsgAddBridgeExecutor',
    serviceUrl: "/opinit.opchild.v1.Msg/AddBridgeExecutor",
    aminoType: "opchild/MsgAddBridgeExecutor",
  ),
  opinitOpchildV1MsgAddBridgeExecutorResponse(
    typeUrl: '/opinit.opchild.v1.MsgAddBridgeExecutorResponse',
  ),
  opinitOpchildV1MsgRemoveBridgeExecutor(
    typeUrl: '/opinit.opchild.v1.MsgRemoveBridgeExecutor',
    serviceUrl: "/opinit.opchild.v1.Msg/RemoveBridgeExecutor",
    aminoType: "opchild/MsgRemoveBridgeExecutor",
  ),
  opinitOpchildV1MsgRemoveBridgeExecutorResponse(
    typeUrl: '/opinit.opchild.v1.MsgRemoveBridgeExecutorResponse',
  ),
  opinitOpchildV1MsgUpdateMinGasPrices(
    typeUrl: '/opinit.opchild.v1.MsgUpdateMinGasPrices',
    serviceUrl: "/opinit.opchild.v1.Msg/UpdateMinGasPrices",
    aminoType: "opchild/MsgUpdateMinGasPrices",
  ),
  opinitOpchildV1MsgUpdateMinGasPricesResponse(
    typeUrl: '/opinit.opchild.v1.MsgUpdateMinGasPricesResponse',
  ),
  opinitOpchildV1MsgUpdateAdmin(
    typeUrl: '/opinit.opchild.v1.MsgUpdateAdmin',
    serviceUrl: "/opinit.opchild.v1.Msg/UpdateAdmin",
    aminoType: "opchild/MsgUpdateAdmin",
  ),
  opinitOpchildV1MsgUpdateAdminResponse(
    typeUrl: '/opinit.opchild.v1.MsgUpdateAdminResponse',
  ),
  opinitOpchildV1MsgUpdateParams(
    typeUrl: '/opinit.opchild.v1.MsgUpdateParams',
    serviceUrl: "/opinit.opchild.v1.Msg/UpdateParams",
    aminoType: "opchild/MsgUpdateParams",
  ),
  opinitOpchildV1MsgUpdateParamsResponse(
    typeUrl: '/opinit.opchild.v1.MsgUpdateParamsResponse',
  ),
  opinitOpchildV1MsgSpendFeePool(
    typeUrl: '/opinit.opchild.v1.MsgSpendFeePool',
    serviceUrl: "/opinit.opchild.v1.Msg/SpendFeePool",
    aminoType: "opchild/MsgSpendFeePool",
  ),
  opinitOpchildV1MsgSpendFeePoolResponse(
    typeUrl: '/opinit.opchild.v1.MsgSpendFeePoolResponse',
  ),
  opinitOpchildV1MsgUpdateOracle(
    typeUrl: '/opinit.opchild.v1.MsgUpdateOracle',
    serviceUrl: "/opinit.opchild.v1.Msg/UpdateOracle",
    aminoType: "opchild/MsgUpdateOracle",
  ),
  opinitOpchildV1MsgUpdateOracleResponse(
    typeUrl: '/opinit.opchild.v1.MsgUpdateOracleResponse',
  ),
  opinitOpchildV1MsgRegisterMigrationInfo(
    typeUrl: '/opinit.opchild.v1.MsgRegisterMigrationInfo',
    serviceUrl: "/opinit.opchild.v1.Msg/RegisterMigrationInfo",
    aminoType: "opchild/MsgRegisterMigrationInfo",
  ),
  opinitOpchildV1MsgRegisterMigrationInfoResponse(
    typeUrl: '/opinit.opchild.v1.MsgRegisterMigrationInfoResponse',
  ),
  opinitOpchildV1MsgMigrateToken(
    typeUrl: '/opinit.opchild.v1.MsgMigrateToken',
    serviceUrl: "/opinit.opchild.v1.Msg/MigrateToken",
    aminoType: "opchild/MsgMigrateToken",
  ),
  opinitOpchildV1MsgMigrateTokenResponse(
    typeUrl: '/opinit.opchild.v1.MsgMigrateTokenResponse',
  ),
  commonAsset(typeUrl: '/common.Asset'),
  commonCoin(typeUrl: '/common.Coin'),
  commonPubKeySet(typeUrl: '/common.PubKeySet'),
  commonTx(typeUrl: '/common.Tx'),
  commonOutputRef(typeUrl: '/common.OutputRef'),
  commonObservedTx(typeUrl: '/common.ObservedTx'),
  commonAttestation(typeUrl: '/common.Attestation'),
  commonQuorumTx(
    typeUrl: '/common.QuorumTx',
    serviceUrl: "/common.LocalhostBifrost/SendQuorumTx",
  ),
  commonNetworkFee(typeUrl: '/common.NetworkFee'),
  commonQuorumNetworkFee(
    typeUrl: '/common.QuorumNetworkFee',
    serviceUrl: "/common.LocalhostBifrost/SendQuorumNetworkFee",
  ),
  commonSolvency(typeUrl: '/common.Solvency'),
  commonQuorumSolvency(
    typeUrl: '/common.QuorumSolvency',
    serviceUrl: "/common.LocalhostBifrost/SendQuorumSolvency",
  ),
  commonErrataTx(typeUrl: '/common.ErrataTx'),
  commonQuorumErrataTx(
    typeUrl: '/common.QuorumErrataTx',
    serviceUrl: "/common.LocalhostBifrost/SendQuorumErrataTx",
  ),
  commonPriceFeed(typeUrl: '/common.PriceFeed'),
  commonQuorumPriceFeed(typeUrl: '/common.QuorumPriceFeed'),
  commonQuorumPriceFeedBatch(
    typeUrl: '/common.QuorumPriceFeedBatch',
    serviceUrl: "/common.LocalhostBifrost/SendQuorumPriceFeedBatch",
  ),
  commonOraclePrice(typeUrl: '/common.OraclePrice'),
  thorchainSchedulerV1QueryScheduleRequest(
    typeUrl: '/thorchain.scheduler.v1.QueryScheduleRequest',
    serviceUrl: "/thorchain.scheduler.v1.Query/Schedule",
  ),
  thorchainSchedulerV1QueryScheduleResponse(
    typeUrl: '/thorchain.scheduler.v1.QueryScheduleResponse',
  ),
  thorchainSchedulerV1QuerySchedulesRequest(
    typeUrl: '/thorchain.scheduler.v1.QuerySchedulesRequest',
    serviceUrl: "/thorchain.scheduler.v1.Query/Schedules",
  ),
  thorchainSchedulerV1QuerySchedulesResponse(
    typeUrl: '/thorchain.scheduler.v1.QuerySchedulesResponse',
  ),
  thorchainSchedulerV1Schedule(typeUrl: '/thorchain.scheduler.v1.Schedule'),
  thorchainSchedulerV1MsgScheduleExecuteContract(
    typeUrl: '/thorchain.scheduler.v1.MsgScheduleExecuteContract',
    serviceUrl: "/thorchain.scheduler.v1.Msg/ScheduleExecuteContract",
  ),
  thorchainSchedulerV1MsgScheduleExecuteContractResponse(
    typeUrl: '/thorchain.scheduler.v1.MsgScheduleExecuteContractResponse',
  ),
  thorchainDenomV1QueryDenomAdminRequest(
    typeUrl: '/thorchain.denom.v1.QueryDenomAdminRequest',
    serviceUrl: "/thorchain.denom.v1.Query/DenomAdmin",
  ),
  thorchainDenomV1QueryDenomAdminResponse(
    typeUrl: '/thorchain.denom.v1.QueryDenomAdminResponse',
  ),
  thorchainDenomV1MsgCreateDenom(
    typeUrl: '/thorchain.denom.v1.MsgCreateDenom',
    serviceUrl: "/thorchain.denom.v1.Msg/CreateDenom",
  ),
  thorchainDenomV1MsgCreateDenomResponse(
    typeUrl: '/thorchain.denom.v1.MsgCreateDenomResponse',
  ),
  thorchainDenomV1MsgMintTokens(
    typeUrl: '/thorchain.denom.v1.MsgMintTokens',
    serviceUrl: "/thorchain.denom.v1.Msg/MintTokens",
  ),
  thorchainDenomV1MsgMintTokensResponse(
    typeUrl: '/thorchain.denom.v1.MsgMintTokensResponse',
  ),
  thorchainDenomV1MsgBurnTokens(
    typeUrl: '/thorchain.denom.v1.MsgBurnTokens',
    serviceUrl: "/thorchain.denom.v1.Msg/BurnTokens",
  ),
  thorchainDenomV1MsgBurnTokensResponse(
    typeUrl: '/thorchain.denom.v1.MsgBurnTokensResponse',
  ),
  thorchainDenomV1MsgChangeDenomAdmin(
    typeUrl: '/thorchain.denom.v1.MsgChangeDenomAdmin',
    serviceUrl: "/thorchain.denom.v1.Msg/ChangeDenomAdmin",
  ),
  thorchainDenomV1MsgChangeDenomAdminResponse(
    typeUrl: '/thorchain.denom.v1.MsgChangeDenomAdminResponse',
  ),
  typesUpgrade(typeUrl: '/types.Upgrade'),
  typesMsgProposeUpgrade(
    typeUrl: '/types.MsgProposeUpgrade',
    serviceUrl: "/types.Msg/ProposeUpgrade",
    aminoType: "thorchain/MsgProposeUpgrade",
  ),
  typesMsgApproveUpgrade(
    typeUrl: '/types.MsgApproveUpgrade',
    serviceUrl: "/types.Msg/ApproveUpgrade",
    aminoType: "thorchain/MsgApproveUpgrade",
  ),
  typesMsgRejectUpgrade(
    typeUrl: '/types.MsgRejectUpgrade',
    serviceUrl: "/types.Msg/RejectUpgrade",
    aminoType: "thorchain/MsgRejectUpgrade",
  ),
  typesQuerySwapDetailsRequest(
    typeUrl: '/types.QuerySwapDetailsRequest',
    serviceUrl: "/types.Query/SwapDetails",
  ),
  typesQuerySwapDetailsResponse(typeUrl: '/types.QuerySwapDetailsResponse'),
  typesQuerySwapperCloutRequest(
    typeUrl: '/types.QuerySwapperCloutRequest',
    serviceUrl: "/types.Query/Clout",
  ),
  typesQueryTradeUnitRequest(
    typeUrl: '/types.QueryTradeUnitRequest',
    serviceUrl: "/types.Query/TradeUnit",
  ),
  typesQueryTradeUnitResponse(typeUrl: '/types.QueryTradeUnitResponse'),
  typesQueryTradeUnitsRequest(
    typeUrl: '/types.QueryTradeUnitsRequest',
    serviceUrl: "/types.Query/TradeUnits",
  ),
  typesQueryTradeUnitsResponse(typeUrl: '/types.QueryTradeUnitsResponse'),
  typesTxOutItem(typeUrl: '/types.TxOutItem'),
  typesTxOut(typeUrl: '/types.TxOut'),
  typesQueryTradeAccountRequest(
    typeUrl: '/types.QueryTradeAccountRequest',
    serviceUrl: "/types.Query/TradeAccount",
  ),
  typesQueryTradeAccountResponse(typeUrl: '/types.QueryTradeAccountResponse'),
  typesQueryTradeAccountsRequest(
    typeUrl: '/types.QueryTradeAccountsRequest',
    serviceUrl: "/types.Query/TradeAccounts",
  ),
  typesQueryTradeAccountsResponse(typeUrl: '/types.QueryTradeAccountsResponse'),
  typesQueryStreamingSwapRequest(
    typeUrl: '/types.QueryStreamingSwapRequest',
    serviceUrl: "/types.Query/StreamingSwap",
  ),
  typesQueryStreamingSwapResponse(typeUrl: '/types.QueryStreamingSwapResponse'),
  typesQueryStreamingSwapsRequest(
    typeUrl: '/types.QueryStreamingSwapsRequest',
    serviceUrl: "/types.Query/StreamingSwaps",
  ),
  typesQueryStreamingSwapsResponse(
    typeUrl: '/types.QueryStreamingSwapsResponse',
  ),
  typesSendQuorumTxResult(typeUrl: '/types.SendQuorumTxResult'),
  typesSubscribeRequest(
    typeUrl: '/types.SubscribeRequest',
    serviceUrl: "/types.LocalhostBifrost/SubscribeToEvents",
  ),
  typesEventNotification(typeUrl: '/types.EventNotification'),
  typesSendQuorumNetworkFeeResult(typeUrl: '/types.SendQuorumNetworkFeeResult'),
  typesSendQuorumSolvencyResult(typeUrl: '/types.SendQuorumSolvencyResult'),
  typesSendQuorumErrataTxResult(typeUrl: '/types.SendQuorumErrataTxResult'),
  typesSendQuorumPriceFeedBatchResult(
    typeUrl: '/types.SendQuorumPriceFeedBatchResult',
  ),
  typesProtoInt64(typeUrl: '/types.ProtoInt64'),
  typesQueryReferenceMemoRequest(
    typeUrl: '/types.QueryReferenceMemoRequest',
    serviceUrl: "/types.Query/ReferenceMemo",
  ),
  typesQueryReferenceMemoResponse(typeUrl: '/types.QueryReferenceMemoResponse'),
  typesQueryReferenceMemoByHashRequest(
    typeUrl: '/types.QueryReferenceMemoByHashRequest',
    serviceUrl: "/types.Query/ReferenceMemoByHash",
  ),
  typesQueryReferenceMemoByHashResponse(
    typeUrl: '/types.QueryReferenceMemoByHashResponse',
  ),
  typesQueryReferenceMemoPreflightRequest(
    typeUrl: '/types.QueryReferenceMemoPreflightRequest',
    serviceUrl: "/types.Query/ReferenceMemoPreflight",
  ),
  typesQueryReferenceMemoPreflightResponse(
    typeUrl: '/types.QueryReferenceMemoPreflightResponse',
  ),
  typesOraclePrice(typeUrl: '/types.OraclePrice'),
  typesMsgSetIPAddress(
    typeUrl: '/types.MsgSetIPAddress',
    serviceUrl: "/types.Msg/SetIPAddress",
    aminoType: "thorchain/MsgSetIPAddress",
  ),
  typesQuerySecuredAssetRequest(
    typeUrl: '/types.QuerySecuredAssetRequest',
    serviceUrl: "/types.Query/SecuredAsset",
  ),
  typesQuerySecuredAssetResponse(typeUrl: '/types.QuerySecuredAssetResponse'),
  typesQuerySecuredAssetsRequest(
    typeUrl: '/types.QuerySecuredAssetsRequest',
    serviceUrl: "/types.Query/SecuredAssets",
  ),
  typesQuerySecuredAssetsResponse(typeUrl: '/types.QuerySecuredAssetsResponse'),
  typesMsgNodePauseChain(
    typeUrl: '/types.MsgNodePauseChain',
    serviceUrl: "/types.Msg/NodePauseChain",
    aminoType: "thorchain/MsgNodePauseChain",
  ),
  typesQueryBlockRequest(
    typeUrl: '/types.QueryBlockRequest',
    serviceUrl: "/types.Query/Block",
  ),
  typesQueryBlockResponse(typeUrl: '/types.QueryBlockResponse'),
  typesBlockResponseId(typeUrl: '/types.BlockResponseId'),
  typesBlockResponseIdParts(typeUrl: '/types.BlockResponseIdParts'),
  typesBlockResponseHeader(typeUrl: '/types.BlockResponseHeader'),
  typesBlockResponseHeaderVersion(typeUrl: '/types.BlockResponseHeaderVersion'),
  typesBlockEvent(typeUrl: '/types.BlockEvent'),
  typesEventKeyValuePair(typeUrl: '/types.EventKeyValuePair'),
  typesQueryBlockTx(typeUrl: '/types.QueryBlockTx'),
  typesBlockTxResult(typeUrl: '/types.BlockTxResult'),
  typesNode(typeUrl: '/types.Node'),
  typesBlame(typeUrl: '/types.Blame'),
  typesMsgSend(
    typeUrl: '/types.MsgSend',
    serviceUrl: "/types.Msg/ThorSend",
    aminoType: "thorchain/MsgSend",
  ),
  typesQueryTCYClaimerRequest(
    typeUrl: '/types.QueryTCYClaimerRequest',
    serviceUrl: "/types.Query/TCYClaimer",
  ),
  typesQueryTCYClaimerResponse(typeUrl: '/types.QueryTCYClaimerResponse'),
  typesQueryTCYClaimer(typeUrl: '/types.QueryTCYClaimer'),
  typesQueryTCYClaimersRequest(
    typeUrl: '/types.QueryTCYClaimersRequest',
    serviceUrl: "/types.Query/TCYClaimers",
  ),
  typesQueryTCYClaimersResponse(typeUrl: '/types.QueryTCYClaimersResponse'),
  typesQueryOraclePriceRequest(
    typeUrl: '/types.QueryOraclePriceRequest',
    serviceUrl: "/types.Query/OraclePrice",
  ),
  typesQueryOraclePriceResponse(typeUrl: '/types.QueryOraclePriceResponse'),
  typesQueryOraclePricesRequest(
    typeUrl: '/types.QueryOraclePricesRequest',
    serviceUrl: "/types.Query/OraclePrices",
  ),
  typesQueryOraclePricesResponse(typeUrl: '/types.QueryOraclePricesResponse'),
  typesQueryOutboundFeeRequest(
    typeUrl: '/types.QueryOutboundFeeRequest',
    serviceUrl: "/types.Query/OutboundFee",
  ),
  typesQueryOutboundFeeResponse(typeUrl: '/types.QueryOutboundFeeResponse'),
  typesQueryOutboundFeesRequest(
    typeUrl: '/types.QueryOutboundFeesRequest',
    serviceUrl: "/types.Query/OutboundFees",
  ),
  typesQueryOutboundFeesResponse(typeUrl: '/types.QueryOutboundFeesResponse'),
  typesMsgMimir(
    typeUrl: '/types.MsgMimir',
    serviceUrl: "/types.Msg/Mimir",
    aminoType: "thorchain/MsgMimir",
  ),
  typesQueryLastBlocksRequest(
    typeUrl: '/types.QueryLastBlocksRequest',
    serviceUrl: "/types.Query/LastBlocks",
  ),
  typesQueryChainsLastBlockRequest(
    typeUrl: '/types.QueryChainsLastBlockRequest',
    serviceUrl: "/types.Query/ChainsLastBlock",
  ),
  typesQueryLastBlocksResponse(typeUrl: '/types.QueryLastBlocksResponse'),
  typesChainsLastBlock(typeUrl: '/types.ChainsLastBlock'),
  typesQueryQueueRequest(
    typeUrl: '/types.QueryQueueRequest',
    serviceUrl: "/types.Query/Queue",
  ),
  typesQueryQueueResponse(typeUrl: '/types.QueryQueueResponse'),
  typesQuerySwapQueueRequest(
    typeUrl: '/types.QuerySwapQueueRequest',
    serviceUrl: "/types.Query/SwapQueue",
  ),
  typesQuerySwapQueueResponse(typeUrl: '/types.QuerySwapQueueResponse'),
  typesQuerySwapQueuePaginatedRequest(
    typeUrl: '/types.QuerySwapQueuePaginatedRequest',
    serviceUrl: "/types.Query/SwapQueuePaginated",
  ),
  typesQuerySwapQueuePaginatedResponse(
    typeUrl: '/types.QuerySwapQueuePaginatedResponse',
  ),
  typesQueryLiquidityProviderRequest(
    typeUrl: '/types.QueryLiquidityProviderRequest',
    serviceUrl: "/types.Query/LiquidityProvider",
  ),
  typesQueryLiquidityProviderResponse(
    typeUrl: '/types.QueryLiquidityProviderResponse',
  ),
  typesQueryLiquidityProvidersRequest(
    typeUrl: '/types.QueryLiquidityProvidersRequest',
    serviceUrl: "/types.Query/LiquidityProviders",
  ),
  typesQueryLiquidityProvidersResponse(
    typeUrl: '/types.QueryLiquidityProvidersResponse',
  ),
  typesMsgObservedTxIn(
    typeUrl: '/types.MsgObservedTxIn',
    serviceUrl: "/types.Msg/ObservedTxIn",
    aminoType: "thorchain/ObservedTxIn",
  ),
  typesMsgTssPool(
    typeUrl: '/types.MsgTssPool',
    serviceUrl: "/types.Msg/TssPool",
    aminoType: "thorchain/TssPool",
  ),
  typesMsgPriceFeedQuorumBatch(
    typeUrl: '/types.MsgPriceFeedQuorumBatch',
    serviceUrl: "/types.Msg/PriceFeedQuorumBatch",
    aminoType: "thorchain/MsgPriceFeedQuorumBatch",
  ),
  typesQueryLimitSwapsSummaryRequest(
    typeUrl: '/types.QueryLimitSwapsSummaryRequest',
    serviceUrl: "/types.Query/LimitSwapsSummary",
  ),
  typesAssetPairSummary(typeUrl: '/types.AssetPairSummary'),
  typesQueryLimitSwapsSummaryResponse(
    typeUrl: '/types.QueryLimitSwapsSummaryResponse',
  ),
  typesQueryVaultRequest(
    typeUrl: '/types.QueryVaultRequest',
    serviceUrl: "/types.Query/Vault",
  ),
  typesQueryVaultResponse(typeUrl: '/types.QueryVaultResponse'),
  typesQueryKeysignPartyRequest(
    typeUrl: '/types.QueryKeysignPartyRequest',
    serviceUrl: "/types.Query/KeysignParty",
  ),
  typesQueryKeysignPartyResponse(typeUrl: '/types.QueryKeysignPartyResponse'),
  typesQueryAsgardVaultsRequest(
    typeUrl: '/types.QueryAsgardVaultsRequest',
    serviceUrl: "/types.Query/AsgardVaults",
  ),
  typesQueryAsgardVaultsResponse(typeUrl: '/types.QueryAsgardVaultsResponse'),
  typesQueryVaultsPubkeysRequest(
    typeUrl: '/types.QueryVaultsPubkeysRequest',
    serviceUrl: "/types.Query/VaultsPubkeys",
  ),
  typesQueryVaultsPubkeysResponse(typeUrl: '/types.QueryVaultsPubkeysResponse'),
  typesVaultInfo(typeUrl: '/types.VaultInfo'),
  typesQueryXMRSpentOutputRefsRequest(
    typeUrl: '/types.QueryXMRSpentOutputRefsRequest',
    serviceUrl: "/types.Query/XMRSpentOutputRefs",
  ),
  typesQueryXMRSpentOutputRefsResponse(
    typeUrl: '/types.QueryXMRSpentOutputRefsResponse',
  ),
  typesVaultRouter(typeUrl: '/types.VaultRouter'),
  typesVaultAddress(typeUrl: '/types.VaultAddress'),
  typesQueryVaultSolvencyRequest(
    typeUrl: '/types.QueryVaultSolvencyRequest',
    serviceUrl: "/types.Query/VaultSolvency",
  ),
  typesVaultSolvencyAsset(typeUrl: '/types.VaultSolvencyAsset'),
  typesQueryVaultSolvencyResponse(typeUrl: '/types.QueryVaultSolvencyResponse'),
  typesKeygen(typeUrl: '/types.Keygen'),
  typesKeygenBlock(typeUrl: '/types.KeygenBlock'),
  typesQueryNodeRequest(
    typeUrl: '/types.QueryNodeRequest',
    serviceUrl: "/types.Query/Node",
  ),
  typesQueryNodeResponse(typeUrl: '/types.QueryNodeResponse'),
  typesQueryNodesRequest(
    typeUrl: '/types.QueryNodesRequest',
    serviceUrl: "/types.Query/Nodes",
  ),
  typesQueryNodesResponse(typeUrl: '/types.QueryNodesResponse'),
  typesNodeBondProviders(typeUrl: '/types.NodeBondProviders'),
  typesNodeBondProvider(typeUrl: '/types.NodeBondProvider'),
  typesNodeJail(typeUrl: '/types.NodeJail'),
  typesChainHeight(typeUrl: '/types.ChainHeight'),
  typesNodePreflightStatus(typeUrl: '/types.NodePreflightStatus'),
  typesQueryTCYProtocolOwnedRequest(
    typeUrl: '/types.QueryTCYProtocolOwnedRequest',
    serviceUrl: "/types.Query/TCYProtocolOwned",
  ),
  typesQueryTCYProtocolOwnedResponse(
    typeUrl: '/types.QueryTCYProtocolOwnedResponse',
  ),
  typesQueryDerivedPoolRequest(
    typeUrl: '/types.QueryDerivedPoolRequest',
    serviceUrl: "/types.Query/DerivedPool",
  ),
  typesQueryDerivedPoolResponse(typeUrl: '/types.QueryDerivedPoolResponse'),
  typesQueryDerivedPoolsRequest(
    typeUrl: '/types.QueryDerivedPoolsRequest',
    serviceUrl: "/types.Query/DerivedPools",
  ),
  typesQueryDerivedPoolsResponse(typeUrl: '/types.QueryDerivedPoolsResponse'),
  typesQueryLimitSwapsRequest(
    typeUrl: '/types.QueryLimitSwapsRequest',
    serviceUrl: "/types.Query/LimitSwaps",
  ),
  typesLimitSwapWithDetails(typeUrl: '/types.LimitSwapWithDetails'),
  typesPaginationMeta(typeUrl: '/types.PaginationMeta'),
  typesQueryLimitSwapsResponse(typeUrl: '/types.QueryLimitSwapsResponse'),
  typesQueryExportRequest(
    typeUrl: '/types.QueryExportRequest',
    serviceUrl: "/types.Query/Export",
  ),
  typesQueryExportResponse(typeUrl: '/types.QueryExportResponse'),
  typesQueryNetworkRequest(
    typeUrl: '/types.QueryNetworkRequest',
    serviceUrl: "/types.Query/Network",
  ),
  typesQueryNetworkResponse(typeUrl: '/types.QueryNetworkResponse'),
  typesQueryScheduledOutboundRequest(
    typeUrl: '/types.QueryScheduledOutboundRequest',
    serviceUrl: "/types.Query/ScheduledOutbound",
  ),
  typesQueryPendingOutboundRequest(
    typeUrl: '/types.QueryPendingOutboundRequest',
    serviceUrl: "/types.Query/PendingOutbound",
  ),
  typesQueryOutboundResponse(typeUrl: '/types.QueryOutboundResponse'),
  typesQueryTxOutItem(typeUrl: '/types.QueryTxOutItem'),
  typesMsgErrataTx(
    typeUrl: '/types.MsgErrataTx',
    serviceUrl: "/types.Msg/ErrataTx",
    aminoType: "thorchain/MsgErrataTx",
  ),
  typesMsgErrataTxQuorum(
    typeUrl: '/types.MsgErrataTxQuorum',
    serviceUrl: "/types.Msg/ErrataTxQuorum",
    aminoType: "thorchain/MsgErrataTxQuorum",
  ),
  typesQueryEip712TypedDataRequest(
    typeUrl: '/types.QueryEip712TypedDataRequest',
    serviceUrl: "/types.Query/Eip712TypedData",
  ),
  typesQueryEip712TypedDataResponse(
    typeUrl: '/types.QueryEip712TypedDataResponse',
  ),
  typesBanVoter(typeUrl: '/types.BanVoter'),
  typesMsgBan(
    typeUrl: '/types.MsgBan',
    serviceUrl: "/types.Msg/Ban",
    aminoType: "thorchain/MsgBan",
  ),
  typesMsgObservedTxQuorum(
    typeUrl: '/types.MsgObservedTxQuorum',
    serviceUrl: "/types.Msg/ObservedTxQuorum",
    aminoType: "thorchain/ObservedTxQuorum",
  ),
  typesQueryPoolRequest(
    typeUrl: '/types.QueryPoolRequest',
    serviceUrl: "/types.Query/Pool",
  ),
  typesQueryPoolResponse(typeUrl: '/types.QueryPoolResponse'),
  typesQueryPoolsRequest(
    typeUrl: '/types.QueryPoolsRequest',
    serviceUrl: "/types.Query/Pools",
  ),
  typesQueryPoolsResponse(typeUrl: '/types.QueryPoolsResponse'),
  typesQuerySaverRequest(
    typeUrl: '/types.QuerySaverRequest',
    serviceUrl: "/types.Query/Saver",
  ),
  typesQuerySaverResponse(typeUrl: '/types.QuerySaverResponse'),
  typesQuerySaversRequest(
    typeUrl: '/types.QuerySaversRequest',
    serviceUrl: "/types.Query/Savers",
  ),
  typesQuerySaversResponse(typeUrl: '/types.QuerySaversResponse'),
  typesQueryRuneProviderRequest(
    typeUrl: '/types.QueryRuneProviderRequest',
    serviceUrl: "/types.Query/RuneProvider",
  ),
  typesQueryRuneProviderResponse(typeUrl: '/types.QueryRuneProviderResponse'),
  typesQueryRuneProvidersRequest(
    typeUrl: '/types.QueryRuneProvidersRequest',
    serviceUrl: "/types.Query/RuneProviders",
  ),
  typesQueryRuneProvidersResponse(typeUrl: '/types.QueryRuneProvidersResponse'),
  typesMsgTssKeysignFail(
    typeUrl: '/types.MsgTssKeysignFail',
    serviceUrl: "/types.Msg/TssKeysignFail",
    aminoType: "thorchain/TssKeysignFail",
  ),
  typesQueryConstantValuesRequest(
    typeUrl: '/types.QueryConstantValuesRequest',
    serviceUrl: "/types.Query/ConstantValues",
  ),
  typesQueryConstantValuesResponse(
    typeUrl: '/types.QueryConstantValuesResponse',
  ),
  typesInt64Constants(typeUrl: '/types.Int64Constants'),
  typesBoolConstants(typeUrl: '/types.BoolConstants'),
  typesStringConstants(typeUrl: '/types.StringConstants'),
  typesQueryUpgradeProposalRequest(
    typeUrl: '/types.QueryUpgradeProposalRequest',
    serviceUrl: "/types.Query/UpgradeProposal",
  ),
  typesQueryUpgradeProposalResponse(
    typeUrl: '/types.QueryUpgradeProposalResponse',
  ),
  typesQueryUpgradeProposalsRequest(
    typeUrl: '/types.QueryUpgradeProposalsRequest',
    serviceUrl: "/types.Query/UpgradeProposals",
  ),
  typesQueryUpgradeProposalsResponse(
    typeUrl: '/types.QueryUpgradeProposalsResponse',
  ),
  typesQueryUpgradeVotesRequest(
    typeUrl: '/types.QueryUpgradeVotesRequest',
    serviceUrl: "/types.Query/UpgradeVotes",
  ),
  typesUpgradeVote(typeUrl: '/types.UpgradeVote'),
  typesQueryUpgradeVotesResponse(typeUrl: '/types.QueryUpgradeVotesResponse'),
  typesQueryQuoteSwapRequest(
    typeUrl: '/types.QueryQuoteSwapRequest',
    serviceUrl: "/types.Query/QuoteSwap",
  ),
  typesQueryQuoteSwapResponse(typeUrl: '/types.QueryQuoteSwapResponse'),
  typesQuoteFees(typeUrl: '/types.QuoteFees'),
  typesVout(typeUrl: '/types.Vout'),
  typesQueryQuoteLimitRequest(
    typeUrl: '/types.QueryQuoteLimitRequest',
    serviceUrl: "/types.Query/QuoteLimit",
  ),
  typesQueryQuoteLimitResponse(typeUrl: '/types.QueryQuoteLimitResponse'),
  typesQueryKeysignRequest(
    typeUrl: '/types.QueryKeysignRequest',
    serviceUrl: "/types.Query/Keysign",
  ),
  typesQueryKeysignPubkeyRequest(
    typeUrl: '/types.QueryKeysignPubkeyRequest',
    serviceUrl: "/types.Query/KeysignPubkey",
  ),
  typesQueryKeysignResponse(typeUrl: '/types.QueryKeysignResponse'),
  typesQueryKeygenRequest(
    typeUrl: '/types.QueryKeygenRequest',
    serviceUrl: "/types.Query/Keygen",
  ),
  typesQueryKeygenResponse(typeUrl: '/types.QueryKeygenResponse'),
  typesMsgSetVersion(
    typeUrl: '/types.MsgSetVersion',
    serviceUrl: "/types.Msg/SetVersion",
    aminoType: "thorchain/MsgSetVersion",
  ),
  typesQueryInboundAddressResponse(
    typeUrl: '/types.QueryInboundAddressResponse',
  ),
  typesQueryInboundAddressesRequest(
    typeUrl: '/types.QueryInboundAddressesRequest',
    serviceUrl: "/types.Query/InboundAddresses",
  ),
  typesQueryInboundAddressesResponse(
    typeUrl: '/types.QueryInboundAddressesResponse',
  ),
  typesMsgNetworkFee(
    typeUrl: '/types.MsgNetworkFee',
    serviceUrl: "/types.Msg/NetworkFee",
    aminoType: "thorchain/MsgNetworkFee",
  ),
  typesMsgNetworkFeeQuorum(
    typeUrl: '/types.MsgNetworkFeeQuorum',
    serviceUrl: "/types.Msg/NetworkFeeQuorum",
    aminoType: "thorchain/MsgNetworkFeeQuorum",
  ),
  typesQueryTssKeygenMetricRequest(
    typeUrl: '/types.QueryTssKeygenMetricRequest',
    serviceUrl: "/types.Query/TssKeygenMetric",
  ),
  typesQueryTssKeygenMetricResponse(
    typeUrl: '/types.QueryTssKeygenMetricResponse',
  ),
  typesQueryTssMetricRequest(
    typeUrl: '/types.QueryTssMetricRequest',
    serviceUrl: "/types.Query/TssMetric",
  ),
  typesQueryTssMetricResponse(typeUrl: '/types.QueryTssMetricResponse'),
  typesSwapState(typeUrl: '/types.SwapState'),
  typesMsgSwap(typeUrl: '/types.MsgSwap'),
  typesQueryVersionRequest(
    typeUrl: '/types.QueryVersionRequest',
    serviceUrl: "/types.Query/Version",
  ),
  typesQueryVersionResponse(typeUrl: '/types.QueryVersionResponse'),
  typesQueryDynamicL1FeesRequest(
    typeUrl: '/types.QueryDynamicL1FeesRequest',
    serviceUrl: "/types.Query/DynamicL1Fees",
  ),
  typesDynamicL1FeeEntry(typeUrl: '/types.DynamicL1FeeEntry'),
  typesQueryDynamicL1FeesResponse(typeUrl: '/types.QueryDynamicL1FeesResponse'),
  typesQueryDynamicL1FeesByThornameRequest(
    typeUrl: '/types.QueryDynamicL1FeesByThornameRequest',
    serviceUrl: "/types.Query/DynamicL1FeesByThorname",
  ),
  typesDynamicL1FeePairDetail(typeUrl: '/types.DynamicL1FeePairDetail'),
  typesDynamicL1FeeHistoryEntry(typeUrl: '/types.DynamicL1FeeHistoryEntry'),
  typesQueryDynamicL1FeesByThornameResponse(
    typeUrl: '/types.QueryDynamicL1FeesByThornameResponse',
  ),
  typesQueryDynamicL1FeesCurrentRequest(
    typeUrl: '/types.QueryDynamicL1FeesCurrentRequest',
    serviceUrl: "/types.Query/DynamicL1FeesCurrent",
  ),
  typesDynamicL1FeeCurrentEntry(typeUrl: '/types.DynamicL1FeeCurrentEntry'),
  typesQueryDynamicL1FeesCurrentResponse(
    typeUrl: '/types.QueryDynamicL1FeesCurrentResponse',
  ),
  typesMsgObservedTxOut(
    typeUrl: '/types.MsgObservedTxOut',
    serviceUrl: "/types.Msg/ObservedTxOut",
    aminoType: "thorchain/ObservedTxOut",
  ),
  typesNodeTssTime(typeUrl: '/types.NodeTssTime'),
  typesTssKeygenMetric(typeUrl: '/types.TssKeygenMetric'),
  typesTssKeysignMetric(typeUrl: '/types.TssKeysignMetric'),
  typesMsgDeposit(
    typeUrl: '/types.MsgDeposit',
    serviceUrl: "/types.Msg/Deposit",
    aminoType: "thorchain/MsgDeposit",
  ),
  typesQueryAccountRequest(
    typeUrl: '/types.QueryAccountRequest',
    serviceUrl: "/types.Query/Account",
  ),
  typesQueryAccountResponse(typeUrl: '/types.QueryAccountResponse'),
  typesQueryInvariantRequest(
    typeUrl: '/types.QueryInvariantRequest',
    serviceUrl: "/types.Query/Invariant",
  ),
  typesQueryInvariantResponse(typeUrl: '/types.QueryInvariantResponse'),
  typesQueryInvariantsRequest(
    typeUrl: '/types.QueryInvariantsRequest',
    serviceUrl: "/types.Query/Invariants",
  ),
  typesQueryInvariantsResponse(typeUrl: '/types.QueryInvariantsResponse'),
  typesMsgSolvency(
    typeUrl: '/types.MsgSolvency',
    serviceUrl: "/types.Msg/Solvency",
    aminoType: "thorchain/MsgSolvency",
  ),
  typesMsgSolvencyQuorum(
    typeUrl: '/types.MsgSolvencyQuorum',
    serviceUrl: "/types.Msg/SolvencyQuorum",
    aminoType: "thorchain/MsgSolvencyQuorum",
  ),
  typesNodeMimir(typeUrl: '/types.NodeMimir'),
  typesQueryTCYStakerRequest(
    typeUrl: '/types.QueryTCYStakerRequest',
    serviceUrl: "/types.Query/TCYStaker",
  ),
  typesQueryTCYStakerResponse(typeUrl: '/types.QueryTCYStakerResponse'),
  typesQueryTCYStakersRequest(
    typeUrl: '/types.QueryTCYStakersRequest',
    serviceUrl: "/types.Query/TCYStakers",
  ),
  typesQueryTCYStakersResponse(typeUrl: '/types.QueryTCYStakersResponse'),
  typesContractInfo(typeUrl: '/types.ContractInfo'),
  typesQueryBalancesRequest(
    typeUrl: '/types.QueryBalancesRequest',
    serviceUrl: "/types.Query/Balances",
  ),
  typesQueryBalancesResponse(typeUrl: '/types.QueryBalancesResponse'),
  typesAmount(typeUrl: '/types.Amount'),
  typesMsgEmpty(typeUrl: '/types.MsgEmpty'),
  typesSwapperClout(typeUrl: '/types.SwapperClout'),
  typesQueryMimirValuesRequest(
    typeUrl: '/types.QueryMimirValuesRequest',
    serviceUrl: "/types.Query/MimirValues",
  ),
  typesQueryMimirValuesResponse(typeUrl: '/types.QueryMimirValuesResponse'),
  typesQueryMimirWithKeyRequest(
    typeUrl: '/types.QueryMimirWithKeyRequest',
    serviceUrl: "/types.Query/MimirWithKey",
  ),
  typesQueryMimirWithKeyResponse(typeUrl: '/types.QueryMimirWithKeyResponse'),
  typesQueryMimirAdminValuesRequest(
    typeUrl: '/types.QueryMimirAdminValuesRequest',
    serviceUrl: "/types.Query/MimirAdminValues",
  ),
  typesQueryMimirAdminValuesResponse(
    typeUrl: '/types.QueryMimirAdminValuesResponse',
  ),
  typesQueryMimirNodesAllValuesRequest(
    typeUrl: '/types.QueryMimirNodesAllValuesRequest',
    serviceUrl: "/types.Query/MimirNodesAllValues",
  ),
  typesQueryMimirNodesAllValuesResponse(
    typeUrl: '/types.QueryMimirNodesAllValuesResponse',
  ),
  typesQueryMimirNodesValuesRequest(
    typeUrl: '/types.QueryMimirNodesValuesRequest',
    serviceUrl: "/types.Query/MimirNodesValues",
  ),
  typesQueryMimirNodesValuesResponse(
    typeUrl: '/types.QueryMimirNodesValuesResponse',
  ),
  typesQueryMimirNodeValuesRequest(
    typeUrl: '/types.QueryMimirNodeValuesRequest',
    serviceUrl: "/types.Query/MimirNodeValues",
  ),
  typesQueryMimirNodeValuesResponse(
    typeUrl: '/types.QueryMimirNodeValuesResponse',
  ),
  typesMimir(typeUrl: '/types.Mimir'),
  typesLockedSupply(typeUrl: '/types.LockedSupply'),
  typesQuerySupplyRequest(
    typeUrl: '/types.QuerySupplyRequest',
    serviceUrl: "/types.Query/Supply",
  ),
  typesQuerySupplyResponse(typeUrl: '/types.QuerySupplyResponse'),
  typesQueryPoolSlipRequest(
    typeUrl: '/types.QueryPoolSlipRequest',
    serviceUrl: "/types.Query/PoolSlip",
  ),
  typesQueryPoolSlipResponse(typeUrl: '/types.QueryPoolSlipResponse'),
  typesQueryPoolSlipsRequest(
    typeUrl: '/types.QueryPoolSlipsRequest',
    serviceUrl: "/types.Query/PoolSlips",
  ),
  typesQueryPoolSlipsResponse(typeUrl: '/types.QueryPoolSlipsResponse'),
  typesQueryTxStagesRequest(
    typeUrl: '/types.QueryTxStagesRequest',
    serviceUrl: "/types.Query/TxStages",
  ),
  typesQueryTxStagesResponse(typeUrl: '/types.QueryTxStagesResponse'),
  typesQueryTxStatusRequest(
    typeUrl: '/types.QueryTxStatusRequest',
    serviceUrl: "/types.Query/TxStatus",
  ),
  typesQueryTxStatusResponse(typeUrl: '/types.QueryTxStatusResponse'),
  typesQueryTxRequest(
    typeUrl: '/types.QueryTxRequest',
    serviceUrl: "/types.Query/Tx",
  ),
  typesQueryTxResponse(typeUrl: '/types.QueryTxResponse'),
  typesQueryObservedTx(typeUrl: '/types.QueryObservedTx'),
  typesQueryObservedTxVoter(typeUrl: '/types.QueryObservedTxVoter'),
  typesQueryTxVotersRequest(
    typeUrl: '/types.QueryTxVotersRequest',
    serviceUrl: "/types.Query/TxVoters",
  ),
  typesPlannedOutTx(typeUrl: '/types.PlannedOutTx'),
  typesInboundObservedStage(typeUrl: '/types.InboundObservedStage'),
  typesInboundConfirmationCountedStage(
    typeUrl: '/types.InboundConfirmationCountedStage',
  ),
  typesInboundFinalisedStage(typeUrl: '/types.InboundFinalisedStage'),
  typesSwapStatus(typeUrl: '/types.SwapStatus'),
  typesStreamingStatus(typeUrl: '/types.StreamingStatus'),
  typesSwapFinalisedStage(typeUrl: '/types.SwapFinalisedStage'),
  typesOutboundDelayStage(typeUrl: '/types.OutboundDelayStage'),
  typesOutboundSignedStage(typeUrl: '/types.OutboundSignedStage'),
  typesQueryThornameRequest(
    typeUrl: '/types.QueryThornameRequest',
    serviceUrl: "/types.Query/Thorname",
  ),
  typesQueryThornameResponse(typeUrl: '/types.QueryThornameResponse'),
  typesThornameAlias(typeUrl: '/types.ThornameAlias'),
  typesQueryRagnarokRequest(
    typeUrl: '/types.QueryRagnarokRequest',
    serviceUrl: "/types.Query/Ragnarok",
  ),
  typesQueryRagnarokResponse(typeUrl: '/types.QueryRagnarokResponse'),
  typesMsgSetNodeKeys(
    typeUrl: '/types.MsgSetNodeKeys',
    serviceUrl: "/types.Msg/SetNodeKeys",
    aminoType: "thorchain/MsgSetNodeKeys",
  ),
  typesQueryBalanceModuleRequest(
    typeUrl: '/types.QueryBalanceModuleRequest',
    serviceUrl: "/types.Query/BalanceModule",
  ),
  typesQueryBalanceModuleResponse(typeUrl: '/types.QueryBalanceModuleResponse'),
  typesQueryRunePoolRequest(
    typeUrl: '/types.QueryRunePoolRequest',
    serviceUrl: "/types.Query/RunePool",
  ),
  typesQueryRunePoolResponse(typeUrl: '/types.QueryRunePoolResponse'),
  typesPol(typeUrl: '/types.POL'),
  typesRunePoolProviders(typeUrl: '/types.RunePoolProviders'),
  typesRunePoolReserve(typeUrl: '/types.RunePoolReserve'),
  typesQueryBanRequest(
    typeUrl: '/types.QueryBanRequest',
    serviceUrl: "/types.Query/Ban",
  ),
  typesQueryContractInfoRequest(
    typeUrl: '/types.QueryContractInfoRequest',
    serviceUrl: "/types.Query/ContractInfo",
  ),
  typesQueryContractInfoResponse(typeUrl: '/types.QueryContractInfoResponse'),
  typesQueryContractInfosRequest(
    typeUrl: '/types.QueryContractInfosRequest',
    serviceUrl: "/types.Query/ContractInfos",
  ),
  typesQueryContractInfosResponse(typeUrl: '/types.QueryContractInfosResponse'),
  ibcCoreChannelV2QueryNextSequenceSendRequest(
    typeUrl: '/ibc.core.channel.v2.QueryNextSequenceSendRequest',
    serviceUrl: "/ibc.core.channel.v2.Query/NextSequenceSend",
  ),
  ibcCoreChannelV2QueryNextSequenceSendResponse(
    typeUrl: '/ibc.core.channel.v2.QueryNextSequenceSendResponse',
  ),
  ibcCoreChannelV2QueryPacketCommitmentRequest(
    typeUrl: '/ibc.core.channel.v2.QueryPacketCommitmentRequest',
    serviceUrl: "/ibc.core.channel.v2.Query/PacketCommitment",
  ),
  ibcCoreChannelV2QueryPacketCommitmentResponse(
    typeUrl: '/ibc.core.channel.v2.QueryPacketCommitmentResponse',
  ),
  ibcCoreChannelV2QueryPacketCommitmentsRequest(
    typeUrl: '/ibc.core.channel.v2.QueryPacketCommitmentsRequest',
    serviceUrl: "/ibc.core.channel.v2.Query/PacketCommitments",
  ),
  ibcCoreChannelV2QueryPacketCommitmentsResponse(
    typeUrl: '/ibc.core.channel.v2.QueryPacketCommitmentsResponse',
  ),
  ibcCoreChannelV2QueryPacketAcknowledgementRequest(
    typeUrl: '/ibc.core.channel.v2.QueryPacketAcknowledgementRequest',
    serviceUrl: "/ibc.core.channel.v2.Query/PacketAcknowledgement",
  ),
  ibcCoreChannelV2QueryPacketAcknowledgementResponse(
    typeUrl: '/ibc.core.channel.v2.QueryPacketAcknowledgementResponse',
  ),
  ibcCoreChannelV2QueryPacketAcknowledgementsRequest(
    typeUrl: '/ibc.core.channel.v2.QueryPacketAcknowledgementsRequest',
    serviceUrl: "/ibc.core.channel.v2.Query/PacketAcknowledgements",
  ),
  ibcCoreChannelV2QueryPacketAcknowledgementsResponse(
    typeUrl: '/ibc.core.channel.v2.QueryPacketAcknowledgementsResponse',
  ),
  ibcCoreChannelV2QueryPacketReceiptRequest(
    typeUrl: '/ibc.core.channel.v2.QueryPacketReceiptRequest',
    serviceUrl: "/ibc.core.channel.v2.Query/PacketReceipt",
  ),
  ibcCoreChannelV2QueryPacketReceiptResponse(
    typeUrl: '/ibc.core.channel.v2.QueryPacketReceiptResponse',
  ),
  ibcCoreChannelV2QueryUnreceivedPacketsRequest(
    typeUrl: '/ibc.core.channel.v2.QueryUnreceivedPacketsRequest',
    serviceUrl: "/ibc.core.channel.v2.Query/UnreceivedPackets",
  ),
  ibcCoreChannelV2QueryUnreceivedPacketsResponse(
    typeUrl: '/ibc.core.channel.v2.QueryUnreceivedPacketsResponse',
  ),
  ibcCoreChannelV2QueryUnreceivedAcksRequest(
    typeUrl: '/ibc.core.channel.v2.QueryUnreceivedAcksRequest',
    serviceUrl: "/ibc.core.channel.v2.Query/UnreceivedAcks",
  ),
  ibcCoreChannelV2QueryUnreceivedAcksResponse(
    typeUrl: '/ibc.core.channel.v2.QueryUnreceivedAcksResponse',
  ),
  ibcCoreChannelV2PacketState(typeUrl: '/ibc.core.channel.v2.PacketState'),
  ibcCoreChannelV2Packet(typeUrl: '/ibc.core.channel.v2.Packet'),
  ibcCoreChannelV2Payload(typeUrl: '/ibc.core.channel.v2.Payload'),
  ibcCoreChannelV2Acknowledgement(
    typeUrl: '/ibc.core.channel.v2.Acknowledgement',
  ),
  ibcCoreChannelV2MsgSendPacket(
    typeUrl: '/ibc.core.channel.v2.MsgSendPacket',
    serviceUrl: "/ibc.core.channel.v2.Msg/SendPacket",
  ),
  ibcCoreChannelV2MsgSendPacketResponse(
    typeUrl: '/ibc.core.channel.v2.MsgSendPacketResponse',
  ),
  ibcCoreChannelV2MsgRecvPacket(
    typeUrl: '/ibc.core.channel.v2.MsgRecvPacket',
    serviceUrl: "/ibc.core.channel.v2.Msg/RecvPacket",
  ),
  ibcCoreChannelV2MsgRecvPacketResponse(
    typeUrl: '/ibc.core.channel.v2.MsgRecvPacketResponse',
  ),
  ibcCoreChannelV2MsgTimeout(
    typeUrl: '/ibc.core.channel.v2.MsgTimeout',
    serviceUrl: "/ibc.core.channel.v2.Msg/Timeout",
  ),
  ibcCoreChannelV2MsgTimeoutResponse(
    typeUrl: '/ibc.core.channel.v2.MsgTimeoutResponse',
  ),
  ibcCoreChannelV2MsgAcknowledgement(
    typeUrl: '/ibc.core.channel.v2.MsgAcknowledgement',
    serviceUrl: "/ibc.core.channel.v2.Msg/Acknowledgement",
  ),
  ibcCoreChannelV2MsgAcknowledgementResponse(
    typeUrl: '/ibc.core.channel.v2.MsgAcknowledgementResponse',
  ),
  ibcCoreChannelV1QueryChannelRequest(
    typeUrl: '/ibc.core.channel.v1.QueryChannelRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/Channel",
  ),
  ibcCoreChannelV1QueryChannelResponse(
    typeUrl: '/ibc.core.channel.v1.QueryChannelResponse',
  ),
  ibcCoreChannelV1QueryChannelsRequest(
    typeUrl: '/ibc.core.channel.v1.QueryChannelsRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/Channels",
  ),
  ibcCoreChannelV1QueryChannelsResponse(
    typeUrl: '/ibc.core.channel.v1.QueryChannelsResponse',
  ),
  ibcCoreChannelV1QueryConnectionChannelsRequest(
    typeUrl: '/ibc.core.channel.v1.QueryConnectionChannelsRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/ConnectionChannels",
  ),
  ibcCoreChannelV1QueryConnectionChannelsResponse(
    typeUrl: '/ibc.core.channel.v1.QueryConnectionChannelsResponse',
  ),
  ibcCoreChannelV1QueryChannelClientStateRequest(
    typeUrl: '/ibc.core.channel.v1.QueryChannelClientStateRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/ChannelClientState",
  ),
  ibcCoreChannelV1QueryChannelClientStateResponse(
    typeUrl: '/ibc.core.channel.v1.QueryChannelClientStateResponse',
  ),
  ibcCoreChannelV1QueryChannelConsensusStateRequest(
    typeUrl: '/ibc.core.channel.v1.QueryChannelConsensusStateRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/ChannelConsensusState",
  ),
  ibcCoreChannelV1QueryChannelConsensusStateResponse(
    typeUrl: '/ibc.core.channel.v1.QueryChannelConsensusStateResponse',
  ),
  ibcCoreChannelV1QueryPacketCommitmentRequest(
    typeUrl: '/ibc.core.channel.v1.QueryPacketCommitmentRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/PacketCommitment",
  ),
  ibcCoreChannelV1QueryPacketCommitmentResponse(
    typeUrl: '/ibc.core.channel.v1.QueryPacketCommitmentResponse',
  ),
  ibcCoreChannelV1QueryPacketCommitmentsRequest(
    typeUrl: '/ibc.core.channel.v1.QueryPacketCommitmentsRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/PacketCommitments",
  ),
  ibcCoreChannelV1QueryPacketCommitmentsResponse(
    typeUrl: '/ibc.core.channel.v1.QueryPacketCommitmentsResponse',
  ),
  ibcCoreChannelV1QueryPacketReceiptRequest(
    typeUrl: '/ibc.core.channel.v1.QueryPacketReceiptRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/PacketReceipt",
  ),
  ibcCoreChannelV1QueryPacketReceiptResponse(
    typeUrl: '/ibc.core.channel.v1.QueryPacketReceiptResponse',
  ),
  ibcCoreChannelV1QueryPacketAcknowledgementRequest(
    typeUrl: '/ibc.core.channel.v1.QueryPacketAcknowledgementRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/PacketAcknowledgement",
  ),
  ibcCoreChannelV1QueryPacketAcknowledgementResponse(
    typeUrl: '/ibc.core.channel.v1.QueryPacketAcknowledgementResponse',
  ),
  ibcCoreChannelV1QueryPacketAcknowledgementsRequest(
    typeUrl: '/ibc.core.channel.v1.QueryPacketAcknowledgementsRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/PacketAcknowledgements",
  ),
  ibcCoreChannelV1QueryPacketAcknowledgementsResponse(
    typeUrl: '/ibc.core.channel.v1.QueryPacketAcknowledgementsResponse',
  ),
  ibcCoreChannelV1QueryUnreceivedPacketsRequest(
    typeUrl: '/ibc.core.channel.v1.QueryUnreceivedPacketsRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/UnreceivedPackets",
  ),
  ibcCoreChannelV1QueryUnreceivedPacketsResponse(
    typeUrl: '/ibc.core.channel.v1.QueryUnreceivedPacketsResponse',
  ),
  ibcCoreChannelV1QueryUnreceivedAcksRequest(
    typeUrl: '/ibc.core.channel.v1.QueryUnreceivedAcksRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/UnreceivedAcks",
  ),
  ibcCoreChannelV1QueryUnreceivedAcksResponse(
    typeUrl: '/ibc.core.channel.v1.QueryUnreceivedAcksResponse',
  ),
  ibcCoreChannelV1QueryNextSequenceReceiveRequest(
    typeUrl: '/ibc.core.channel.v1.QueryNextSequenceReceiveRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/NextSequenceReceive",
  ),
  ibcCoreChannelV1QueryNextSequenceReceiveResponse(
    typeUrl: '/ibc.core.channel.v1.QueryNextSequenceReceiveResponse',
  ),
  ibcCoreChannelV1QueryNextSequenceSendRequest(
    typeUrl: '/ibc.core.channel.v1.QueryNextSequenceSendRequest',
    serviceUrl: "/ibc.core.channel.v1.Query/NextSequenceSend",
  ),
  ibcCoreChannelV1QueryNextSequenceSendResponse(
    typeUrl: '/ibc.core.channel.v1.QueryNextSequenceSendResponse',
  ),
  ibcCoreChannelV1Channel(typeUrl: '/ibc.core.channel.v1.Channel'),
  ibcCoreChannelV1IdentifiedChannel(
    typeUrl: '/ibc.core.channel.v1.IdentifiedChannel',
  ),
  ibcCoreChannelV1Counterparty(typeUrl: '/ibc.core.channel.v1.Counterparty'),
  ibcCoreChannelV1Packet(typeUrl: '/ibc.core.channel.v1.Packet'),
  ibcCoreChannelV1PacketState(typeUrl: '/ibc.core.channel.v1.PacketState'),
  ibcCoreChannelV1MsgChannelOpenInit(
    typeUrl: '/ibc.core.channel.v1.MsgChannelOpenInit',
    serviceUrl: "/ibc.core.channel.v1.Msg/ChannelOpenInit",
  ),
  ibcCoreChannelV1MsgChannelOpenInitResponse(
    typeUrl: '/ibc.core.channel.v1.MsgChannelOpenInitResponse',
  ),
  ibcCoreChannelV1MsgChannelOpenTry(
    typeUrl: '/ibc.core.channel.v1.MsgChannelOpenTry',
    serviceUrl: "/ibc.core.channel.v1.Msg/ChannelOpenTry",
  ),
  ibcCoreChannelV1MsgChannelOpenTryResponse(
    typeUrl: '/ibc.core.channel.v1.MsgChannelOpenTryResponse',
  ),
  ibcCoreChannelV1MsgChannelOpenAck(
    typeUrl: '/ibc.core.channel.v1.MsgChannelOpenAck',
    serviceUrl: "/ibc.core.channel.v1.Msg/ChannelOpenAck",
  ),
  ibcCoreChannelV1MsgChannelOpenAckResponse(
    typeUrl: '/ibc.core.channel.v1.MsgChannelOpenAckResponse',
  ),
  ibcCoreChannelV1MsgChannelOpenConfirm(
    typeUrl: '/ibc.core.channel.v1.MsgChannelOpenConfirm',
    serviceUrl: "/ibc.core.channel.v1.Msg/ChannelOpenConfirm",
  ),
  ibcCoreChannelV1MsgChannelOpenConfirmResponse(
    typeUrl: '/ibc.core.channel.v1.MsgChannelOpenConfirmResponse',
  ),
  ibcCoreChannelV1MsgChannelCloseInit(
    typeUrl: '/ibc.core.channel.v1.MsgChannelCloseInit',
    serviceUrl: "/ibc.core.channel.v1.Msg/ChannelCloseInit",
  ),
  ibcCoreChannelV1MsgChannelCloseInitResponse(
    typeUrl: '/ibc.core.channel.v1.MsgChannelCloseInitResponse',
  ),
  ibcCoreChannelV1MsgChannelCloseConfirm(
    typeUrl: '/ibc.core.channel.v1.MsgChannelCloseConfirm',
    serviceUrl: "/ibc.core.channel.v1.Msg/ChannelCloseConfirm",
  ),
  ibcCoreChannelV1MsgChannelCloseConfirmResponse(
    typeUrl: '/ibc.core.channel.v1.MsgChannelCloseConfirmResponse',
  ),
  ibcCoreChannelV1MsgRecvPacket(
    typeUrl: '/ibc.core.channel.v1.MsgRecvPacket',
    serviceUrl: "/ibc.core.channel.v1.Msg/RecvPacket",
  ),
  ibcCoreChannelV1MsgRecvPacketResponse(
    typeUrl: '/ibc.core.channel.v1.MsgRecvPacketResponse',
  ),
  ibcCoreChannelV1MsgTimeout(
    typeUrl: '/ibc.core.channel.v1.MsgTimeout',
    serviceUrl: "/ibc.core.channel.v1.Msg/Timeout",
  ),
  ibcCoreChannelV1MsgTimeoutResponse(
    typeUrl: '/ibc.core.channel.v1.MsgTimeoutResponse',
  ),
  ibcCoreChannelV1MsgTimeoutOnClose(
    typeUrl: '/ibc.core.channel.v1.MsgTimeoutOnClose',
    serviceUrl: "/ibc.core.channel.v1.Msg/TimeoutOnClose",
  ),
  ibcCoreChannelV1MsgTimeoutOnCloseResponse(
    typeUrl: '/ibc.core.channel.v1.MsgTimeoutOnCloseResponse',
  ),
  ibcCoreChannelV1MsgAcknowledgement(
    typeUrl: '/ibc.core.channel.v1.MsgAcknowledgement',
    serviceUrl: "/ibc.core.channel.v1.Msg/Acknowledgement",
  ),
  ibcCoreChannelV1MsgAcknowledgementResponse(
    typeUrl: '/ibc.core.channel.v1.MsgAcknowledgementResponse',
  ),
  ibcCoreConnectionV1QueryConnectionRequest(
    typeUrl: '/ibc.core.connection.v1.QueryConnectionRequest',
    serviceUrl: "/ibc.core.connection.v1.Query/Connection",
  ),
  ibcCoreConnectionV1QueryConnectionResponse(
    typeUrl: '/ibc.core.connection.v1.QueryConnectionResponse',
  ),
  ibcCoreConnectionV1QueryConnectionsRequest(
    typeUrl: '/ibc.core.connection.v1.QueryConnectionsRequest',
    serviceUrl: "/ibc.core.connection.v1.Query/Connections",
  ),
  ibcCoreConnectionV1QueryConnectionsResponse(
    typeUrl: '/ibc.core.connection.v1.QueryConnectionsResponse',
  ),
  ibcCoreConnectionV1QueryClientConnectionsRequest(
    typeUrl: '/ibc.core.connection.v1.QueryClientConnectionsRequest',
    serviceUrl: "/ibc.core.connection.v1.Query/ClientConnections",
  ),
  ibcCoreConnectionV1QueryClientConnectionsResponse(
    typeUrl: '/ibc.core.connection.v1.QueryClientConnectionsResponse',
  ),
  ibcCoreConnectionV1QueryConnectionClientStateRequest(
    typeUrl: '/ibc.core.connection.v1.QueryConnectionClientStateRequest',
    serviceUrl: "/ibc.core.connection.v1.Query/ConnectionClientState",
  ),
  ibcCoreConnectionV1QueryConnectionClientStateResponse(
    typeUrl: '/ibc.core.connection.v1.QueryConnectionClientStateResponse',
  ),
  ibcCoreConnectionV1QueryConnectionConsensusStateRequest(
    typeUrl: '/ibc.core.connection.v1.QueryConnectionConsensusStateRequest',
    serviceUrl: "/ibc.core.connection.v1.Query/ConnectionConsensusState",
  ),
  ibcCoreConnectionV1QueryConnectionConsensusStateResponse(
    typeUrl: '/ibc.core.connection.v1.QueryConnectionConsensusStateResponse',
  ),
  ibcCoreConnectionV1QueryConnectionParamsRequest(
    typeUrl: '/ibc.core.connection.v1.QueryConnectionParamsRequest',
    serviceUrl: "/ibc.core.connection.v1.Query/ConnectionParams",
  ),
  ibcCoreConnectionV1QueryConnectionParamsResponse(
    typeUrl: '/ibc.core.connection.v1.QueryConnectionParamsResponse',
  ),
  ibcCoreConnectionV1ConnectionEnd(
    typeUrl: '/ibc.core.connection.v1.ConnectionEnd',
  ),
  ibcCoreConnectionV1IdentifiedConnection(
    typeUrl: '/ibc.core.connection.v1.IdentifiedConnection',
  ),
  ibcCoreConnectionV1Counterparty(
    typeUrl: '/ibc.core.connection.v1.Counterparty',
  ),
  ibcCoreConnectionV1Version(typeUrl: '/ibc.core.connection.v1.Version'),
  ibcCoreConnectionV1Params(typeUrl: '/ibc.core.connection.v1.Params'),
  ibcCoreConnectionV1MsgConnectionOpenInit(
    typeUrl: '/ibc.core.connection.v1.MsgConnectionOpenInit',
    serviceUrl: "/ibc.core.connection.v1.Msg/ConnectionOpenInit",
  ),
  ibcCoreConnectionV1MsgConnectionOpenInitResponse(
    typeUrl: '/ibc.core.connection.v1.MsgConnectionOpenInitResponse',
  ),
  ibcCoreConnectionV1MsgConnectionOpenTry(
    typeUrl: '/ibc.core.connection.v1.MsgConnectionOpenTry',
    serviceUrl: "/ibc.core.connection.v1.Msg/ConnectionOpenTry",
  ),
  ibcCoreConnectionV1MsgConnectionOpenTryResponse(
    typeUrl: '/ibc.core.connection.v1.MsgConnectionOpenTryResponse',
  ),
  ibcCoreConnectionV1MsgConnectionOpenAck(
    typeUrl: '/ibc.core.connection.v1.MsgConnectionOpenAck',
    serviceUrl: "/ibc.core.connection.v1.Msg/ConnectionOpenAck",
  ),
  ibcCoreConnectionV1MsgConnectionOpenAckResponse(
    typeUrl: '/ibc.core.connection.v1.MsgConnectionOpenAckResponse',
  ),
  ibcCoreConnectionV1MsgConnectionOpenConfirm(
    typeUrl: '/ibc.core.connection.v1.MsgConnectionOpenConfirm',
    serviceUrl: "/ibc.core.connection.v1.Msg/ConnectionOpenConfirm",
  ),
  ibcCoreConnectionV1MsgConnectionOpenConfirmResponse(
    typeUrl: '/ibc.core.connection.v1.MsgConnectionOpenConfirmResponse',
  ),
  ibcCoreConnectionV1MsgUpdateParams(
    typeUrl: '/ibc.core.connection.v1.MsgUpdateParams',
    serviceUrl: "/ibc.core.connection.v1.Msg/UpdateConnectionParams",
  ),
  ibcCoreConnectionV1MsgUpdateParamsResponse(
    typeUrl: '/ibc.core.connection.v1.MsgUpdateParamsResponse',
  ),
  ibcCoreCommitmentV2MerklePath(typeUrl: '/ibc.core.commitment.v2.MerklePath'),
  ibcCoreCommitmentV1MerklePrefix(
    typeUrl: '/ibc.core.commitment.v1.MerklePrefix',
  ),
  ibcCoreClientV2CounterpartyInfo(
    typeUrl: '/ibc.core.client.v2.CounterpartyInfo',
  ),
  ibcCoreClientV2QueryCounterpartyInfoRequest(
    typeUrl: '/ibc.core.client.v2.QueryCounterpartyInfoRequest',
    serviceUrl: "/ibc.core.client.v2.Query/CounterpartyInfo",
  ),
  ibcCoreClientV2QueryCounterpartyInfoResponse(
    typeUrl: '/ibc.core.client.v2.QueryCounterpartyInfoResponse',
  ),
  ibcCoreClientV2QueryConfigRequest(
    typeUrl: '/ibc.core.client.v2.QueryConfigRequest',
    serviceUrl: "/ibc.core.client.v2.Query/Config",
  ),
  ibcCoreClientV2QueryConfigResponse(
    typeUrl: '/ibc.core.client.v2.QueryConfigResponse',
  ),
  ibcCoreClientV2Config(typeUrl: '/ibc.core.client.v2.Config'),
  ibcCoreClientV2MsgRegisterCounterparty(
    typeUrl: '/ibc.core.client.v2.MsgRegisterCounterparty',
    serviceUrl: "/ibc.core.client.v2.Msg/RegisterCounterparty",
  ),
  ibcCoreClientV2MsgRegisterCounterpartyResponse(
    typeUrl: '/ibc.core.client.v2.MsgRegisterCounterpartyResponse',
  ),
  ibcCoreClientV2MsgUpdateClientConfig(
    typeUrl: '/ibc.core.client.v2.MsgUpdateClientConfig',
    serviceUrl: "/ibc.core.client.v2.Msg/UpdateClientConfig",
  ),
  ibcCoreClientV2MsgUpdateClientConfigResponse(
    typeUrl: '/ibc.core.client.v2.MsgUpdateClientConfigResponse',
  ),
  ibcCoreClientV1QueryClientStateRequest(
    typeUrl: '/ibc.core.client.v1.QueryClientStateRequest',
    serviceUrl: "/ibc.core.client.v1.Query/ClientState",
  ),
  ibcCoreClientV1QueryClientStateResponse(
    typeUrl: '/ibc.core.client.v1.QueryClientStateResponse',
  ),
  ibcCoreClientV1QueryClientStatesRequest(
    typeUrl: '/ibc.core.client.v1.QueryClientStatesRequest',
    serviceUrl: "/ibc.core.client.v1.Query/ClientStates",
  ),
  ibcCoreClientV1QueryClientStatesResponse(
    typeUrl: '/ibc.core.client.v1.QueryClientStatesResponse',
  ),
  ibcCoreClientV1QueryConsensusStateRequest(
    typeUrl: '/ibc.core.client.v1.QueryConsensusStateRequest',
    serviceUrl: "/ibc.core.client.v1.Query/ConsensusState",
  ),
  ibcCoreClientV1QueryConsensusStateResponse(
    typeUrl: '/ibc.core.client.v1.QueryConsensusStateResponse',
  ),
  ibcCoreClientV1QueryConsensusStatesRequest(
    typeUrl: '/ibc.core.client.v1.QueryConsensusStatesRequest',
    serviceUrl: "/ibc.core.client.v1.Query/ConsensusStates",
  ),
  ibcCoreClientV1QueryConsensusStatesResponse(
    typeUrl: '/ibc.core.client.v1.QueryConsensusStatesResponse',
  ),
  ibcCoreClientV1QueryConsensusStateHeightsRequest(
    typeUrl: '/ibc.core.client.v1.QueryConsensusStateHeightsRequest',
    serviceUrl: "/ibc.core.client.v1.Query/ConsensusStateHeights",
  ),
  ibcCoreClientV1QueryConsensusStateHeightsResponse(
    typeUrl: '/ibc.core.client.v1.QueryConsensusStateHeightsResponse',
  ),
  ibcCoreClientV1QueryClientStatusRequest(
    typeUrl: '/ibc.core.client.v1.QueryClientStatusRequest',
    serviceUrl: "/ibc.core.client.v1.Query/ClientStatus",
  ),
  ibcCoreClientV1QueryClientStatusResponse(
    typeUrl: '/ibc.core.client.v1.QueryClientStatusResponse',
  ),
  ibcCoreClientV1QueryClientParamsRequest(
    typeUrl: '/ibc.core.client.v1.QueryClientParamsRequest',
    serviceUrl: "/ibc.core.client.v1.Query/ClientParams",
  ),
  ibcCoreClientV1QueryClientParamsResponse(
    typeUrl: '/ibc.core.client.v1.QueryClientParamsResponse',
  ),
  ibcCoreClientV1QueryClientCreatorRequest(
    typeUrl: '/ibc.core.client.v1.QueryClientCreatorRequest',
    serviceUrl: "/ibc.core.client.v1.Query/ClientCreator",
  ),
  ibcCoreClientV1QueryClientCreatorResponse(
    typeUrl: '/ibc.core.client.v1.QueryClientCreatorResponse',
  ),
  ibcCoreClientV1QueryUpgradedClientStateRequest(
    typeUrl: '/ibc.core.client.v1.QueryUpgradedClientStateRequest',
    serviceUrl: "/ibc.core.client.v1.Query/UpgradedClientState",
  ),
  ibcCoreClientV1QueryUpgradedClientStateResponse(
    typeUrl: '/ibc.core.client.v1.QueryUpgradedClientStateResponse',
  ),
  ibcCoreClientV1QueryUpgradedConsensusStateRequest(
    typeUrl: '/ibc.core.client.v1.QueryUpgradedConsensusStateRequest',
    serviceUrl: "/ibc.core.client.v1.Query/UpgradedConsensusState",
  ),
  ibcCoreClientV1QueryUpgradedConsensusStateResponse(
    typeUrl: '/ibc.core.client.v1.QueryUpgradedConsensusStateResponse',
  ),
  ibcCoreClientV1QueryVerifyMembershipRequest(
    typeUrl: '/ibc.core.client.v1.QueryVerifyMembershipRequest',
    serviceUrl: "/ibc.core.client.v1.Query/VerifyMembership",
  ),
  ibcCoreClientV1QueryVerifyMembershipResponse(
    typeUrl: '/ibc.core.client.v1.QueryVerifyMembershipResponse',
  ),
  ibcCoreClientV1IdentifiedClientState(
    typeUrl: '/ibc.core.client.v1.IdentifiedClientState',
  ),
  ibcCoreClientV1ConsensusStateWithHeight(
    typeUrl: '/ibc.core.client.v1.ConsensusStateWithHeight',
  ),
  ibcCoreClientV1Height(typeUrl: '/ibc.core.client.v1.Height'),
  ibcCoreClientV1Params(typeUrl: '/ibc.core.client.v1.Params'),
  ibcCoreClientV1MsgCreateClient(
    typeUrl: '/ibc.core.client.v1.MsgCreateClient',
    serviceUrl: "/ibc.core.client.v1.Msg/CreateClient",
  ),
  ibcCoreClientV1MsgCreateClientResponse(
    typeUrl: '/ibc.core.client.v1.MsgCreateClientResponse',
  ),
  ibcCoreClientV1MsgUpdateClient(
    typeUrl: '/ibc.core.client.v1.MsgUpdateClient',
    serviceUrl: "/ibc.core.client.v1.Msg/UpdateClient",
  ),
  ibcCoreClientV1MsgUpdateClientResponse(
    typeUrl: '/ibc.core.client.v1.MsgUpdateClientResponse',
  ),
  ibcCoreClientV1MsgUpgradeClient(
    typeUrl: '/ibc.core.client.v1.MsgUpgradeClient',
    serviceUrl: "/ibc.core.client.v1.Msg/UpgradeClient",
  ),
  ibcCoreClientV1MsgUpgradeClientResponse(
    typeUrl: '/ibc.core.client.v1.MsgUpgradeClientResponse',
  ),
  ibcCoreClientV1MsgSubmitMisbehaviour(
    typeUrl: '/ibc.core.client.v1.MsgSubmitMisbehaviour',
    serviceUrl: "/ibc.core.client.v1.Msg/SubmitMisbehaviour",
  ),
  ibcCoreClientV1MsgSubmitMisbehaviourResponse(
    typeUrl: '/ibc.core.client.v1.MsgSubmitMisbehaviourResponse',
  ),
  ibcCoreClientV1MsgRecoverClient(
    typeUrl: '/ibc.core.client.v1.MsgRecoverClient',
    serviceUrl: "/ibc.core.client.v1.Msg/RecoverClient",
    aminoType: "cosmos-sdk/MsgRecoverClient",
  ),
  ibcCoreClientV1MsgRecoverClientResponse(
    typeUrl: '/ibc.core.client.v1.MsgRecoverClientResponse',
  ),
  ibcCoreClientV1MsgIBCSoftwareUpgrade(
    typeUrl: '/ibc.core.client.v1.MsgIBCSoftwareUpgrade',
    serviceUrl: "/ibc.core.client.v1.Msg/IBCSoftwareUpgrade",
  ),
  ibcCoreClientV1MsgIBCSoftwareUpgradeResponse(
    typeUrl: '/ibc.core.client.v1.MsgIBCSoftwareUpgradeResponse',
  ),
  ibcCoreClientV1MsgUpdateParams(
    typeUrl: '/ibc.core.client.v1.MsgUpdateParams',
    serviceUrl: "/ibc.core.client.v1.Msg/UpdateClientParams",
  ),
  ibcCoreClientV1MsgUpdateParamsResponse(
    typeUrl: '/ibc.core.client.v1.MsgUpdateParamsResponse',
  ),
  ibcCoreClientV1MsgDeleteClientCreator(
    typeUrl: '/ibc.core.client.v1.MsgDeleteClientCreator',
    serviceUrl: "/ibc.core.client.v1.Msg/DeleteClientCreator",
  ),
  ibcCoreClientV1MsgDeleteClientCreatorResponse(
    typeUrl: '/ibc.core.client.v1.MsgDeleteClientCreatorResponse',
  ),
  ibcLightclientsWasmV1QueryChecksumsRequest(
    typeUrl: '/ibc.lightclients.wasm.v1.QueryChecksumsRequest',
    serviceUrl: "/ibc.lightclients.wasm.v1.Query/Checksums",
  ),
  ibcLightclientsWasmV1QueryChecksumsResponse(
    typeUrl: '/ibc.lightclients.wasm.v1.QueryChecksumsResponse',
  ),
  ibcLightclientsWasmV1QueryCodeRequest(
    typeUrl: '/ibc.lightclients.wasm.v1.QueryCodeRequest',
    serviceUrl: "/ibc.lightclients.wasm.v1.Query/Code",
  ),
  ibcLightclientsWasmV1QueryCodeResponse(
    typeUrl: '/ibc.lightclients.wasm.v1.QueryCodeResponse',
  ),
  ibcLightclientsWasmV1MsgStoreCode(
    typeUrl: '/ibc.lightclients.wasm.v1.MsgStoreCode',
    serviceUrl: "/ibc.lightclients.wasm.v1.Msg/StoreCode",
  ),
  ibcLightclientsWasmV1MsgStoreCodeResponse(
    typeUrl: '/ibc.lightclients.wasm.v1.MsgStoreCodeResponse',
  ),
  ibcLightclientsWasmV1MsgRemoveChecksum(
    typeUrl: '/ibc.lightclients.wasm.v1.MsgRemoveChecksum',
    serviceUrl: "/ibc.lightclients.wasm.v1.Msg/RemoveChecksum",
  ),
  ibcLightclientsWasmV1MsgRemoveChecksumResponse(
    typeUrl: '/ibc.lightclients.wasm.v1.MsgRemoveChecksumResponse',
  ),
  ibcLightclientsWasmV1MsgMigrateContract(
    typeUrl: '/ibc.lightclients.wasm.v1.MsgMigrateContract',
    serviceUrl: "/ibc.lightclients.wasm.v1.Msg/MigrateContract",
  ),
  ibcLightclientsWasmV1MsgMigrateContractResponse(
    typeUrl: '/ibc.lightclients.wasm.v1.MsgMigrateContractResponse',
  ),
  ibcApplicationsInterchainAccountsHostV1QueryParamsRequest(
    typeUrl: '/ibc.applications.interchain_accounts.host.v1.QueryParamsRequest',
    serviceUrl: "/ibc.applications.interchain_accounts.host.v1.Query/Params",
  ),
  ibcApplicationsInterchainAccountsHostV1QueryParamsResponse(
    typeUrl:
        '/ibc.applications.interchain_accounts.host.v1.QueryParamsResponse',
  ),
  ibcApplicationsInterchainAccountsHostV1Params(
    typeUrl: '/ibc.applications.interchain_accounts.host.v1.Params',
  ),
  ibcApplicationsInterchainAccountsHostV1QueryRequest(
    typeUrl: '/ibc.applications.interchain_accounts.host.v1.QueryRequest',
  ),
  ibcApplicationsInterchainAccountsHostV1MsgUpdateParams(
    typeUrl: '/ibc.applications.interchain_accounts.host.v1.MsgUpdateParams',
    serviceUrl:
        "/ibc.applications.interchain_accounts.host.v1.Msg/UpdateParams",
  ),
  ibcApplicationsInterchainAccountsHostV1MsgUpdateParamsResponse(
    typeUrl:
        '/ibc.applications.interchain_accounts.host.v1.MsgUpdateParamsResponse',
  ),
  ibcApplicationsInterchainAccountsHostV1MsgModuleQuerySafe(
    typeUrl: '/ibc.applications.interchain_accounts.host.v1.MsgModuleQuerySafe',
    serviceUrl:
        "/ibc.applications.interchain_accounts.host.v1.Msg/ModuleQuerySafe",
  ),
  ibcApplicationsInterchainAccountsHostV1MsgModuleQuerySafeResponse(
    typeUrl:
        '/ibc.applications.interchain_accounts.host.v1.MsgModuleQuerySafeResponse',
  ),
  ibcApplicationsInterchainAccountsControllerV1QueryInterchainAccountRequest(
    typeUrl:
        '/ibc.applications.interchain_accounts.controller.v1.QueryInterchainAccountRequest',
    serviceUrl:
        "/ibc.applications.interchain_accounts.controller.v1.Query/InterchainAccount",
  ),
  ibcApplicationsInterchainAccountsControllerV1QueryInterchainAccountResponse(
    typeUrl:
        '/ibc.applications.interchain_accounts.controller.v1.QueryInterchainAccountResponse',
  ),
  ibcApplicationsInterchainAccountsControllerV1QueryParamsRequest(
    typeUrl:
        '/ibc.applications.interchain_accounts.controller.v1.QueryParamsRequest',
    serviceUrl:
        "/ibc.applications.interchain_accounts.controller.v1.Query/Params",
  ),
  ibcApplicationsInterchainAccountsControllerV1QueryParamsResponse(
    typeUrl:
        '/ibc.applications.interchain_accounts.controller.v1.QueryParamsResponse',
  ),
  ibcApplicationsInterchainAccountsControllerV1Params(
    typeUrl: '/ibc.applications.interchain_accounts.controller.v1.Params',
  ),
  ibcApplicationsInterchainAccountsControllerV1MsgRegisterInterchainAccount(
    typeUrl:
        '/ibc.applications.interchain_accounts.controller.v1.MsgRegisterInterchainAccount',
    serviceUrl:
        "/ibc.applications.interchain_accounts.controller.v1.Msg/RegisterInterchainAccount",
  ),
  ibcApplicationsInterchainAccountsControllerV1MsgRegisterInterchainAccountResponse(
    typeUrl:
        '/ibc.applications.interchain_accounts.controller.v1.MsgRegisterInterchainAccountResponse',
  ),
  ibcApplicationsInterchainAccountsControllerV1MsgSendTx(
    typeUrl: '/ibc.applications.interchain_accounts.controller.v1.MsgSendTx',
    serviceUrl:
        "/ibc.applications.interchain_accounts.controller.v1.Msg/SendTx",
  ),
  ibcApplicationsInterchainAccountsControllerV1MsgSendTxResponse(
    typeUrl:
        '/ibc.applications.interchain_accounts.controller.v1.MsgSendTxResponse',
  ),
  ibcApplicationsInterchainAccountsControllerV1MsgUpdateParams(
    typeUrl:
        '/ibc.applications.interchain_accounts.controller.v1.MsgUpdateParams',
    serviceUrl:
        "/ibc.applications.interchain_accounts.controller.v1.Msg/UpdateParams",
  ),
  ibcApplicationsInterchainAccountsControllerV1MsgUpdateParamsResponse(
    typeUrl:
        '/ibc.applications.interchain_accounts.controller.v1.MsgUpdateParamsResponse',
  ),
  ibcApplicationsInterchainAccountsV1InterchainAccountPacketData(
    typeUrl:
        '/ibc.applications.interchain_accounts.v1.InterchainAccountPacketData',
  ),
  ibcApplicationsTransferV1QueryParamsRequest(
    typeUrl: '/ibc.applications.transfer.v1.QueryParamsRequest',
    serviceUrl: "/ibc.applications.transfer.v1.Query/Params",
  ),
  ibcApplicationsTransferV1QueryParamsResponse(
    typeUrl: '/ibc.applications.transfer.v1.QueryParamsResponse',
  ),
  ibcApplicationsTransferV1QueryDenomRequest(
    typeUrl: '/ibc.applications.transfer.v1.QueryDenomRequest',
    serviceUrl: "/ibc.applications.transfer.v1.Query/Denom",
  ),
  ibcApplicationsTransferV1QueryDenomResponse(
    typeUrl: '/ibc.applications.transfer.v1.QueryDenomResponse',
  ),
  ibcApplicationsTransferV1QueryDenomsRequest(
    typeUrl: '/ibc.applications.transfer.v1.QueryDenomsRequest',
    serviceUrl: "/ibc.applications.transfer.v1.Query/Denoms",
  ),
  ibcApplicationsTransferV1QueryDenomsResponse(
    typeUrl: '/ibc.applications.transfer.v1.QueryDenomsResponse',
  ),
  ibcApplicationsTransferV1QueryDenomHashRequest(
    typeUrl: '/ibc.applications.transfer.v1.QueryDenomHashRequest',
    serviceUrl: "/ibc.applications.transfer.v1.Query/DenomHash",
  ),
  ibcApplicationsTransferV1QueryDenomHashResponse(
    typeUrl: '/ibc.applications.transfer.v1.QueryDenomHashResponse',
  ),
  ibcApplicationsTransferV1QueryEscrowAddressRequest(
    typeUrl: '/ibc.applications.transfer.v1.QueryEscrowAddressRequest',
    serviceUrl: "/ibc.applications.transfer.v1.Query/EscrowAddress",
  ),
  ibcApplicationsTransferV1QueryEscrowAddressResponse(
    typeUrl: '/ibc.applications.transfer.v1.QueryEscrowAddressResponse',
  ),
  ibcApplicationsTransferV1QueryTotalEscrowForDenomRequest(
    typeUrl: '/ibc.applications.transfer.v1.QueryTotalEscrowForDenomRequest',
    serviceUrl: "/ibc.applications.transfer.v1.Query/TotalEscrowForDenom",
  ),
  ibcApplicationsTransferV1QueryTotalEscrowForDenomResponse(
    typeUrl: '/ibc.applications.transfer.v1.QueryTotalEscrowForDenomResponse',
  ),
  ibcApplicationsTransferV1Params(
    typeUrl: '/ibc.applications.transfer.v1.Params',
  ),
  ibcApplicationsTransferV1Denom(
    typeUrl: '/ibc.applications.transfer.v1.Denom',
  ),
  ibcApplicationsTransferV1Hop(typeUrl: '/ibc.applications.transfer.v1.Hop'),
  ibcApplicationsTransferV1MsgTransfer(
    typeUrl: '/ibc.applications.transfer.v1.MsgTransfer',
    serviceUrl: "/ibc.applications.transfer.v1.Msg/Transfer",
    aminoType: "cosmos-sdk/MsgTransfer",
  ),
  ibcApplicationsTransferV1MsgTransferResponse(
    typeUrl: '/ibc.applications.transfer.v1.MsgTransferResponse',
  ),
  ibcApplicationsTransferV1MsgUpdateParams(
    typeUrl: '/ibc.applications.transfer.v1.MsgUpdateParams',
    serviceUrl: "/ibc.applications.transfer.v1.Msg/UpdateParams",
  ),
  ibcApplicationsTransferV1MsgUpdateParamsResponse(
    typeUrl: '/ibc.applications.transfer.v1.MsgUpdateParamsResponse',
  ),
  googleProtobufAny(typeUrl: '/google.protobuf.Any'),
  googleProtobufFileDescriptorProto(
    typeUrl: '/google.protobuf.FileDescriptorProto',
  ),
  googleProtobufDescriptorProto(typeUrl: '/google.protobuf.DescriptorProto'),
  googleProtobufDescriptorProtoExtensionRange(
    typeUrl: '/google.protobuf.DescriptorProto.ExtensionRange',
  ),
  googleProtobufDescriptorProtoReservedRange(
    typeUrl: '/google.protobuf.DescriptorProto.ReservedRange',
  ),
  googleProtobufExtensionRangeOptions(
    typeUrl: '/google.protobuf.ExtensionRangeOptions',
  ),
  googleProtobufExtensionRangeOptionsDeclaration(
    typeUrl: '/google.protobuf.ExtensionRangeOptions.Declaration',
  ),
  googleProtobufFieldDescriptorProto(
    typeUrl: '/google.protobuf.FieldDescriptorProto',
  ),
  googleProtobufOneofDescriptorProto(
    typeUrl: '/google.protobuf.OneofDescriptorProto',
  ),
  googleProtobufEnumDescriptorProto(
    typeUrl: '/google.protobuf.EnumDescriptorProto',
  ),
  googleProtobufEnumDescriptorProtoEnumReservedRange(
    typeUrl: '/google.protobuf.EnumDescriptorProto.EnumReservedRange',
  ),
  googleProtobufEnumValueDescriptorProto(
    typeUrl: '/google.protobuf.EnumValueDescriptorProto',
  ),
  googleProtobufServiceDescriptorProto(
    typeUrl: '/google.protobuf.ServiceDescriptorProto',
  ),
  googleProtobufMethodDescriptorProto(
    typeUrl: '/google.protobuf.MethodDescriptorProto',
  ),
  googleProtobufFileOptions(typeUrl: '/google.protobuf.FileOptions'),
  googleProtobufMessageOptions(typeUrl: '/google.protobuf.MessageOptions'),
  googleProtobufFieldOptions(typeUrl: '/google.protobuf.FieldOptions'),
  googleProtobufFieldOptionsEditionDefault(
    typeUrl: '/google.protobuf.FieldOptions.EditionDefault',
  ),
  googleProtobufFieldOptionsFeatureSupport(
    typeUrl: '/google.protobuf.FieldOptions.FeatureSupport',
  ),
  googleProtobufOneofOptions(typeUrl: '/google.protobuf.OneofOptions'),
  googleProtobufEnumOptions(typeUrl: '/google.protobuf.EnumOptions'),
  googleProtobufEnumValueOptions(typeUrl: '/google.protobuf.EnumValueOptions'),
  googleProtobufServiceOptions(typeUrl: '/google.protobuf.ServiceOptions'),
  googleProtobufMethodOptions(typeUrl: '/google.protobuf.MethodOptions'),
  googleProtobufUninterpretedOption(
    typeUrl: '/google.protobuf.UninterpretedOption',
  ),
  googleProtobufUninterpretedOptionNamePart(
    typeUrl: '/google.protobuf.UninterpretedOption.NamePart',
  ),
  googleProtobufFeatureSet(typeUrl: '/google.protobuf.FeatureSet'),
  googleProtobufSourceCodeInfo(typeUrl: '/google.protobuf.SourceCodeInfo'),
  googleProtobufSourceCodeInfoLocation(
    typeUrl: '/google.protobuf.SourceCodeInfo.Location',
  ),
  googleProtobufEmpty(
    typeUrl: '/google.protobuf.Empty',
    serviceUrl: "/google.protobuf.Query/Codes",
  ),
  googleProtobufTimestamp(typeUrl: '/google.protobuf.Timestamp'),
  googleProtobufDuration(typeUrl: '/google.protobuf.Duration'),
  cosmosEvmErc20V1QueryTokenPairsRequest(
    typeUrl: '/cosmos.evm.erc20.v1.QueryTokenPairsRequest',
    serviceUrl: "/cosmos.evm.erc20.v1.Query/TokenPairs",
  ),
  cosmosEvmErc20V1QueryTokenPairsResponse(
    typeUrl: '/cosmos.evm.erc20.v1.QueryTokenPairsResponse',
  ),
  cosmosEvmErc20V1QueryTokenPairRequest(
    typeUrl: '/cosmos.evm.erc20.v1.QueryTokenPairRequest',
    serviceUrl: "/cosmos.evm.erc20.v1.Query/TokenPair",
  ),
  cosmosEvmErc20V1QueryTokenPairResponse(
    typeUrl: '/cosmos.evm.erc20.v1.QueryTokenPairResponse',
  ),
  cosmosEvmErc20V1QueryParamsRequest(
    typeUrl: '/cosmos.evm.erc20.v1.QueryParamsRequest',
    serviceUrl: "/cosmos.evm.erc20.v1.Query/Params",
  ),
  cosmosEvmErc20V1QueryParamsResponse(
    typeUrl: '/cosmos.evm.erc20.v1.QueryParamsResponse',
  ),
  cosmosEvmErc20V1Params(typeUrl: '/cosmos.evm.erc20.v1.Params'),
  cosmosEvmErc20V1TokenPair(typeUrl: '/cosmos.evm.erc20.v1.TokenPair'),
  cosmosEvmErc20V1MsgConvertERC20(
    typeUrl: '/cosmos.evm.erc20.v1.MsgConvertERC20',
    serviceUrl: "/cosmos.evm.erc20.v1.Msg/ConvertERC20",
    aminoType: "cosmos/evm/MsgConvertERC20",
  ),
  cosmosEvmErc20V1MsgConvertERC20Response(
    typeUrl: '/cosmos.evm.erc20.v1.MsgConvertERC20Response',
  ),
  cosmosEvmErc20V1MsgConvertCoin(
    typeUrl: '/cosmos.evm.erc20.v1.MsgConvertCoin',
    serviceUrl: "/cosmos.evm.erc20.v1.Msg/ConvertCoin",
    aminoType: "cosmos/evm/x/erc20/MsgConvertCoin",
  ),
  cosmosEvmErc20V1MsgConvertCoinResponse(
    typeUrl: '/cosmos.evm.erc20.v1.MsgConvertCoinResponse',
  ),
  cosmosEvmErc20V1MsgUpdateParams(
    typeUrl: '/cosmos.evm.erc20.v1.MsgUpdateParams',
    serviceUrl: "/cosmos.evm.erc20.v1.Msg/UpdateParams",
    aminoType: "cosmos/evm/x/erc20/MsgUpdateParams",
  ),
  cosmosEvmErc20V1MsgUpdateParamsResponse(
    typeUrl: '/cosmos.evm.erc20.v1.MsgUpdateParamsResponse',
  ),
  cosmosEvmErc20V1MsgRegisterERC20(
    typeUrl: '/cosmos.evm.erc20.v1.MsgRegisterERC20',
    serviceUrl: "/cosmos.evm.erc20.v1.Msg/RegisterERC20",
    aminoType: "cosmos/evm/x/erc20/MsgRegisterERC20",
  ),
  cosmosEvmErc20V1MsgRegisterERC20Response(
    typeUrl: '/cosmos.evm.erc20.v1.MsgRegisterERC20Response',
  ),
  cosmosEvmErc20V1MsgToggleConversion(
    typeUrl: '/cosmos.evm.erc20.v1.MsgToggleConversion',
    serviceUrl: "/cosmos.evm.erc20.v1.Msg/ToggleConversion",
    aminoType: "cosmos/evm/x/erc20/MsgToggleConversion",
  ),
  cosmosEvmErc20V1MsgToggleConversionResponse(
    typeUrl: '/cosmos.evm.erc20.v1.MsgToggleConversionResponse',
  ),
  cosmosEvmVmV1QueryConfigRequest(
    typeUrl: '/cosmos.evm.vm.v1.QueryConfigRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/Config",
  ),
  cosmosEvmVmV1QueryConfigResponse(
    typeUrl: '/cosmos.evm.vm.v1.QueryConfigResponse',
  ),
  cosmosEvmVmV1QueryAccountRequest(
    typeUrl: '/cosmos.evm.vm.v1.QueryAccountRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/Account",
  ),
  cosmosEvmVmV1QueryAccountResponse(
    typeUrl: '/cosmos.evm.vm.v1.QueryAccountResponse',
  ),
  cosmosEvmVmV1QueryCosmosAccountRequest(
    typeUrl: '/cosmos.evm.vm.v1.QueryCosmosAccountRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/CosmosAccount",
  ),
  cosmosEvmVmV1QueryCosmosAccountResponse(
    typeUrl: '/cosmos.evm.vm.v1.QueryCosmosAccountResponse',
  ),
  cosmosEvmVmV1QueryValidatorAccountRequest(
    typeUrl: '/cosmos.evm.vm.v1.QueryValidatorAccountRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/ValidatorAccount",
  ),
  cosmosEvmVmV1QueryValidatorAccountResponse(
    typeUrl: '/cosmos.evm.vm.v1.QueryValidatorAccountResponse',
  ),
  cosmosEvmVmV1QueryBalanceRequest(
    typeUrl: '/cosmos.evm.vm.v1.QueryBalanceRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/Balance",
  ),
  cosmosEvmVmV1QueryBalanceResponse(
    typeUrl: '/cosmos.evm.vm.v1.QueryBalanceResponse',
  ),
  cosmosEvmVmV1QueryStorageRequest(
    typeUrl: '/cosmos.evm.vm.v1.QueryStorageRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/Storage",
  ),
  cosmosEvmVmV1QueryStorageResponse(
    typeUrl: '/cosmos.evm.vm.v1.QueryStorageResponse',
  ),
  cosmosEvmVmV1QueryCodeRequest(
    typeUrl: '/cosmos.evm.vm.v1.QueryCodeRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/Code",
  ),
  cosmosEvmVmV1QueryCodeResponse(
    typeUrl: '/cosmos.evm.vm.v1.QueryCodeResponse',
  ),
  cosmosEvmVmV1QueryParamsRequest(
    typeUrl: '/cosmos.evm.vm.v1.QueryParamsRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/Params",
  ),
  cosmosEvmVmV1QueryParamsResponse(
    typeUrl: '/cosmos.evm.vm.v1.QueryParamsResponse',
  ),
  cosmosEvmVmV1EthCallRequest(
    typeUrl: '/cosmos.evm.vm.v1.EthCallRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/EthCall",
  ),
  cosmosEvmVmV1EstimateGasResponse(
    typeUrl: '/cosmos.evm.vm.v1.EstimateGasResponse',
  ),
  cosmosEvmVmV1QueryTraceTxRequest(
    typeUrl: '/cosmos.evm.vm.v1.QueryTraceTxRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/TraceTx",
  ),
  cosmosEvmVmV1QueryTraceTxResponse(
    typeUrl: '/cosmos.evm.vm.v1.QueryTraceTxResponse',
  ),
  cosmosEvmVmV1QueryTraceBlockRequest(
    typeUrl: '/cosmos.evm.vm.v1.QueryTraceBlockRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/TraceBlock",
  ),
  cosmosEvmVmV1QueryTraceBlockResponse(
    typeUrl: '/cosmos.evm.vm.v1.QueryTraceBlockResponse',
  ),
  cosmosEvmVmV1QueryTraceCallRequest(
    typeUrl: '/cosmos.evm.vm.v1.QueryTraceCallRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/TraceCall",
  ),
  cosmosEvmVmV1QueryTraceCallResponse(
    typeUrl: '/cosmos.evm.vm.v1.QueryTraceCallResponse',
  ),
  cosmosEvmVmV1QueryBaseFeeRequest(
    typeUrl: '/cosmos.evm.vm.v1.QueryBaseFeeRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/BaseFee",
  ),
  cosmosEvmVmV1QueryBaseFeeResponse(
    typeUrl: '/cosmos.evm.vm.v1.QueryBaseFeeResponse',
  ),
  cosmosEvmVmV1QueryGlobalMinGasPriceRequest(
    typeUrl: '/cosmos.evm.vm.v1.QueryGlobalMinGasPriceRequest',
    serviceUrl: "/cosmos.evm.vm.v1.Query/GlobalMinGasPrice",
  ),
  cosmosEvmVmV1QueryGlobalMinGasPriceResponse(
    typeUrl: '/cosmos.evm.vm.v1.QueryGlobalMinGasPriceResponse',
  ),
  cosmosEvmVmV1Params(
    typeUrl: '/cosmos.evm.vm.v1.Params',
    aminoType: "cosmos/evm/x/vm/Params",
  ),
  cosmosEvmVmV1ExtendedDenomOptions(
    typeUrl: '/cosmos.evm.vm.v1.ExtendedDenomOptions',
  ),
  cosmosEvmVmV1AccessControl(typeUrl: '/cosmos.evm.vm.v1.AccessControl'),
  cosmosEvmVmV1AccessControlType(
    typeUrl: '/cosmos.evm.vm.v1.AccessControlType',
  ),
  cosmosEvmVmV1ChainConfig(typeUrl: '/cosmos.evm.vm.v1.ChainConfig'),
  cosmosEvmVmV1Log(typeUrl: '/cosmos.evm.vm.v1.Log'),
  cosmosEvmVmV1TraceConfig(typeUrl: '/cosmos.evm.vm.v1.TraceConfig'),
  cosmosEvmVmV1Preinstall(typeUrl: '/cosmos.evm.vm.v1.Preinstall'),
  cosmosEvmVmV1MsgEthereumTx(
    typeUrl: '/cosmos.evm.vm.v1.MsgEthereumTx',
    serviceUrl: "/cosmos.evm.vm.v1.Msg/EthereumTx",
    aminoType: "cosmos/evm/MsgEthereumTx",
  ),
  cosmosEvmVmV1MsgEthereumTxResponse(
    typeUrl: '/cosmos.evm.vm.v1.MsgEthereumTxResponse',
  ),
  cosmosEvmVmV1MsgUpdateParams(
    typeUrl: '/cosmos.evm.vm.v1.MsgUpdateParams',
    serviceUrl: "/cosmos.evm.vm.v1.Msg/UpdateParams",
    aminoType: "cosmos/evm/x/vm/MsgUpdateParams",
  ),
  cosmosEvmVmV1MsgUpdateParamsResponse(
    typeUrl: '/cosmos.evm.vm.v1.MsgUpdateParamsResponse',
  ),
  cosmosEvmVmV1MsgRegisterPreinstalls(
    typeUrl: '/cosmos.evm.vm.v1.MsgRegisterPreinstalls',
    serviceUrl: "/cosmos.evm.vm.v1.Msg/RegisterPreinstalls",
    aminoType: "cosmos/evm/x/vm/MsgRegisterPreinstalls",
  ),
  cosmosEvmVmV1MsgRegisterPreinstallsResponse(
    typeUrl: '/cosmos.evm.vm.v1.MsgRegisterPreinstallsResponse',
  ),
  cosmosEvmFeemarketV1QueryParamsRequest(
    typeUrl: '/cosmos.evm.feemarket.v1.QueryParamsRequest',
    serviceUrl: "/cosmos.evm.feemarket.v1.Query/Params",
  ),
  cosmosEvmFeemarketV1QueryParamsResponse(
    typeUrl: '/cosmos.evm.feemarket.v1.QueryParamsResponse',
  ),
  cosmosEvmFeemarketV1QueryBaseFeeRequest(
    typeUrl: '/cosmos.evm.feemarket.v1.QueryBaseFeeRequest',
    serviceUrl: "/cosmos.evm.feemarket.v1.Query/BaseFee",
  ),
  cosmosEvmFeemarketV1QueryBaseFeeResponse(
    typeUrl: '/cosmos.evm.feemarket.v1.QueryBaseFeeResponse',
  ),
  cosmosEvmFeemarketV1QueryBlockGasRequest(
    typeUrl: '/cosmos.evm.feemarket.v1.QueryBlockGasRequest',
    serviceUrl: "/cosmos.evm.feemarket.v1.Query/BlockGas",
  ),
  cosmosEvmFeemarketV1QueryBlockGasResponse(
    typeUrl: '/cosmos.evm.feemarket.v1.QueryBlockGasResponse',
  ),
  cosmosEvmFeemarketV1Params(
    typeUrl: '/cosmos.evm.feemarket.v1.Params',
    aminoType: "cosmos/evm/x/feemarket/Params",
  ),
  cosmosEvmFeemarketV1MsgUpdateParams(
    typeUrl: '/cosmos.evm.feemarket.v1.MsgUpdateParams',
    serviceUrl: "/cosmos.evm.feemarket.v1.Msg/UpdateParams",
    aminoType: "cosmos/evm/x/feemarket/MsgUpdateParams",
  ),
  cosmosEvmFeemarketV1MsgUpdateParamsResponse(
    typeUrl: '/cosmos.evm.feemarket.v1.MsgUpdateParamsResponse',
  ),
  cosmosEvmCryptoV1Ethsecp256k1PubKey(
    typeUrl: '/cosmos.evm.crypto.v1.ethsecp256k1.PubKey',
  ),
  cosmosEvmCryptoV1Ethsecp256k1PrivKey(
    typeUrl: '/cosmos.evm.crypto.v1.ethsecp256k1.PrivKey',
  ),
  ibcApplicationsPermV1QueryChannelStatesRequest(
    typeUrl: '/ibc.applications.perm.v1.QueryChannelStatesRequest',
    serviceUrl: "/ibc.applications.perm.v1.Query/ChannelStates",
  ),
  ibcApplicationsPermV1QueryChannelStatesResponse(
    typeUrl: '/ibc.applications.perm.v1.QueryChannelStatesResponse',
  ),
  ibcApplicationsPermV1QueryChannelStateRequest(
    typeUrl: '/ibc.applications.perm.v1.QueryChannelStateRequest',
    serviceUrl: "/ibc.applications.perm.v1.Query/ChannelState",
  ),
  ibcApplicationsPermV1QueryChannelStateResponse(
    typeUrl: '/ibc.applications.perm.v1.QueryChannelStateResponse',
  ),
  ibcApplicationsPermV1ChannelState(
    typeUrl: '/ibc.applications.perm.v1.ChannelState',
  ),
  ibcApplicationsPermV1MsgUpdateAdmin(
    typeUrl: '/ibc.applications.perm.v1.MsgUpdateAdmin',
    serviceUrl: "/ibc.applications.perm.v1.Msg/UpdateAdmin",
    aminoType: "ibc-perm/MsgUpdateAdmin",
  ),
  ibcApplicationsPermV1MsgUpdateAdminResponse(
    typeUrl: '/ibc.applications.perm.v1.MsgUpdateAdminResponse',
  ),
  ibcApplicationsPermV1MsgUpdatePermissionedRelayers(
    typeUrl: '/ibc.applications.perm.v1.MsgUpdatePermissionedRelayers',
    serviceUrl: "/ibc.applications.perm.v1.Msg/UpdatePermissionedRelayers",
    aminoType: "ibc-perm/MsgUpdatePermissionedRelayers",
  ),
  ibcApplicationsPermV1MsgUpdatePermissionedRelayersResponse(
    typeUrl: '/ibc.applications.perm.v1.MsgUpdatePermissionedRelayersResponse',
  ),
  ibcApplicationsNftTransferV1QueryClassTraceRequest(
    typeUrl: '/ibc.applications.nft_transfer.v1.QueryClassTraceRequest',
    serviceUrl: "/ibc.applications.nft_transfer.v1.Query/ClassTrace",
  ),
  ibcApplicationsNftTransferV1QueryClassTraceResponse(
    typeUrl: '/ibc.applications.nft_transfer.v1.QueryClassTraceResponse',
  ),
  ibcApplicationsNftTransferV1QueryClassTracesRequest(
    typeUrl: '/ibc.applications.nft_transfer.v1.QueryClassTracesRequest',
    serviceUrl: "/ibc.applications.nft_transfer.v1.Query/ClassTraces",
  ),
  ibcApplicationsNftTransferV1QueryClassTracesResponse(
    typeUrl: '/ibc.applications.nft_transfer.v1.QueryClassTracesResponse',
  ),
  ibcApplicationsNftTransferV1QueryClassHashRequest(
    typeUrl: '/ibc.applications.nft_transfer.v1.QueryClassHashRequest',
    serviceUrl: "/ibc.applications.nft_transfer.v1.Query/ClassHash",
  ),
  ibcApplicationsNftTransferV1QueryClassHashResponse(
    typeUrl: '/ibc.applications.nft_transfer.v1.QueryClassHashResponse',
  ),
  ibcApplicationsNftTransferV1QueryClassDataRequest(
    typeUrl: '/ibc.applications.nft_transfer.v1.QueryClassDataRequest',
    serviceUrl: "/ibc.applications.nft_transfer.v1.Query/ClassData",
  ),
  ibcApplicationsNftTransferV1QueryClassDataResponse(
    typeUrl: '/ibc.applications.nft_transfer.v1.QueryClassDataResponse',
  ),
  ibcApplicationsNftTransferV1QueryEscrowAddressRequest(
    typeUrl: '/ibc.applications.nft_transfer.v1.QueryEscrowAddressRequest',
    serviceUrl: "/ibc.applications.nft_transfer.v1.Query/EscrowAddress",
  ),
  ibcApplicationsNftTransferV1QueryEscrowAddressResponse(
    typeUrl: '/ibc.applications.nft_transfer.v1.QueryEscrowAddressResponse',
  ),
  ibcApplicationsNftTransferV1QueryParamsRequest(
    typeUrl: '/ibc.applications.nft_transfer.v1.QueryParamsRequest',
    serviceUrl: "/ibc.applications.nft_transfer.v1.Query/Params",
  ),
  ibcApplicationsNftTransferV1QueryParamsResponse(
    typeUrl: '/ibc.applications.nft_transfer.v1.QueryParamsResponse',
  ),
  ibcApplicationsNftTransferV1ClassTrace(
    typeUrl: '/ibc.applications.nft_transfer.v1.ClassTrace',
  ),
  ibcApplicationsNftTransferV1Params(
    typeUrl: '/ibc.applications.nft_transfer.v1.Params',
    aminoType: "nft-transfer/Params",
  ),
  ibcApplicationsNftTransferV1MsgTransfer(
    typeUrl: '/ibc.applications.nft_transfer.v1.MsgTransfer',
    serviceUrl: "/ibc.applications.nft_transfer.v1.Msg/Transfer",
    aminoType: "nft-transfer/MsgTransfer",
  ),
  ibcApplicationsNftTransferV1MsgTransferResponse(
    typeUrl: '/ibc.applications.nft_transfer.v1.MsgTransferResponse',
  ),
  ibcApplicationsNftTransferV1MsgUpdateParams(
    typeUrl: '/ibc.applications.nft_transfer.v1.MsgUpdateParams',
    serviceUrl: "/ibc.applications.nft_transfer.v1.Msg/UpdateParams",
    aminoType: "nft-transfer/MsgUpdateParams",
  ),
  ibcApplicationsNftTransferV1MsgUpdateParamsResponse(
    typeUrl: '/ibc.applications.nft_transfer.v1.MsgUpdateParamsResponse',
  ),
  initiaIntertxV1QueryInterchainAccountRequest(
    typeUrl: '/initia.intertx.v1.QueryInterchainAccountRequest',
    serviceUrl: "/initia.intertx.v1.Query/InterchainAccount",
  ),
  initiaIntertxV1QueryInterchainAccountResponse(
    typeUrl: '/initia.intertx.v1.QueryInterchainAccountResponse',
  ),
  initiaIntertxV1MsgRegisterAccount(
    typeUrl: '/initia.intertx.v1.MsgRegisterAccount',
    serviceUrl: "/initia.intertx.v1.Msg/RegisterAccount",
    aminoType: "intertx/MsgRegisterAccount",
  ),
  initiaIntertxV1MsgRegisterAccountResponse(
    typeUrl: '/initia.intertx.v1.MsgRegisterAccountResponse',
  ),
  initiaIntertxV1MsgSubmitTx(
    typeUrl: '/initia.intertx.v1.MsgSubmitTx',
    serviceUrl: "/initia.intertx.v1.Msg/SubmitTx",
    aminoType: "intertx/MsgSubmitTx",
  ),
  initiaIntertxV1MsgSubmitTxResponse(
    typeUrl: '/initia.intertx.v1.MsgSubmitTxResponse',
  ),
  initiaIbchooksV1QueryACLRequest(
    typeUrl: '/initia.ibchooks.v1.QueryACLRequest',
    serviceUrl: "/initia.ibchooks.v1.Query/ACL",
  ),
  initiaIbchooksV1QueryACLResponse(
    typeUrl: '/initia.ibchooks.v1.QueryACLResponse',
  ),
  initiaIbchooksV1QueryACLsRequest(
    typeUrl: '/initia.ibchooks.v1.QueryACLsRequest',
    serviceUrl: "/initia.ibchooks.v1.Query/ACLs",
  ),
  initiaIbchooksV1QueryACLsResponse(
    typeUrl: '/initia.ibchooks.v1.QueryACLsResponse',
  ),
  initiaIbchooksV1QueryParamsRequest(
    typeUrl: '/initia.ibchooks.v1.QueryParamsRequest',
    serviceUrl: "/initia.ibchooks.v1.Query/Params",
  ),
  initiaIbchooksV1QueryParamsResponse(
    typeUrl: '/initia.ibchooks.v1.QueryParamsResponse',
  ),
  initiaIbchooksV1Params(
    typeUrl: '/initia.ibchooks.v1.Params',
    aminoType: "ibchooks/Params",
  ),
  initiaIbchooksV1Acl(typeUrl: '/initia.ibchooks.v1.ACL'),
  initiaIbchooksV1MsgUpdateACL(
    typeUrl: '/initia.ibchooks.v1.MsgUpdateACL',
    serviceUrl: "/initia.ibchooks.v1.Msg/UpdateACL",
    aminoType: "ibchooks/MsgUpdateACL",
  ),
  initiaIbchooksV1MsgUpdateACLResponse(
    typeUrl: '/initia.ibchooks.v1.MsgUpdateACLResponse',
  ),
  initiaIbchooksV1MsgUpdateParams(
    typeUrl: '/initia.ibchooks.v1.MsgUpdateParams',
    serviceUrl: "/initia.ibchooks.v1.Msg/UpdateParams",
    aminoType: "ibchooks/MsgUpdateParams",
  ),
  initiaIbchooksV1MsgUpdateParamsResponse(
    typeUrl: '/initia.ibchooks.v1.MsgUpdateParamsResponse',
  ),
  initiaDistributionV1QueryParamsRequest(
    typeUrl: '/initia.distribution.v1.QueryParamsRequest',
    serviceUrl: "/initia.distribution.v1.Query/Params",
  ),
  initiaDistributionV1QueryParamsResponse(
    typeUrl: '/initia.distribution.v1.QueryParamsResponse',
  ),
  initiaDistributionV1QueryValidatorOutstandingRewardsRequest(
    typeUrl: '/initia.distribution.v1.QueryValidatorOutstandingRewardsRequest',
    serviceUrl: "/initia.distribution.v1.Query/ValidatorOutstandingRewards",
  ),
  initiaDistributionV1QueryValidatorOutstandingRewardsResponse(
    typeUrl: '/initia.distribution.v1.QueryValidatorOutstandingRewardsResponse',
  ),
  initiaDistributionV1QueryValidatorCommissionRequest(
    typeUrl: '/initia.distribution.v1.QueryValidatorCommissionRequest',
    serviceUrl: "/initia.distribution.v1.Query/ValidatorCommission",
  ),
  initiaDistributionV1QueryValidatorCommissionResponse(
    typeUrl: '/initia.distribution.v1.QueryValidatorCommissionResponse',
  ),
  initiaDistributionV1QueryValidatorSlashesRequest(
    typeUrl: '/initia.distribution.v1.QueryValidatorSlashesRequest',
    serviceUrl: "/initia.distribution.v1.Query/ValidatorSlashes",
  ),
  initiaDistributionV1QueryValidatorSlashesResponse(
    typeUrl: '/initia.distribution.v1.QueryValidatorSlashesResponse',
  ),
  initiaDistributionV1QueryDelegationRewardsRequest(
    typeUrl: '/initia.distribution.v1.QueryDelegationRewardsRequest',
    serviceUrl: "/initia.distribution.v1.Query/DelegationRewards",
  ),
  initiaDistributionV1QueryDelegationRewardsResponse(
    typeUrl: '/initia.distribution.v1.QueryDelegationRewardsResponse',
  ),
  initiaDistributionV1QueryDelegationTotalRewardsRequest(
    typeUrl: '/initia.distribution.v1.QueryDelegationTotalRewardsRequest',
    serviceUrl: "/initia.distribution.v1.Query/DelegationTotalRewards",
  ),
  initiaDistributionV1QueryDelegationTotalRewardsResponse(
    typeUrl: '/initia.distribution.v1.QueryDelegationTotalRewardsResponse',
  ),
  initiaDistributionV1MsgUpdateParams(
    typeUrl: '/initia.distribution.v1.MsgUpdateParams',
    serviceUrl: "/initia.distribution.v1.Msg/UpdateParams",
    aminoType: "distribution/MsgUpdateParams",
  ),
  initiaDistributionV1MsgUpdateParamsResponse(
    typeUrl: '/initia.distribution.v1.MsgUpdateParamsResponse',
  ),
  initiaDistributionV1MsgDepositValidatorRewardsPool(
    typeUrl: '/initia.distribution.v1.MsgDepositValidatorRewardsPool',
    serviceUrl: "/initia.distribution.v1.Msg/DepositValidatorRewardsPool",
    aminoType: "distr/MsgDepositValidatorRewardsPool",
  ),
  initiaDistributionV1MsgDepositValidatorRewardsPoolResponse(
    typeUrl: '/initia.distribution.v1.MsgDepositValidatorRewardsPoolResponse',
  ),
  initiaDistributionV1Params(
    typeUrl: '/initia.distribution.v1.Params',
    aminoType: "distribution/Params",
  ),
  initiaDistributionV1RewardWeight(
    typeUrl: '/initia.distribution.v1.RewardWeight',
  ),
  initiaDistributionV1DecPool(typeUrl: '/initia.distribution.v1.DecPool'),
  initiaDistributionV1ValidatorAccumulatedCommission(
    typeUrl: '/initia.distribution.v1.ValidatorAccumulatedCommission',
  ),
  initiaDistributionV1ValidatorOutstandingRewards(
    typeUrl: '/initia.distribution.v1.ValidatorOutstandingRewards',
  ),
  initiaDistributionV1ValidatorSlashEvent(
    typeUrl: '/initia.distribution.v1.ValidatorSlashEvent',
  ),
  initiaDistributionV1DelegationDelegatorReward(
    typeUrl: '/initia.distribution.v1.DelegationDelegatorReward',
  ),
  initiaDynamicfeeV1QueryParamsRequest(
    typeUrl: '/initia.dynamicfee.v1.QueryParamsRequest',
    serviceUrl: "/initia.dynamicfee.v1.Query/Params",
  ),
  initiaDynamicfeeV1QueryParamsResponse(
    typeUrl: '/initia.dynamicfee.v1.QueryParamsResponse',
  ),
  initiaDynamicfeeV1Params(typeUrl: '/initia.dynamicfee.v1.Params'),
  initiaDynamicfeeV1MsgUpdateParams(
    typeUrl: '/initia.dynamicfee.v1.MsgUpdateParams',
    serviceUrl: "/initia.dynamicfee.v1.Msg/UpdateParams",
    aminoType: "dynamicfee/MsgUpdateParams",
  ),
  initiaDynamicfeeV1MsgUpdateParamsResponse(
    typeUrl: '/initia.dynamicfee.v1.MsgUpdateParamsResponse',
  ),
  initiaAbcippMempoolV1QueryTxDistributionRequest(
    typeUrl: '/initia.abcipp.mempool.v1.QueryTxDistributionRequest',
    serviceUrl: "/initia.abcipp.mempool.v1.Query/QueryTxDistribution",
  ),
  initiaAbcippMempoolV1QueryTxDistributionResponse(
    typeUrl: '/initia.abcipp.mempool.v1.QueryTxDistributionResponse',
  ),
  initiaAbcippMempoolV1QueryTxHashRequest(
    typeUrl: '/initia.abcipp.mempool.v1.QueryTxHashRequest',
    serviceUrl: "/initia.abcipp.mempool.v1.Query/QueryTxHash",
  ),
  initiaAbcippMempoolV1QueryTxHashResponse(
    typeUrl: '/initia.abcipp.mempool.v1.QueryTxHashResponse',
  ),
  initiaRewardV1QueryParamsRequest(
    typeUrl: '/initia.reward.v1.QueryParamsRequest',
    serviceUrl: "/initia.reward.v1.Query/Params",
  ),
  initiaRewardV1QueryParamsResponse(
    typeUrl: '/initia.reward.v1.QueryParamsResponse',
  ),
  initiaRewardV1QueryAnnualProvisionsRequest(
    typeUrl: '/initia.reward.v1.QueryAnnualProvisionsRequest',
    serviceUrl: "/initia.reward.v1.Query/AnnualProvisions",
  ),
  initiaRewardV1QueryAnnualProvisionsResponse(
    typeUrl: '/initia.reward.v1.QueryAnnualProvisionsResponse',
  ),
  initiaRewardV1QueryLastDilutionTimestampRequest(
    typeUrl: '/initia.reward.v1.QueryLastDilutionTimestampRequest',
    serviceUrl: "/initia.reward.v1.Query/LastDilutionTimestamp",
  ),
  initiaRewardV1QueryLastDilutionTimestampResponse(
    typeUrl: '/initia.reward.v1.QueryLastDilutionTimestampResponse',
  ),
  initiaRewardV1Params(
    typeUrl: '/initia.reward.v1.Params',
    aminoType: "reward/Params",
  ),
  initiaRewardV1MsgUpdateParams(
    typeUrl: '/initia.reward.v1.MsgUpdateParams',
    serviceUrl: "/initia.reward.v1.Msg/UpdateParams",
    aminoType: "reward/MsgUpdateParams",
  ),
  initiaRewardV1MsgUpdateParamsResponse(
    typeUrl: '/initia.reward.v1.MsgUpdateParamsResponse',
  ),
  initiaRewardV1MsgFundCommunityPool(
    typeUrl: '/initia.reward.v1.MsgFundCommunityPool',
    serviceUrl: "/initia.reward.v1.Msg/FundCommunityPool",
    aminoType: "reward/MsgFundCommunityPool",
  ),
  initiaRewardV1MsgFundCommunityPoolResponse(
    typeUrl: '/initia.reward.v1.MsgFundCommunityPoolResponse',
  ),
  initiaGovV1QueryParamsRequest(
    typeUrl: '/initia.gov.v1.QueryParamsRequest',
    serviceUrl: "/initia.gov.v1.Query/Params",
  ),
  initiaGovV1QueryParamsResponse(typeUrl: '/initia.gov.v1.QueryParamsResponse'),
  initiaGovV1QueryEmergencyProposalsRequest(
    typeUrl: '/initia.gov.v1.QueryEmergencyProposalsRequest',
    serviceUrl: "/initia.gov.v1.Query/EmergencyProposals",
  ),
  initiaGovV1QueryEmergencyProposalsResponse(
    typeUrl: '/initia.gov.v1.QueryEmergencyProposalsResponse',
  ),
  initiaGovV1QueryProposalRequest(
    typeUrl: '/initia.gov.v1.QueryProposalRequest',
    serviceUrl: "/initia.gov.v1.Query/Proposal",
  ),
  initiaGovV1QueryProposalResponse(
    typeUrl: '/initia.gov.v1.QueryProposalResponse',
  ),
  initiaGovV1QueryProposalsRequest(
    typeUrl: '/initia.gov.v1.QueryProposalsRequest',
    serviceUrl: "/initia.gov.v1.Query/Proposals",
  ),
  initiaGovV1QueryProposalsResponse(
    typeUrl: '/initia.gov.v1.QueryProposalsResponse',
  ),
  initiaGovV1QueryTallyResultRequest(
    typeUrl: '/initia.gov.v1.QueryTallyResultRequest',
    serviceUrl: "/initia.gov.v1.Query/TallyResult",
  ),
  initiaGovV1QueryTallyResultResponse(
    typeUrl: '/initia.gov.v1.QueryTallyResultResponse',
  ),
  initiaGovV1QuerySimulateProposalRequest(
    typeUrl: '/initia.gov.v1.QuerySimulateProposalRequest',
    serviceUrl: "/initia.gov.v1.Query/SimulateProposal",
  ),
  initiaGovV1QuerySimulateProposalResponse(
    typeUrl: '/initia.gov.v1.QuerySimulateProposalResponse',
  ),
  initiaGovV1Params(typeUrl: '/initia.gov.v1.Params', aminoType: "gov/Params"),
  initiaGovV1Vesting(typeUrl: '/initia.gov.v1.Vesting'),
  initiaGovV1TallyResult(typeUrl: '/initia.gov.v1.TallyResult'),
  initiaGovV1Proposal(typeUrl: '/initia.gov.v1.Proposal'),
  initiaGovV1MsgUpdateParams(
    typeUrl: '/initia.gov.v1.MsgUpdateParams',
    serviceUrl: "/initia.gov.v1.Msg/UpdateParams",
    aminoType: "gov/MsgUpdateParams",
  ),
  initiaGovV1MsgUpdateParamsResponse(
    typeUrl: '/initia.gov.v1.MsgUpdateParamsResponse',
  ),
  initiaGovV1MsgAddEmergencySubmitters(
    typeUrl: '/initia.gov.v1.MsgAddEmergencySubmitters',
    serviceUrl: "/initia.gov.v1.Msg/AddEmergencySubmitters",
    aminoType: "gov/MsgAddEmergencySubmitters",
  ),
  initiaGovV1MsgAddEmergencySubmittersResponse(
    typeUrl: '/initia.gov.v1.MsgAddEmergencySubmittersResponse',
  ),
  initiaGovV1MsgRemoveEmergencySubmitters(
    typeUrl: '/initia.gov.v1.MsgRemoveEmergencySubmitters',
    serviceUrl: "/initia.gov.v1.Msg/RemoveEmergencySubmitters",
    aminoType: "gov/MsgRemoveEmergencySubmitters",
  ),
  initiaGovV1MsgRemoveEmergencySubmittersResponse(
    typeUrl: '/initia.gov.v1.MsgRemoveEmergencySubmittersResponse',
  ),
  initiaGovV1MsgActivateEmergencyProposal(
    typeUrl: '/initia.gov.v1.MsgActivateEmergencyProposal',
    serviceUrl: "/initia.gov.v1.Msg/ActivateEmergencyProposal",
    aminoType: "gov/MsgActivateEmergencyProposal",
  ),
  initiaGovV1MsgActivateEmergencyProposalResponse(
    typeUrl: '/initia.gov.v1.MsgActivateEmergencyProposalResponse',
  ),
  initiaTxV1QueryGasPricesRequest(
    typeUrl: '/initia.tx.v1.QueryGasPricesRequest',
    serviceUrl: "/initia.tx.v1.Query/GasPrices",
  ),
  initiaTxV1QueryGasPricesResponse(
    typeUrl: '/initia.tx.v1.QueryGasPricesResponse',
  ),
  initiaTxV1QueryGasPriceRequest(
    typeUrl: '/initia.tx.v1.QueryGasPriceRequest',
    serviceUrl: "/initia.tx.v1.Query/GasPrice",
  ),
  initiaTxV1QueryGasPriceResponse(
    typeUrl: '/initia.tx.v1.QueryGasPriceResponse',
  ),
  initiaTxV1TxsByEventsRequest(
    typeUrl: '/initia.tx.v1.TxsByEventsRequest',
    serviceUrl: "/initia.tx.v1.Query/TxsByEvents",
  ),
  initiaTxV1TxsByEventsResponse(typeUrl: '/initia.tx.v1.TxsByEventsResponse'),
  initiaMoveV1QueryModuleRequest(
    typeUrl: '/initia.move.v1.QueryModuleRequest',
    serviceUrl: "/initia.move.v1.Query/Module",
  ),
  initiaMoveV1QueryModuleResponse(
    typeUrl: '/initia.move.v1.QueryModuleResponse',
  ),
  initiaMoveV1QueryModulesRequest(
    typeUrl: '/initia.move.v1.QueryModulesRequest',
    serviceUrl: "/initia.move.v1.Query/Modules",
  ),
  initiaMoveV1QueryModulesResponse(
    typeUrl: '/initia.move.v1.QueryModulesResponse',
  ),
  initiaMoveV1QueryResourceRequest(
    typeUrl: '/initia.move.v1.QueryResourceRequest',
    serviceUrl: "/initia.move.v1.Query/Resource",
  ),
  initiaMoveV1QueryResourceResponse(
    typeUrl: '/initia.move.v1.QueryResourceResponse',
  ),
  initiaMoveV1QueryResourcesRequest(
    typeUrl: '/initia.move.v1.QueryResourcesRequest',
    serviceUrl: "/initia.move.v1.Query/Resources",
  ),
  initiaMoveV1QueryResourcesResponse(
    typeUrl: '/initia.move.v1.QueryResourcesResponse',
  ),
  initiaMoveV1QueryTableInfoRequest(
    typeUrl: '/initia.move.v1.QueryTableInfoRequest',
    serviceUrl: "/initia.move.v1.Query/TableInfo",
  ),
  initiaMoveV1QueryTableInfoResponse(
    typeUrl: '/initia.move.v1.QueryTableInfoResponse',
  ),
  initiaMoveV1QueryTableEntryRequest(
    typeUrl: '/initia.move.v1.QueryTableEntryRequest',
    serviceUrl: "/initia.move.v1.Query/TableEntry",
  ),
  initiaMoveV1QueryTableEntryResponse(
    typeUrl: '/initia.move.v1.QueryTableEntryResponse',
  ),
  initiaMoveV1QueryTableEntriesRequest(
    typeUrl: '/initia.move.v1.QueryTableEntriesRequest',
    serviceUrl: "/initia.move.v1.Query/TableEntries",
  ),
  initiaMoveV1QueryTableEntriesResponse(
    typeUrl: '/initia.move.v1.QueryTableEntriesResponse',
  ),
  initiaMoveV1QueryLegacyViewRequest(
    typeUrl: '/initia.move.v1.QueryLegacyViewRequest',
    serviceUrl: "/initia.move.v1.Query/LegacyView",
  ),
  initiaMoveV1QueryLegacyViewResponse(
    typeUrl: '/initia.move.v1.QueryLegacyViewResponse',
  ),
  initiaMoveV1QueryViewRequest(
    typeUrl: '/initia.move.v1.QueryViewRequest',
    serviceUrl: "/initia.move.v1.Query/View",
  ),
  initiaMoveV1QueryViewResponse(typeUrl: '/initia.move.v1.QueryViewResponse'),
  initiaMoveV1QueryViewBatchRequest(
    typeUrl: '/initia.move.v1.QueryViewBatchRequest',
    serviceUrl: "/initia.move.v1.Query/ViewBatch",
  ),
  initiaMoveV1QueryViewBatchResponse(
    typeUrl: '/initia.move.v1.QueryViewBatchResponse',
  ),
  initiaMoveV1QueryViewJSONRequest(
    typeUrl: '/initia.move.v1.QueryViewJSONRequest',
    serviceUrl: "/initia.move.v1.Query/ViewJSON",
  ),
  initiaMoveV1QueryViewJSONResponse(
    typeUrl: '/initia.move.v1.QueryViewJSONResponse',
  ),
  initiaMoveV1QueryViewJSONBatchRequest(
    typeUrl: '/initia.move.v1.QueryViewJSONBatchRequest',
    serviceUrl: "/initia.move.v1.Query/ViewJSONBatch",
  ),
  initiaMoveV1QueryViewJSONBatchResponse(
    typeUrl: '/initia.move.v1.QueryViewJSONBatchResponse',
  ),
  initiaMoveV1VMEvent(typeUrl: '/initia.move.v1.VMEvent'),
  initiaMoveV1QueryScriptABIRequest(
    typeUrl: '/initia.move.v1.QueryScriptABIRequest',
    serviceUrl: "/initia.move.v1.Query/ScriptABI",
  ),
  initiaMoveV1QueryScriptABIResponse(
    typeUrl: '/initia.move.v1.QueryScriptABIResponse',
  ),
  initiaMoveV1QueryParamsRequest(
    typeUrl: '/initia.move.v1.QueryParamsRequest',
    serviceUrl: "/initia.move.v1.Query/Params",
  ),
  initiaMoveV1QueryParamsResponse(
    typeUrl: '/initia.move.v1.QueryParamsResponse',
  ),
  initiaMoveV1QueryMetadataRequest(
    typeUrl: '/initia.move.v1.QueryMetadataRequest',
    serviceUrl: "/initia.move.v1.Query/Metadata",
  ),
  initiaMoveV1QueryMetadataResponse(
    typeUrl: '/initia.move.v1.QueryMetadataResponse',
  ),
  initiaMoveV1QueryDenomRequest(
    typeUrl: '/initia.move.v1.QueryDenomRequest',
    serviceUrl: "/initia.move.v1.Query/Denom",
  ),
  initiaMoveV1QueryDenomResponse(typeUrl: '/initia.move.v1.QueryDenomResponse'),
  initiaMoveV1QueryDexPairRequest(
    typeUrl: '/initia.move.v1.QueryDexPairRequest',
    serviceUrl: "/initia.move.v1.Query/DexPair",
  ),
  initiaMoveV1QueryDexPairResponse(
    typeUrl: '/initia.move.v1.QueryDexPairResponse',
  ),
  initiaMoveV1QueryDexPairsRequest(
    typeUrl: '/initia.move.v1.QueryDexPairsRequest',
    serviceUrl: "/initia.move.v1.Query/DexPairs",
  ),
  initiaMoveV1QueryDexPairsResponse(
    typeUrl: '/initia.move.v1.QueryDexPairsResponse',
  ),
  initiaMoveV1Params(
    typeUrl: '/initia.move.v1.Params',
    aminoType: "move/Params",
  ),
  initiaMoveV1Module(typeUrl: '/initia.move.v1.Module'),
  initiaMoveV1Resource(typeUrl: '/initia.move.v1.Resource'),
  initiaMoveV1TableInfo(typeUrl: '/initia.move.v1.TableInfo'),
  initiaMoveV1TableEntry(typeUrl: '/initia.move.v1.TableEntry'),
  initiaMoveV1DexPair(typeUrl: '/initia.move.v1.DexPair'),
  initiaMoveV1MsgPublish(
    typeUrl: '/initia.move.v1.MsgPublish',
    serviceUrl: "/initia.move.v1.Msg/Publish",
    aminoType: "move/MsgPublish",
  ),
  initiaMoveV1MsgPublishResponse(typeUrl: '/initia.move.v1.MsgPublishResponse'),
  initiaMoveV1MsgExecute(
    typeUrl: '/initia.move.v1.MsgExecute',
    serviceUrl: "/initia.move.v1.Msg/Execute",
    aminoType: "move/MsgExecute",
  ),
  initiaMoveV1MsgExecuteResponse(typeUrl: '/initia.move.v1.MsgExecuteResponse'),
  initiaMoveV1MsgExecuteJSON(
    typeUrl: '/initia.move.v1.MsgExecuteJSON',
    serviceUrl: "/initia.move.v1.Msg/ExecuteJSON",
    aminoType: "move/MsgExecuteJSON",
  ),
  initiaMoveV1MsgExecuteJSONResponse(
    typeUrl: '/initia.move.v1.MsgExecuteJSONResponse',
  ),
  initiaMoveV1MsgScript(
    typeUrl: '/initia.move.v1.MsgScript',
    serviceUrl: "/initia.move.v1.Msg/Script",
    aminoType: "move/MsgScript",
  ),
  initiaMoveV1MsgScriptResponse(typeUrl: '/initia.move.v1.MsgScriptResponse'),
  initiaMoveV1MsgScriptJSON(
    typeUrl: '/initia.move.v1.MsgScriptJSON',
    serviceUrl: "/initia.move.v1.Msg/ScriptJSON",
    aminoType: "move/MsgScriptJSON",
  ),
  initiaMoveV1MsgScriptJSONResponse(
    typeUrl: '/initia.move.v1.MsgScriptJSONResponse',
  ),
  initiaMoveV1MsgGovPublish(
    typeUrl: '/initia.move.v1.MsgGovPublish',
    serviceUrl: "/initia.move.v1.Msg/GovPublish",
    aminoType: "move/MsgGovPublish",
  ),
  initiaMoveV1MsgGovPublishResponse(
    typeUrl: '/initia.move.v1.MsgGovPublishResponse',
  ),
  initiaMoveV1MsgGovExecute(
    typeUrl: '/initia.move.v1.MsgGovExecute',
    serviceUrl: "/initia.move.v1.Msg/GovExecute",
    aminoType: "move/MsgGovExecute",
  ),
  initiaMoveV1MsgGovExecuteResponse(
    typeUrl: '/initia.move.v1.MsgGovExecuteResponse',
  ),
  initiaMoveV1MsgGovExecuteJSON(
    typeUrl: '/initia.move.v1.MsgGovExecuteJSON',
    serviceUrl: "/initia.move.v1.Msg/GovExecuteJSON",
    aminoType: "move/MsgGovExecuteJSON",
  ),
  initiaMoveV1MsgGovExecuteJSONResponse(
    typeUrl: '/initia.move.v1.MsgGovExecuteJSONResponse',
  ),
  initiaMoveV1MsgGovScript(
    typeUrl: '/initia.move.v1.MsgGovScript',
    serviceUrl: "/initia.move.v1.Msg/GovScript",
    aminoType: "move/MsgGovScript",
  ),
  initiaMoveV1MsgGovScriptResponse(
    typeUrl: '/initia.move.v1.MsgGovScriptResponse',
  ),
  initiaMoveV1MsgGovScriptJSON(
    typeUrl: '/initia.move.v1.MsgGovScriptJSON',
    serviceUrl: "/initia.move.v1.Msg/GovScriptJSON",
    aminoType: "move/MsgGovScriptJSON",
  ),
  initiaMoveV1MsgGovScriptJSONResponse(
    typeUrl: '/initia.move.v1.MsgGovScriptJSONResponse',
  ),
  initiaMoveV1MsgWhitelistStaking(
    typeUrl: '/initia.move.v1.MsgWhitelistStaking',
    serviceUrl: "/initia.move.v1.Msg/WhitelistStaking",
    aminoType: "move/MsgWhitelistStaking",
  ),
  initiaMoveV1MsgWhitelistStakingResponse(
    typeUrl: '/initia.move.v1.MsgWhitelistStakingResponse',
  ),
  initiaMoveV1MsgWhitelistGasPrice(
    typeUrl: '/initia.move.v1.MsgWhitelistGasPrice',
    serviceUrl: "/initia.move.v1.Msg/WhitelistGasPrice",
    aminoType: "move/MsgWhitelistGasPrice",
  ),
  initiaMoveV1MsgWhitelistGasPriceResponse(
    typeUrl: '/initia.move.v1.MsgWhitelistGasPriceResponse',
  ),
  initiaMoveV1MsgDelistStaking(
    typeUrl: '/initia.move.v1.MsgDelistStaking',
    serviceUrl: "/initia.move.v1.Msg/DelistStaking",
    aminoType: "move/MsgDelistStaking",
  ),
  initiaMoveV1MsgDelistStakingResponse(
    typeUrl: '/initia.move.v1.MsgDelistStakingResponse',
  ),
  initiaMoveV1MsgDelistGasPrice(
    typeUrl: '/initia.move.v1.MsgDelistGasPrice',
    serviceUrl: "/initia.move.v1.Msg/DelistGasPrice",
    aminoType: "move/MsgDelistGasPrice",
  ),
  initiaMoveV1MsgDelistGasPriceResponse(
    typeUrl: '/initia.move.v1.MsgDelistGasPriceResponse',
  ),
  initiaMoveV1MsgUpdateParams(
    typeUrl: '/initia.move.v1.MsgUpdateParams',
    serviceUrl: "/initia.move.v1.Msg/UpdateParams",
    aminoType: "move/MsgUpdateParams",
  ),
  initiaMoveV1MsgUpdateParamsResponse(
    typeUrl: '/initia.move.v1.MsgUpdateParamsResponse',
  ),
  initiaBankV1MsgSetDenomMetadata(
    typeUrl: '/initia.bank.v1.MsgSetDenomMetadata',
    serviceUrl: "/initia.bank.v1.Msg/SetDenomMetadata",
    aminoType: "bank/MsgSetDenomMetadata",
  ),
  initiaBankV1MsgSetDenomMetadataResponse(
    typeUrl: '/initia.bank.v1.MsgSetDenomMetadataResponse',
  ),
  initiaCryptoV1beta1Ethsecp256k1PubKey(
    typeUrl: '/initia.crypto.v1beta1.ethsecp256k1.PubKey',
    aminoType: "initia/PubKeyEthSecp256k1",
  ),
  initiaCryptoV1beta1Ethsecp256k1PrivKey(
    typeUrl: '/initia.crypto.v1beta1.ethsecp256k1.PrivKey',
    aminoType: "initia/PrivKeyEthSecp256k1",
  ),
  initiaMstakingV1QueryValidatorsRequest(
    typeUrl: '/initia.mstaking.v1.QueryValidatorsRequest',
    serviceUrl: "/initia.mstaking.v1.Query/Validators",
  ),
  initiaMstakingV1QueryValidatorsResponse(
    typeUrl: '/initia.mstaking.v1.QueryValidatorsResponse',
  ),
  initiaMstakingV1QueryValidatorRequest(
    typeUrl: '/initia.mstaking.v1.QueryValidatorRequest',
    serviceUrl: "/initia.mstaking.v1.Query/Validator",
  ),
  initiaMstakingV1QueryValidatorResponse(
    typeUrl: '/initia.mstaking.v1.QueryValidatorResponse',
  ),
  initiaMstakingV1QueryValidatorDelegationsRequest(
    typeUrl: '/initia.mstaking.v1.QueryValidatorDelegationsRequest',
    serviceUrl: "/initia.mstaking.v1.Query/ValidatorDelegations",
  ),
  initiaMstakingV1QueryValidatorDelegationsResponse(
    typeUrl: '/initia.mstaking.v1.QueryValidatorDelegationsResponse',
  ),
  initiaMstakingV1QueryValidatorUnbondingDelegationsRequest(
    typeUrl: '/initia.mstaking.v1.QueryValidatorUnbondingDelegationsRequest',
    serviceUrl: "/initia.mstaking.v1.Query/ValidatorUnbondingDelegations",
  ),
  initiaMstakingV1QueryValidatorUnbondingDelegationsResponse(
    typeUrl: '/initia.mstaking.v1.QueryValidatorUnbondingDelegationsResponse',
  ),
  initiaMstakingV1QueryDelegationRequest(
    typeUrl: '/initia.mstaking.v1.QueryDelegationRequest',
    serviceUrl: "/initia.mstaking.v1.Query/Delegation",
  ),
  initiaMstakingV1QueryDelegationResponse(
    typeUrl: '/initia.mstaking.v1.QueryDelegationResponse',
  ),
  initiaMstakingV1QueryUnbondingDelegationRequest(
    typeUrl: '/initia.mstaking.v1.QueryUnbondingDelegationRequest',
    serviceUrl: "/initia.mstaking.v1.Query/UnbondingDelegation",
  ),
  initiaMstakingV1QueryUnbondingDelegationResponse(
    typeUrl: '/initia.mstaking.v1.QueryUnbondingDelegationResponse',
  ),
  initiaMstakingV1QueryDelegatorDelegationsRequest(
    typeUrl: '/initia.mstaking.v1.QueryDelegatorDelegationsRequest',
    serviceUrl: "/initia.mstaking.v1.Query/DelegatorDelegations",
  ),
  initiaMstakingV1QueryDelegatorDelegationsResponse(
    typeUrl: '/initia.mstaking.v1.QueryDelegatorDelegationsResponse',
  ),
  initiaMstakingV1QueryDelegatorUnbondingDelegationsRequest(
    typeUrl: '/initia.mstaking.v1.QueryDelegatorUnbondingDelegationsRequest',
    serviceUrl: "/initia.mstaking.v1.Query/DelegatorUnbondingDelegations",
  ),
  initiaMstakingV1QueryDelegatorUnbondingDelegationsResponse(
    typeUrl: '/initia.mstaking.v1.QueryDelegatorUnbondingDelegationsResponse',
  ),
  initiaMstakingV1QueryRedelegationsRequest(
    typeUrl: '/initia.mstaking.v1.QueryRedelegationsRequest',
    serviceUrl: "/initia.mstaking.v1.Query/RedelegationsOfDelegator",
  ),
  initiaMstakingV1QueryRedelegationsResponse(
    typeUrl: '/initia.mstaking.v1.QueryRedelegationsResponse',
  ),
  initiaMstakingV1QueryDelegatorValidatorsRequest(
    typeUrl: '/initia.mstaking.v1.QueryDelegatorValidatorsRequest',
    serviceUrl: "/initia.mstaking.v1.Query/DelegatorValidators",
  ),
  initiaMstakingV1QueryDelegatorValidatorsResponse(
    typeUrl: '/initia.mstaking.v1.QueryDelegatorValidatorsResponse',
  ),
  initiaMstakingV1QueryDelegatorValidatorRequest(
    typeUrl: '/initia.mstaking.v1.QueryDelegatorValidatorRequest',
    serviceUrl: "/initia.mstaking.v1.Query/DelegatorValidator",
  ),
  initiaMstakingV1QueryDelegatorValidatorResponse(
    typeUrl: '/initia.mstaking.v1.QueryDelegatorValidatorResponse',
  ),
  initiaMstakingV1QueryDelegatorTotalDelegationBalanceRequest(
    typeUrl: '/initia.mstaking.v1.QueryDelegatorTotalDelegationBalanceRequest',
    serviceUrl: "/initia.mstaking.v1.Query/DelegatorTotalDelegationBalance",
  ),
  initiaMstakingV1QueryDelegatorTotalDelegationBalanceResponse(
    typeUrl: '/initia.mstaking.v1.QueryDelegatorTotalDelegationBalanceResponse',
  ),
  initiaMstakingV1QueryDelegatorTotalUnbondingBalanceRequest(
    typeUrl: '/initia.mstaking.v1.QueryDelegatorTotalUnbondingBalanceRequest',
    serviceUrl: "/initia.mstaking.v1.Query/DelegatorTotalUnbondingBalance",
  ),
  initiaMstakingV1QueryDelegatorTotalUnbondingBalanceResponse(
    typeUrl: '/initia.mstaking.v1.QueryDelegatorTotalUnbondingBalanceResponse',
  ),
  initiaMstakingV1QueryPoolRequest(
    typeUrl: '/initia.mstaking.v1.QueryPoolRequest',
    serviceUrl: "/initia.mstaking.v1.Query/Pool",
  ),
  initiaMstakingV1QueryPoolResponse(
    typeUrl: '/initia.mstaking.v1.QueryPoolResponse',
  ),
  initiaMstakingV1QueryParamsRequest(
    typeUrl: '/initia.mstaking.v1.QueryParamsRequest',
    serviceUrl: "/initia.mstaking.v1.Query/Params",
  ),
  initiaMstakingV1QueryParamsResponse(
    typeUrl: '/initia.mstaking.v1.QueryParamsResponse',
  ),
  initiaMstakingV1CommissionRates(
    typeUrl: '/initia.mstaking.v1.CommissionRates',
  ),
  initiaMstakingV1Commission(typeUrl: '/initia.mstaking.v1.Commission'),
  initiaMstakingV1Description(typeUrl: '/initia.mstaking.v1.Description'),
  initiaMstakingV1Validator(typeUrl: '/initia.mstaking.v1.Validator'),
  initiaMstakingV1Delegation(typeUrl: '/initia.mstaking.v1.Delegation'),
  initiaMstakingV1UnbondingDelegation(
    typeUrl: '/initia.mstaking.v1.UnbondingDelegation',
  ),
  initiaMstakingV1UnbondingDelegationEntry(
    typeUrl: '/initia.mstaking.v1.UnbondingDelegationEntry',
  ),
  initiaMstakingV1RedelegationEntry(
    typeUrl: '/initia.mstaking.v1.RedelegationEntry',
  ),
  initiaMstakingV1Redelegation(typeUrl: '/initia.mstaking.v1.Redelegation'),
  initiaMstakingV1Params(typeUrl: '/initia.mstaking.v1.Params'),
  initiaMstakingV1DelegationResponse(
    typeUrl: '/initia.mstaking.v1.DelegationResponse',
  ),
  initiaMstakingV1RedelegationEntryResponse(
    typeUrl: '/initia.mstaking.v1.RedelegationEntryResponse',
  ),
  initiaMstakingV1RedelegationResponse(
    typeUrl: '/initia.mstaking.v1.RedelegationResponse',
  ),
  initiaMstakingV1Pool(typeUrl: '/initia.mstaking.v1.Pool'),
  initiaMstakingV1MsgCreateValidator(
    typeUrl: '/initia.mstaking.v1.MsgCreateValidator',
    serviceUrl: "/initia.mstaking.v1.Msg/CreateValidator",
    aminoType: "mstaking/MsgCreateValidator",
  ),
  initiaMstakingV1MsgCreateValidatorResponse(
    typeUrl: '/initia.mstaking.v1.MsgCreateValidatorResponse',
  ),
  initiaMstakingV1MsgEditValidator(
    typeUrl: '/initia.mstaking.v1.MsgEditValidator',
    serviceUrl: "/initia.mstaking.v1.Msg/EditValidator",
    aminoType: "mstaking/MsgEditValidator",
  ),
  initiaMstakingV1MsgEditValidatorResponse(
    typeUrl: '/initia.mstaking.v1.MsgEditValidatorResponse',
  ),
  initiaMstakingV1MsgDelegate(
    typeUrl: '/initia.mstaking.v1.MsgDelegate',
    serviceUrl: "/initia.mstaking.v1.Msg/Delegate",
    aminoType: "mstaking/MsgDelegate",
  ),
  initiaMstakingV1MsgDelegateResponse(
    typeUrl: '/initia.mstaking.v1.MsgDelegateResponse',
  ),
  initiaMstakingV1MsgBeginRedelegate(
    typeUrl: '/initia.mstaking.v1.MsgBeginRedelegate',
    serviceUrl: "/initia.mstaking.v1.Msg/BeginRedelegate",
    aminoType: "mstaking/MsgBeginRedelegate",
  ),
  initiaMstakingV1MsgBeginRedelegateResponse(
    typeUrl: '/initia.mstaking.v1.MsgBeginRedelegateResponse',
  ),
  initiaMstakingV1MsgUndelegate(
    typeUrl: '/initia.mstaking.v1.MsgUndelegate',
    serviceUrl: "/initia.mstaking.v1.Msg/Undelegate",
    aminoType: "mstaking/MsgUndelegate",
  ),
  initiaMstakingV1MsgUndelegateResponse(
    typeUrl: '/initia.mstaking.v1.MsgUndelegateResponse',
  ),
  initiaMstakingV1MsgCancelUnbondingDelegation(
    typeUrl: '/initia.mstaking.v1.MsgCancelUnbondingDelegation',
    serviceUrl: "/initia.mstaking.v1.Msg/CancelUnbondingDelegation",
    aminoType: "mstaking/MsgCancelUnbondingDelegation",
  ),
  initiaMstakingV1MsgCancelUnbondingDelegationResponse(
    typeUrl: '/initia.mstaking.v1.MsgCancelUnbondingDelegationResponse',
  ),
  initiaMstakingV1MsgUpdateParams(
    typeUrl: '/initia.mstaking.v1.MsgUpdateParams',
    serviceUrl: "/initia.mstaking.v1.Msg/UpdateParams",
    aminoType: "mstaking/MsgUpdateParams",
  ),
  initiaMstakingV1MsgUpdateParamsResponse(
    typeUrl: '/initia.mstaking.v1.MsgUpdateParamsResponse',
  ),
  tendermintP2pProtocolVersion(typeUrl: '/tendermint.p2p.ProtocolVersion'),
  tendermintP2pDefaultNodeInfo(typeUrl: '/tendermint.p2p.DefaultNodeInfo'),
  tendermintP2pDefaultNodeInfoOther(
    typeUrl: '/tendermint.p2p.DefaultNodeInfoOther',
  ),
  tendermintVersionConsensus(typeUrl: '/tendermint.version.Consensus'),
  tendermintTypesValidatorSet(typeUrl: '/tendermint.types.ValidatorSet'),
  tendermintTypesValidator(typeUrl: '/tendermint.types.Validator'),
  tendermintTypesConsensusParams(typeUrl: '/tendermint.types.ConsensusParams'),
  tendermintTypesBlockParams(typeUrl: '/tendermint.types.BlockParams'),
  tendermintTypesEvidenceParams(typeUrl: '/tendermint.types.EvidenceParams'),
  tendermintTypesValidatorParams(typeUrl: '/tendermint.types.ValidatorParams'),
  tendermintTypesVersionParams(typeUrl: '/tendermint.types.VersionParams'),
  tendermintTypesABCIParams(typeUrl: '/tendermint.types.ABCIParams'),
  tendermintTypesBlock(typeUrl: '/tendermint.types.Block'),
  tendermintTypesPartSetHeader(typeUrl: '/tendermint.types.PartSetHeader'),
  tendermintTypesBlockID(typeUrl: '/tendermint.types.BlockID'),
  tendermintTypesHeader(typeUrl: '/tendermint.types.Header'),
  tendermintTypesData(typeUrl: '/tendermint.types.Data'),
  tendermintTypesVote(typeUrl: '/tendermint.types.Vote'),
  tendermintTypesCommit(typeUrl: '/tendermint.types.Commit'),
  tendermintTypesCommitSig(typeUrl: '/tendermint.types.CommitSig'),
  tendermintTypesSignedHeader(typeUrl: '/tendermint.types.SignedHeader'),
  tendermintTypesLightBlock(typeUrl: '/tendermint.types.LightBlock'),
  tendermintTypesEvidence(typeUrl: '/tendermint.types.Evidence'),
  tendermintTypesDuplicateVoteEvidence(
    typeUrl: '/tendermint.types.DuplicateVoteEvidence',
  ),
  tendermintTypesLightClientAttackEvidence(
    typeUrl: '/tendermint.types.LightClientAttackEvidence',
  ),
  tendermintTypesEvidenceList(typeUrl: '/tendermint.types.EvidenceList'),
  tendermintAbciRequestEcho(
    typeUrl: '/tendermint.abci.RequestEcho',
    serviceUrl: "/tendermint.abci.ABCI/Echo",
  ),
  tendermintAbciRequestFlush(
    typeUrl: '/tendermint.abci.RequestFlush',
    serviceUrl: "/tendermint.abci.ABCI/Flush",
  ),
  tendermintAbciRequestInfo(
    typeUrl: '/tendermint.abci.RequestInfo',
    serviceUrl: "/tendermint.abci.ABCI/Info",
  ),
  tendermintAbciRequestInitChain(
    typeUrl: '/tendermint.abci.RequestInitChain',
    serviceUrl: "/tendermint.abci.ABCI/InitChain",
  ),
  tendermintAbciRequestQuery(
    typeUrl: '/tendermint.abci.RequestQuery',
    serviceUrl: "/tendermint.abci.ABCI/Query",
  ),
  tendermintAbciRequestCheckTx(
    typeUrl: '/tendermint.abci.RequestCheckTx',
    serviceUrl: "/tendermint.abci.ABCI/CheckTx",
  ),
  tendermintAbciRequestCommit(
    typeUrl: '/tendermint.abci.RequestCommit',
    serviceUrl: "/tendermint.abci.ABCI/Commit",
  ),
  tendermintAbciRequestListSnapshots(
    typeUrl: '/tendermint.abci.RequestListSnapshots',
    serviceUrl: "/tendermint.abci.ABCI/ListSnapshots",
  ),
  tendermintAbciRequestOfferSnapshot(
    typeUrl: '/tendermint.abci.RequestOfferSnapshot',
    serviceUrl: "/tendermint.abci.ABCI/OfferSnapshot",
  ),
  tendermintAbciRequestLoadSnapshotChunk(
    typeUrl: '/tendermint.abci.RequestLoadSnapshotChunk',
    serviceUrl: "/tendermint.abci.ABCI/LoadSnapshotChunk",
  ),
  tendermintAbciRequestApplySnapshotChunk(
    typeUrl: '/tendermint.abci.RequestApplySnapshotChunk',
    serviceUrl: "/tendermint.abci.ABCI/ApplySnapshotChunk",
  ),
  tendermintAbciRequestPrepareProposal(
    typeUrl: '/tendermint.abci.RequestPrepareProposal',
    serviceUrl: "/tendermint.abci.ABCI/PrepareProposal",
  ),
  tendermintAbciRequestProcessProposal(
    typeUrl: '/tendermint.abci.RequestProcessProposal',
    serviceUrl: "/tendermint.abci.ABCI/ProcessProposal",
  ),
  tendermintAbciRequestExtendVote(
    typeUrl: '/tendermint.abci.RequestExtendVote',
    serviceUrl: "/tendermint.abci.ABCI/ExtendVote",
  ),
  tendermintAbciRequestVerifyVoteExtension(
    typeUrl: '/tendermint.abci.RequestVerifyVoteExtension',
    serviceUrl: "/tendermint.abci.ABCI/VerifyVoteExtension",
  ),
  tendermintAbciRequestFinalizeBlock(
    typeUrl: '/tendermint.abci.RequestFinalizeBlock',
    serviceUrl: "/tendermint.abci.ABCI/FinalizeBlock",
  ),
  tendermintAbciResponseEcho(typeUrl: '/tendermint.abci.ResponseEcho'),
  tendermintAbciResponseFlush(typeUrl: '/tendermint.abci.ResponseFlush'),
  tendermintAbciResponseInfo(typeUrl: '/tendermint.abci.ResponseInfo'),
  tendermintAbciResponseInitChain(
    typeUrl: '/tendermint.abci.ResponseInitChain',
  ),
  tendermintAbciResponseQuery(typeUrl: '/tendermint.abci.ResponseQuery'),
  tendermintAbciResponseCheckTx(typeUrl: '/tendermint.abci.ResponseCheckTx'),
  tendermintAbciResponseCommit(typeUrl: '/tendermint.abci.ResponseCommit'),
  tendermintAbciResponseListSnapshots(
    typeUrl: '/tendermint.abci.ResponseListSnapshots',
  ),
  tendermintAbciResponseOfferSnapshot(
    typeUrl: '/tendermint.abci.ResponseOfferSnapshot',
  ),
  tendermintAbciResponseLoadSnapshotChunk(
    typeUrl: '/tendermint.abci.ResponseLoadSnapshotChunk',
  ),
  tendermintAbciResponseApplySnapshotChunk(
    typeUrl: '/tendermint.abci.ResponseApplySnapshotChunk',
  ),
  tendermintAbciResponsePrepareProposal(
    typeUrl: '/tendermint.abci.ResponsePrepareProposal',
  ),
  tendermintAbciResponseProcessProposal(
    typeUrl: '/tendermint.abci.ResponseProcessProposal',
  ),
  tendermintAbciResponseExtendVote(
    typeUrl: '/tendermint.abci.ResponseExtendVote',
  ),
  tendermintAbciResponseVerifyVoteExtension(
    typeUrl: '/tendermint.abci.ResponseVerifyVoteExtension',
  ),
  tendermintAbciResponseFinalizeBlock(
    typeUrl: '/tendermint.abci.ResponseFinalizeBlock',
  ),
  tendermintAbciCommitInfo(typeUrl: '/tendermint.abci.CommitInfo'),
  tendermintAbciExtendedCommitInfo(
    typeUrl: '/tendermint.abci.ExtendedCommitInfo',
  ),
  tendermintAbciEvent(typeUrl: '/tendermint.abci.Event'),
  tendermintAbciEventAttribute(typeUrl: '/tendermint.abci.EventAttribute'),
  tendermintAbciExecTxResult(typeUrl: '/tendermint.abci.ExecTxResult'),
  tendermintAbciValidator(typeUrl: '/tendermint.abci.Validator'),
  tendermintAbciValidatorUpdate(typeUrl: '/tendermint.abci.ValidatorUpdate'),
  tendermintAbciVoteInfo(typeUrl: '/tendermint.abci.VoteInfo'),
  tendermintAbciExtendedVoteInfo(typeUrl: '/tendermint.abci.ExtendedVoteInfo'),
  tendermintAbciMisbehavior(typeUrl: '/tendermint.abci.Misbehavior'),
  tendermintAbciSnapshot(typeUrl: '/tendermint.abci.Snapshot'),
  tendermintCryptoPublicKey(typeUrl: '/tendermint.crypto.PublicKey'),
  tendermintCryptoProofOp(typeUrl: '/tendermint.crypto.ProofOp'),
  tendermintCryptoProofOps(typeUrl: '/tendermint.crypto.ProofOps'),
  strideAirdropQueryAirdropRequest(
    typeUrl: '/stride.airdrop.QueryAirdropRequest',
    serviceUrl: "/stride.airdrop.Query/Airdrop",
  ),
  strideAirdropQueryAirdropResponse(
    typeUrl: '/stride.airdrop.QueryAirdropResponse',
  ),
  strideAirdropQueryAllAirdropsRequest(
    typeUrl: '/stride.airdrop.QueryAllAirdropsRequest',
    serviceUrl: "/stride.airdrop.Query/AllAirdrops",
  ),
  strideAirdropQueryAllAirdropsResponse(
    typeUrl: '/stride.airdrop.QueryAllAirdropsResponse',
  ),
  strideAirdropQueryUserAllocationRequest(
    typeUrl: '/stride.airdrop.QueryUserAllocationRequest',
    serviceUrl: "/stride.airdrop.Query/UserAllocation",
  ),
  strideAirdropQueryUserAllocationResponse(
    typeUrl: '/stride.airdrop.QueryUserAllocationResponse',
  ),
  strideAirdropQueryUserAllocationsRequest(
    typeUrl: '/stride.airdrop.QueryUserAllocationsRequest',
    serviceUrl: "/stride.airdrop.Query/UserAllocations",
  ),
  strideAirdropQueryUserAllocationsResponse(
    typeUrl: '/stride.airdrop.QueryUserAllocationsResponse',
  ),
  strideAirdropQueryAllAllocationsRequest(
    typeUrl: '/stride.airdrop.QueryAllAllocationsRequest',
    serviceUrl: "/stride.airdrop.Query/AllAllocations",
  ),
  strideAirdropQueryAllAllocationsResponse(
    typeUrl: '/stride.airdrop.QueryAllAllocationsResponse',
  ),
  strideAirdropQueryUserSummaryRequest(
    typeUrl: '/stride.airdrop.QueryUserSummaryRequest',
    serviceUrl: "/stride.airdrop.Query/UserSummary",
  ),
  strideAirdropQueryUserSummaryResponse(
    typeUrl: '/stride.airdrop.QueryUserSummaryResponse',
  ),
  strideAirdropUserAllocation(typeUrl: '/stride.airdrop.UserAllocation'),
  strideAirdropAirdrop(typeUrl: '/stride.airdrop.Airdrop'),
  strideAirdropMsgClaimDaily(
    typeUrl: '/stride.airdrop.MsgClaimDaily',
    serviceUrl: "/stride.airdrop.Msg/ClaimDaily",
    aminoType: "airdrop/MsgClaimDaily",
  ),
  strideAirdropMsgClaimDailyResponse(
    typeUrl: '/stride.airdrop.MsgClaimDailyResponse',
  ),
  strideAirdropMsgClaimEarly(
    typeUrl: '/stride.airdrop.MsgClaimEarly',
    serviceUrl: "/stride.airdrop.Msg/ClaimEarly",
    aminoType: "airdrop/MsgClaimEarly",
  ),
  strideAirdropMsgClaimEarlyResponse(
    typeUrl: '/stride.airdrop.MsgClaimEarlyResponse',
  ),
  strideAirdropMsgCreateAirdrop(
    typeUrl: '/stride.airdrop.MsgCreateAirdrop',
    serviceUrl: "/stride.airdrop.Msg/CreateAirdrop",
    aminoType: "airdrop/MsgCreateAirdrop",
  ),
  strideAirdropMsgCreateAirdropResponse(
    typeUrl: '/stride.airdrop.MsgCreateAirdropResponse',
  ),
  strideAirdropMsgUpdateAirdrop(
    typeUrl: '/stride.airdrop.MsgUpdateAirdrop',
    serviceUrl: "/stride.airdrop.Msg/UpdateAirdrop",
    aminoType: "airdrop/MsgUpdateAirdrop",
  ),
  strideAirdropMsgUpdateAirdropResponse(
    typeUrl: '/stride.airdrop.MsgUpdateAirdropResponse',
  ),
  strideAirdropRawAllocation(typeUrl: '/stride.airdrop.RawAllocation'),
  strideAirdropMsgAddAllocations(
    typeUrl: '/stride.airdrop.MsgAddAllocations',
    serviceUrl: "/stride.airdrop.Msg/AddAllocations",
    aminoType: "airdrop/MsgAddAllocations",
  ),
  strideAirdropMsgAddAllocationsResponse(
    typeUrl: '/stride.airdrop.MsgAddAllocationsResponse',
  ),
  strideAirdropMsgUpdateUserAllocation(
    typeUrl: '/stride.airdrop.MsgUpdateUserAllocation',
    serviceUrl: "/stride.airdrop.Msg/UpdateUserAllocation",
    aminoType: "airdrop/MsgUpdateUserAllocation",
  ),
  strideAirdropMsgUpdateUserAllocationResponse(
    typeUrl: '/stride.airdrop.MsgUpdateUserAllocationResponse',
  ),
  strideAirdropMsgLinkAddresses(
    typeUrl: '/stride.airdrop.MsgLinkAddresses',
    serviceUrl: "/stride.airdrop.Msg/LinkAddresses",
    aminoType: "airdrop/MsgLinkAddresses",
  ),
  strideAirdropMsgLinkAddressesResponse(
    typeUrl: '/stride.airdrop.MsgLinkAddressesResponse',
  ),
  strideIcaoracleQueryOracleRequest(
    typeUrl: '/stride.icaoracle.QueryOracleRequest',
    serviceUrl: "/stride.icaoracle.Query/Oracle",
  ),
  strideIcaoracleQueryOracleResponse(
    typeUrl: '/stride.icaoracle.QueryOracleResponse',
  ),
  strideIcaoracleQueryAllOraclesRequest(
    typeUrl: '/stride.icaoracle.QueryAllOraclesRequest',
    serviceUrl: "/stride.icaoracle.Query/AllOracles",
  ),
  strideIcaoracleQueryAllOraclesResponse(
    typeUrl: '/stride.icaoracle.QueryAllOraclesResponse',
  ),
  strideIcaoracleQueryActiveOraclesRequest(
    typeUrl: '/stride.icaoracle.QueryActiveOraclesRequest',
    serviceUrl: "/stride.icaoracle.Query/ActiveOracles",
  ),
  strideIcaoracleQueryActiveOraclesResponse(
    typeUrl: '/stride.icaoracle.QueryActiveOraclesResponse',
  ),
  strideIcaoracleQueryMetricsRequest(
    typeUrl: '/stride.icaoracle.QueryMetricsRequest',
    serviceUrl: "/stride.icaoracle.Query/Metrics",
  ),
  strideIcaoracleQueryMetricsResponse(
    typeUrl: '/stride.icaoracle.QueryMetricsResponse',
  ),
  strideIcaoracleOracle(typeUrl: '/stride.icaoracle.Oracle'),
  strideIcaoracleMetric(typeUrl: '/stride.icaoracle.Metric'),
  strideIcaoracleMsgAddOracle(
    typeUrl: '/stride.icaoracle.MsgAddOracle',
    serviceUrl: "/stride.icaoracle.Msg/AddOracle",
    aminoType: "icaoracle/MsgAddOracle",
  ),
  strideIcaoracleMsgAddOracleResponse(
    typeUrl: '/stride.icaoracle.MsgAddOracleResponse',
  ),
  strideIcaoracleMsgInstantiateOracle(
    typeUrl: '/stride.icaoracle.MsgInstantiateOracle',
    serviceUrl: "/stride.icaoracle.Msg/InstantiateOracle",
    aminoType: "icaoracle/MsgInstantiateOracle",
  ),
  strideIcaoracleMsgInstantiateOracleResponse(
    typeUrl: '/stride.icaoracle.MsgInstantiateOracleResponse',
  ),
  strideIcaoracleMsgRestoreOracleICA(
    typeUrl: '/stride.icaoracle.MsgRestoreOracleICA',
    serviceUrl: "/stride.icaoracle.Msg/RestoreOracleICA",
    aminoType: "icaoracle/MsgRestoreOracleICA",
  ),
  strideIcaoracleMsgRestoreOracleICAResponse(
    typeUrl: '/stride.icaoracle.MsgRestoreOracleICAResponse',
  ),
  strideIcaoracleMsgToggleOracle(
    typeUrl: '/stride.icaoracle.MsgToggleOracle',
    serviceUrl: "/stride.icaoracle.Msg/ToggleOracle",
    aminoType: "icaoracle/MsgToggleOracle",
  ),
  strideIcaoracleMsgToggleOracleResponse(
    typeUrl: '/stride.icaoracle.MsgToggleOracleResponse',
  ),
  strideIcaoracleMsgRemoveOracle(
    typeUrl: '/stride.icaoracle.MsgRemoveOracle',
    serviceUrl: "/stride.icaoracle.Msg/RemoveOracle",
    aminoType: "icaoracle/MsgRemoveOracle",
  ),
  strideIcaoracleMsgRemoveOracleResponse(
    typeUrl: '/stride.icaoracle.MsgRemoveOracleResponse',
  ),
  strideStakeibcAddressUnbonding(typeUrl: '/stride.stakeibc.AddressUnbonding'),
  strideStakeibcValidator(typeUrl: '/stride.stakeibc.Validator'),
  strideStakeibcEpochTracker(typeUrl: '/stride.stakeibc.EpochTracker'),
  strideStakeibcQueryInterchainAccountFromAddressRequest(
    typeUrl: '/stride.stakeibc.QueryInterchainAccountFromAddressRequest',
    serviceUrl: "/stride.stakeibc.Query/InterchainAccountFromAddress",
  ),
  strideStakeibcQueryInterchainAccountFromAddressResponse(
    typeUrl: '/stride.stakeibc.QueryInterchainAccountFromAddressResponse',
  ),
  strideStakeibcQueryParamsRequest(
    typeUrl: '/stride.stakeibc.QueryParamsRequest',
    serviceUrl: "/stride.stakeibc.Query/Params",
  ),
  strideStakeibcQueryParamsResponse(
    typeUrl: '/stride.stakeibc.QueryParamsResponse',
  ),
  strideStakeibcQueryGetValidatorsRequest(
    typeUrl: '/stride.stakeibc.QueryGetValidatorsRequest',
    serviceUrl: "/stride.stakeibc.Query/Validators",
  ),
  strideStakeibcQueryGetValidatorsResponse(
    typeUrl: '/stride.stakeibc.QueryGetValidatorsResponse',
  ),
  strideStakeibcQueryGetHostZoneRequest(
    typeUrl: '/stride.stakeibc.QueryGetHostZoneRequest',
    serviceUrl: "/stride.stakeibc.Query/HostZone",
  ),
  strideStakeibcQueryGetHostZoneResponse(
    typeUrl: '/stride.stakeibc.QueryGetHostZoneResponse',
  ),
  strideStakeibcQueryAllHostZoneRequest(
    typeUrl: '/stride.stakeibc.QueryAllHostZoneRequest',
    serviceUrl: "/stride.stakeibc.Query/HostZoneAll",
  ),
  strideStakeibcQueryAllHostZoneResponse(
    typeUrl: '/stride.stakeibc.QueryAllHostZoneResponse',
  ),
  strideStakeibcQueryModuleAddressRequest(
    typeUrl: '/stride.stakeibc.QueryModuleAddressRequest',
    serviceUrl: "/stride.stakeibc.Query/ModuleAddress",
  ),
  strideStakeibcQueryModuleAddressResponse(
    typeUrl: '/stride.stakeibc.QueryModuleAddressResponse',
  ),
  strideStakeibcQueryGetEpochTrackerRequest(
    typeUrl: '/stride.stakeibc.QueryGetEpochTrackerRequest',
    serviceUrl: "/stride.stakeibc.Query/EpochTracker",
  ),
  strideStakeibcQueryGetEpochTrackerResponse(
    typeUrl: '/stride.stakeibc.QueryGetEpochTrackerResponse',
  ),
  strideStakeibcQueryAllEpochTrackerRequest(
    typeUrl: '/stride.stakeibc.QueryAllEpochTrackerRequest',
    serviceUrl: "/stride.stakeibc.Query/EpochTrackerAll",
  ),
  strideStakeibcQueryAllEpochTrackerResponse(
    typeUrl: '/stride.stakeibc.QueryAllEpochTrackerResponse',
  ),
  strideStakeibcQueryGetNextPacketSequenceRequest(
    typeUrl: '/stride.stakeibc.QueryGetNextPacketSequenceRequest',
    serviceUrl: "/stride.stakeibc.Query/NextPacketSequence",
  ),
  strideStakeibcQueryGetNextPacketSequenceResponse(
    typeUrl: '/stride.stakeibc.QueryGetNextPacketSequenceResponse',
  ),
  strideStakeibcQueryAddressUnbondings(
    typeUrl: '/stride.stakeibc.QueryAddressUnbondings',
    serviceUrl: "/stride.stakeibc.Query/AddressUnbondings",
  ),
  strideStakeibcQueryAddressUnbondingsResponse(
    typeUrl: '/stride.stakeibc.QueryAddressUnbondingsResponse',
  ),
  strideStakeibcQueryAllTradeRoutes(
    typeUrl: '/stride.stakeibc.QueryAllTradeRoutes',
    serviceUrl: "/stride.stakeibc.Query/AllTradeRoutes",
  ),
  strideStakeibcQueryAllTradeRoutesResponse(
    typeUrl: '/stride.stakeibc.QueryAllTradeRoutesResponse',
  ),
  strideStakeibcParams(typeUrl: '/stride.stakeibc.Params'),
  strideStakeibcCommunityPoolRebate(
    typeUrl: '/stride.stakeibc.CommunityPoolRebate',
  ),
  strideStakeibcHostZone(typeUrl: '/stride.stakeibc.HostZone'),
  strideStakeibcICAAccount(typeUrl: '/stride.stakeibc.ICAAccount'),
  strideStakeibcTradeConfig(typeUrl: '/stride.stakeibc.TradeConfig'),
  strideStakeibcTradeRoute(typeUrl: '/stride.stakeibc.TradeRoute'),
  strideStakeibcMsgUpdateInnerRedemptionRateBounds(
    typeUrl: '/stride.stakeibc.MsgUpdateInnerRedemptionRateBounds',
    serviceUrl: "/stride.stakeibc.Msg/UpdateInnerRedemptionRateBounds",
    aminoType: "stakeibc/MsgUpdateRedemptionRateBounds",
  ),
  strideStakeibcMsgUpdateInnerRedemptionRateBoundsResponse(
    typeUrl: '/stride.stakeibc.MsgUpdateInnerRedemptionRateBoundsResponse',
  ),
  strideStakeibcMsgLiquidStake(
    typeUrl: '/stride.stakeibc.MsgLiquidStake',
    serviceUrl: "/stride.stakeibc.Msg/LiquidStake",
    aminoType: "stakeibc/MsgLiquidStake",
  ),
  strideStakeibcMsgLiquidStakeResponse(
    typeUrl: '/stride.stakeibc.MsgLiquidStakeResponse',
  ),
  strideStakeibcMsgLSMLiquidStake(
    typeUrl: '/stride.stakeibc.MsgLSMLiquidStake',
    serviceUrl: "/stride.stakeibc.Msg/LSMLiquidStake",
    aminoType: "stakeibc/MsgLSMLiquidStake",
  ),
  strideStakeibcMsgLSMLiquidStakeResponse(
    typeUrl: '/stride.stakeibc.MsgLSMLiquidStakeResponse',
  ),
  strideStakeibcMsgClearBalance(
    typeUrl: '/stride.stakeibc.MsgClearBalance',
    serviceUrl: "/stride.stakeibc.Msg/ClearBalance",
    aminoType: "stakeibc/MsgClearBalance",
  ),
  strideStakeibcMsgClearBalanceResponse(
    typeUrl: '/stride.stakeibc.MsgClearBalanceResponse',
  ),
  strideStakeibcMsgRedeemStake(
    typeUrl: '/stride.stakeibc.MsgRedeemStake',
    serviceUrl: "/stride.stakeibc.Msg/RedeemStake",
    aminoType: "stakeibc/MsgRedeemStake",
  ),
  strideStakeibcMsgRedeemStakeResponse(
    typeUrl: '/stride.stakeibc.MsgRedeemStakeResponse',
  ),
  strideStakeibcMsgRegisterHostZone(
    typeUrl: '/stride.stakeibc.MsgRegisterHostZone',
    serviceUrl: "/stride.stakeibc.Msg/RegisterHostZone",
    aminoType: "stakeibc/MsgRegisterHostZone",
  ),
  strideStakeibcMsgRegisterHostZoneResponse(
    typeUrl: '/stride.stakeibc.MsgRegisterHostZoneResponse',
  ),
  strideStakeibcMsgClaimUndelegatedTokens(
    typeUrl: '/stride.stakeibc.MsgClaimUndelegatedTokens',
    serviceUrl: "/stride.stakeibc.Msg/ClaimUndelegatedTokens",
    aminoType: "stakeibc/MsgClaimUndelegatedTokens",
  ),
  strideStakeibcMsgClaimUndelegatedTokensResponse(
    typeUrl: '/stride.stakeibc.MsgClaimUndelegatedTokensResponse',
  ),
  strideStakeibcMsgRebalanceValidators(
    typeUrl: '/stride.stakeibc.MsgRebalanceValidators',
    serviceUrl: "/stride.stakeibc.Msg/RebalanceValidators",
    aminoType: "stakeibc/MsgRebalanceValidators",
  ),
  strideStakeibcMsgRebalanceValidatorsResponse(
    typeUrl: '/stride.stakeibc.MsgRebalanceValidatorsResponse',
  ),
  strideStakeibcMsgAddValidators(
    typeUrl: '/stride.stakeibc.MsgAddValidators',
    serviceUrl: "/stride.stakeibc.Msg/AddValidators",
    aminoType: "stakeibc/MsgAddValidators",
  ),
  strideStakeibcMsgAddValidatorsResponse(
    typeUrl: '/stride.stakeibc.MsgAddValidatorsResponse',
  ),
  strideStakeibcValidatorWeight(typeUrl: '/stride.stakeibc.ValidatorWeight'),
  strideStakeibcMsgChangeValidatorWeights(
    typeUrl: '/stride.stakeibc.MsgChangeValidatorWeights',
    serviceUrl: "/stride.stakeibc.Msg/ChangeValidatorWeight",
    aminoType: "stakeibc/MsgChangeValidatorWeights",
  ),
  strideStakeibcMsgChangeValidatorWeightsResponse(
    typeUrl: '/stride.stakeibc.MsgChangeValidatorWeightsResponse',
  ),
  strideStakeibcMsgDeleteValidator(
    typeUrl: '/stride.stakeibc.MsgDeleteValidator',
    serviceUrl: "/stride.stakeibc.Msg/DeleteValidator",
    aminoType: "stakeibc/MsgDeleteValidator",
  ),
  strideStakeibcMsgDeleteValidatorResponse(
    typeUrl: '/stride.stakeibc.MsgDeleteValidatorResponse',
  ),
  strideStakeibcMsgRestoreInterchainAccount(
    typeUrl: '/stride.stakeibc.MsgRestoreInterchainAccount',
    serviceUrl: "/stride.stakeibc.Msg/RestoreInterchainAccount",
    aminoType: "stakeibc/MsgRestoreInterchainAcco",
  ),
  strideStakeibcMsgRestoreInterchainAccountResponse(
    typeUrl: '/stride.stakeibc.MsgRestoreInterchainAccountResponse',
  ),
  strideStakeibcMsgCloseDelegationChannel(
    typeUrl: '/stride.stakeibc.MsgCloseDelegationChannel',
    serviceUrl: "/stride.stakeibc.Msg/CloseDelegationChannel",
    aminoType: "stakeibc/MsgCloseDelegationChanne",
  ),
  strideStakeibcMsgCloseDelegationChannelResponse(
    typeUrl: '/stride.stakeibc.MsgCloseDelegationChannelResponse',
  ),
  strideStakeibcMsgUpdateValidatorSharesExchRate(
    typeUrl: '/stride.stakeibc.MsgUpdateValidatorSharesExchRate',
    serviceUrl: "/stride.stakeibc.Msg/UpdateValidatorSharesExchRate",
    aminoType: "stakeibc/MsgUpdateValSharesExchRate",
  ),
  strideStakeibcMsgUpdateValidatorSharesExchRateResponse(
    typeUrl: '/stride.stakeibc.MsgUpdateValidatorSharesExchRateResponse',
  ),
  strideStakeibcMsgCalibrateDelegation(
    typeUrl: '/stride.stakeibc.MsgCalibrateDelegation',
    serviceUrl: "/stride.stakeibc.Msg/CalibrateDelegation",
    aminoType: "stakeibc/MsgCalibrateDelegation",
  ),
  strideStakeibcMsgCalibrateDelegationResponse(
    typeUrl: '/stride.stakeibc.MsgCalibrateDelegationResponse',
  ),
  strideStakeibcMsgResumeHostZone(
    typeUrl: '/stride.stakeibc.MsgResumeHostZone',
    serviceUrl: "/stride.stakeibc.Msg/ResumeHostZone",
    aminoType: "stakeibc/MsgResumeHostZone",
  ),
  strideStakeibcMsgResumeHostZoneResponse(
    typeUrl: '/stride.stakeibc.MsgResumeHostZoneResponse',
  ),
  strideStakeibcMsgDeprecateHostZone(
    typeUrl: '/stride.stakeibc.MsgDeprecateHostZone',
    serviceUrl: "/stride.stakeibc.Msg/DeprecateHostZone",
    aminoType: "stakeibc/MsgDeprecateHostZone",
  ),
  strideStakeibcMsgDeprecateHostZoneResponse(
    typeUrl: '/stride.stakeibc.MsgDeprecateHostZoneResponse',
  ),
  strideStakeibcMsgCreateTradeRoute(
    typeUrl: '/stride.stakeibc.MsgCreateTradeRoute',
    serviceUrl: "/stride.stakeibc.Msg/CreateTradeRoute",
    aminoType: "stakeibc/MsgCreateTradeRoute",
  ),
  strideStakeibcMsgCreateTradeRouteResponse(
    typeUrl: '/stride.stakeibc.MsgCreateTradeRouteResponse',
  ),
  strideStakeibcMsgDeleteTradeRoute(
    typeUrl: '/stride.stakeibc.MsgDeleteTradeRoute',
    serviceUrl: "/stride.stakeibc.Msg/DeleteTradeRoute",
    aminoType: "stakeibc/MsgDeleteTradeRoute",
  ),
  strideStakeibcMsgDeleteTradeRouteResponse(
    typeUrl: '/stride.stakeibc.MsgDeleteTradeRouteResponse',
  ),
  strideStakeibcMsgUpdateTradeRoute(
    typeUrl: '/stride.stakeibc.MsgUpdateTradeRoute',
    serviceUrl: "/stride.stakeibc.Msg/UpdateTradeRoute",
    aminoType: "stakeibc/MsgUpdateTradeRoute",
  ),
  strideStakeibcMsgUpdateTradeRouteResponse(
    typeUrl: '/stride.stakeibc.MsgUpdateTradeRouteResponse',
  ),
  strideStakeibcMsgSetCommunityPoolRebate(
    typeUrl: '/stride.stakeibc.MsgSetCommunityPoolRebate',
    serviceUrl: "/stride.stakeibc.Msg/SetCommunityPoolRebate",
    aminoType: "stakeibc/MsgSetCommunityPoolRebate",
  ),
  strideStakeibcMsgSetCommunityPoolRebateResponse(
    typeUrl: '/stride.stakeibc.MsgSetCommunityPoolRebateResponse',
  ),
  strideStakeibcMsgToggleTradeController(
    typeUrl: '/stride.stakeibc.MsgToggleTradeController',
    serviceUrl: "/stride.stakeibc.Msg/ToggleTradeController",
    aminoType: "stakeibc/MsgToggleTradeController",
  ),
  strideStakeibcMsgToggleTradeControllerResponse(
    typeUrl: '/stride.stakeibc.MsgToggleTradeControllerResponse',
  ),
  strideStakeibcMsgUpdateHostZoneParams(
    typeUrl: '/stride.stakeibc.MsgUpdateHostZoneParams',
    serviceUrl: "/stride.stakeibc.Msg/UpdateHostZoneParams",
    aminoType: "stakeibc/MsgUpdateHostZoneParams",
  ),
  strideStakeibcMsgUpdateHostZoneParamsResponse(
    typeUrl: '/stride.stakeibc.MsgUpdateHostZoneParamsResponse',
  ),
  strideVestingPeriod(typeUrl: '/stride.vesting.Period'),
  strideIcqoracleQueryTokenPriceRequest(
    typeUrl: '/stride.icqoracle.QueryTokenPriceRequest',
    serviceUrl: "/stride.icqoracle.Query/TokenPrice",
  ),
  strideIcqoracleQueryTokenPricesRequest(
    typeUrl: '/stride.icqoracle.QueryTokenPricesRequest',
    serviceUrl: "/stride.icqoracle.Query/TokenPrices",
  ),
  strideIcqoracleTokenPriceResponse(
    typeUrl: '/stride.icqoracle.TokenPriceResponse',
  ),
  strideIcqoracleQueryTokenPricesResponse(
    typeUrl: '/stride.icqoracle.QueryTokenPricesResponse',
  ),
  strideIcqoracleQueryParamsRequest(
    typeUrl: '/stride.icqoracle.QueryParamsRequest',
    serviceUrl: "/stride.icqoracle.Query/Params",
  ),
  strideIcqoracleQueryParamsResponse(
    typeUrl: '/stride.icqoracle.QueryParamsResponse',
  ),
  strideIcqoracleQueryTokenPriceForQuoteDenomRequest(
    typeUrl: '/stride.icqoracle.QueryTokenPriceForQuoteDenomRequest',
    serviceUrl: "/stride.icqoracle.Query/TokenPriceForQuoteDenom",
  ),
  strideIcqoracleQueryTokenPriceForQuoteDenomResponse(
    typeUrl: '/stride.icqoracle.QueryTokenPriceForQuoteDenomResponse',
  ),
  strideIcqoracleTokenPrice(typeUrl: '/stride.icqoracle.TokenPrice'),
  strideIcqoracleParams(typeUrl: '/stride.icqoracle.Params'),
  strideIcqoracleMsgRegisterTokenPriceQuery(
    typeUrl: '/stride.icqoracle.MsgRegisterTokenPriceQuery',
    serviceUrl: "/stride.icqoracle.Msg/RegisterTokenPriceQuery",
    aminoType: "icqoracle/MsgRegisterTokenPriceQuery",
  ),
  strideIcqoracleMsgRegisterTokenPriceQueryResponse(
    typeUrl: '/stride.icqoracle.MsgRegisterTokenPriceQueryResponse',
  ),
  strideIcqoracleMsgRemoveTokenPriceQuery(
    typeUrl: '/stride.icqoracle.MsgRemoveTokenPriceQuery',
    serviceUrl: "/stride.icqoracle.Msg/RemoveTokenPriceQuery",
    aminoType: "icqoracle/MsgRemoveTokenPriceQuery",
  ),
  strideIcqoracleMsgRemoveTokenPriceQueryResponse(
    typeUrl: '/stride.icqoracle.MsgRemoveTokenPriceQueryResponse',
  ),
  strideIcqoracleMsgUpdateParams(
    typeUrl: '/stride.icqoracle.MsgUpdateParams',
    serviceUrl: "/stride.icqoracle.Msg/UpdateParams",
    aminoType: "icqoracle/MsgUpdateParams",
  ),
  strideIcqoracleMsgUpdateParamsResponse(
    typeUrl: '/stride.icqoracle.MsgUpdateParamsResponse',
  ),
  strideIcacallbacksQueryParamsRequest(
    typeUrl: '/stride.icacallbacks.QueryParamsRequest',
    serviceUrl: "/stride.icacallbacks.Query/Params",
  ),
  strideIcacallbacksQueryParamsResponse(
    typeUrl: '/stride.icacallbacks.QueryParamsResponse',
  ),
  strideIcacallbacksQueryGetCallbackDataRequest(
    typeUrl: '/stride.icacallbacks.QueryGetCallbackDataRequest',
    serviceUrl: "/stride.icacallbacks.Query/CallbackData",
  ),
  strideIcacallbacksQueryGetCallbackDataResponse(
    typeUrl: '/stride.icacallbacks.QueryGetCallbackDataResponse',
  ),
  strideIcacallbacksQueryAllCallbackDataRequest(
    typeUrl: '/stride.icacallbacks.QueryAllCallbackDataRequest',
    serviceUrl: "/stride.icacallbacks.Query/CallbackDataAll",
  ),
  strideIcacallbacksQueryAllCallbackDataResponse(
    typeUrl: '/stride.icacallbacks.QueryAllCallbackDataResponse',
  ),
  strideIcacallbacksParams(typeUrl: '/stride.icacallbacks.Params'),
  strideIcacallbacksCallbackData(typeUrl: '/stride.icacallbacks.CallbackData'),
  strideRecordsQueryParamsRequest(
    typeUrl: '/stride.records.QueryParamsRequest',
    serviceUrl: "/stride.records.Query/Params",
  ),
  strideRecordsQueryParamsResponse(
    typeUrl: '/stride.records.QueryParamsResponse',
  ),
  strideRecordsQueryGetDepositRecordRequest(
    typeUrl: '/stride.records.QueryGetDepositRecordRequest',
    serviceUrl: "/stride.records.Query/DepositRecord",
  ),
  strideRecordsQueryGetDepositRecordResponse(
    typeUrl: '/stride.records.QueryGetDepositRecordResponse',
  ),
  strideRecordsQueryAllDepositRecordRequest(
    typeUrl: '/stride.records.QueryAllDepositRecordRequest',
    serviceUrl: "/stride.records.Query/DepositRecordAll",
  ),
  strideRecordsQueryAllDepositRecordResponse(
    typeUrl: '/stride.records.QueryAllDepositRecordResponse',
  ),
  strideRecordsQueryDepositRecordByHostRequest(
    typeUrl: '/stride.records.QueryDepositRecordByHostRequest',
    serviceUrl: "/stride.records.Query/DepositRecordByHost",
  ),
  strideRecordsQueryDepositRecordByHostResponse(
    typeUrl: '/stride.records.QueryDepositRecordByHostResponse',
  ),
  strideRecordsQueryGetUserRedemptionRecordRequest(
    typeUrl: '/stride.records.QueryGetUserRedemptionRecordRequest',
    serviceUrl: "/stride.records.Query/UserRedemptionRecord",
  ),
  strideRecordsQueryGetUserRedemptionRecordResponse(
    typeUrl: '/stride.records.QueryGetUserRedemptionRecordResponse',
  ),
  strideRecordsQueryAllUserRedemptionRecordRequest(
    typeUrl: '/stride.records.QueryAllUserRedemptionRecordRequest',
    serviceUrl: "/stride.records.Query/UserRedemptionRecordAll",
  ),
  strideRecordsQueryAllUserRedemptionRecordResponse(
    typeUrl: '/stride.records.QueryAllUserRedemptionRecordResponse',
  ),
  strideRecordsQueryAllUserRedemptionRecordForUserRequest(
    typeUrl: '/stride.records.QueryAllUserRedemptionRecordForUserRequest',
    serviceUrl: "/stride.records.Query/UserRedemptionRecordForUser",
  ),
  strideRecordsQueryAllUserRedemptionRecordForUserResponse(
    typeUrl: '/stride.records.QueryAllUserRedemptionRecordForUserResponse',
  ),
  strideRecordsQueryGetEpochUnbondingRecordRequest(
    typeUrl: '/stride.records.QueryGetEpochUnbondingRecordRequest',
    serviceUrl: "/stride.records.Query/EpochUnbondingRecord",
  ),
  strideRecordsQueryGetEpochUnbondingRecordResponse(
    typeUrl: '/stride.records.QueryGetEpochUnbondingRecordResponse',
  ),
  strideRecordsQueryAllEpochUnbondingRecordRequest(
    typeUrl: '/stride.records.QueryAllEpochUnbondingRecordRequest',
    serviceUrl: "/stride.records.Query/EpochUnbondingRecordAll",
  ),
  strideRecordsQueryAllEpochUnbondingRecordResponse(
    typeUrl: '/stride.records.QueryAllEpochUnbondingRecordResponse',
  ),
  strideRecordsQueryLSMDepositRequest(
    typeUrl: '/stride.records.QueryLSMDepositRequest',
    serviceUrl: "/stride.records.Query/LSMDeposit",
  ),
  strideRecordsQueryLSMDepositResponse(
    typeUrl: '/stride.records.QueryLSMDepositResponse',
  ),
  strideRecordsQueryLSMDepositsRequest(
    typeUrl: '/stride.records.QueryLSMDepositsRequest',
    serviceUrl: "/stride.records.Query/LSMDeposits",
  ),
  strideRecordsQueryLSMDepositsResponse(
    typeUrl: '/stride.records.QueryLSMDepositsResponse',
  ),
  strideRecordsUserRedemptionRecord(
    typeUrl: '/stride.records.UserRedemptionRecord',
  ),
  strideRecordsDepositRecord(typeUrl: '/stride.records.DepositRecord'),
  strideRecordsHostZoneUnbonding(typeUrl: '/stride.records.HostZoneUnbonding'),
  strideRecordsEpochUnbondingRecord(
    typeUrl: '/stride.records.EpochUnbondingRecord',
  ),
  strideRecordsLSMTokenDeposit(typeUrl: '/stride.records.LSMTokenDeposit'),
  strideRecordsParams(typeUrl: '/stride.records.Params'),
  strideInterchainqueryV1QueryPendingQueriesRequest(
    typeUrl: '/stride.interchainquery.v1.QueryPendingQueriesRequest',
    serviceUrl: "/stride.interchainquery.v1.QueryService/PendingQueries",
  ),
  strideInterchainqueryV1QueryPendingQueriesResponse(
    typeUrl: '/stride.interchainquery.v1.QueryPendingQueriesResponse',
  ),
  strideInterchainqueryV1Query(typeUrl: '/stride.interchainquery.v1.Query'),
  strideInterchainqueryV1MsgSubmitQueryResponse(
    typeUrl: '/stride.interchainquery.v1.MsgSubmitQueryResponse',
    serviceUrl: "/stride.interchainquery.v1.Msg/SubmitQueryResponse",
    aminoType: "interchainquery/MsgSubmitQueryResponse",
  ),
  strideInterchainqueryV1MsgSubmitQueryResponseResponse(
    typeUrl: '/stride.interchainquery.v1.MsgSubmitQueryResponseResponse',
  ),
  strideClaimClaimStatus(typeUrl: '/stride.claim.ClaimStatus'),
  strideClaimQueryClaimStatusRequest(
    typeUrl: '/stride.claim.QueryClaimStatusRequest',
    serviceUrl: "/stride.claim.Query/ClaimStatus",
  ),
  strideClaimQueryClaimStatusResponse(
    typeUrl: '/stride.claim.QueryClaimStatusResponse',
  ),
  strideClaimClaimMetadata(typeUrl: '/stride.claim.ClaimMetadata'),
  strideClaimQueryClaimMetadataRequest(
    typeUrl: '/stride.claim.QueryClaimMetadataRequest',
    serviceUrl: "/stride.claim.Query/ClaimMetadata",
  ),
  strideClaimQueryClaimMetadataResponse(
    typeUrl: '/stride.claim.QueryClaimMetadataResponse',
  ),
  strideClaimQueryDistributorAccountBalanceRequest(
    typeUrl: '/stride.claim.QueryDistributorAccountBalanceRequest',
    serviceUrl: "/stride.claim.Query/DistributorAccountBalance",
  ),
  strideClaimQueryDistributorAccountBalanceResponse(
    typeUrl: '/stride.claim.QueryDistributorAccountBalanceResponse',
  ),
  strideClaimQueryParamsRequest(
    typeUrl: '/stride.claim.QueryParamsRequest',
    serviceUrl: "/stride.claim.Query/Params",
  ),
  strideClaimQueryParamsResponse(typeUrl: '/stride.claim.QueryParamsResponse'),
  strideClaimQueryClaimRecordRequest(
    typeUrl: '/stride.claim.QueryClaimRecordRequest',
    serviceUrl: "/stride.claim.Query/ClaimRecord",
  ),
  strideClaimQueryClaimRecordResponse(
    typeUrl: '/stride.claim.QueryClaimRecordResponse',
  ),
  strideClaimQueryClaimableForActionRequest(
    typeUrl: '/stride.claim.QueryClaimableForActionRequest',
    serviceUrl: "/stride.claim.Query/ClaimableForAction",
  ),
  strideClaimQueryClaimableForActionResponse(
    typeUrl: '/stride.claim.QueryClaimableForActionResponse',
  ),
  strideClaimQueryTotalClaimableRequest(
    typeUrl: '/stride.claim.QueryTotalClaimableRequest',
    serviceUrl: "/stride.claim.Query/TotalClaimable",
  ),
  strideClaimQueryTotalClaimableResponse(
    typeUrl: '/stride.claim.QueryTotalClaimableResponse',
  ),
  strideClaimQueryUserVestingsRequest(
    typeUrl: '/stride.claim.QueryUserVestingsRequest',
    serviceUrl: "/stride.claim.Query/UserVestings",
  ),
  strideClaimQueryUserVestingsResponse(
    typeUrl: '/stride.claim.QueryUserVestingsResponse',
  ),
  strideClaimClaimRecord(typeUrl: '/stride.claim.ClaimRecord'),
  strideClaimParams(typeUrl: '/stride.claim.Params'),
  strideClaimAirdrop(typeUrl: '/stride.claim.Airdrop'),
  strideClaimMsgSetAirdropAllocations(
    typeUrl: '/stride.claim.MsgSetAirdropAllocations',
    serviceUrl: "/stride.claim.Msg/SetAirdropAllocations",
    aminoType: "claim/MsgSetAirdropAllocations",
  ),
  strideClaimMsgSetAirdropAllocationsResponse(
    typeUrl: '/stride.claim.MsgSetAirdropAllocationsResponse',
  ),
  strideClaimMsgClaimFreeAmount(
    typeUrl: '/stride.claim.MsgClaimFreeAmount',
    serviceUrl: "/stride.claim.Msg/ClaimFreeAmount",
    aminoType: "claim/MsgClaimFreeAmount",
  ),
  strideClaimMsgClaimFreeAmountResponse(
    typeUrl: '/stride.claim.MsgClaimFreeAmountResponse',
  ),
  strideClaimMsgCreateAirdrop(
    typeUrl: '/stride.claim.MsgCreateAirdrop',
    serviceUrl: "/stride.claim.Msg/CreateAirdrop",
    aminoType: "claim/MsgCreateAirdrop",
  ),
  strideClaimMsgCreateAirdropResponse(
    typeUrl: '/stride.claim.MsgCreateAirdropResponse',
  ),
  strideClaimMsgDeleteAirdrop(
    typeUrl: '/stride.claim.MsgDeleteAirdrop',
    serviceUrl: "/stride.claim.Msg/DeleteAirdrop",
    aminoType: "claim/MsgDeleteAirdrop",
  ),
  strideClaimMsgDeleteAirdropResponse(
    typeUrl: '/stride.claim.MsgDeleteAirdropResponse',
  ),
  strideStakedymQueryHostZoneRequest(
    typeUrl: '/stride.stakedym.QueryHostZoneRequest',
    serviceUrl: "/stride.stakedym.Query/HostZone",
  ),
  strideStakedymQueryHostZoneResponse(
    typeUrl: '/stride.stakedym.QueryHostZoneResponse',
  ),
  strideStakedymQueryDelegationRecordsRequest(
    typeUrl: '/stride.stakedym.QueryDelegationRecordsRequest',
    serviceUrl: "/stride.stakedym.Query/DelegationRecords",
  ),
  strideStakedymQueryDelegationRecordsResponse(
    typeUrl: '/stride.stakedym.QueryDelegationRecordsResponse',
  ),
  strideStakedymQueryUnbondingRecordsRequest(
    typeUrl: '/stride.stakedym.QueryUnbondingRecordsRequest',
    serviceUrl: "/stride.stakedym.Query/UnbondingRecords",
  ),
  strideStakedymQueryUnbondingRecordsResponse(
    typeUrl: '/stride.stakedym.QueryUnbondingRecordsResponse',
  ),
  strideStakedymQueryRedemptionRecordRequest(
    typeUrl: '/stride.stakedym.QueryRedemptionRecordRequest',
    serviceUrl: "/stride.stakedym.Query/RedemptionRecord",
  ),
  strideStakedymQueryRedemptionRecordResponse(
    typeUrl: '/stride.stakedym.QueryRedemptionRecordResponse',
  ),
  strideStakedymQueryRedemptionRecordsRequest(
    typeUrl: '/stride.stakedym.QueryRedemptionRecordsRequest',
    serviceUrl: "/stride.stakedym.Query/RedemptionRecords",
  ),
  strideStakedymQueryRedemptionRecordsResponse(
    typeUrl: '/stride.stakedym.QueryRedemptionRecordsResponse',
  ),
  strideStakedymQuerySlashRecordsRequest(
    typeUrl: '/stride.stakedym.QuerySlashRecordsRequest',
    serviceUrl: "/stride.stakedym.Query/SlashRecords",
  ),
  strideStakedymQuerySlashRecordsResponse(
    typeUrl: '/stride.stakedym.QuerySlashRecordsResponse',
  ),
  strideStakedymRedemptionRecordResponse(
    typeUrl: '/stride.stakedym.RedemptionRecordResponse',
  ),
  strideStakedymHostZone(typeUrl: '/stride.stakedym.HostZone'),
  strideStakedymDelegationRecord(typeUrl: '/stride.stakedym.DelegationRecord'),
  strideStakedymUnbondingRecord(typeUrl: '/stride.stakedym.UnbondingRecord'),
  strideStakedymRedemptionRecord(typeUrl: '/stride.stakedym.RedemptionRecord'),
  strideStakedymSlashRecord(typeUrl: '/stride.stakedym.SlashRecord'),
  strideStakedymMsgLiquidStake(
    typeUrl: '/stride.stakedym.MsgLiquidStake',
    serviceUrl: "/stride.stakedym.Msg/LiquidStake",
    aminoType: "stakedym/MsgLiquidStake",
  ),
  strideStakedymMsgLiquidStakeResponse(
    typeUrl: '/stride.stakedym.MsgLiquidStakeResponse',
  ),
  strideStakedymMsgRedeemStake(
    typeUrl: '/stride.stakedym.MsgRedeemStake',
    serviceUrl: "/stride.stakedym.Msg/RedeemStake",
    aminoType: "stakedym/MsgRedeemStake",
  ),
  strideStakedymMsgRedeemStakeResponse(
    typeUrl: '/stride.stakedym.MsgRedeemStakeResponse',
  ),
  strideStakedymMsgConfirmDelegation(
    typeUrl: '/stride.stakedym.MsgConfirmDelegation',
    serviceUrl: "/stride.stakedym.Msg/ConfirmDelegation",
    aminoType: "stakedym/MsgConfirmDelegation",
  ),
  strideStakedymMsgConfirmDelegationResponse(
    typeUrl: '/stride.stakedym.MsgConfirmDelegationResponse',
  ),
  strideStakedymMsgConfirmUndelegation(
    typeUrl: '/stride.stakedym.MsgConfirmUndelegation',
    serviceUrl: "/stride.stakedym.Msg/ConfirmUndelegation",
    aminoType: "stakedym/MsgConfirmUndelegation",
  ),
  strideStakedymMsgConfirmUndelegationResponse(
    typeUrl: '/stride.stakedym.MsgConfirmUndelegationResponse',
  ),
  strideStakedymMsgConfirmUnbondedTokenSweep(
    typeUrl: '/stride.stakedym.MsgConfirmUnbondedTokenSweep',
    serviceUrl: "/stride.stakedym.Msg/ConfirmUnbondedTokenSweep",
    aminoType: "stakedym/MsgConfirmUnbondedTokenSweep",
  ),
  strideStakedymMsgConfirmUnbondedTokenSweepResponse(
    typeUrl: '/stride.stakedym.MsgConfirmUnbondedTokenSweepResponse',
  ),
  strideStakedymMsgAdjustDelegatedBalance(
    typeUrl: '/stride.stakedym.MsgAdjustDelegatedBalance',
    serviceUrl: "/stride.stakedym.Msg/AdjustDelegatedBalance",
    aminoType: "stakedym/MsgAdjustDelegatedBalance",
  ),
  strideStakedymMsgAdjustDelegatedBalanceResponse(
    typeUrl: '/stride.stakedym.MsgAdjustDelegatedBalanceResponse',
  ),
  strideStakedymMsgUpdateInnerRedemptionRateBounds(
    typeUrl: '/stride.stakedym.MsgUpdateInnerRedemptionRateBounds',
    serviceUrl: "/stride.stakedym.Msg/UpdateInnerRedemptionRateBounds",
    aminoType: "stakedym/MsgUpdateRedemptionRateBounds",
  ),
  strideStakedymMsgUpdateInnerRedemptionRateBoundsResponse(
    typeUrl: '/stride.stakedym.MsgUpdateInnerRedemptionRateBoundsResponse',
  ),
  strideStakedymMsgResumeHostZone(
    typeUrl: '/stride.stakedym.MsgResumeHostZone',
    serviceUrl: "/stride.stakedym.Msg/ResumeHostZone",
    aminoType: "stakedym/MsgResumeHostZone",
  ),
  strideStakedymMsgResumeHostZoneResponse(
    typeUrl: '/stride.stakedym.MsgResumeHostZoneResponse',
  ),
  strideStakedymMsgRefreshRedemptionRate(
    typeUrl: '/stride.stakedym.MsgRefreshRedemptionRate',
    serviceUrl: "/stride.stakedym.Msg/RefreshRedemptionRate",
    aminoType: "stakedym/MsgRefreshRedemptionRate",
  ),
  strideStakedymMsgRefreshRedemptionRateResponse(
    typeUrl: '/stride.stakedym.MsgRefreshRedemptionRateResponse',
  ),
  strideStakedymMsgOverwriteDelegationRecord(
    typeUrl: '/stride.stakedym.MsgOverwriteDelegationRecord',
    serviceUrl: "/stride.stakedym.Msg/OverwriteDelegationRecord",
    aminoType: "stakedym/MsgOverwriteDelegationRecord",
  ),
  strideStakedymMsgOverwriteDelegationRecordResponse(
    typeUrl: '/stride.stakedym.MsgOverwriteDelegationRecordResponse',
  ),
  strideStakedymMsgOverwriteUnbondingRecord(
    typeUrl: '/stride.stakedym.MsgOverwriteUnbondingRecord',
    serviceUrl: "/stride.stakedym.Msg/OverwriteUnbondingRecord",
    aminoType: "stakedym/MsgOverwriteUnbondingRecord",
  ),
  strideStakedymMsgOverwriteUnbondingRecordResponse(
    typeUrl: '/stride.stakedym.MsgOverwriteUnbondingRecordResponse',
  ),
  strideStakedymMsgOverwriteRedemptionRecord(
    typeUrl: '/stride.stakedym.MsgOverwriteRedemptionRecord',
    serviceUrl: "/stride.stakedym.Msg/OverwriteRedemptionRecord",
    aminoType: "stakedym/MsgOverwriteRedemptionRecord",
  ),
  strideStakedymMsgOverwriteRedemptionRecordResponse(
    typeUrl: '/stride.stakedym.MsgOverwriteRedemptionRecordResponse',
  ),
  strideStakedymMsgSetOperatorAddress(
    typeUrl: '/stride.stakedym.MsgSetOperatorAddress',
    serviceUrl: "/stride.stakedym.Msg/SetOperatorAddress",
    aminoType: "stakedym/MsgSetOperatorAddress",
  ),
  strideStakedymMsgSetOperatorAddressResponse(
    typeUrl: '/stride.stakedym.MsgSetOperatorAddressResponse',
  ),
  strideMintV1beta1QueryParamsRequest(
    typeUrl: '/stride.mint.v1beta1.QueryParamsRequest',
    serviceUrl: "/stride.mint.v1beta1.Query/Params",
  ),
  strideMintV1beta1QueryParamsResponse(
    typeUrl: '/stride.mint.v1beta1.QueryParamsResponse',
  ),
  strideMintV1beta1QueryEpochProvisionsRequest(
    typeUrl: '/stride.mint.v1beta1.QueryEpochProvisionsRequest',
    serviceUrl: "/stride.mint.v1beta1.Query/EpochProvisions",
  ),
  strideMintV1beta1QueryEpochProvisionsResponse(
    typeUrl: '/stride.mint.v1beta1.QueryEpochProvisionsResponse',
  ),
  strideMintV1beta1DistributionProportions(
    typeUrl: '/stride.mint.v1beta1.DistributionProportions',
  ),
  strideMintV1beta1Params(typeUrl: '/stride.mint.v1beta1.Params'),
  strideAutopilotQueryParamsRequest(
    typeUrl: '/stride.autopilot.QueryParamsRequest',
    serviceUrl: "/stride.autopilot.Query/Params",
  ),
  strideAutopilotQueryParamsResponse(
    typeUrl: '/stride.autopilot.QueryParamsResponse',
  ),
  strideAutopilotParams(typeUrl: '/stride.autopilot.Params'),
  strideAuctionQueryAuctionRequest(
    typeUrl: '/stride.auction.QueryAuctionRequest',
    serviceUrl: "/stride.auction.Query/Auction",
  ),
  strideAuctionQueryAuctionResponse(
    typeUrl: '/stride.auction.QueryAuctionResponse',
  ),
  strideAuctionQueryAuctionsRequest(
    typeUrl: '/stride.auction.QueryAuctionsRequest',
    serviceUrl: "/stride.auction.Query/Auctions",
  ),
  strideAuctionQueryAuctionsResponse(
    typeUrl: '/stride.auction.QueryAuctionsResponse',
  ),
  strideAuctionAuction(typeUrl: '/stride.auction.Auction'),
  strideAuctionMsgPlaceBid(
    typeUrl: '/stride.auction.MsgPlaceBid',
    serviceUrl: "/stride.auction.Msg/PlaceBid",
    aminoType: "auction/MsgPlaceBid",
  ),
  strideAuctionMsgPlaceBidResponse(
    typeUrl: '/stride.auction.MsgPlaceBidResponse',
  ),
  strideAuctionMsgCreateAuction(
    typeUrl: '/stride.auction.MsgCreateAuction',
    serviceUrl: "/stride.auction.Msg/CreateAuction",
    aminoType: "auction/MsgCreateAuction",
  ),
  strideAuctionMsgCreateAuctionResponse(
    typeUrl: '/stride.auction.MsgCreateAuctionResponse',
  ),
  strideAuctionMsgUpdateAuction(
    typeUrl: '/stride.auction.MsgUpdateAuction',
    serviceUrl: "/stride.auction.Msg/UpdateAuction",
    aminoType: "auction/MsgUpdateAuction",
  ),
  strideAuctionMsgUpdateAuctionResponse(
    typeUrl: '/stride.auction.MsgUpdateAuctionResponse',
  ),
  strideEpochsQueryEpochsInfoRequest(
    typeUrl: '/stride.epochs.QueryEpochsInfoRequest',
    serviceUrl: "/stride.epochs.Query/EpochInfos",
  ),
  strideEpochsQueryEpochsInfoResponse(
    typeUrl: '/stride.epochs.QueryEpochsInfoResponse',
  ),
  strideEpochsQueryCurrentEpochRequest(
    typeUrl: '/stride.epochs.QueryCurrentEpochRequest',
    serviceUrl: "/stride.epochs.Query/CurrentEpoch",
  ),
  strideEpochsQueryCurrentEpochResponse(
    typeUrl: '/stride.epochs.QueryCurrentEpochResponse',
  ),
  strideEpochsQueryEpochInfoRequest(
    typeUrl: '/stride.epochs.QueryEpochInfoRequest',
    serviceUrl: "/stride.epochs.Query/EpochInfo",
  ),
  strideEpochsQueryEpochInfoResponse(
    typeUrl: '/stride.epochs.QueryEpochInfoResponse',
  ),
  strideEpochsEpochInfo(typeUrl: '/stride.epochs.EpochInfo'),
  strideStaketiaQueryHostZoneRequest(
    typeUrl: '/stride.staketia.QueryHostZoneRequest',
    serviceUrl: "/stride.staketia.Query/HostZone",
  ),
  strideStaketiaQueryHostZoneResponse(
    typeUrl: '/stride.staketia.QueryHostZoneResponse',
  ),
  strideStaketiaQueryDelegationRecordsRequest(
    typeUrl: '/stride.staketia.QueryDelegationRecordsRequest',
    serviceUrl: "/stride.staketia.Query/DelegationRecords",
  ),
  strideStaketiaQueryDelegationRecordsResponse(
    typeUrl: '/stride.staketia.QueryDelegationRecordsResponse',
  ),
  strideStaketiaQueryUnbondingRecordsRequest(
    typeUrl: '/stride.staketia.QueryUnbondingRecordsRequest',
    serviceUrl: "/stride.staketia.Query/UnbondingRecords",
  ),
  strideStaketiaQueryUnbondingRecordsResponse(
    typeUrl: '/stride.staketia.QueryUnbondingRecordsResponse',
  ),
  strideStaketiaQueryRedemptionRecordRequest(
    typeUrl: '/stride.staketia.QueryRedemptionRecordRequest',
    serviceUrl: "/stride.staketia.Query/RedemptionRecord",
  ),
  strideStaketiaQueryRedemptionRecordResponse(
    typeUrl: '/stride.staketia.QueryRedemptionRecordResponse',
  ),
  strideStaketiaQueryRedemptionRecordsRequest(
    typeUrl: '/stride.staketia.QueryRedemptionRecordsRequest',
    serviceUrl: "/stride.staketia.Query/RedemptionRecords",
  ),
  strideStaketiaQueryRedemptionRecordsResponse(
    typeUrl: '/stride.staketia.QueryRedemptionRecordsResponse',
  ),
  strideStaketiaQuerySlashRecordsRequest(
    typeUrl: '/stride.staketia.QuerySlashRecordsRequest',
    serviceUrl: "/stride.staketia.Query/SlashRecords",
  ),
  strideStaketiaQuerySlashRecordsResponse(
    typeUrl: '/stride.staketia.QuerySlashRecordsResponse',
  ),
  strideStaketiaRedemptionRecordResponse(
    typeUrl: '/stride.staketia.RedemptionRecordResponse',
  ),
  strideStaketiaMsgLiquidStake(
    typeUrl: '/stride.staketia.MsgLiquidStake',
    serviceUrl: "/stride.staketia.Msg/LiquidStake",
    aminoType: "staketia/MsgLiquidStake",
  ),
  strideStaketiaMsgLiquidStakeResponse(
    typeUrl: '/stride.staketia.MsgLiquidStakeResponse',
  ),
  strideStaketiaMsgRedeemStake(
    typeUrl: '/stride.staketia.MsgRedeemStake',
    serviceUrl: "/stride.staketia.Msg/RedeemStake",
    aminoType: "staketia/MsgRedeemStake",
  ),
  strideStaketiaMsgRedeemStakeResponse(
    typeUrl: '/stride.staketia.MsgRedeemStakeResponse',
  ),
  strideStaketiaMsgConfirmDelegation(
    typeUrl: '/stride.staketia.MsgConfirmDelegation',
    serviceUrl: "/stride.staketia.Msg/ConfirmDelegation",
    aminoType: "staketia/MsgConfirmDelegation",
  ),
  strideStaketiaMsgConfirmDelegationResponse(
    typeUrl: '/stride.staketia.MsgConfirmDelegationResponse',
  ),
  strideStaketiaMsgConfirmUndelegation(
    typeUrl: '/stride.staketia.MsgConfirmUndelegation',
    serviceUrl: "/stride.staketia.Msg/ConfirmUndelegation",
    aminoType: "staketia/MsgConfirmUndelegation",
  ),
  strideStaketiaMsgConfirmUndelegationResponse(
    typeUrl: '/stride.staketia.MsgConfirmUndelegationResponse',
  ),
  strideStaketiaMsgConfirmUnbondedTokenSweep(
    typeUrl: '/stride.staketia.MsgConfirmUnbondedTokenSweep',
    serviceUrl: "/stride.staketia.Msg/ConfirmUnbondedTokenSweep",
    aminoType: "staketia/MsgConfirmUnbondedTokenSweep",
  ),
  strideStaketiaMsgConfirmUnbondedTokenSweepResponse(
    typeUrl: '/stride.staketia.MsgConfirmUnbondedTokenSweepResponse',
  ),
  strideStaketiaMsgAdjustDelegatedBalance(
    typeUrl: '/stride.staketia.MsgAdjustDelegatedBalance',
    serviceUrl: "/stride.staketia.Msg/AdjustDelegatedBalance",
    aminoType: "staketia/MsgAdjustDelegatedBalance",
  ),
  strideStaketiaMsgAdjustDelegatedBalanceResponse(
    typeUrl: '/stride.staketia.MsgAdjustDelegatedBalanceResponse',
  ),
  strideStaketiaMsgUpdateInnerRedemptionRateBounds(
    typeUrl: '/stride.staketia.MsgUpdateInnerRedemptionRateBounds',
    serviceUrl: "/stride.staketia.Msg/UpdateInnerRedemptionRateBounds",
    aminoType: "staketia/MsgUpdateRedemptionRateBounds",
  ),
  strideStaketiaMsgUpdateInnerRedemptionRateBoundsResponse(
    typeUrl: '/stride.staketia.MsgUpdateInnerRedemptionRateBoundsResponse',
  ),
  strideStaketiaMsgResumeHostZone(
    typeUrl: '/stride.staketia.MsgResumeHostZone',
    serviceUrl: "/stride.staketia.Msg/ResumeHostZone",
    aminoType: "staketia/MsgResumeHostZone",
  ),
  strideStaketiaMsgResumeHostZoneResponse(
    typeUrl: '/stride.staketia.MsgResumeHostZoneResponse',
  ),
  strideStaketiaMsgRefreshRedemptionRate(
    typeUrl: '/stride.staketia.MsgRefreshRedemptionRate',
    serviceUrl: "/stride.staketia.Msg/RefreshRedemptionRate",
    aminoType: "staketia/MsgRefreshRedemptionRate",
  ),
  strideStaketiaMsgRefreshRedemptionRateResponse(
    typeUrl: '/stride.staketia.MsgRefreshRedemptionRateResponse',
  ),
  strideStaketiaMsgOverwriteDelegationRecord(
    typeUrl: '/stride.staketia.MsgOverwriteDelegationRecord',
    serviceUrl: "/stride.staketia.Msg/OverwriteDelegationRecord",
    aminoType: "staketia/MsgOverwriteDelegationRecord",
  ),
  strideStaketiaMsgOverwriteDelegationRecordResponse(
    typeUrl: '/stride.staketia.MsgOverwriteDelegationRecordResponse',
  ),
  strideStaketiaMsgOverwriteUnbondingRecord(
    typeUrl: '/stride.staketia.MsgOverwriteUnbondingRecord',
    serviceUrl: "/stride.staketia.Msg/OverwriteUnbondingRecord",
    aminoType: "staketia/MsgOverwriteUnbondingRecord",
  ),
  strideStaketiaMsgOverwriteUnbondingRecordResponse(
    typeUrl: '/stride.staketia.MsgOverwriteUnbondingRecordResponse',
  ),
  strideStaketiaMsgOverwriteRedemptionRecord(
    typeUrl: '/stride.staketia.MsgOverwriteRedemptionRecord',
    serviceUrl: "/stride.staketia.Msg/OverwriteRedemptionRecord",
    aminoType: "staketia/MsgOverwriteRedemptionRecord",
  ),
  strideStaketiaMsgOverwriteRedemptionRecordResponse(
    typeUrl: '/stride.staketia.MsgOverwriteRedemptionRecordResponse',
  ),
  strideStaketiaMsgSetOperatorAddress(
    typeUrl: '/stride.staketia.MsgSetOperatorAddress',
    serviceUrl: "/stride.staketia.Msg/SetOperatorAddress",
    aminoType: "staketia/MsgSetOperatorAddress",
  ),
  strideStaketiaMsgSetOperatorAddressResponse(
    typeUrl: '/stride.staketia.MsgSetOperatorAddressResponse',
  ),
  strideStaketiaHostZone(typeUrl: '/stride.staketia.HostZone'),
  strideStaketiaDelegationRecord(typeUrl: '/stride.staketia.DelegationRecord'),
  strideStaketiaUnbondingRecord(typeUrl: '/stride.staketia.UnbondingRecord'),
  strideStaketiaRedemptionRecord(typeUrl: '/stride.staketia.RedemptionRecord'),
  strideStaketiaSlashRecord(typeUrl: '/stride.staketia.SlashRecord'),
  strideStrdburnerQueryStrdBurnerAddressRequest(
    typeUrl: '/stride.strdburner.QueryStrdBurnerAddressRequest',
    serviceUrl: "/stride.strdburner.Query/StrdBurnerAddress",
  ),
  strideStrdburnerQueryStrdBurnerAddressResponse(
    typeUrl: '/stride.strdburner.QueryStrdBurnerAddressResponse',
  ),
  strideStrdburnerQueryTotalStrdBurnedRequest(
    typeUrl: '/stride.strdburner.QueryTotalStrdBurnedRequest',
    serviceUrl: "/stride.strdburner.Query/TotalStrdBurned",
  ),
  strideStrdburnerQueryTotalStrdBurnedResponse(
    typeUrl: '/stride.strdburner.QueryTotalStrdBurnedResponse',
  ),
  strideStrdburnerQueryStrdBurnedByAddressRequest(
    typeUrl: '/stride.strdburner.QueryStrdBurnedByAddressRequest',
    serviceUrl: "/stride.strdburner.Query/StrdBurnedByAddress",
  ),
  strideStrdburnerQueryStrdBurnedByAddressResponse(
    typeUrl: '/stride.strdburner.QueryStrdBurnedByAddressResponse',
  ),
  strideStrdburnerQueryLinkedAddressRequest(
    typeUrl: '/stride.strdburner.QueryLinkedAddressRequest',
    serviceUrl: "/stride.strdburner.Query/LinkedAddress",
  ),
  strideStrdburnerQueryLinkedAddressResponse(
    typeUrl: '/stride.strdburner.QueryLinkedAddressResponse',
  ),
  strideStrdburnerMsgBurn(
    typeUrl: '/stride.strdburner.MsgBurn',
    serviceUrl: "/stride.strdburner.Msg/Burn",
    aminoType: "strdburner/MsgBurn",
  ),
  strideStrdburnerMsgBurnResponse(
    typeUrl: '/stride.strdburner.MsgBurnResponse',
  ),
  strideStrdburnerMsgLink(
    typeUrl: '/stride.strdburner.MsgLink',
    serviceUrl: "/stride.strdburner.Msg/Link",
    aminoType: "strdburner/MsgLink",
  ),
  strideStrdburnerMsgLinkResponse(
    typeUrl: '/stride.strdburner.MsgLinkResponse',
  ),
  secretComputeV1beta1MsgStoreCode(
    typeUrl: '/secret.compute.v1beta1.MsgStoreCode',
    serviceUrl: "/secret.compute.v1beta1.Msg/StoreCode",
    aminoType: "wasm/MsgStoreCode",
  ),
  secretComputeV1beta1MsgStoreCodeResponse(
    typeUrl: '/secret.compute.v1beta1.MsgStoreCodeResponse',
  ),
  secretComputeV1beta1MsgInstantiateContract(
    typeUrl: '/secret.compute.v1beta1.MsgInstantiateContract',
    serviceUrl: "/secret.compute.v1beta1.Msg/InstantiateContract",
    aminoType: "wasm/MsgInstantiateContract",
  ),
  secretComputeV1beta1MsgInstantiateContractResponse(
    typeUrl: '/secret.compute.v1beta1.MsgInstantiateContractResponse',
  ),
  secretComputeV1beta1MsgExecuteContract(
    typeUrl: '/secret.compute.v1beta1.MsgExecuteContract',
    serviceUrl: "/secret.compute.v1beta1.Msg/ExecuteContract",
    aminoType: "wasm/MsgExecuteContract",
  ),
  secretComputeV1beta1MsgExecuteContractResponse(
    typeUrl: '/secret.compute.v1beta1.MsgExecuteContractResponse',
  ),
  secretComputeV1beta1MsgMigrateContract(
    typeUrl: '/secret.compute.v1beta1.MsgMigrateContract',
    serviceUrl: "/secret.compute.v1beta1.Msg/MigrateContract",
    aminoType: "wasm/MsgMigrateContract",
  ),
  secretComputeV1beta1MsgMigrateContractResponse(
    typeUrl: '/secret.compute.v1beta1.MsgMigrateContractResponse',
  ),
  secretComputeV1beta1MsgUpdateAdmin(
    typeUrl: '/secret.compute.v1beta1.MsgUpdateAdmin',
    serviceUrl: "/secret.compute.v1beta1.Msg/UpdateAdmin",
    aminoType: "wasm/MsgUpdateAdmin",
  ),
  secretComputeV1beta1MsgUpdateAdminResponse(
    typeUrl: '/secret.compute.v1beta1.MsgUpdateAdminResponse',
  ),
  secretComputeV1beta1MsgClearAdmin(
    typeUrl: '/secret.compute.v1beta1.MsgClearAdmin',
    serviceUrl: "/secret.compute.v1beta1.Msg/ClearAdmin",
    aminoType: "wasm/MsgClearAdmin",
  ),
  secretComputeV1beta1MsgClearAdminResponse(
    typeUrl: '/secret.compute.v1beta1.MsgClearAdminResponse',
  ),
  secretComputeV1beta1MsgUpdateParams(
    typeUrl: '/secret.compute.v1beta1.MsgUpdateParams',
    serviceUrl: "/secret.compute.v1beta1.Msg/UpdateParams",
    aminoType: "wasm/MsgUpdateParams",
  ),
  secretComputeV1beta1MsgUpdateParamsResponse(
    typeUrl: '/secret.compute.v1beta1.MsgUpdateParamsResponse',
  ),
  secretComputeV1beta1MsgUpgradeProposalPassed(
    typeUrl: '/secret.compute.v1beta1.MsgUpgradeProposalPassed',
    serviceUrl: "/secret.compute.v1beta1.Msg/UpgradeProposalPassed",
    aminoType: "wasm/MsgUpgradeProposalPassed",
  ),
  secretComputeV1beta1MsgUpgradeProposalPassedResponse(
    typeUrl: '/secret.compute.v1beta1.MsgUpgradeProposalPassedResponse',
  ),
  secretComputeV1beta1MigrateContractInfo(
    typeUrl: '/secret.compute.v1beta1.MigrateContractInfo',
  ),
  secretComputeV1beta1UpdateAdminInfo(
    typeUrl: '/secret.compute.v1beta1.UpdateAdminInfo',
  ),
  secretComputeV1beta1MsgContractGovernanceProposal(
    typeUrl: '/secret.compute.v1beta1.MsgContractGovernanceProposal',
    serviceUrl: "/secret.compute.v1beta1.Msg/ContractGovernanceProposal",
    aminoType: "wasm/MsgContractGovernanceProposal",
  ),
  secretComputeV1beta1MsgContractGovernanceProposalResponse(
    typeUrl: '/secret.compute.v1beta1.MsgContractGovernanceProposalResponse',
  ),
  secretComputeV1beta1MsgSetContractGovernance(
    typeUrl: '/secret.compute.v1beta1.MsgSetContractGovernance',
    serviceUrl: "/secret.compute.v1beta1.Msg/SetContractGovernance",
    aminoType: "wasm/MsgSetContractGovernance",
  ),
  secretComputeV1beta1MsgSetContractGovernanceResponse(
    typeUrl: '/secret.compute.v1beta1.MsgSetContractGovernanceResponse',
  ),
  secretComputeV1beta1MsgUpdateMachineWhitelistProposal(
    typeUrl: '/secret.compute.v1beta1.MsgUpdateMachineWhitelistProposal',
    serviceUrl: "/secret.compute.v1beta1.Msg/UpdateMachineWhitelistProposal",
    aminoType: "wasm/MsgUpdateMachineWhitelistProposal",
  ),
  secretComputeV1beta1MsgUpdateMachineWhitelistProposalResponse(
    typeUrl:
        '/secret.compute.v1beta1.MsgUpdateMachineWhitelistProposalResponse',
  ),
  secretComputeV1beta1MsgUpdateMachineWhitelist(
    typeUrl: '/secret.compute.v1beta1.MsgUpdateMachineWhitelist',
    serviceUrl: "/secret.compute.v1beta1.Msg/UpdateMachineWhitelist",
    aminoType: "wasm/MsgUpdateMachineWhitelist",
  ),
  secretComputeV1beta1MsgUpdateMachineWhitelistResponse(
    typeUrl: '/secret.compute.v1beta1.MsgUpdateMachineWhitelistResponse',
  ),
  secretComputeV1beta1ParamsRequest(
    typeUrl: '/secret.compute.v1beta1.ParamsRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/Params",
  ),
  secretComputeV1beta1ParamsResponse(
    typeUrl: '/secret.compute.v1beta1.ParamsResponse',
  ),
  secretComputeV1beta1QuerySecretContractRequest(
    typeUrl: '/secret.compute.v1beta1.QuerySecretContractRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/QuerySecretContract",
  ),
  secretComputeV1beta1QueryByLabelRequest(
    typeUrl: '/secret.compute.v1beta1.QueryByLabelRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/AddressByLabel",
  ),
  secretComputeV1beta1QueryByContractAddressRequest(
    typeUrl: '/secret.compute.v1beta1.QueryByContractAddressRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/ContractInfo",
  ),
  secretComputeV1beta1QueryByCodeIdRequest(
    typeUrl: '/secret.compute.v1beta1.QueryByCodeIdRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/ContractsByCodeId",
  ),
  secretComputeV1beta1QuerySecretContractResponse(
    typeUrl: '/secret.compute.v1beta1.QuerySecretContractResponse',
  ),
  secretComputeV1beta1QueryContractInfoResponse(
    typeUrl: '/secret.compute.v1beta1.QueryContractInfoResponse',
  ),
  secretComputeV1beta1ContractInfoWithAddress(
    typeUrl: '/secret.compute.v1beta1.ContractInfoWithAddress',
  ),
  secretComputeV1beta1QueryContractsByCodeIdResponse(
    typeUrl: '/secret.compute.v1beta1.QueryContractsByCodeIdResponse',
  ),
  secretComputeV1beta1CodeInfoResponse(
    typeUrl: '/secret.compute.v1beta1.CodeInfoResponse',
  ),
  secretComputeV1beta1QueryCodeResponse(
    typeUrl: '/secret.compute.v1beta1.QueryCodeResponse',
  ),
  secretComputeV1beta1QueryCodesResponse(
    typeUrl: '/secret.compute.v1beta1.QueryCodesResponse',
  ),
  secretComputeV1beta1QueryContractAddressResponse(
    typeUrl: '/secret.compute.v1beta1.QueryContractAddressResponse',
  ),
  secretComputeV1beta1QueryContractLabelResponse(
    typeUrl: '/secret.compute.v1beta1.QueryContractLabelResponse',
  ),
  secretComputeV1beta1QueryCodeHashResponse(
    typeUrl: '/secret.compute.v1beta1.QueryCodeHashResponse',
  ),
  secretComputeV1beta1QueryContractHistoryRequest(
    typeUrl: '/secret.compute.v1beta1.QueryContractHistoryRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/ContractHistory",
  ),
  secretComputeV1beta1QueryContractHistoryResponse(
    typeUrl: '/secret.compute.v1beta1.QueryContractHistoryResponse',
  ),
  secretComputeV1beta1QueryAuthorizedMigrationRequest(
    typeUrl: '/secret.compute.v1beta1.QueryAuthorizedMigrationRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/AuthorizedMigration",
  ),
  secretComputeV1beta1QueryAuthorizedMigrationResponse(
    typeUrl: '/secret.compute.v1beta1.QueryAuthorizedMigrationResponse',
  ),
  secretComputeV1beta1QueryAuthorizedAdminUpdateRequest(
    typeUrl: '/secret.compute.v1beta1.QueryAuthorizedAdminUpdateRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/AuthorizedAdminUpdate",
  ),
  secretComputeV1beta1QueryAuthorizedAdminUpdateResponse(
    typeUrl: '/secret.compute.v1beta1.QueryAuthorizedAdminUpdateResponse',
  ),
  secretComputeV1beta1QueryEcallRecordRequest(
    typeUrl: '/secret.compute.v1beta1.QueryEcallRecordRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/EcallRecord",
  ),
  secretComputeV1beta1QueryEcallRecordResponse(
    typeUrl: '/secret.compute.v1beta1.QueryEcallRecordResponse',
  ),
  secretComputeV1beta1QueryNetworkPubkeyRequest(
    typeUrl: '/secret.compute.v1beta1.QueryNetworkPubkeyRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/NetworkPubkey",
  ),
  secretComputeV1beta1QueryNetworkPubkeyResponse(
    typeUrl: '/secret.compute.v1beta1.QueryNetworkPubkeyResponse',
  ),
  secretComputeV1beta1QueryEcallRecordsRequest(
    typeUrl: '/secret.compute.v1beta1.QueryEcallRecordsRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/EcallRecords",
  ),
  secretComputeV1beta1QueryEcallRecordsResponse(
    typeUrl: '/secret.compute.v1beta1.QueryEcallRecordsResponse',
  ),
  secretComputeV1beta1QueryEncryptedSeedRequest(
    typeUrl: '/secret.compute.v1beta1.QueryEncryptedSeedRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/EncryptedSeed",
  ),
  secretComputeV1beta1QueryEncryptedSeedResponse(
    typeUrl: '/secret.compute.v1beta1.QueryEncryptedSeedResponse',
  ),
  secretComputeV1beta1StorageOp(typeUrl: '/secret.compute.v1beta1.StorageOp'),
  secretComputeV1beta1CrossModuleOp(
    typeUrl: '/secret.compute.v1beta1.CrossModuleOp',
  ),
  secretComputeV1beta1ExecutionTraceData(
    typeUrl: '/secret.compute.v1beta1.ExecutionTraceData',
  ),
  secretComputeV1beta1QueryBlockTracesRequest(
    typeUrl: '/secret.compute.v1beta1.QueryBlockTracesRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/BlockTraces",
  ),
  secretComputeV1beta1QueryBlockTracesResponse(
    typeUrl: '/secret.compute.v1beta1.QueryBlockTracesResponse',
  ),
  secretComputeV1beta1QueryMachineIDProofRequest(
    typeUrl: '/secret.compute.v1beta1.QueryMachineIDProofRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/MachineIDProof",
  ),
  secretComputeV1beta1QueryMachineIDProofResponse(
    typeUrl: '/secret.compute.v1beta1.QueryMachineIDProofResponse',
  ),
  secretComputeV1beta1QueryAnalyzeCodeRequest(
    typeUrl: '/secret.compute.v1beta1.QueryAnalyzeCodeRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/AnalyzeCode",
  ),
  secretComputeV1beta1QueryAnalyzeCodeResponse(
    typeUrl: '/secret.compute.v1beta1.QueryAnalyzeCodeResponse',
  ),
  secretComputeV1beta1CreateResultData(
    typeUrl: '/secret.compute.v1beta1.CreateResultData',
  ),
  secretComputeV1beta1QueryBlockCreateResultsRequest(
    typeUrl: '/secret.compute.v1beta1.QueryBlockCreateResultsRequest',
    serviceUrl: "/secret.compute.v1beta1.Query/BlockCreateResults",
  ),
  secretComputeV1beta1QueryBlockCreateResultsResponse(
    typeUrl: '/secret.compute.v1beta1.QueryBlockCreateResultsResponse',
  ),
  secretComputeV1beta1Params(typeUrl: '/secret.compute.v1beta1.Params'),
  secretComputeV1beta1ContractInfo(
    typeUrl: '/secret.compute.v1beta1.ContractInfo',
  ),
  secretComputeV1beta1AbsoluteTxPosition(
    typeUrl: '/secret.compute.v1beta1.AbsoluteTxPosition',
  ),
  secretComputeV1beta1ContractCodeHistoryEntry(
    typeUrl: '/secret.compute.v1beta1.ContractCodeHistoryEntry',
  ),
  secretCronSchedule(typeUrl: '/secret.cron.Schedule'),
  secretCronMsgExecuteContract(typeUrl: '/secret.cron.MsgExecuteContract'),
  secretCronQueryParamsRequest(
    typeUrl: '/secret.cron.QueryParamsRequest',
    serviceUrl: "/secret.cron.Query/Params",
  ),
  secretCronQueryParamsResponse(typeUrl: '/secret.cron.QueryParamsResponse'),
  secretCronQueryGetScheduleRequest(
    typeUrl: '/secret.cron.QueryGetScheduleRequest',
    serviceUrl: "/secret.cron.Query/Schedule",
  ),
  secretCronQueryGetScheduleResponse(
    typeUrl: '/secret.cron.QueryGetScheduleResponse',
  ),
  secretCronQuerySchedulesRequest(
    typeUrl: '/secret.cron.QuerySchedulesRequest',
    serviceUrl: "/secret.cron.Query/Schedules",
  ),
  secretCronQuerySchedulesResponse(
    typeUrl: '/secret.cron.QuerySchedulesResponse',
  ),
  secretCronParams(typeUrl: '/secret.cron.Params'),
  secretCronMsgAddSchedule(
    typeUrl: '/secret.cron.MsgAddSchedule',
    serviceUrl: "/secret.cron.Msg/AddSchedule",
    aminoType: "cron/MsgAddSchedule",
  ),
  secretCronMsgAddScheduleResponse(
    typeUrl: '/secret.cron.MsgAddScheduleResponse',
  ),
  secretCronMsgRemoveSchedule(
    typeUrl: '/secret.cron.MsgRemoveSchedule',
    serviceUrl: "/secret.cron.Msg/RemoveSchedule",
    aminoType: "cron/MsgRemoveSchedule",
  ),
  secretCronMsgRemoveScheduleResponse(
    typeUrl: '/secret.cron.MsgRemoveScheduleResponse',
  ),
  secretCronMsgUpdateParams(
    typeUrl: '/secret.cron.MsgUpdateParams',
    serviceUrl: "/secret.cron.Msg/UpdateParams",
    aminoType: "cron/MsgUpdateParams",
  ),
  secretCronMsgUpdateParamsResponse(
    typeUrl: '/secret.cron.MsgUpdateParamsResponse',
  ),
  secretRegistrationV1beta1RaAuthenticate(
    typeUrl: '/secret.registration.v1beta1.RaAuthenticate',
    serviceUrl: "/secret.registration.v1beta1.Msg/RegisterAuth",
  ),
  secretRegistrationV1beta1RaAuthenticateResponse(
    typeUrl: '/secret.registration.v1beta1.RaAuthenticateResponse',
  ),
  secretRegistrationV1beta1Key(typeUrl: '/secret.registration.v1beta1.Key'),
  secretRegistrationV1beta1QueryEncryptedSeedRequest(
    typeUrl: '/secret.registration.v1beta1.QueryEncryptedSeedRequest',
    serviceUrl: "/secret.registration.v1beta1.Query/EncryptedSeed",
  ),
  secretRegistrationV1beta1QueryEncryptedSeedResponse(
    typeUrl: '/secret.registration.v1beta1.QueryEncryptedSeedResponse',
  ),
  secretEmergencybuttonV1beta1ParamsRequest(
    typeUrl: '/secret.emergencybutton.v1beta1.ParamsRequest',
    serviceUrl: "/secret.emergencybutton.v1beta1.Query/Params",
  ),
  secretEmergencybuttonV1beta1ParamsResponse(
    typeUrl: '/secret.emergencybutton.v1beta1.ParamsResponse',
  ),
  secretEmergencybuttonV1beta1Params(
    typeUrl: '/secret.emergencybutton.v1beta1.Params',
  ),
  secretEmergencybuttonV1beta1MsgToggleIbcSwitch(
    typeUrl: '/secret.emergencybutton.v1beta1.MsgToggleIbcSwitch',
    serviceUrl: "/secret.emergencybutton.v1beta1.Msg/ToggleIbcSwitch",
  ),
  secretEmergencybuttonV1beta1MsgToggleIbcSwitchResponse(
    typeUrl: '/secret.emergencybutton.v1beta1.MsgToggleIbcSwitchResponse',
  ),
  secretEmergencybuttonV1beta1MsgUpdateParams(
    typeUrl: '/secret.emergencybutton.v1beta1.MsgUpdateParams',
    serviceUrl: "/secret.emergencybutton.v1beta1.Msg/UpdateParams",
  ),
  secretEmergencybuttonV1beta1MsgUpdateParamsResponse(
    typeUrl: '/secret.emergencybutton.v1beta1.MsgUpdateParamsResponse',
  ),
  ethermintEvmV1QueryAccountRequest(
    typeUrl: '/ethermint.evm.v1.QueryAccountRequest',
    serviceUrl: "/ethermint.evm.v1.Query/Account",
  ),
  ethermintEvmV1QueryAccountResponse(
    typeUrl: '/ethermint.evm.v1.QueryAccountResponse',
  ),
  ethermintEvmV1QueryCosmosAccountRequest(
    typeUrl: '/ethermint.evm.v1.QueryCosmosAccountRequest',
    serviceUrl: "/ethermint.evm.v1.Query/CosmosAccount",
  ),
  ethermintEvmV1QueryCosmosAccountResponse(
    typeUrl: '/ethermint.evm.v1.QueryCosmosAccountResponse',
  ),
  ethermintEvmV1QueryValidatorAccountRequest(
    typeUrl: '/ethermint.evm.v1.QueryValidatorAccountRequest',
    serviceUrl: "/ethermint.evm.v1.Query/ValidatorAccount",
  ),
  ethermintEvmV1QueryValidatorAccountResponse(
    typeUrl: '/ethermint.evm.v1.QueryValidatorAccountResponse',
  ),
  ethermintEvmV1QueryBalanceRequest(
    typeUrl: '/ethermint.evm.v1.QueryBalanceRequest',
    serviceUrl: "/ethermint.evm.v1.Query/Balance",
  ),
  ethermintEvmV1QueryBalanceResponse(
    typeUrl: '/ethermint.evm.v1.QueryBalanceResponse',
  ),
  ethermintEvmV1QueryStorageRequest(
    typeUrl: '/ethermint.evm.v1.QueryStorageRequest',
    serviceUrl: "/ethermint.evm.v1.Query/Storage",
  ),
  ethermintEvmV1QueryStorageResponse(
    typeUrl: '/ethermint.evm.v1.QueryStorageResponse',
  ),
  ethermintEvmV1QueryCodeRequest(
    typeUrl: '/ethermint.evm.v1.QueryCodeRequest',
    serviceUrl: "/ethermint.evm.v1.Query/Code",
  ),
  ethermintEvmV1QueryCodeResponse(
    typeUrl: '/ethermint.evm.v1.QueryCodeResponse',
  ),
  ethermintEvmV1QueryParamsRequest(
    typeUrl: '/ethermint.evm.v1.QueryParamsRequest',
    serviceUrl: "/ethermint.evm.v1.Query/Params",
  ),
  ethermintEvmV1QueryParamsResponse(
    typeUrl: '/ethermint.evm.v1.QueryParamsResponse',
  ),
  ethermintEvmV1EthCallRequest(
    typeUrl: '/ethermint.evm.v1.EthCallRequest',
    serviceUrl: "/ethermint.evm.v1.Query/EthCall",
  ),
  ethermintEvmV1EstimateGasResponse(
    typeUrl: '/ethermint.evm.v1.EstimateGasResponse',
  ),
  ethermintEvmV1QueryTraceTxRequest(
    typeUrl: '/ethermint.evm.v1.QueryTraceTxRequest',
    serviceUrl: "/ethermint.evm.v1.Query/TraceTx",
  ),
  ethermintEvmV1QueryTraceTxResponse(
    typeUrl: '/ethermint.evm.v1.QueryTraceTxResponse',
  ),
  ethermintEvmV1QueryTraceBlockRequest(
    typeUrl: '/ethermint.evm.v1.QueryTraceBlockRequest',
    serviceUrl: "/ethermint.evm.v1.Query/TraceBlock",
  ),
  ethermintEvmV1QueryTraceBlockResponse(
    typeUrl: '/ethermint.evm.v1.QueryTraceBlockResponse',
  ),
  ethermintEvmV1QueryBaseFeeRequest(
    typeUrl: '/ethermint.evm.v1.QueryBaseFeeRequest',
    serviceUrl: "/ethermint.evm.v1.Query/BaseFee",
  ),
  ethermintEvmV1QueryBaseFeeResponse(
    typeUrl: '/ethermint.evm.v1.QueryBaseFeeResponse',
  ),
  ethermintEvmV1QueryGlobalMinGasPriceRequest(
    typeUrl: '/ethermint.evm.v1.QueryGlobalMinGasPriceRequest',
    serviceUrl: "/ethermint.evm.v1.Query/GlobalMinGasPrice",
  ),
  ethermintEvmV1QueryGlobalMinGasPriceResponse(
    typeUrl: '/ethermint.evm.v1.QueryGlobalMinGasPriceResponse',
  ),
  ethermintEvmV1QueryConfigRequest(
    typeUrl: '/ethermint.evm.v1.QueryConfigRequest',
    serviceUrl: "/ethermint.evm.v1.Query/Config",
  ),
  ethermintEvmV1QueryConfigResponse(
    typeUrl: '/ethermint.evm.v1.QueryConfigResponse',
  ),
  ethermintEvmV1Params(
    typeUrl: '/ethermint.evm.v1.Params',
    aminoType: "evmos/x/evm/Params",
  ),
  ethermintEvmV1AccessControl(typeUrl: '/ethermint.evm.v1.AccessControl'),
  ethermintEvmV1AccessControlType(
    typeUrl: '/ethermint.evm.v1.AccessControlType',
  ),
  ethermintEvmV1ChainConfig(typeUrl: '/ethermint.evm.v1.ChainConfig'),
  ethermintEvmV1Log(typeUrl: '/ethermint.evm.v1.Log'),
  ethermintEvmV1TraceConfig(typeUrl: '/ethermint.evm.v1.TraceConfig'),
  ethermintEvmV1MsgEthereumTx(
    typeUrl: '/ethermint.evm.v1.MsgEthereumTx',
    serviceUrl: "/ethermint.evm.v1.Msg/EthereumTx",
    aminoType: "ethermint/MsgEthereumTx",
  ),
  ethermintEvmV1MsgEthereumTxResponse(
    typeUrl: '/ethermint.evm.v1.MsgEthereumTxResponse',
  ),
  ethermintEvmV1MsgUpdateParams(
    typeUrl: '/ethermint.evm.v1.MsgUpdateParams',
    serviceUrl: "/ethermint.evm.v1.Msg/UpdateParams",
    aminoType: "evmos/x/evm/MsgUpdateParams",
  ),
  ethermintEvmV1MsgUpdateParamsResponse(
    typeUrl: '/ethermint.evm.v1.MsgUpdateParamsResponse',
  ),
  ethermintFeemarketV1QueryParamsRequest(
    typeUrl: '/ethermint.feemarket.v1.QueryParamsRequest',
    serviceUrl: "/ethermint.feemarket.v1.Query/Params",
  ),
  ethermintFeemarketV1QueryParamsResponse(
    typeUrl: '/ethermint.feemarket.v1.QueryParamsResponse',
  ),
  ethermintFeemarketV1QueryBaseFeeRequest(
    typeUrl: '/ethermint.feemarket.v1.QueryBaseFeeRequest',
    serviceUrl: "/ethermint.feemarket.v1.Query/BaseFee",
  ),
  ethermintFeemarketV1QueryBaseFeeResponse(
    typeUrl: '/ethermint.feemarket.v1.QueryBaseFeeResponse',
  ),
  ethermintFeemarketV1QueryBlockGasRequest(
    typeUrl: '/ethermint.feemarket.v1.QueryBlockGasRequest',
    serviceUrl: "/ethermint.feemarket.v1.Query/BlockGas",
  ),
  ethermintFeemarketV1QueryBlockGasResponse(
    typeUrl: '/ethermint.feemarket.v1.QueryBlockGasResponse',
  ),
  ethermintFeemarketV1Params(
    typeUrl: '/ethermint.feemarket.v1.Params',
    aminoType: "evmos/x/feemarket/Params",
  ),
  ethermintFeemarketV1MsgUpdateParams(
    typeUrl: '/ethermint.feemarket.v1.MsgUpdateParams',
    serviceUrl: "/ethermint.feemarket.v1.Msg/UpdateParams",
    aminoType: "evmos/x/feemarket/MsgUpdateParams",
  ),
  ethermintFeemarketV1MsgUpdateParamsResponse(
    typeUrl: '/ethermint.feemarket.v1.MsgUpdateParamsResponse',
  ),
  ethermintCryptoV1Ethsecp256k1PubKey(
    typeUrl: '/ethermint.crypto.v1.ethsecp256k1.PubKey',
  ),
  ethermintCryptoV1Ethsecp256k1PrivKey(
    typeUrl: '/ethermint.crypto.v1.ethsecp256k1.PrivKey',
  ),
  evmosVestingV2QueryBalancesRequest(
    typeUrl: '/evmos.vesting.v2.QueryBalancesRequest',
    serviceUrl: "/evmos.vesting.v2.Query/Balances",
  ),
  evmosVestingV2QueryBalancesResponse(
    typeUrl: '/evmos.vesting.v2.QueryBalancesResponse',
  ),
  evmosVestingV2MsgCreateClawbackVestingAccount(
    typeUrl: '/evmos.vesting.v2.MsgCreateClawbackVestingAccount',
    serviceUrl: "/evmos.vesting.v2.Msg/CreateClawbackVestingAccount",
    aminoType: "evmos/MsgCreateClawbackVestingAccount",
  ),
  evmosVestingV2MsgCreateClawbackVestingAccountResponse(
    typeUrl: '/evmos.vesting.v2.MsgCreateClawbackVestingAccountResponse',
  ),
  evmosVestingV2MsgFundVestingAccount(
    typeUrl: '/evmos.vesting.v2.MsgFundVestingAccount',
    serviceUrl: "/evmos.vesting.v2.Msg/FundVestingAccount",
    aminoType: "evmos/MsgFundVestingAccount",
  ),
  evmosVestingV2MsgFundVestingAccountResponse(
    typeUrl: '/evmos.vesting.v2.MsgFundVestingAccountResponse',
  ),
  evmosVestingV2MsgClawback(
    typeUrl: '/evmos.vesting.v2.MsgClawback',
    serviceUrl: "/evmos.vesting.v2.Msg/Clawback",
    aminoType: "evmos/MsgClawback",
  ),
  evmosVestingV2MsgClawbackResponse(
    typeUrl: '/evmos.vesting.v2.MsgClawbackResponse',
  ),
  evmosVestingV2MsgUpdateVestingFunder(
    typeUrl: '/evmos.vesting.v2.MsgUpdateVestingFunder',
    serviceUrl: "/evmos.vesting.v2.Msg/UpdateVestingFunder",
    aminoType: "evmos/MsgUpdateVestingFunder",
  ),
  evmosVestingV2MsgUpdateVestingFunderResponse(
    typeUrl: '/evmos.vesting.v2.MsgUpdateVestingFunderResponse',
  ),
  evmosVestingV2MsgConvertVestingAccount(
    typeUrl: '/evmos.vesting.v2.MsgConvertVestingAccount',
    serviceUrl: "/evmos.vesting.v2.Msg/ConvertVestingAccount",
    aminoType: "evmos/MsgConvertVestingAccount",
  ),
  evmosVestingV2MsgConvertVestingAccountResponse(
    typeUrl: '/evmos.vesting.v2.MsgConvertVestingAccountResponse',
  ),
  evmosErc20V1QueryTokenPairsRequest(
    typeUrl: '/evmos.erc20.v1.QueryTokenPairsRequest',
    serviceUrl: "/evmos.erc20.v1.Query/TokenPairs",
  ),
  evmosErc20V1QueryTokenPairsResponse(
    typeUrl: '/evmos.erc20.v1.QueryTokenPairsResponse',
  ),
  evmosErc20V1QueryTokenPairRequest(
    typeUrl: '/evmos.erc20.v1.QueryTokenPairRequest',
    serviceUrl: "/evmos.erc20.v1.Query/TokenPair",
  ),
  evmosErc20V1QueryTokenPairResponse(
    typeUrl: '/evmos.erc20.v1.QueryTokenPairResponse',
  ),
  evmosErc20V1QueryParamsRequest(
    typeUrl: '/evmos.erc20.v1.QueryParamsRequest',
    serviceUrl: "/evmos.erc20.v1.Query/Params",
  ),
  evmosErc20V1QueryParamsResponse(
    typeUrl: '/evmos.erc20.v1.QueryParamsResponse',
  ),
  evmosErc20V1Params(typeUrl: '/evmos.erc20.v1.Params'),
  evmosErc20V1TokenPair(typeUrl: '/evmos.erc20.v1.TokenPair'),
  evmosErc20V1MsgConvertERC20(
    typeUrl: '/evmos.erc20.v1.MsgConvertERC20',
    serviceUrl: "/evmos.erc20.v1.Msg/ConvertERC20",
    aminoType: "evmos/MsgConvertERC20",
  ),
  evmosErc20V1MsgConvertERC20Response(
    typeUrl: '/evmos.erc20.v1.MsgConvertERC20Response',
  ),
  evmosErc20V1MsgUpdateParams(
    typeUrl: '/evmos.erc20.v1.MsgUpdateParams',
    serviceUrl: "/evmos.erc20.v1.Msg/UpdateParams",
    aminoType: "evmos/x/erc20/MsgUpdateParams",
  ),
  evmosErc20V1MsgUpdateParamsResponse(
    typeUrl: '/evmos.erc20.v1.MsgUpdateParamsResponse',
  ),
  evmosErc20V1MsgRegisterERC20(
    typeUrl: '/evmos.erc20.v1.MsgRegisterERC20',
    serviceUrl: "/evmos.erc20.v1.Msg/RegisterERC20",
    aminoType: "evmos/x/erc20/MsgRegisterERC20",
  ),
  evmosErc20V1MsgRegisterERC20Response(
    typeUrl: '/evmos.erc20.v1.MsgRegisterERC20Response',
  ),
  evmosErc20V1MsgToggleConversion(
    typeUrl: '/evmos.erc20.v1.MsgToggleConversion',
    serviceUrl: "/evmos.erc20.v1.Msg/ToggleConversion",
    aminoType: "evmos/x/erc20/MsgToggleConversion",
  ),
  evmosErc20V1MsgToggleConversionResponse(
    typeUrl: '/evmos.erc20.v1.MsgToggleConversionResponse',
  ),
  evmosInflationV1QueryPeriodRequest(
    typeUrl: '/evmos.inflation.v1.QueryPeriodRequest',
    serviceUrl: "/evmos.inflation.v1.Query/Period",
  ),
  evmosInflationV1QueryPeriodResponse(
    typeUrl: '/evmos.inflation.v1.QueryPeriodResponse',
  ),
  evmosInflationV1QueryEpochMintProvisionRequest(
    typeUrl: '/evmos.inflation.v1.QueryEpochMintProvisionRequest',
    serviceUrl: "/evmos.inflation.v1.Query/EpochMintProvision",
  ),
  evmosInflationV1QueryEpochMintProvisionResponse(
    typeUrl: '/evmos.inflation.v1.QueryEpochMintProvisionResponse',
  ),
  evmosInflationV1QuerySkippedEpochsRequest(
    typeUrl: '/evmos.inflation.v1.QuerySkippedEpochsRequest',
    serviceUrl: "/evmos.inflation.v1.Query/SkippedEpochs",
  ),
  evmosInflationV1QuerySkippedEpochsResponse(
    typeUrl: '/evmos.inflation.v1.QuerySkippedEpochsResponse',
  ),
  evmosInflationV1QueryCirculatingSupplyRequest(
    typeUrl: '/evmos.inflation.v1.QueryCirculatingSupplyRequest',
    serviceUrl: "/evmos.inflation.v1.Query/CirculatingSupply",
  ),
  evmosInflationV1QueryCirculatingSupplyResponse(
    typeUrl: '/evmos.inflation.v1.QueryCirculatingSupplyResponse',
  ),
  evmosInflationV1QueryInflationRateRequest(
    typeUrl: '/evmos.inflation.v1.QueryInflationRateRequest',
    serviceUrl: "/evmos.inflation.v1.Query/InflationRate",
  ),
  evmosInflationV1QueryInflationRateResponse(
    typeUrl: '/evmos.inflation.v1.QueryInflationRateResponse',
  ),
  evmosInflationV1QueryParamsRequest(
    typeUrl: '/evmos.inflation.v1.QueryParamsRequest',
    serviceUrl: "/evmos.inflation.v1.Query/Params",
  ),
  evmosInflationV1QueryParamsResponse(
    typeUrl: '/evmos.inflation.v1.QueryParamsResponse',
  ),
  evmosInflationV1InflationDistribution(
    typeUrl: '/evmos.inflation.v1.InflationDistribution',
  ),
  evmosInflationV1ExponentialCalculation(
    typeUrl: '/evmos.inflation.v1.ExponentialCalculation',
  ),
  evmosInflationV1Params(typeUrl: '/evmos.inflation.v1.Params'),
  evmosInflationV1MsgUpdateParams(
    typeUrl: '/evmos.inflation.v1.MsgUpdateParams',
    serviceUrl: "/evmos.inflation.v1.Msg/UpdateParams",
    aminoType: "evmos/x/inflation/MsgUpdateParams",
  ),
  evmosInflationV1MsgUpdateParamsResponse(
    typeUrl: '/evmos.inflation.v1.MsgUpdateParamsResponse',
  ),
  evmosEpochsV1QueryEpochsInfoRequest(
    typeUrl: '/evmos.epochs.v1.QueryEpochsInfoRequest',
    serviceUrl: "/evmos.epochs.v1.Query/EpochInfos",
  ),
  evmosEpochsV1QueryEpochsInfoResponse(
    typeUrl: '/evmos.epochs.v1.QueryEpochsInfoResponse',
  ),
  evmosEpochsV1QueryCurrentEpochRequest(
    typeUrl: '/evmos.epochs.v1.QueryCurrentEpochRequest',
    serviceUrl: "/evmos.epochs.v1.Query/CurrentEpoch",
  ),
  evmosEpochsV1QueryCurrentEpochResponse(
    typeUrl: '/evmos.epochs.v1.QueryCurrentEpochResponse',
  ),
  evmosEpochsV1EpochInfo(typeUrl: '/evmos.epochs.v1.EpochInfo'),
  circleCctpV1QueryRolesRequest(
    typeUrl: '/circle.cctp.v1.QueryRolesRequest',
    serviceUrl: "/circle.cctp.v1.Query/Roles",
  ),
  circleCctpV1QueryRolesResponse(typeUrl: '/circle.cctp.v1.QueryRolesResponse'),
  circleCctpV1QueryGetAttesterRequest(
    typeUrl: '/circle.cctp.v1.QueryGetAttesterRequest',
    serviceUrl: "/circle.cctp.v1.Query/Attester",
  ),
  circleCctpV1QueryGetAttesterResponse(
    typeUrl: '/circle.cctp.v1.QueryGetAttesterResponse',
  ),
  circleCctpV1QueryAllAttestersRequest(
    typeUrl: '/circle.cctp.v1.QueryAllAttestersRequest',
    serviceUrl: "/circle.cctp.v1.Query/Attesters",
  ),
  circleCctpV1QueryAllAttestersResponse(
    typeUrl: '/circle.cctp.v1.QueryAllAttestersResponse',
  ),
  circleCctpV1QueryGetPerMessageBurnLimitRequest(
    typeUrl: '/circle.cctp.v1.QueryGetPerMessageBurnLimitRequest',
    serviceUrl: "/circle.cctp.v1.Query/PerMessageBurnLimit",
  ),
  circleCctpV1QueryGetPerMessageBurnLimitResponse(
    typeUrl: '/circle.cctp.v1.QueryGetPerMessageBurnLimitResponse',
  ),
  circleCctpV1QueryAllPerMessageBurnLimitsRequest(
    typeUrl: '/circle.cctp.v1.QueryAllPerMessageBurnLimitsRequest',
    serviceUrl: "/circle.cctp.v1.Query/PerMessageBurnLimits",
  ),
  circleCctpV1QueryAllPerMessageBurnLimitsResponse(
    typeUrl: '/circle.cctp.v1.QueryAllPerMessageBurnLimitsResponse',
  ),
  circleCctpV1QueryGetBurningAndMintingPausedRequest(
    typeUrl: '/circle.cctp.v1.QueryGetBurningAndMintingPausedRequest',
    serviceUrl: "/circle.cctp.v1.Query/BurningAndMintingPaused",
  ),
  circleCctpV1QueryGetBurningAndMintingPausedResponse(
    typeUrl: '/circle.cctp.v1.QueryGetBurningAndMintingPausedResponse',
  ),
  circleCctpV1QueryGetSendingAndReceivingMessagesPausedRequest(
    typeUrl: '/circle.cctp.v1.QueryGetSendingAndReceivingMessagesPausedRequest',
    serviceUrl: "/circle.cctp.v1.Query/SendingAndReceivingMessagesPaused",
  ),
  circleCctpV1QueryGetSendingAndReceivingMessagesPausedResponse(
    typeUrl:
        '/circle.cctp.v1.QueryGetSendingAndReceivingMessagesPausedResponse',
  ),
  circleCctpV1QueryGetMaxMessageBodySizeRequest(
    typeUrl: '/circle.cctp.v1.QueryGetMaxMessageBodySizeRequest',
    serviceUrl: "/circle.cctp.v1.Query/MaxMessageBodySize",
  ),
  circleCctpV1QueryGetMaxMessageBodySizeResponse(
    typeUrl: '/circle.cctp.v1.QueryGetMaxMessageBodySizeResponse',
  ),
  circleCctpV1QueryGetNextAvailableNonceRequest(
    typeUrl: '/circle.cctp.v1.QueryGetNextAvailableNonceRequest',
    serviceUrl: "/circle.cctp.v1.Query/NextAvailableNonce",
  ),
  circleCctpV1QueryGetNextAvailableNonceResponse(
    typeUrl: '/circle.cctp.v1.QueryGetNextAvailableNonceResponse',
  ),
  circleCctpV1QueryGetSignatureThresholdRequest(
    typeUrl: '/circle.cctp.v1.QueryGetSignatureThresholdRequest',
    serviceUrl: "/circle.cctp.v1.Query/SignatureThreshold",
  ),
  circleCctpV1QueryGetSignatureThresholdResponse(
    typeUrl: '/circle.cctp.v1.QueryGetSignatureThresholdResponse',
  ),
  circleCctpV1QueryGetTokenPairRequest(
    typeUrl: '/circle.cctp.v1.QueryGetTokenPairRequest',
    serviceUrl: "/circle.cctp.v1.Query/TokenPair",
  ),
  circleCctpV1QueryGetTokenPairResponse(
    typeUrl: '/circle.cctp.v1.QueryGetTokenPairResponse',
  ),
  circleCctpV1QueryAllTokenPairsRequest(
    typeUrl: '/circle.cctp.v1.QueryAllTokenPairsRequest',
    serviceUrl: "/circle.cctp.v1.Query/TokenPairs",
  ),
  circleCctpV1QueryAllTokenPairsResponse(
    typeUrl: '/circle.cctp.v1.QueryAllTokenPairsResponse',
  ),
  circleCctpV1QueryGetUsedNonceRequest(
    typeUrl: '/circle.cctp.v1.QueryGetUsedNonceRequest',
    serviceUrl: "/circle.cctp.v1.Query/UsedNonce",
  ),
  circleCctpV1QueryGetUsedNonceResponse(
    typeUrl: '/circle.cctp.v1.QueryGetUsedNonceResponse',
  ),
  circleCctpV1QueryAllUsedNoncesRequest(
    typeUrl: '/circle.cctp.v1.QueryAllUsedNoncesRequest',
    serviceUrl: "/circle.cctp.v1.Query/UsedNonces",
  ),
  circleCctpV1QueryAllUsedNoncesResponse(
    typeUrl: '/circle.cctp.v1.QueryAllUsedNoncesResponse',
  ),
  circleCctpV1QueryRemoteTokenMessengerRequest(
    typeUrl: '/circle.cctp.v1.QueryRemoteTokenMessengerRequest',
    serviceUrl: "/circle.cctp.v1.Query/RemoteTokenMessenger",
  ),
  circleCctpV1QueryRemoteTokenMessengerResponse(
    typeUrl: '/circle.cctp.v1.QueryRemoteTokenMessengerResponse',
  ),
  circleCctpV1QueryRemoteTokenMessengersRequest(
    typeUrl: '/circle.cctp.v1.QueryRemoteTokenMessengersRequest',
    serviceUrl: "/circle.cctp.v1.Query/RemoteTokenMessengers",
  ),
  circleCctpV1QueryRemoteTokenMessengersResponse(
    typeUrl: '/circle.cctp.v1.QueryRemoteTokenMessengersResponse',
  ),
  circleCctpV1QueryBurnMessageVersionRequest(
    typeUrl: '/circle.cctp.v1.QueryBurnMessageVersionRequest',
    serviceUrl: "/circle.cctp.v1.Query/BurnMessageVersion",
  ),
  circleCctpV1QueryBurnMessageVersionResponse(
    typeUrl: '/circle.cctp.v1.QueryBurnMessageVersionResponse',
  ),
  circleCctpV1QueryLocalMessageVersionRequest(
    typeUrl: '/circle.cctp.v1.QueryLocalMessageVersionRequest',
    serviceUrl: "/circle.cctp.v1.Query/LocalMessageVersion",
  ),
  circleCctpV1QueryLocalMessageVersionResponse(
    typeUrl: '/circle.cctp.v1.QueryLocalMessageVersionResponse',
  ),
  circleCctpV1QueryLocalDomainRequest(
    typeUrl: '/circle.cctp.v1.QueryLocalDomainRequest',
    serviceUrl: "/circle.cctp.v1.Query/LocalDomain",
  ),
  circleCctpV1QueryLocalDomainResponse(
    typeUrl: '/circle.cctp.v1.QueryLocalDomainResponse',
  ),
  circleCctpV1PerMessageBurnLimit(
    typeUrl: '/circle.cctp.v1.PerMessageBurnLimit',
  ),
  circleCctpV1MaxMessageBodySize(typeUrl: '/circle.cctp.v1.MaxMessageBodySize'),
  circleCctpV1RemoteTokenMessenger(
    typeUrl: '/circle.cctp.v1.RemoteTokenMessenger',
  ),
  circleCctpV1BurningAndMintingPaused(
    typeUrl: '/circle.cctp.v1.BurningAndMintingPaused',
  ),
  circleCctpV1Nonce(typeUrl: '/circle.cctp.v1.Nonce'),
  circleCctpV1Attester(typeUrl: '/circle.cctp.v1.Attester'),
  circleCctpV1SignatureThreshold(typeUrl: '/circle.cctp.v1.SignatureThreshold'),
  circleCctpV1TokenPair(typeUrl: '/circle.cctp.v1.TokenPair'),
  circleCctpV1MsgUpdateOwner(
    typeUrl: '/circle.cctp.v1.MsgUpdateOwner',
    serviceUrl: "/circle.cctp.v1.Msg/UpdateOwner",
    aminoType: "cctp/UpdateOwner",
  ),
  circleCctpV1MsgUpdateOwnerResponse(
    typeUrl: '/circle.cctp.v1.MsgUpdateOwnerResponse',
  ),
  circleCctpV1MsgUpdateAttesterManager(
    typeUrl: '/circle.cctp.v1.MsgUpdateAttesterManager',
    serviceUrl: "/circle.cctp.v1.Msg/UpdateAttesterManager",
    aminoType: "cctp/UpdateAttesterManager",
  ),
  circleCctpV1MsgUpdateAttesterManagerResponse(
    typeUrl: '/circle.cctp.v1.MsgUpdateAttesterManagerResponse',
  ),
  circleCctpV1MsgUpdateTokenController(
    typeUrl: '/circle.cctp.v1.MsgUpdateTokenController',
    serviceUrl: "/circle.cctp.v1.Msg/UpdateTokenController",
    aminoType: "cctp/UpdateTokenController",
  ),
  circleCctpV1MsgUpdateTokenControllerResponse(
    typeUrl: '/circle.cctp.v1.MsgUpdateTokenControllerResponse',
  ),
  circleCctpV1MsgUpdatePauser(
    typeUrl: '/circle.cctp.v1.MsgUpdatePauser',
    serviceUrl: "/circle.cctp.v1.Msg/UpdatePauser",
    aminoType: "cctp/UpdatePauser",
  ),
  circleCctpV1MsgUpdatePauserResponse(
    typeUrl: '/circle.cctp.v1.MsgUpdatePauserResponse',
  ),
  circleCctpV1MsgAcceptOwner(
    typeUrl: '/circle.cctp.v1.MsgAcceptOwner',
    serviceUrl: "/circle.cctp.v1.Msg/AcceptOwner",
    aminoType: "cctp/AcceptOwner",
  ),
  circleCctpV1MsgAcceptOwnerResponse(
    typeUrl: '/circle.cctp.v1.MsgAcceptOwnerResponse',
  ),
  circleCctpV1MsgEnableAttester(
    typeUrl: '/circle.cctp.v1.MsgEnableAttester',
    serviceUrl: "/circle.cctp.v1.Msg/EnableAttester",
    aminoType: "cctp/EnableAttester",
  ),
  circleCctpV1MsgEnableAttesterResponse(
    typeUrl: '/circle.cctp.v1.MsgEnableAttesterResponse',
  ),
  circleCctpV1MsgDisableAttester(
    typeUrl: '/circle.cctp.v1.MsgDisableAttester',
    serviceUrl: "/circle.cctp.v1.Msg/DisableAttester",
    aminoType: "cctp/DisableAttester",
  ),
  circleCctpV1MsgDisableAttesterResponse(
    typeUrl: '/circle.cctp.v1.MsgDisableAttesterResponse',
  ),
  circleCctpV1MsgPauseBurningAndMinting(
    typeUrl: '/circle.cctp.v1.MsgPauseBurningAndMinting',
    serviceUrl: "/circle.cctp.v1.Msg/PauseBurningAndMinting",
    aminoType: "cctp/PauseBurningAndMinting",
  ),
  circleCctpV1MsgPauseBurningAndMintingResponse(
    typeUrl: '/circle.cctp.v1.MsgPauseBurningAndMintingResponse',
  ),
  circleCctpV1MsgUnpauseBurningAndMinting(
    typeUrl: '/circle.cctp.v1.MsgUnpauseBurningAndMinting',
    serviceUrl: "/circle.cctp.v1.Msg/UnpauseBurningAndMinting",
    aminoType: "cctp/UnpauseBurningAndMinting",
  ),
  circleCctpV1MsgUnpauseBurningAndMintingResponse(
    typeUrl: '/circle.cctp.v1.MsgUnpauseBurningAndMintingResponse',
  ),
  circleCctpV1MsgPauseSendingAndReceivingMessages(
    typeUrl: '/circle.cctp.v1.MsgPauseSendingAndReceivingMessages',
    serviceUrl: "/circle.cctp.v1.Msg/PauseSendingAndReceivingMessages",
    aminoType: "cctp/PauseSendingAndReceivingMessages",
  ),
  circleCctpV1MsgPauseSendingAndReceivingMessagesResponse(
    typeUrl: '/circle.cctp.v1.MsgPauseSendingAndReceivingMessagesResponse',
  ),
  circleCctpV1MsgUnpauseSendingAndReceivingMessages(
    typeUrl: '/circle.cctp.v1.MsgUnpauseSendingAndReceivingMessages',
    serviceUrl: "/circle.cctp.v1.Msg/UnpauseSendingAndReceivingMessages",
    aminoType: "cctp/UnpauseSendingAndReceivingMessages",
  ),
  circleCctpV1MsgUnpauseSendingAndReceivingMessagesResponse(
    typeUrl: '/circle.cctp.v1.MsgUnpauseSendingAndReceivingMessagesResponse',
  ),
  circleCctpV1MsgUpdateMaxMessageBodySize(
    typeUrl: '/circle.cctp.v1.MsgUpdateMaxMessageBodySize',
    serviceUrl: "/circle.cctp.v1.Msg/UpdateMaxMessageBodySize",
    aminoType: "cctp/UpdateMaxMessageBodySize",
  ),
  circleCctpV1MsgUpdateMaxMessageBodySizeResponse(
    typeUrl: '/circle.cctp.v1.MsgUpdateMaxMessageBodySizeResponse',
  ),
  circleCctpV1MsgSetMaxBurnAmountPerMessage(
    typeUrl: '/circle.cctp.v1.MsgSetMaxBurnAmountPerMessage',
    serviceUrl: "/circle.cctp.v1.Msg/SetMaxBurnAmountPerMessage",
    aminoType: "cctp/SetMaxBurnAmountPerMessage",
  ),
  circleCctpV1MsgSetMaxBurnAmountPerMessageResponse(
    typeUrl: '/circle.cctp.v1.MsgSetMaxBurnAmountPerMessageResponse',
  ),
  circleCctpV1MsgDepositForBurn(
    typeUrl: '/circle.cctp.v1.MsgDepositForBurn',
    serviceUrl: "/circle.cctp.v1.Msg/DepositForBurn",
    aminoType: "cctp/DepositForBurn",
  ),
  circleCctpV1MsgDepositForBurnResponse(
    typeUrl: '/circle.cctp.v1.MsgDepositForBurnResponse',
  ),
  circleCctpV1MsgDepositForBurnWithCaller(
    typeUrl: '/circle.cctp.v1.MsgDepositForBurnWithCaller',
    serviceUrl: "/circle.cctp.v1.Msg/DepositForBurnWithCaller",
    aminoType: "cctp/DepositForBurnWithCaller",
  ),
  circleCctpV1MsgDepositForBurnWithCallerResponse(
    typeUrl: '/circle.cctp.v1.MsgDepositForBurnWithCallerResponse',
  ),
  circleCctpV1MsgReplaceDepositForBurn(
    typeUrl: '/circle.cctp.v1.MsgReplaceDepositForBurn',
    serviceUrl: "/circle.cctp.v1.Msg/ReplaceDepositForBurn",
    aminoType: "cctp/ReplaceDepositForBurn",
  ),
  circleCctpV1MsgReplaceDepositForBurnResponse(
    typeUrl: '/circle.cctp.v1.MsgReplaceDepositForBurnResponse',
  ),
  circleCctpV1MsgReceiveMessage(
    typeUrl: '/circle.cctp.v1.MsgReceiveMessage',
    serviceUrl: "/circle.cctp.v1.Msg/ReceiveMessage",
    aminoType: "cctp/ReceiveMessage",
  ),
  circleCctpV1MsgReceiveMessageResponse(
    typeUrl: '/circle.cctp.v1.MsgReceiveMessageResponse',
  ),
  circleCctpV1MsgSendMessage(
    typeUrl: '/circle.cctp.v1.MsgSendMessage',
    serviceUrl: "/circle.cctp.v1.Msg/SendMessage",
    aminoType: "cctp/SendMessage",
  ),
  circleCctpV1MsgSendMessageResponse(
    typeUrl: '/circle.cctp.v1.MsgSendMessageResponse',
  ),
  circleCctpV1MsgSendMessageWithCaller(
    typeUrl: '/circle.cctp.v1.MsgSendMessageWithCaller',
    serviceUrl: "/circle.cctp.v1.Msg/SendMessageWithCaller",
    aminoType: "cctp/SendMessageWithCaller",
  ),
  circleCctpV1MsgSendMessageWithCallerResponse(
    typeUrl: '/circle.cctp.v1.MsgSendMessageWithCallerResponse',
  ),
  circleCctpV1MsgReplaceMessage(
    typeUrl: '/circle.cctp.v1.MsgReplaceMessage',
    serviceUrl: "/circle.cctp.v1.Msg/ReplaceMessage",
    aminoType: "cctp/ReplaceMessage",
  ),
  circleCctpV1MsgReplaceMessageResponse(
    typeUrl: '/circle.cctp.v1.MsgReplaceMessageResponse',
  ),
  circleCctpV1MsgUpdateSignatureThreshold(
    typeUrl: '/circle.cctp.v1.MsgUpdateSignatureThreshold',
    serviceUrl: "/circle.cctp.v1.Msg/UpdateSignatureThreshold",
    aminoType: "cctp/UpdateSignatureThreshold",
  ),
  circleCctpV1MsgUpdateSignatureThresholdResponse(
    typeUrl: '/circle.cctp.v1.MsgUpdateSignatureThresholdResponse',
  ),
  circleCctpV1MsgLinkTokenPair(
    typeUrl: '/circle.cctp.v1.MsgLinkTokenPair',
    serviceUrl: "/circle.cctp.v1.Msg/LinkTokenPair",
    aminoType: "cctp/LinkTokenPair",
  ),
  circleCctpV1MsgLinkTokenPairResponse(
    typeUrl: '/circle.cctp.v1.MsgLinkTokenPairResponse',
  ),
  circleCctpV1MsgUnlinkTokenPair(
    typeUrl: '/circle.cctp.v1.MsgUnlinkTokenPair',
    serviceUrl: "/circle.cctp.v1.Msg/UnlinkTokenPair",
    aminoType: "cctp/UnlinkTokenPair",
  ),
  circleCctpV1MsgUnlinkTokenPairResponse(
    typeUrl: '/circle.cctp.v1.MsgUnlinkTokenPairResponse',
  ),
  circleCctpV1MsgAddRemoteTokenMessenger(
    typeUrl: '/circle.cctp.v1.MsgAddRemoteTokenMessenger',
    serviceUrl: "/circle.cctp.v1.Msg/AddRemoteTokenMessenger",
    aminoType: "cctp/AddRemoteTokenMessenger",
  ),
  circleCctpV1MsgAddRemoteTokenMessengerResponse(
    typeUrl: '/circle.cctp.v1.MsgAddRemoteTokenMessengerResponse',
  ),
  circleCctpV1MsgRemoveRemoteTokenMessenger(
    typeUrl: '/circle.cctp.v1.MsgRemoveRemoteTokenMessenger',
    serviceUrl: "/circle.cctp.v1.Msg/RemoveRemoteTokenMessenger",
    aminoType: "cctp/RemoveRemoteTokenMessenger",
  ),
  circleCctpV1MsgRemoveRemoteTokenMessengerResponse(
    typeUrl: '/circle.cctp.v1.MsgRemoveRemoteTokenMessengerResponse',
  ),
  circleCctpV1SendingAndReceivingMessagesPaused(
    typeUrl: '/circle.cctp.v1.SendingAndReceivingMessagesPaused',
  );

  @override
  final String typeUrl;
  @override
  final String? aminoType;
  @override
  final String? serviceUrl;
  const DefaultCosmosProtoTypeUrl({
    required this.typeUrl,
    this.aminoType,
    this.serviceUrl,
  });
  static DefaultCosmosProtoTypeUrl? fromUrl(String? value) {
    return DefaultCosmosProtoTypeUrl.values.firstWhereNullable(
      (e) =>
          e.typeUrl == value || e.aminoType == value || e.serviceUrl == value,
    );
  }

  @override
  String getServiceUrl() {
    final serviceUrl = this.serviceUrl;
    if (serviceUrl == null) {
      throw DartCosmosSdkPluginException(
        "Missing service url.",
        details: {"type_url": typeUrl},
      );
    }
    return serviceUrl;
  }

  @override
  String getAminoType() {
    final aminoType = this.aminoType;
    if (aminoType == null) {
      throw DartCosmosSdkPluginException(
        "Missing amino type name.",
        details: {"type_url": typeUrl},
      );
    }
    return aminoType;
  }
}
