import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisCosmWasmPoolV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const OsmosisCosmWasmPoolV1beta1Types._(this.typeUrl, {this.rpc});
  static const OsmosisCosmWasmPoolV1beta1Types
      uploadCosmWasmPoolCodeAndWhiteListProposal =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.UploadCosmWasmPoolCodeAndWhiteListProposal");
  static const OsmosisCosmWasmPoolV1beta1Types swapExactAmountOut =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.SwapExactAmountOut");
  static const OsmosisCosmWasmPoolV1beta1Types swapExactAmountIn =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.SwapExactAmountIn");
  static const OsmosisCosmWasmPoolV1beta1Types spotPrice =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.SpotPrice");
  static const OsmosisCosmWasmPoolV1beta1Types params =
      OsmosisCosmWasmPoolV1beta1Types._("/osmosis.cosmwasmpool.v1beta1.Params");
  static const OsmosisCosmWasmPoolV1beta1Types migratePoolContractsProposal =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.MigratePoolContractsProposal");
  static const OsmosisCosmWasmPoolV1beta1Types instantiateMsg =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.InstantiateMsg");
  static const OsmosisCosmWasmPoolV1beta1Types gnesisState =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.GenesisState");
  static const OsmosisCosmWasmPoolV1beta1Types emptyStruct =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.EmptyStruct");
  static const OsmosisCosmWasmPoolV1beta1Types emptyRequest =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.EmptyRequest");
  static const OsmosisCosmWasmPoolV1beta1Types cosmWasmPool =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.CosmWasmPool");
  static const OsmosisCosmWasmPoolV1beta1Types calcOutAmtGivenIn =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.CalcOutAmtGivenIn");
  static const OsmosisCosmWasmPoolV1beta1Types calcInAmtGivenOut =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.CalcInAmtGivenOut");

  static const OsmosisCosmWasmPoolV1beta1Types msgCreateCosmWasmPool =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.MsgCreateCosmWasmPool");
  static const OsmosisCosmWasmPoolV1beta1Types msgCreateCosmWasmPoolResponse =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.MsgCreateCosmWasmPoolResponse");

  static const OsmosisCosmWasmPoolV1beta1Types poolsRequest =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.PoolsRequest");
  static const OsmosisCosmWasmPoolV1beta1Types poolsResponse =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.PoolsResponse");

  static const OsmosisCosmWasmPoolV1beta1Types paramsRequest =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.ParamsRequest");
  static const OsmosisCosmWasmPoolV1beta1Types paramsResponse =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.ParamsResponse");

  static const OsmosisCosmWasmPoolV1beta1Types contractInfoByPoolIdRequest =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.ContractInfoByPoolIdRequest");
  static const OsmosisCosmWasmPoolV1beta1Types contractInfoByPoolIdResponse =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.ContractInfoByPoolIdResponse");

  /// query
  static const OsmosisCosmWasmPoolV1beta1Types contractInfoByPoolId =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.Query/ContractInfoByPoolId",
          rpc: "/osmosis/cosmwasmpool/v1beta1/contract_info");

  static const OsmosisCosmWasmPoolV1beta1Types queryParams =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.Query/Params",
          rpc: "/osmosis/cosmwasmpool/v1beta1/params");

  static const OsmosisCosmWasmPoolV1beta1Types pools =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.Query/Pools",
          rpc: "/osmosis/cosmwasmpool/v1beta1/pools");

  ///service
  static const OsmosisCosmWasmPoolV1beta1Types createCosmWasmPool =
      OsmosisCosmWasmPoolV1beta1Types._(
          "/osmosis.cosmwasmpool.v1beta1.MsgCreator/CreateCosmWasmPool");
}
