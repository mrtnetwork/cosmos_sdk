import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'period_lock.dart';
import 'synthetic_lock.dart';

class OsmosisLockupGenesisState extends CosmosMessage {
  final BigInt? lastLockId;
  final List<OsmosisLockupPeriodLock> locks;
  final List<OsmosisLockupSyntheticLock> syntheticLocks;

  OsmosisLockupGenesisState({
    this.lastLockId,
    required List<OsmosisLockupPeriodLock> locks,
    required List<OsmosisLockupSyntheticLock> syntheticLocks,
  })  : locks = locks.immutable,
        syntheticLocks = syntheticLocks.immutable;

  factory OsmosisLockupGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupGenesisState(
      lastLockId: decode.getField(1),
      locks: decode
          .getFields<List<int>>(2)
          .map((e) => OsmosisLockupPeriodLock.deserialize(e))
          .toList(),
      syntheticLocks: decode
          .getFields<List<int>>(3)
          .map((e) => OsmosisLockupSyntheticLock.deserialize(e))
          .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "last_lock_id": lastLockId?.toString(),
      "locks": locks.map((e) => e.toJson()).toList(),
      "synthetic_locks": syntheticLocks.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.syntheticLock;

  @override
  List get values => [lastLockId, locks, syntheticLocks];
}
