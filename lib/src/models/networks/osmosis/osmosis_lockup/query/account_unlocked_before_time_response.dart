import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/messages/period_lock.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisLockupAccountUnlockedBeforeTimeResponse extends CosmosMessage {
  final List<OsmosisLockupPeriodLock> locks;
  OsmosisLockupAccountUnlockedBeforeTimeResponse(
      List<OsmosisLockupPeriodLock> locks)
      : locks = locks.immutable;
  factory OsmosisLockupAccountUnlockedBeforeTimeResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountUnlockedBeforeTimeResponse(decode
        .getFields<List<int>>(1)
        .map((e) => OsmosisLockupPeriodLock.deserialize(e))
        .toList());
  }
  factory OsmosisLockupAccountUnlockedBeforeTimeResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountUnlockedBeforeTimeResponse(
        (json["locks"] as List?)
                ?.map((e) => OsmosisLockupPeriodLock.deserialize(e))
                .toList() ??
            <OsmosisLockupPeriodLock>[]);
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"locks": locks.map((e) => e.toJson()).toList()};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.accountUnlockedBeforeTimeResponse;

  @override
  List get values => [locks];
}
