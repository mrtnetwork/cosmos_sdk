import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisConcentratedLiquidityV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const OsmosisConcentratedLiquidityV1beta1Types._(this.typeUrl, {this.rpc});
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
          "/osmosis.concentratedliquidity.v1beta1.PoolsRequest");
  static const OsmosisConcentratedLiquidityV1beta1Types poolsResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.PoolsResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types fullPositionBreakdown =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.FullPositionBreakdown");

  static const OsmosisConcentratedLiquidityV1beta1Types paramsRequest =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.ParamsRequest");
  static const OsmosisConcentratedLiquidityV1beta1Types paramsResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.ParamsResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types userPositionsRequest =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.UserPositionsRequest");
  static const OsmosisConcentratedLiquidityV1beta1Types userPositionsResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.UserPositionsResponse");

  static const OsmosisConcentratedLiquidityV1beta1Types
      liquidityPerTickRangeRequest = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.LiquidityPerTickRangeRequest");
  static const OsmosisConcentratedLiquidityV1beta1Types
      liquidityPerTickRangeResponse =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.LiquidityPerTickRangeResponse");

  /// query
  static const OsmosisConcentratedLiquidityV1beta1Types
      liquidityDepthWithRangeQuery = OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.Query/LiquidityDepthWithRange",
          rpc:
              "/osmosis/concentratedliquidity/v1beta1/liquidity_per_tick_range");
  static const OsmosisConcentratedLiquidityV1beta1Types userPositions =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.Query/UserPositions",
          rpc: "/osmosis/concentratedliquidity/v1beta1/positions/:address");
  static const OsmosisConcentratedLiquidityV1beta1Types params =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.Query/Params",
          rpc: "/osmosis/concentratedliquidity/v1beta1/params");

  static const OsmosisConcentratedLiquidityV1beta1Types pools =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.Query/Pools",
          rpc: "/osmosis/concentratedliquidity/v1beta1/pools");

  /// services
  static const OsmosisConcentratedLiquidityV1beta1Types transferPositions =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.Msg/TransferPositions");
  static const OsmosisConcentratedLiquidityV1beta1Types collectIncentives =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.Msg/CollectIncentives");

  static const OsmosisConcentratedLiquidityV1beta1Types collectSpreadRewards =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.Msg/CollectSpreadRewards");

  static const OsmosisConcentratedLiquidityV1beta1Types addToPosition =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.Msg/AddToPosition");
  static const OsmosisConcentratedLiquidityV1beta1Types withdrawPosition =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.Msg/WithdrawPosition");
  static const OsmosisConcentratedLiquidityV1beta1Types createPosition =
      OsmosisConcentratedLiquidityV1beta1Types._(
          "/osmosis.concentratedliquidity.v1beta1.Msg/CreatePosition");
}
