import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisPoolManagerV2Types extends TypeUrl {
  const OsmosisPoolManagerV2Types._(super.typeUrl, {super.query, super.rpc});
  static const OsmosisPoolManagerV2Types spotPriceRequest =
      OsmosisPoolManagerV2Types._("/osmosis.poolmanager.v2.SpotPriceRequest",
          query: "/osmosis.poolmanager.v2.Query/SpotPriceV2",
          rpc: "/osmosis/poolmanager/v2/pools/:pool_id/prices");
  static const OsmosisPoolManagerV2Types spotPriceResponse =
      OsmosisPoolManagerV2Types._("/osmosis.poolmanager.v2.SpotPriceResponse");
}
