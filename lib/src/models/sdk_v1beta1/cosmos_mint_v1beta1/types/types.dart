import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class MintV1beta1Types extends TypeUrl {
  const MintV1beta1Types._(super.typeUrl, {super.query, super.rpc});
  static const String root = "/cosmos.mint.v1beta1";
  static const MintV1beta1Types mintParams = MintV1beta1Types._(
    "/cosmos.mint.v1beta1.Params",
  );
  static const MintV1beta1Types minter = MintV1beta1Types._(
    "/cosmos.mint.v1beta1.Minter",
  );
  static const MintV1beta1Types mintGenesisState = MintV1beta1Types._(
    "/cosmos.mint.v1beta1.GenesisState",
  );
  static const MintV1beta1Types msgUpdateMintParams = MintV1beta1Types._(
    "/cosmos.mint.v1beta1.MsgUpdateParams",
  );
  static const MintV1beta1Types msgUpdateMintParamsResponse =
      MintV1beta1Types._("/cosmos.mint.v1beta1.MsgUpdateParamsResponse");
  static const MintV1beta1Types queryMintParamsRequest = MintV1beta1Types._(
    "/cosmos.mint.v1beta1.QueryParamsRequest",
    query: "/cosmos.mint.v1beta1.Query/Params",
    rpc: "/cosmos/mint/v1beta1/params",
  );
  static const MintV1beta1Types queryMintParamsResponse = MintV1beta1Types._(
    "/cosmos.mint.v1beta1.QueryParamsResponse",
  );
  static const MintV1beta1Types queryInflationRequest = MintV1beta1Types._(
    "/cosmos.mint.v1beta1.QueryInflationRequest",
    query: "/cosmos.mint.v1beta1.Query/Inflation",
    rpc: "/cosmos/mint/v1beta1/inflation",
  );
  static const MintV1beta1Types queryInflationResponse = MintV1beta1Types._(
    "/cosmos.mint.v1beta1.QueryInflationResponse",
  );
  static const MintV1beta1Types queryAnnualProvisionsRequest =
      MintV1beta1Types._(
        "/cosmos.mint.v1beta1.QueryAnnualProvisionsRequest",
        query: "/cosmos.mint.v1beta1.Query/AnnualProvisions",
        rpc: "/cosmos/mint/v1beta1/annual_provisions",
      );
  static const MintV1beta1Types queryAnnualProvisionsResponse =
      MintV1beta1Types._("/cosmos.mint.v1beta1.QueryAnnualProvisionsResponse");

  static const List<TypeUrl> services = [msgUpdateMintParams];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
