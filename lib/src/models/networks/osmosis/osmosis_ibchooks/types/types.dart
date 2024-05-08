import 'package:cosmos_sdk/src/models/core/type_url/type_url.dart';

class OsmosisIbchooksTypes extends TypeUrl {
  @override
  final String typeUrl;
  @override
  final String? rpc = null;
  const OsmosisIbchooksTypes._(this.typeUrl);
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
