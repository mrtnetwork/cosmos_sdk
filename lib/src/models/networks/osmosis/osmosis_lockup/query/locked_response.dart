import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/messages/period_lock.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';

class OsmosisLockupLockedResponse extends CosmosMessage {
  final OsmosisLockupPeriodLock? lock;
  OsmosisLockupLockedResponse({this.lock});
  factory OsmosisLockupLockedResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupLockedResponse(
        lock: decode.getResult(1)?.to<OsmosisLockupPeriodLock, List<int>>(
            (e) => OsmosisLockupPeriodLock.deserialize(e)));
  }
  factory OsmosisLockupLockedResponse.fromJson(Map<String, dynamic> json) {
    return OsmosisLockupLockedResponse(
        lock: json["lock"] == null
            ? null
            : OsmosisLockupPeriodLock.fromJson(json["lock"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"lock": lock?.toJson()};
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.lockedResponse;

  @override
  List get values => [lock];
}
