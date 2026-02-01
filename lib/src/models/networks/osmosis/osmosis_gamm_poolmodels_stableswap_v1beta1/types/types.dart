import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisGammPoolmodelsStableSwapV1beta1Types extends TypeUrl {
  const OsmosisGammPoolmodelsStableSwapV1beta1Types._(super.typeUrl);
  static const String root = "/osmosis.gamm.poolmodels.stableswap.v1beta1";
  static const OsmosisGammPoolmodelsStableSwapV1beta1Types poolParams =
      OsmosisGammPoolmodelsStableSwapV1beta1Types._(
        "/osmosis.gamm.poolmodels.stableswap.v1beta1.PoolParams",
      );
  static const OsmosisGammPoolmodelsStableSwapV1beta1Types pool =
      OsmosisGammPoolmodelsStableSwapV1beta1Types._(
        "/osmosis.gamm.poolmodels.stableswap.v1beta1.Pool",
      );

  static const OsmosisGammPoolmodelsStableSwapV1beta1Types
  msgCreateStableswapPoolResponse = OsmosisGammPoolmodelsStableSwapV1beta1Types._(
    "/osmosis.gamm.poolmodels.stableswap.v1beta1.MsgCreateStableswapPoolResponse",
  );
  static const OsmosisGammPoolmodelsStableSwapV1beta1Types
  msgCreateStableswapPool = OsmosisGammPoolmodelsStableSwapV1beta1Types._(
    "/osmosis.gamm.poolmodels.stableswap.v1beta1.MsgCreateStableswapPool",
  );

  static const OsmosisGammPoolmodelsStableSwapV1beta1Types
  msgStableSwapAdjustScalingFactors = OsmosisGammPoolmodelsStableSwapV1beta1Types._(
    "/osmosis.gamm.poolmodels.stableswap.v1beta1.MsgStableSwapAdjustScalingFactors",
  );
  static const OsmosisGammPoolmodelsStableSwapV1beta1Types
  msgStableSwapAdjustScalingFactorsResponse =
      OsmosisGammPoolmodelsStableSwapV1beta1Types._(
        "/osmosis.gamm.poolmodels.stableswap.v1beta1.MsgStableSwapAdjustScalingFactorsResponse",
      );

  static const List<TypeUrl> services = [
    msgCreateStableswapPool,
    msgStableSwapAdjustScalingFactors,
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
