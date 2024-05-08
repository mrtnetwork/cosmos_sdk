import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types
    extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc = null;
  const OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types._(
      this.typeUrl);
  static const OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types
      msgCreateConcentratedPool =
      OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types._(
          "/osmosis.concentratedliquidity.poolmodel.concentrated.v1beta1.MsgCreateConcentratedPool");
  static const OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types
      msgCreateConcentratedPoolResponse =
      OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types._(
          "/osmosis.concentratedliquidity.poolmodel.concentrated.v1beta1.MsgCreateConcentratedPoolResponse");

  /// service
  static const OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types
      createConcentratedPool =
      OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types._(
          "/osmosis.concentratedliquidity.poolmodel.concentrated.v1beta1.Msg/CreateConcentratedPool");
}
