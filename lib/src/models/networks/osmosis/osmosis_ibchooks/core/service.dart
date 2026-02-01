import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_ibchooks/services/msg_emit_ibc_ack.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_ibchooks/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisIbchooks<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisIbchooks();

  static T? fromJson<T extends OsmosisIbchooks>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = OsmosisIbchooksTypes.findService(typeUrl);
    final OsmosisIbchooks? service =
        switch (type) {
              OsmosisIbchooksTypes.msgEmitIBCAck =>
                OsmosisIbchooksMsgEmitIBCAck.fromJson(json),
              _ => null,
            }
            as OsmosisIbchooks?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid Ibchooks Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends OsmosisIbchooks>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = OsmosisIbchooksTypes.findService(typeUrl);
    final OsmosisIbchooks? service =
        switch (type) {
              OsmosisIbchooksTypes.msgEmitIBCAck =>
                OsmosisIbchooksMsgEmitIBCAck.deserialize(bytes),
              _ => null,
            }
            as OsmosisIbchooks?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid Ibchooks Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
