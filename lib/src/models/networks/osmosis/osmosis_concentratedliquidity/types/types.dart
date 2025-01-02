import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisConcentratedLiquidityTypes extends TypeUrl {
  const OsmosisConcentratedLiquidityTypes._(super.typeUrl);

  static const OsmosisConcentratedLiquidityTypes params =
      OsmosisConcentratedLiquidityTypes._(
          "/osmosis.concentratedliquidity.Params");
}
