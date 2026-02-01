import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisCosmWasmPoolV1beta1Types extends TypeUrl {
  const OsmosisCosmWasmPoolV1beta1Types._(
    super.typeUrl, {
    super.query,
    super.rpc,
  });
  static const String root = "/osmosis.cosmwasmpool.v1beta1";
  static const OsmosisCosmWasmPoolV1beta1Types
  uploadCosmWasmPoolCodeAndWhiteListProposal = OsmosisCosmWasmPoolV1beta1Types._(
    "/osmosis.cosmwasmpool.v1beta1.UploadCosmWasmPoolCodeAndWhiteListProposal",
  );
  static const OsmosisCosmWasmPoolV1beta1Types swapExactAmountOut =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.SwapExactAmountOut",
      );
  static const OsmosisCosmWasmPoolV1beta1Types swapExactAmountIn =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.SwapExactAmountIn",
      );
  static const OsmosisCosmWasmPoolV1beta1Types spotPrice =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.SpotPrice",
      );
  static const OsmosisCosmWasmPoolV1beta1Types params =
      OsmosisCosmWasmPoolV1beta1Types._("/osmosis.cosmwasmpool.v1beta1.Params");
  static const OsmosisCosmWasmPoolV1beta1Types migratePoolContractsProposal =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.MigratePoolContractsProposal",
      );
  static const OsmosisCosmWasmPoolV1beta1Types instantiateMsg =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.InstantiateMsg",
      );
  static const OsmosisCosmWasmPoolV1beta1Types gnesisState =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.GenesisState",
      );
  static const OsmosisCosmWasmPoolV1beta1Types emptyStruct =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.EmptyStruct",
      );
  static const OsmosisCosmWasmPoolV1beta1Types emptyRequest =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.EmptyRequest",
      );
  static const OsmosisCosmWasmPoolV1beta1Types cosmWasmPool =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.CosmWasmPool",
      );
  static const OsmosisCosmWasmPoolV1beta1Types calcOutAmtGivenIn =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.CalcOutAmtGivenIn",
      );
  static const OsmosisCosmWasmPoolV1beta1Types calcInAmtGivenOut =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.CalcInAmtGivenOut",
      );

  static const OsmosisCosmWasmPoolV1beta1Types msgCreateCosmWasmPool =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.MsgCreateCosmWasmPool",
      );
  static const OsmosisCosmWasmPoolV1beta1Types msgCreateCosmWasmPoolResponse =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.MsgCreateCosmWasmPoolResponse",
      );

  static const OsmosisCosmWasmPoolV1beta1Types poolsRequest =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.PoolsRequest",
        query: "/osmosis.cosmwasmpool.v1beta1.Query/Pools",
        rpc: "/osmosis/cosmwasmpool/v1beta1/pools",
      );
  static const OsmosisCosmWasmPoolV1beta1Types poolsResponse =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.PoolsResponse",
      );

  static const OsmosisCosmWasmPoolV1beta1Types paramsRequest =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.ParamsRequest",
        query: "/osmosis.cosmwasmpool.v1beta1.Query/Params",
        rpc: "/osmosis/cosmwasmpool/v1beta1/params",
      );
  static const OsmosisCosmWasmPoolV1beta1Types paramsResponse =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.ParamsResponse",
      );

  static const OsmosisCosmWasmPoolV1beta1Types contractInfoByPoolIdRequest =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.ContractInfoByPoolIdRequest",
        query: "/osmosis.cosmwasmpool.v1beta1.Query/ContractInfoByPoolId",
        rpc: "/osmosis/cosmwasmpool/v1beta1/contract_info",
      );
  static const OsmosisCosmWasmPoolV1beta1Types contractInfoByPoolIdResponse =
      OsmosisCosmWasmPoolV1beta1Types._(
        "/osmosis.cosmwasmpool.v1beta1.ContractInfoByPoolIdResponse",
      );

  ///service

  static const List<TypeUrl> services = [msgCreateCosmWasmPool];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
