import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/messages/period_lock.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class OsmosisLockupMsgBeginUnlockingAllResponse extends CosmosMessage {
  final List<OsmosisLockupPeriodLock>? unlocks;
  OsmosisLockupMsgBeginUnlockingAllResponse(
      {List<OsmosisLockupPeriodLock>? unlocks})
      : unlocks = unlocks?.emptyAsNull?.immutable;
  factory OsmosisLockupMsgBeginUnlockingAllResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupMsgBeginUnlockingAllResponse(
        unlocks: decode
            .getFields<List<int>>(1)
            .map((e) => OsmosisLockupPeriodLock.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1];

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.msgBeginUnlockingAllResponse;

  @override
  List get values => [unlocks];

  @override
  Map<String, dynamic> toJson() {
    return {"unlocks": unlocks?.map((e) => e.toJson()).toList()};
  }
}
