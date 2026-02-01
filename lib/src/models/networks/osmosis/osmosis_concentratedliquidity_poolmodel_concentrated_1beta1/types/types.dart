import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types
    extends TypeUrl {
  static const String root =
      "/osmosis.concentratedliquidity.poolmodel.concentrated.v1beta1";
  const OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types._(
    super.typeUrl,
  );
  static const OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types
  msgCreateConcentratedPool =
      OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types._(
        "/osmosis.concentratedliquidity.poolmodel.concentrated.v1beta1.MsgCreateConcentratedPool",
      );
  static const OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types
  msgCreateConcentratedPoolResponse =
      OsmosisConcentratedliquidityPoolmodelConcentratedV1beta1Types._(
        "/osmosis.concentratedliquidity.poolmodel.concentrated.v1beta1.MsgCreateConcentratedPoolResponse",
      );

  static const List<TypeUrl> services = [msgCreateConcentratedPool];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
