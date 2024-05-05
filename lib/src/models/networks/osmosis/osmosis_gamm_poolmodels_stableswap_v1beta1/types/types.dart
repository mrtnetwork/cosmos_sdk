import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisGammPoolmodelsStableswaPV1beta1Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc = null;
  const OsmosisGammPoolmodelsStableswaPV1beta1Types._(this.typeUrl);
  static const OsmosisGammPoolmodelsStableswaPV1beta1Types poolParams =
      OsmosisGammPoolmodelsStableswaPV1beta1Types._(
          "/osmosis.gamm.poolmodels.stableswap.v1beta1.PoolParams");
  static const OsmosisGammPoolmodelsStableswaPV1beta1Types pool =
      OsmosisGammPoolmodelsStableswaPV1beta1Types._(
          "/osmosis.gamm.poolmodels.stableswap.v1beta1.Pool");

  static const OsmosisGammPoolmodelsStableswaPV1beta1Types
      createStableswapPool = OsmosisGammPoolmodelsStableswaPV1beta1Types._(
          "/osmosis.gamm.poolmodels.stableswap.v1beta1.Msg/CreateStableswapPool");

  static const OsmosisGammPoolmodelsStableswaPV1beta1Types
      msgCreateStableswapPoolResponse =
      OsmosisGammPoolmodelsStableswaPV1beta1Types._(
          "/osmosis.gamm.poolmodels.stableswap.v1beta1.MsgCreateStableswapPoolResponse");
  static const OsmosisGammPoolmodelsStableswaPV1beta1Types
      msgCreateStableswapPool = OsmosisGammPoolmodelsStableswaPV1beta1Types._(
          "/osmosis.gamm.poolmodels.stableswap.v1beta1.MsgCreateStableswapPool");

  static const OsmosisGammPoolmodelsStableswaPV1beta1Types
      stableSwapAdjustScalingFactors =
      OsmosisGammPoolmodelsStableswaPV1beta1Types._(
          "/osmosis.gamm.poolmodels.stableswap.v1beta1.Msg/StableSwapAdjustScalingFactors");

  static const OsmosisGammPoolmodelsStableswaPV1beta1Types
      msgStableSwapAdjustScalingFactors =
      OsmosisGammPoolmodelsStableswaPV1beta1Types._(
          "/osmosis.gamm.poolmodels.stableswap.v1beta1.MsgStableSwapAdjustScalingFactors");
  static const OsmosisGammPoolmodelsStableswaPV1beta1Types
      msgStableSwapAdjustScalingFactorsResponse =
      OsmosisGammPoolmodelsStableswaPV1beta1Types._(
          "/osmosis.gamm.poolmodels.stableswap.v1beta1.MsgStableSwapAdjustScalingFactorsResponse");
}
