import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisConcentratedLiquidityTypes extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc = null;
  const OsmosisConcentratedLiquidityTypes._(this.typeUrl);

  static const OsmosisConcentratedLiquidityTypes params =
      OsmosisConcentratedLiquidityTypes._(
          "/osmosis.concentratedliquidity.Params");
}
