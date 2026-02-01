import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisPoolincentivesV1beta1Types extends TypeUrl {
  const OsmosisPoolincentivesV1beta1Types._(
    super.typeUrl, {
    super.query,
    super.rpc,
  });
  static const OsmosisPoolincentivesV1beta1Types distrRecord =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.DistrRecord",
      );
  static const OsmosisPoolincentivesV1beta1Types updatePoolIncentivesProposal =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.UpdatePoolIncentivesProposal",
      );
  static const OsmosisPoolincentivesV1beta1Types replacePoolIncentivesProposal =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.ReplacePoolIncentivesProposal",
      );
  static const OsmosisPoolincentivesV1beta1Types poolToGauge =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.PoolToGauge",
      );
  static const OsmosisPoolincentivesV1beta1Types poolToGauges =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.PoolToGauges",
      );
  static const OsmosisPoolincentivesV1beta1Types params =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.Params",
      );
  static const OsmosisPoolincentivesV1beta1Types lockableDurationsInfo =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.LockableDurationsInfo",
      );
  static const OsmosisPoolincentivesV1beta1Types incentivizedPool =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.IncentivizedPool",
      );
  static const OsmosisPoolincentivesV1beta1Types distrInfo =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.DistrInfo",
      );
  static const OsmosisPoolincentivesV1beta1Types genesisState =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.GenesisState",
      );
  static const OsmosisPoolincentivesV1beta1Types
  gaugeIdWithDuration = OsmosisPoolincentivesV1beta1Types._(
    "/osmosis.poolincentives.v1beta1.QueryGaugeIdsResponse.GaugeIdWithDuration",
  );
  static const OsmosisPoolincentivesV1beta1Types queryGaugeIdsRequest =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.QueryGaugeIdsRequest",
        query: "/osmosis.poolincentives.v1beta1.Query/GaugeIds",
        rpc: "/osmosis/pool-incentives/v1beta1/gauge-ids/:pool_id",
      );
  static const OsmosisPoolincentivesV1beta1Types queryGaugeIdsResponse =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.QueryGaugeIdsResponse",
      );

  static const OsmosisPoolincentivesV1beta1Types queryDistrInfoRequest =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.QueryDistrInfoRequest",
        query: "/osmosis.poolincentives.v1beta1.Query/DistrInfo",
        rpc: "/osmosis/pool-incentives/v1beta1/distr_info",
      );
  static const OsmosisPoolincentivesV1beta1Types queryDistrInfoResponse =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.QueryDistrInfoResponse",
      );

  static const OsmosisPoolincentivesV1beta1Types queryParamsRequest =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.QueryParamsRequest",
        query: "/osmosis.poolincentives.v1beta1.Query/Params",
        rpc: "/osmosis/pool-incentives/v1beta1/params",
      );
  static const OsmosisPoolincentivesV1beta1Types queryParamsResponse =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.QueryParamsResponse",
      );

  static const OsmosisPoolincentivesV1beta1Types queryLockableDurationsRequest =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.QueryLockableDurationsRequest",
        query: "/osmosis.poolincentives.v1beta1.Query/LockableDurations",
        rpc: "/osmosis/pool-incentives/v1beta1/lockable_durations",
      );
  static const OsmosisPoolincentivesV1beta1Types
  queryLockableDurationsResponse = OsmosisPoolincentivesV1beta1Types._(
    "/osmosis.poolincentives.v1beta1.QueryLockableDurationsResponse",
  );

  static const OsmosisPoolincentivesV1beta1Types queryIncentivizedPoolsRequest =
      OsmosisPoolincentivesV1beta1Types._(
        "/osmosis.poolincentives.v1beta1.QueryIncentivizedPoolsRequest",
        query: "/osmosis.poolincentives.v1beta1.Query/IncentivizedPools",
        rpc: "/osmosis/pool-incentives/v1beta1/incentivized_pools",
      );
  static const OsmosisPoolincentivesV1beta1Types
  queryIncentivizedPoolsResponse = OsmosisPoolincentivesV1beta1Types._(
    "/osmosis.poolincentives.v1beta1.QueryIncentivizedPoolsResponse",
  );

  static const OsmosisPoolincentivesV1beta1Types
  queryExternalIncentiveGaugesRequest = OsmosisPoolincentivesV1beta1Types._(
    "/osmosis.poolincentives.v1beta1.QueryExternalIncentiveGaugesRequest",
    query: "/osmosis.poolincentives.v1beta1.Query/ExternalIncentiveGauges",
    rpc: "/osmosis/pool-incentives/v1beta1/external_incentive_gauges",
  );
  static const OsmosisPoolincentivesV1beta1Types
  queryExternalIncentiveGaugesResponse = OsmosisPoolincentivesV1beta1Types._(
    "/osmosis.poolincentives.v1beta1.QueryExternalIncentiveGaugesResponse",
  );
}
