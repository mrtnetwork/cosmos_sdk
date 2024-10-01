import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/messages/period_lock.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisLockupAccountLockedPastTimeDenomResponse extends CosmosMessage {
  final List<OsmosisLockupPeriodLock> locks;
  OsmosisLockupAccountLockedPastTimeDenomResponse(
      List<OsmosisLockupPeriodLock> locks)
      : locks = locks.immutable;
  factory OsmosisLockupAccountLockedPastTimeDenomResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupAccountLockedPastTimeDenomResponse(decode
        .getFields(1)
        .map((e) => OsmosisLockupPeriodLock.deserialize(e))
        .toList());
  }
  factory OsmosisLockupAccountLockedPastTimeDenomResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisLockupAccountLockedPastTimeDenomResponse(
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
  String get typeUrl =>
      OsmosisLockupTypes.accountLockedPastTimeDenomResponse.typeUrl;

  @override
  List get values => [locks];
}
