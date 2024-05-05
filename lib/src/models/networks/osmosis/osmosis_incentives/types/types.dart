import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisIncentivesTypes extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const OsmosisIncentivesTypes._(this.typeUrl, {this.rpc});
  static const OsmosisIncentivesTypes gauge =
      OsmosisIncentivesTypes._("/osmosis.incentives.Gauge");

  static const OsmosisIncentivesTypes msgCreateGauge =
      OsmosisIncentivesTypes._("/osmosis.incentives.MsgCreateGauge");
  static const OsmosisIncentivesTypes msgCreateGaugeResponse =
      OsmosisIncentivesTypes._("/osmosis.incentives.MsgCreateGaugeResponse");

  static const OsmosisIncentivesTypes msgAddToGauge =
      OsmosisIncentivesTypes._("/osmosis.incentives.MsgAddToGauge");
  static const OsmosisIncentivesTypes msgAddToGaugeResponse =
      OsmosisIncentivesTypes._("/osmosis.incentives.MsgAddToGaugeResponse");

  static const OsmosisIncentivesTypes moduleToDistributeCoinsRequest =
      OsmosisIncentivesTypes._(
          "/osmosis.incentives.ModuleToDistributeCoinsRequest");
  static const OsmosisIncentivesTypes moduleToDistributeCoinsResponse =
      OsmosisIncentivesTypes._(
          "/osmosis.incentives.moduleToDistributeCoinsResponse");

  static const OsmosisIncentivesTypes gaugeByIDRequest =
      OsmosisIncentivesTypes._("/osmosis.incentives.GaugeByIDRequest");
  static const OsmosisIncentivesTypes gaugeByIDResponse =
      OsmosisIncentivesTypes._("/osmosis.incentives.GaugeByIDResponse");

  static const OsmosisIncentivesTypes gaugesRequest =
      OsmosisIncentivesTypes._("/osmosis.incentives.GaugesRequest");
  static const OsmosisIncentivesTypes gaugesResponse =
      OsmosisIncentivesTypes._("/osmosis.incentives.GaugesResponse");

  static const OsmosisIncentivesTypes activeGaugesRequest =
      OsmosisIncentivesTypes._("/osmosis.incentives.ActiveGaugesRequest");
  static const OsmosisIncentivesTypes activeGaugesResponse =
      OsmosisIncentivesTypes._("/osmosis.incentives.ActiveGaugesResponse");

  static const OsmosisIncentivesTypes activeGaugesPerDenomRequest =
      OsmosisIncentivesTypes._(
          "/osmosis.incentives.ActiveGaugesPerDenomRequest");
  static const OsmosisIncentivesTypes activeGaugesPerDenomResponse =
      OsmosisIncentivesTypes._(
          "/osmosis.incentives.ActiveGaugesPerDenomResponse");

  static const OsmosisIncentivesTypes upcomingGaugesRequest =
      OsmosisIncentivesTypes._("/osmosis.incentives.UpcomingGaugesRequest");
  static const OsmosisIncentivesTypes upcomingGaugesResponse =
      OsmosisIncentivesTypes._("/osmosis.incentives.UpcomingGaugesResponse");

  static const OsmosisIncentivesTypes upcomingGaugesPerDenomRequest =
      OsmosisIncentivesTypes._(
          "/osmosis.incentives.UpcomingGaugesPerDenomRequest");
  static const OsmosisIncentivesTypes upcomingGaugesPerDenomResponse =
      OsmosisIncentivesTypes._(
          "/osmosis.incentives.UpcomingGaugesPerDenomResponse");

  static const OsmosisIncentivesTypes rewardsEstRequest =
      OsmosisIncentivesTypes._("/osmosis.incentives.RewardsEstRequest");
  static const OsmosisIncentivesTypes rewardsEstResponse =
      OsmosisIncentivesTypes._("/osmosis.incentives.RewardsEstResponse");

  static const OsmosisIncentivesTypes queryLockableDurationsRequest =
      OsmosisIncentivesTypes._(
          "/osmosis.incentives.QueryLockableDurationsRequest");
  static const OsmosisIncentivesTypes queryLockableDurationsResponse =
      OsmosisIncentivesTypes._(
          "/osmosis.incentives.QueryLockableDurationsResponse");

  /// query
  static const OsmosisIncentivesTypes lockableDurations =
      OsmosisIncentivesTypes._("/osmosis.incentives.Query/LockableDurations",
          rpc: "/osmosis/incentives/v1beta1/lockable_durations");
  static const OsmosisIncentivesTypes rewardsEst = OsmosisIncentivesTypes._(
      "/osmosis.incentives.Query/RewardsEst",
      rpc: "/osmosis/incentives/v1beta1/rewards_est/:owner");
  static const OsmosisIncentivesTypes upcomingGaugesPerDenom =
      OsmosisIncentivesTypes._(
          "/osmosis.incentives.Query/UpcomingGaugesPerDenom",
          rpc: "/osmosis/incentives/v1beta1/upcoming_gauges_per_denom");
  static const OsmosisIncentivesTypes upcomingGauges = OsmosisIncentivesTypes._(
      "/osmosis.incentives.Query/UpcomingGauges",
      rpc: "/osmosis/incentives/v1beta1/upcoming_gauges");
  static const OsmosisIncentivesTypes activeGaugesPerDenom =
      OsmosisIncentivesTypes._("/osmosis.incentives.Query/ActiveGaugesPerDenom",
          rpc: "/osmosis/incentives/v1beta1/active_gauges_per_denom");
  static const OsmosisIncentivesTypes activeGauges = OsmosisIncentivesTypes._(
      "/osmosis.incentives.Query/ActiveGauges",
      rpc: "/osmosis/incentives/v1beta1/active_gauges");
  static const OsmosisIncentivesTypes gauges = OsmosisIncentivesTypes._(
      "/osmosis.incentives.Query/Gauges",
      rpc: "/osmosis/incentives/v1beta1/gauges");
  static const OsmosisIncentivesTypes moduleToDistributeCoins =
      OsmosisIncentivesTypes._(
          "/osmosis.incentives.Query/ModuleToDistributeCoins",
          rpc: "/osmosis/incentives/v1beta1/module_to_distribute_coins");

  static const OsmosisIncentivesTypes gaugeByID = OsmosisIncentivesTypes._(
      "/osmosis.incentives.Query/GaugeByID",
      rpc: "/osmosis/incentives/v1beta1/gauge_by_id/:id");

  /// services
  static const OsmosisIncentivesTypes createGauge =
      OsmosisIncentivesTypes._("/osmosis.incentives.Msg/CreateGauge");
  static const OsmosisIncentivesTypes addToGauge =
      OsmosisIncentivesTypes._("/osmosis.incentives.Msg/AddToGauge");
}
