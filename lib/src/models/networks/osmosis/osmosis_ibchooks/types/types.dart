import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisIbchooksTypes extends TypeUrl {
  const OsmosisIbchooksTypes._(super.typeUrl);
  static const String root = "/osmosis.ibchooks";
  static const OsmosisIbchooksTypes params = OsmosisIbchooksTypes._(
    "/osmosis.ibchooks.Params",
  );
  static const OsmosisIbchooksTypes genesisState = OsmosisIbchooksTypes._(
    "/osmosis.ibchooks.GenesisState",
  );

  static const OsmosisIbchooksTypes msgEmitIBCAck = OsmosisIbchooksTypes._(
    "/osmosis.ibchooks.MsgEmitIBCAck",
  );
  static const OsmosisIbchooksTypes msgEmitIBCAckResponse =
      OsmosisIbchooksTypes._("/osmosis.ibchooks.MsgEmitIBCAckResponse");

  static const List<TypeUrl> services = [msgEmitIBCAck];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
