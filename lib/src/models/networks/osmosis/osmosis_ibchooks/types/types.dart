import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class OsmosisIbchooksTypes extends TypeUrl {
  const OsmosisIbchooksTypes._(super.typeUrl);
  static const OsmosisIbchooksTypes params =
      OsmosisIbchooksTypes._("/osmosis.ibchooks.Params");
  static const OsmosisIbchooksTypes genesisState =
      OsmosisIbchooksTypes._("/osmosis.ibchooks.GenesisState");

  static const OsmosisIbchooksTypes msgEmitIBCAck =
      OsmosisIbchooksTypes._("/osmosis.ibchooks.MsgEmitIBCAck");
  static const OsmosisIbchooksTypes msgEmitIBCAckResponse =
      OsmosisIbchooksTypes._("/osmosis.ibchooks.MsgEmitIBCAckResponse");

  /// service
  static const OsmosisIbchooksTypes emitIBCAck =
      OsmosisIbchooksTypes._("/osmosis.ibchooks.Msg/EmitIBCAck");
}
