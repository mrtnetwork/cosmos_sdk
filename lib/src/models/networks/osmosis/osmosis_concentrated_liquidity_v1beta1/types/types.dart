import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisConcentratedLiquidityV1beta1Types extends TypeUrl {
  const OsmosisConcentratedLiquidityV1beta1Types._(super.typeUrl,
      {super.query, super.rpc});
  static const String root = "/osmosis.concentratedliquidity.v1beta1";
  static const OsmosisConcentratedLiquidityV1beta1Types uptimeTrackers =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.UptimeTrackers");
  static const OsmosisConcentratedLiquidityV1beta1Types uptimeTracker =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.UptimeTracker");
  static const OsmosisConcentratedLiquidityV1beta1Types
      poolIdToTickSpacingRecord = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.PoolIdToTickSpacingRecord");
  static const OsmosisConcentratedLiquidityV1beta1Types poolRecord =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.PoolRecord");
  static const OsmosisConcentratedLiquidityV1beta1Types pool =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.Pool");

  static const OsmosisConcentratedLiquidityV1beta1Types
      tickSpacingDecreaseProposal = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.TickSpacingDecreaseProposal");

  static const OsmosisConcentratedLiquidityV1beta1Types tickLiquidityNet =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.TickLiquidityNet");

  static const OsmosisConcentratedLiquidityV1beta1Types tickInfo =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.TickInfo");

  static const OsmosisConcentratedLiquidityV1beta1Types position =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.Position");

  static const OsmosisConcentratedLiquidityV1beta1Types positionData =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.PositionData");

  static const OsmosisConcentratedLiquidityV1beta1Types positionWithPeriodLock =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.PositionWithPeriodLock");
  static const OsmosisConcentratedLiquidityV1beta1Types fullTick =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.FullTick");

  static const OsmosisConcentratedLiquidityV1beta1Types accumObject =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.AccumObject");

  static const OsmosisConcentratedLiquidityV1beta1Types incentiveRecordBody =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.IncentiveRecordBody");

  static const OsmosisConcentratedLiquidityV1beta1Types
      liquidityDepthWithRange = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.LiquidityDepthWithRange");
  static const OsmosisConcentratedLiquidityV1beta1Types incentiveRecord =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.IncentiveRecord");
  static const OsmosisConcentratedLiquidityV1beta1Types poolData =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.PoolData");
  static const OsmosisConcentratedLiquidityV1beta1Types genesisState =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.GenesisState");

  static const OsmosisConcentratedLiquidityV1beta1Types msgCreatePosition =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.MsgCreatePosition");
  static const OsmosisConcentratedLiquidityV1beta1Types
      msgCreatePositionResponse = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.msgCreatePositionResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types msgWithdrawPosition =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.MsgWithdrawPosition");
  static const OsmosisConcentratedLiquidityV1beta1Types
      msgWithdrawPositionResponse = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.MsgWithdrawPositionResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types msgAddToPosition =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.MsgAddToPosition");
  static const OsmosisConcentratedLiquidityV1beta1Types
      msgAddToPositionResponse = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.MsgAddToPositionResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types
      msgCollectSpreadRewards = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.MsgCollectSpreadRewards");
  static const OsmosisConcentratedLiquidityV1beta1Types
      msgCollectSpreadRewardsResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.MsgCollectSpreadRewardsResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types msgCollectIncentives =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.MsgCollectIncentives");
  static const OsmosisConcentratedLiquidityV1beta1Types
      msgCollectIncentivesResponse = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.MsgCollectIncentivesResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types msgTransferPositions =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.MsgTransferPositions");
  static const OsmosisConcentratedLiquidityV1beta1Types
      msgTransferPositionsResponse = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.MsgTransferPositionsResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types poolsRequest =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.PoolsRequest",
          query: "/osmosis.concentratedliquidity.v1beta1.Query/Pools",
          rpc: "/osmosis/concentratedliquidity/v1beta1/pools");
  static const OsmosisConcentratedLiquidityV1beta1Types poolsResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.PoolsResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types fullPositionBreakdown =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.FullPositionBreakdown");

  static const OsmosisConcentratedLiquidityV1beta1Types paramsRequest =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.ParamsRequest",
          query: "/osmosis.concentratedliquidity.v1beta1.Query/Params",
          rpc: "/osmosis/concentratedliquidity/v1beta1/params");
  static const OsmosisConcentratedLiquidityV1beta1Types paramsResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.ParamsResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types userPositionsRequest =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.UserPositionsRequest",
          query: "/osmosis.concentratedliquidity.v1beta1.Query/UserPositions",
          rpc: "/osmosis/concentratedliquidity/v1beta1/positions/:address");
  static const OsmosisConcentratedLiquidityV1beta1Types userPositionsResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.UserPositionsResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types
      liquidityPerTickRangeRequest = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.LiquidityPerTickRangeRequest",
          query:
              "/osmosis.concentratedliquidity.v1beta1.Query/LiquidityDepthWithRange",
          rpc:
              "/osmosis/concentratedliquidity/v1beta1/liquidity_per_tick_range");
  static const OsmosisConcentratedLiquidityV1beta1Types
      liquidityPerTickRangeResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.LiquidityPerTickRangeResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types
      liquidityNetInDirectionRequest =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.LiquidityNetInDirectionRequest",
          query:
              "/osmosis.concentratedliquidity.v1beta1.Query/LiquidityNetInDirection",
          rpc:
              "/osmosis/concentratedliquidity/v1beta1/liquidity_net_in_direction");
  static const OsmosisConcentratedLiquidityV1beta1Types
      liquidityNetInDirectionResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.LiquidityPerTickRangeResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types
      claimableSpreadRewardsRequest =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.ClaimableSpreadRewardsRequest",
          query:
              "/osmosis.concentratedliquidity.v1beta1.Query/ClaimableSpreadRewards",
          rpc:
              "/osmosis/concentratedliquidity/v1beta1/claimable_spread_rewards");
  static const OsmosisConcentratedLiquidityV1beta1Types
      claimableSpreadRewardsResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.ClaimableSpreadRewardsResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types
      claimableIncentivesRequest = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.ClaimableIncentivesRequest",
          query:
              "/osmosis.concentratedliquidity.v1beta1.Query/ClaimableIncentives",
          rpc: "/osmosis/concentratedliquidity/v1beta1/claimable_incentives");
  static const OsmosisConcentratedLiquidityV1beta1Types
      claimableIncentivesResponse = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.ClaimableIncentivesResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types positionByIdRequest =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.PositionByIdRequest",
          query: "/osmosis.concentratedliquidity.v1beta1.Query/PositionById",
          rpc: "/osmosis/concentratedliquidity/v1beta1/position_by_id");
  static const OsmosisConcentratedLiquidityV1beta1Types positionByIdResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.PositionByIdResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types
      poolAccumulatorRewardsRequest =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.PoolAccumulatorRewardsRequest",
          query:
              "/osmosis.concentratedliquidity.v1beta1.Query/PoolAccumulatorRewards",
          rpc: "/osmosis/concentratedliquidity/v1beta1/pool_accum_rewards");
  static const OsmosisConcentratedLiquidityV1beta1Types
      poolAccumulatorRewardsResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.PoolAccumulatorRewardsResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types
      incentiveRecordsRequest = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.IncentiveRecordsRequest",
          query:
              "/osmosis.concentratedliquidity.v1beta1.Query/IncentiveRecords",
          rpc: "/osmosis/concentratedliquidity/v1beta1/incentive_records");
  static const OsmosisConcentratedLiquidityV1beta1Types
      incentiveRecordsResponse = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.IncentiveRecordsResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types
      tickAccumulatorTrackersRequest =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.TickAccumulatorTrackersRequest",
          query:
              "/osmosis.concentratedliquidity.v1beta1.Query/TickAccumulatorTrackers",
          rpc: "/osmosis/concentratedliquidity/v1beta1/tick_accum_trackers");
  static const OsmosisConcentratedLiquidityV1beta1Types
      tickAccumulatorTrackersResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.TickAccumulatorTrackersResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types
      cFMMPoolIdLinkFromConcentratedPoolIdRequest =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.CFMMPoolIdLinkFromConcentratedPoolIdRequest",
          query:
              "/osmosis.concentratedliquidity.v1beta1.Query/CFMMPoolIdLinkFromConcentratedPoolId",
          rpc:
              "/osmosis/concentratedliquidity/v1beta1/cfmm_pool_id_link_from_concentrated/:concentrated_pool_id");
  static const OsmosisConcentratedLiquidityV1beta1Types
      cFMMPoolIdLinkFromConcentratedPoolIdResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.CFMMPoolIdLinkFromConcentratedPoolIdResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types
      userUnbondingPositionsRequest =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.UserUnbondingPositionsRequest",
          query:
              "/osmosis.concentratedliquidity.v1beta1.Query/UserUnbondingPositions",
          rpc:
              "/osmosis/concentratedliquidity/v1beta1/user_unbonding_positions/:address");
  static const OsmosisConcentratedLiquidityV1beta1Types
      userUnbondingPositionsResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.UserUnbondingPositionsResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types
      getTotalLiquidityRequest = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.GetTotalLiquidityRequest",
          query:
              "/osmosis.concentratedliquidity.v1beta1.Query/GetTotalLiquidity",
          rpc: "/osmosis/concentratedliquidity/v1beta1/get_total_liquidity");
  static const OsmosisConcentratedLiquidityV1beta1Types
      getTotalLiquidityResponse = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.GetTotalLiquidityResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types
      numNextInitializedTicksRequest =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.NumNextInitializedTicksRequest",
          query:
              "/osmosis.concentratedliquidity.v1beta1.Query/NumNextInitializedTicks",
          rpc:
              "/osmosis/concentratedliquidity/v1beta1/num_next_initialized_ticks");
  static const OsmosisConcentratedLiquidityV1beta1Types
      numNextInitializedTicksResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.NumNextInitializedTicksResponse");

  /// query

  static const List<TypeUrl> services = [
    msgAddToPosition,
    msgCollectIncentives,
    msgCollectSpreadRewards,
    msgCreatePosition,
    msgTransferPositions,
    msgWithdrawPosition
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
