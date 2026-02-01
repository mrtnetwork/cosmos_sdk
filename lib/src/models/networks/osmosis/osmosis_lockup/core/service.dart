import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/services/begin_unlocking.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/services/begin_unlocking_all.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/services/extend_lockup.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/services/lock_tokens.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/service/service.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

abstract class OsmosisLockup<T extends CosmosMessage>
    extends OsmosisService<T> {
  const OsmosisLockup();

  static T? fromJson<T extends OsmosisLockup>({
    required String typeUrl,
    required Map<String, dynamic> json,
  }) {
    final type = OsmosisLockupTypes.findService(typeUrl);
    final OsmosisLockup? service =
        switch (type) {
              OsmosisLockupTypes.msgBeginUnlockingAll =>
                OsmosisLockupMsgBeginUnlockingAll.fromJson(json),
              OsmosisLockupTypes.msgBeginUnlocking =>
                OsmosisLockupMsgBeginUnlocking.fromJson(json),
              OsmosisLockupTypes.msgExtendLockup =>
                OsmosisLockupMsgExtendLockup.fromJson(json),
              OsmosisLockupTypes.msgLockTokens =>
                OsmosisLockupMsgLockTokens.fromJson(json),
              _ => null,
            }
            as OsmosisLockup?;

    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid Lockup Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }

  static T? deserialize<T extends OsmosisLockup>({
    required String typeUrl,
    required List<int> bytes,
  }) {
    final type = OsmosisLockupTypes.findService(typeUrl);
    final OsmosisLockup? service =
        switch (type) {
              OsmosisLockupTypes.msgBeginUnlockingAll =>
                OsmosisLockupMsgBeginUnlockingAll.deserialize(bytes),
              OsmosisLockupTypes.msgBeginUnlocking =>
                OsmosisLockupMsgBeginUnlocking.deserialize(bytes),
              OsmosisLockupTypes.msgExtendLockup =>
                OsmosisLockupMsgExtendLockup.deserialize(bytes),
              OsmosisLockupTypes.msgLockTokens =>
                OsmosisLockupMsgLockTokens.deserialize(bytes),
              _ => null,
            }
            as OsmosisLockup?;
    if (service == null) return null;
    if (service is! T) {
      throw DartCosmosSdkPluginException(
        "Invalid Lockup Service.",
        details: {"excepted": "$T", "service": service.runtimeType.toString()},
      );
    }
    return service;
  }
}
