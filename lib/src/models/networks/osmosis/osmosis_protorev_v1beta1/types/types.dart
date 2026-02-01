import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisProtorevV1beta1Types extends TypeUrl {
  const OsmosisProtorevV1beta1Types._(super.typeUrl, {super.query, super.rpc});
  static const String root = "/osmosis.protorev";
  static const OsmosisProtorevV1beta1Types weightMap =
      OsmosisProtorevV1beta1Types._("/osmosis.protorev.v1beta1.WeightMap");
  static const OsmosisProtorevV1beta1Types trade =
      OsmosisProtorevV1beta1Types._("/osmosis.protorev.v1beta1.Trade");

  static const OsmosisProtorevV1beta1Types route =
      OsmosisProtorevV1beta1Types._("/osmosis.protorev.v1beta1.Route");
  static const OsmosisProtorevV1beta1Types cyclicArbTracker =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.CyclicArbTracker",
      );
  static const OsmosisProtorevV1beta1Types routeStatistics =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.RouteStatistics",
      );
  static const OsmosisProtorevV1beta1Types setProtoRevAdminAccountProposal =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.SetProtoRevAdminAccountProposal",
      );
  static const OsmosisProtorevV1beta1Types setProtoRevEnabledProposal =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.SetProtoRevEnabledProposal",
      );
  static const OsmosisProtorevV1beta1Types tokenPairArbRoutes =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.TokenPairArbRoutes",
      );
  static const OsmosisProtorevV1beta1Types stablePoolInfo =
      OsmosisProtorevV1beta1Types._("/osmosis.protorev.v1beta1.StablePoolInfo");
  static const OsmosisProtorevV1beta1Types params =
      OsmosisProtorevV1beta1Types._("/osmosis.protorev.v1beta1.Params");

  static const OsmosisProtorevV1beta1Types poolWeights =
      OsmosisProtorevV1beta1Types._("/osmosis.protorev.v1beta1.PoolWeights");

  static const OsmosisProtorevV1beta1Types balancerPoolInfo =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.BalancerPoolInfo",
      );

  static const OsmosisProtorevV1beta1Types concentratedPoolInfo =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.ConcentratedPoolInfo",
      );

  static const OsmosisProtorevV1beta1Types baseDenom =
      OsmosisProtorevV1beta1Types._("/osmosis.protorev.v1beta1.BaseDenom");
  static const OsmosisProtorevV1beta1Types cosmwasmPoolInfo =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.CosmwasmPoolInfo",
      );
  static const OsmosisProtorevV1beta1Types infoByPoolType =
      OsmosisProtorevV1beta1Types._("/osmosis.protorev.v1beta1.InfoByPoolType");

  static const OsmosisProtorevV1beta1Types msgSetHotRoutes =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.MsgSetHotRoutes",
      );
  static const OsmosisProtorevV1beta1Types msgSetHotRoutesResponse =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.MsgSetHotRoutesResponse",
      );

  static const OsmosisProtorevV1beta1Types msgSetDeveloperAccount =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.MsgSetDeveloperAccount",
      );
  static const OsmosisProtorevV1beta1Types msgSetDeveloperAccountResponse =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.MsgSetDeveloperAccountResponse",
      );

  static const OsmosisProtorevV1beta1Types msgSetMaxPoolPointsPerTx =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.MsgSetMaxPoolPointsPerTx",
      );
  static const OsmosisProtorevV1beta1Types msgSetMaxPoolPointsPerTxResponse =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.MsgSetMaxPoolPointsPerTxResponse",
      );

  static const OsmosisProtorevV1beta1Types msgSetMaxPoolPointsPerBlock =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.MsgSetMaxPoolPointsPerBlock",
      );
  static const OsmosisProtorevV1beta1Types msgSetMaxPoolPointsPerBlockResponse =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.MsgSetMaxPoolPointsPerBlockResponse",
      );

  static const OsmosisProtorevV1beta1Types msgSetInfoByPoolType =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.MsgSetInfoByPoolType",
      );
  static const OsmosisProtorevV1beta1Types msgSetInfoByPoolTypeResponse =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.MsgSetInfoByPoolTypeResponse",
      );

  static const OsmosisProtorevV1beta1Types msgSetBaseDenoms =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.MsgSetBaseDenoms",
      );
  static const OsmosisProtorevV1beta1Types msgSetBaseDenomsResponse =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.MsgSetBaseDenomsResponse",
      );

  static const OsmosisProtorevV1beta1Types queryParamsRequest =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.QueryParamsRequest",
        query: "/osmosis.protorev.v1beta1.Query/Params",
        rpc: "/osmosis/protorev/params",
      );
  static const OsmosisProtorevV1beta1Types queryParamsResponse =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.QueryParamsResponse",
      );

  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevNumberOfTradesRequest = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevNumberOfTradesRequest",
    query: "/osmosis.protorev.v1beta1.Query/GetProtoRevNumberOfTrades",
    rpc: "/osmosis/protorev/number_of_trades",
  );
  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevNumberOfTradesResponse = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevNumberOfTradesResponse",
  );

  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevProfitsByDenomRequest = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevProfitsByDenomRequest",
    query: "/osmosis.protorev.v1beta1.Query/GetProtoRevProfitsByDenom",
    rpc: "/osmosis/protorev/profits_by_denom",
  );
  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevProfitsByDenomResponse = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevProfitsByDenomResponse",
  );

  static const OsmosisProtorevV1beta1Types queryGetProtoRevAllProfitsRequest =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.QueryGetProtoRevAllProfitsRequest",
        query: "/osmosis.protorev.v1beta1.Query/GetProtoRevAllProfits",
        rpc: "/osmosis/protorev/all_profits",
      );
  static const OsmosisProtorevV1beta1Types queryGetProtoRevAllProfitsResponse =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.QueryGetProtoRevAllProfitsResponse",
      );

  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevStatisticsByRouteRequest = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevStatisticsByRouteRequest",
    query: "/osmosis.protorev.v1beta1.Query/GetProtoRevStatisticsByRoute",
    rpc: "/osmosis/protorev/statistics_by_route",
  );
  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevStatisticsByRouteResponse = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevStatisticsByRouteResponse",
  );

  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevAllRouteStatisticsRequest = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevAllRouteStatisticsRequest",
    query: "/osmosis.protorev.v1beta1.Query/GetProtoRevAllRouteStatistics",
    rpc: "/osmosis/protorev/all_route_statistics",
  );
  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevAllRouteStatisticsResponse = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevAllRouteStatisticsResponse",
  );

  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevTokenPairArbRoutesRequest = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevTokenPairArbRoutesRequest",
    query: "/osmosis.protorev.v1beta1.Query/GetProtoRevTokenPairArbRoutes",
    rpc: "/osmosis/protorev/token_pair_arb_routes",
  );
  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevTokenPairArbRoutesResponse = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevTokenPairArbRoutesResponse",
  );

  static const OsmosisProtorevV1beta1Types queryGetProtoRevAdminAccountRequest =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.QueryGetProtoRevAdminAccountRequest",
        query: "/osmosis.protorev.v1beta1.Query/GetProtoRevAdminAccount",
        rpc: "/osmosis/protorev/admin_account",
      );
  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevAdminAccountResponse = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevAdminAccountResponse",
  );

  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevDeveloperAccountRequest = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevDeveloperAccountRequest",
    query: "/osmosis.protorev.v1beta1.Query/GetProtoRevDeveloperAccount",
    rpc: "/osmosis/protorev/developer_account",
  );
  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevDeveloperAccountResponse = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevDeveloperAccountResponse",
  );

  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevInfoByPoolTypeRequest = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevInfoByPoolTypeRequest",
    query: "/osmosis.protorev.v1beta1.Query/GetProtoRevInfoByPoolType",
    rpc: "/osmosis/protorev/info_by_pool_type",
  );
  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevInfoByPoolTypeResponse = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevInfoByPoolTypeResponse",
  );

  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevMaxPoolPointsPerTxRequest = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevMaxPoolPointsPerTxRequest",
    query: "/osmosis.protorev.v1beta1.Query/GetProtoRevMaxPoolPointsPerTx",
    rpc: "/osmosis/protorev/max_pool_points_per_tx",
  );
  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevMaxPoolPointsPerTxResponse = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevMaxPoolPointsPerTxResponse",
  );

  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevMaxPoolPointsPerBlockRequest = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevMaxPoolPointsPerBlockRequest",
    query: "/osmosis.protorev.v1beta1.Query/GetProtoRevMaxPoolPointsPerBlock",
    rpc: "/osmosis/protorev/max_pool_points_per_block",
  );
  static const OsmosisProtorevV1beta1Types
  queryGetProtoRevMaxPoolPointsPerBlockResponse = OsmosisProtorevV1beta1Types._(
    "/osmosis.protorev.v1beta1.QueryGetProtoRevMaxPoolPointsPerBlockResponse",
  );

  static const OsmosisProtorevV1beta1Types queryGetProtoRevBaseDenomsRequest =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.QueryGetProtoRevBaseDenomsRequest",
        query: "/osmosis.protorev.v1beta1.Query/GetProtoRevBaseDenoms",
        rpc: "/osmosis/protorev/base_denoms",
      );
  static const OsmosisProtorevV1beta1Types queryGetProtoRevBaseDenomsResponse =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.QueryGetProtoRevBaseDenomsResponse",
      );

  static const OsmosisProtorevV1beta1Types queryGetProtoRevEnabledRequest =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.QueryGetProtoRevEnabledRequest",
        query: "/osmosis.protorev.v1beta1.Query/GetProtoRevEnabled",
        rpc: "/osmosis/protorev/enabled",
      );
  static const OsmosisProtorevV1beta1Types queryGetProtoRevEnabledResponse =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.QueryGetProtoRevEnabledResponse",
      );

  static const OsmosisProtorevV1beta1Types queryGetProtoRevPoolRequest =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.QueryGetProtoRevPoolRequest",
        query: "/osmosis.protorev.v1beta1.Query/GetProtoRevPool",
        rpc: "/osmosis/protorev/pool",
      );
  static const OsmosisProtorevV1beta1Types queryGetProtoRevPoolResponse =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.QueryGetProtoRevPoolResponse",
      );
  static const OsmosisProtorevV1beta1Types allProtocolRevenue =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.AllProtocolRevenue",
      );
  static const OsmosisProtorevV1beta1Types queryGetAllProtocolRevenueRequest =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.QueryGetAllProtocolRevenueRequest",
        query: "/osmosis.protorev.v1beta1.Query/GetAllProtocolRevenue",
        rpc: "/osmosis/protorev/all_protocol_revenue",
      );
  static const OsmosisProtorevV1beta1Types queryGetAllProtocolRevenueResponse =
      OsmosisProtorevV1beta1Types._(
        "/osmosis.protorev.v1beta1.QueryGetAllProtocolRevenueResponse",
      );

  static const List<TypeUrl> services = [
    msgSetBaseDenoms,
    msgSetDeveloperAccount,
    msgSetHotRoutes,
    msgSetInfoByPoolType,
    msgSetMaxPoolPointsPerBlock,
    msgSetMaxPoolPointsPerTx,
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
