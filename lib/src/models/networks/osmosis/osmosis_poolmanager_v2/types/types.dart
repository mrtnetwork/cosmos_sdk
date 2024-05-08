import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisPoolManagerV2Types extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc;
  const OsmosisPoolManagerV2Types._(this.typeUrl, {this.rpc});
  static const OsmosisPoolManagerV2Types spotPriceRequest =
      OsmosisPoolManagerV2Types._("/osmosis.poolmanager.v2.SpotPriceRequest");
  static const OsmosisPoolManagerV2Types spotPriceResponse =
      OsmosisPoolManagerV2Types._("/osmosis.poolmanager.v2.SpotPriceResponse");

  /// query
  static const OsmosisPoolManagerV2Types spotPriceV2 =
      OsmosisPoolManagerV2Types._("/osmosis.poolmanager.v2.Query/SpotPriceV2",
          rpc: "/osmosis/poolmanager/v2/pools/:pool_id/prices");
}
