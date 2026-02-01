import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/messages/period_lock.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyResponse
    extends CosmosMessage {
  final List<OsmosisLockupPeriodLock> locks;
  OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyResponse(
    List<OsmosisLockupPeriodLock> locks,
  ) : locks = locks.immutable;
  factory OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyResponse.deserialize(
    List<int> bytes,
  ) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyResponse(
      decode
          .getFields<List<int>>(1)
          .map((e) => OsmosisLockupPeriodLock.deserialize(e))
          .toList(),
    );
  }
  factory OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return OsmosisLockupAccountLockedPastTimeNotUnlockingOnlyResponse(
      (json["locks"] as List?)
              ?.map((e) => OsmosisLockupPeriodLock.deserialize(e))
              .toList() ??
          <OsmosisLockupPeriodLock>[],
    );
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"locks": locks.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl =>
      OsmosisLockupTypes.accountLockedPastTimeNotUnlockingOnlyResponse;

  @override
  List get values => [locks];
}
