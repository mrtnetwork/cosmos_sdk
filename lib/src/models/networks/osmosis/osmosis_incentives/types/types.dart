import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisIncentivesTypes extends TypeUrl {
  const OsmosisIncentivesTypes._(super.typeUrl, {super.query, super.rpc});
  static const String root = "/osmosis.incentives";
  static const OsmosisIncentivesTypes gauge = OsmosisIncentivesTypes._(
    "/osmosis.incentives.Gauge",
  );

  static const OsmosisIncentivesTypes msgCreateGauge = OsmosisIncentivesTypes._(
    "/osmosis.incentives.MsgCreateGauge",
  );
  static const OsmosisIncentivesTypes msgCreateGaugeResponse =
      OsmosisIncentivesTypes._("/osmosis.incentives.MsgCreateGaugeResponse");

  static const OsmosisIncentivesTypes msgAddToGauge = OsmosisIncentivesTypes._(
    "/osmosis.incentives.MsgAddToGauge",
  );
  static const OsmosisIncentivesTypes msgAddToGaugeResponse =
      OsmosisIncentivesTypes._("/osmosis.incentives.MsgAddToGaugeResponse");

  static const OsmosisIncentivesTypes moduleToDistributeCoinsRequest =
      OsmosisIncentivesTypes._(
        "/osmosis.incentives.ModuleToDistributeCoinsRequest",
        query: "/osmosis.incentives.Query/ModuleToDistributeCoins",
        rpc: "/osmosis/incentives/v1beta1/module_to_distribute_coins",
      );
  static const OsmosisIncentivesTypes moduleToDistributeCoinsResponse =
      OsmosisIncentivesTypes._(
        "/osmosis.incentives.moduleToDistributeCoinsResponse",
      );

  static const OsmosisIncentivesTypes gaugeByIDRequest =
      OsmosisIncentivesTypes._(
        "/osmosis.incentives.GaugeByIDRequest",
        query: "/osmosis.incentives.Query/GaugeByID",
        rpc: "/osmosis/incentives/v1beta1/gauge_by_id/:id",
      );
  static const OsmosisIncentivesTypes gaugeByIDResponse =
      OsmosisIncentivesTypes._("/osmosis.incentives.GaugeByIDResponse");

  static const OsmosisIncentivesTypes gaugesRequest = OsmosisIncentivesTypes._(
    "/osmosis.incentives.GaugesRequest",
    query: "/osmosis.incentives.Query/Gauges",
    rpc: "/osmosis/incentives/v1beta1/gauges",
  );

  static const OsmosisIncentivesTypes gaugesResponse = OsmosisIncentivesTypes._(
    "/osmosis.incentives.GaugesResponse",
  );

  static const OsmosisIncentivesTypes activeGaugesRequest =
      OsmosisIncentivesTypes._(
        "/osmosis.incentives.ActiveGaugesRequest",
        query: "/osmosis.incentives.Query/ActiveGauges",
        rpc: "/osmosis/incentives/v1beta1/active_gauges",
      );

  static const OsmosisIncentivesTypes activeGaugesResponse =
      OsmosisIncentivesTypes._("/osmosis.incentives.ActiveGaugesResponse");

  static const OsmosisIncentivesTypes activeGaugesPerDenomRequest =
      OsmosisIncentivesTypes._(
        "/osmosis.incentives.ActiveGaugesPerDenomRequest",
        query: "/osmosis.incentives.Query/ActiveGaugesPerDenom",
        rpc: "/osmosis/incentives/v1beta1/active_gauges_per_denom",
      );
  static const OsmosisIncentivesTypes activeGaugesPerDenomResponse =
      OsmosisIncentivesTypes._(
        "/osmosis.incentives.ActiveGaugesPerDenomResponse",
      );

  static const OsmosisIncentivesTypes upcomingGaugesRequest =
      OsmosisIncentivesTypes._(
        "/osmosis.incentives.UpcomingGaugesRequest",
        query: "/osmosis.incentives.Query/UpcomingGauges",
        rpc: "/osmosis/incentives/v1beta1/upcoming_gauges",
      );
  static const OsmosisIncentivesTypes upcomingGaugesResponse =
      OsmosisIncentivesTypes._("/osmosis.incentives.UpcomingGaugesResponse");

  static const OsmosisIncentivesTypes upcomingGaugesPerDenomRequest =
      OsmosisIncentivesTypes._(
        "/osmosis.incentives.UpcomingGaugesPerDenomRequest",
        query: "/osmosis.incentives.Query/UpcomingGaugesPerDenom",
        rpc: "/osmosis/incentives/v1beta1/upcoming_gauges_per_denom",
      );
  static const OsmosisIncentivesTypes upcomingGaugesPerDenomResponse =
      OsmosisIncentivesTypes._(
        "/osmosis.incentives.UpcomingGaugesPerDenomResponse",
      );

  static const OsmosisIncentivesTypes rewardsEstRequest =
      OsmosisIncentivesTypes._(
        "/osmosis.incentives.RewardsEstRequest",
        query: "/osmosis.incentives.Query/RewardsEst",
        rpc: "/osmosis/incentives/v1beta1/rewards_est/:owner",
      );
  static const OsmosisIncentivesTypes rewardsEstResponse =
      OsmosisIncentivesTypes._("/osmosis.incentives.RewardsEstResponse");

  static const OsmosisIncentivesTypes queryLockableDurationsRequest =
      OsmosisIncentivesTypes._(
        "/osmosis.incentives.QueryLockableDurationsRequest",
        query: "/osmosis.incentives.Query/LockableDurations",
        rpc: "/osmosis/incentives/v1beta1/lockable_durations",
      );
  static const OsmosisIncentivesTypes queryLockableDurationsResponse =
      OsmosisIncentivesTypes._(
        "/osmosis.incentives.QueryLockableDurationsResponse",
      );

  static const List<TypeUrl> services = [msgAddToGauge, msgCreateGauge];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
