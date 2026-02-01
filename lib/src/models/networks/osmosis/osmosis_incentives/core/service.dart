import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/services/msg_add_to_gauge.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/services/msg_create_gauge.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_incentives/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisIncentives<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisIncentives();

  static T? fromJson<T extends OsmosisIncentives>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = OsmosisIncentivesTypes.findService(typeUrl);
    final OsmosisIncentives? service =
        switch (type) {
              OsmosisIncentivesTypes.msgCreateGauge =>
                OsmosisIncentiveMsgCreateGauge.fromJson(json),
              OsmosisIncentivesTypes.msgAddToGauge =>
                OsmosisIncentiveMsgAddToGauge.fromJson(json),
              _ => null,
            }
            as OsmosisIncentives?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid Incentives Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends OsmosisIncentives>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = OsmosisIncentivesTypes.findService(typeUrl);
    final OsmosisIncentives? service =
        switch (type) {
              OsmosisIncentivesTypes.msgCreateGauge =>
                OsmosisIncentiveMsgCreateGauge.deserialize(bytes),
              OsmosisIncentivesTypes.msgAddToGauge =>
                OsmosisIncentiveMsgAddToGauge.deserialize(bytes),
              _ => null,
            }
            as OsmosisIncentives?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid Incentives Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
