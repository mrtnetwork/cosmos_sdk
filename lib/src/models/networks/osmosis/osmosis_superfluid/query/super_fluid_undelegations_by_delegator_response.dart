import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/messages/synthetic_lock.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/messages/super_fluid_delegation_record.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_superfluid/types/types.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse
    extends CosmosMessage {
  final List<OsmosisSuperfluidSuperfluidDelegationRecord>
      superfluidDelegationRecords;
  final List<Coin> totalUnDelegatedCoins;
  final List<OsmosisLockupSyntheticLock> syntheticLocks;
  OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse(
      {required List<OsmosisSuperfluidSuperfluidDelegationRecord>
          superfluidDelegationRecords,
      required List<Coin> totalUnDelegatedCoins,
      required List<OsmosisLockupSyntheticLock> syntheticLocks})
      : superfluidDelegationRecords = superfluidDelegationRecords.immutable,
        totalUnDelegatedCoins = totalUnDelegatedCoins.immutable,
        syntheticLocks = syntheticLocks.immutable;
  factory OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse(
      superfluidDelegationRecords: decode
          .getFields(1)
          .map(
              (e) => OsmosisSuperfluidSuperfluidDelegationRecord.deserialize(e))
          .toList(),
      totalUnDelegatedCoins:
          decode.getFields(2).map((e) => Coin.deserialize(e)).toList(),
      syntheticLocks: decode
          .getFields(3)
          .map((e) => OsmosisLockupSyntheticLock.deserialize(e))
          .toList(),
    );
  }
  factory OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse.fromRpc(
      Map<String, dynamic> json) {
    return OsmosisSuperfluidSuperfluidUndelegationsByDelegatorResponse(
        superfluidDelegationRecords:
            (json["superfluid_delegation_records"] as List?)
                    ?.map((e) =>
                        OsmosisSuperfluidSuperfluidDelegationRecord.fromRpc(e))
                    .toList() ??
                <OsmosisSuperfluidSuperfluidDelegationRecord>[],
        totalUnDelegatedCoins: (json["total_undelegated_coins"] as List?)
                ?.map((e) => Coin.fromRpc(e))
                .toList() ??
            <Coin>[],
        syntheticLocks: (json["synthetic_locks"] as List?)
                ?.map((e) => OsmosisLockupSyntheticLock.fromRpc(e))
                .toList() ??
            <OsmosisLockupSyntheticLock>[]);
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "superfluid_delegation_records":
          superfluidDelegationRecords.map((e) => e.toJson()).toList(),
      "total_undelegated_coins":
          totalUnDelegatedCoins.map((e) => e.toJson()).toList(),
      "synthetic_locks": syntheticLocks.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl =>
      OsmosisSuperfluidTypes.superfluidUndelegationsByDelegatorResponse.typeUrl;

  @override
  List get values =>
      [superfluidDelegationRecords, totalUnDelegatedCoins, syntheticLocks];
}
