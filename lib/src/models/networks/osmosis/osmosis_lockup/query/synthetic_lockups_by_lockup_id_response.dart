import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/messages/synthetic_lock.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:blockchain_utils/helper/helper.dart';

class OsmosisLockupSyntheticLockupsByLockupIDResponse extends CosmosMessage {
  final List<OsmosisLockupSyntheticLock> syntheticLocks;

  OsmosisLockupSyntheticLockupsByLockupIDResponse(
      List<OsmosisLockupSyntheticLock> syntheticLocks)
      : syntheticLocks = syntheticLocks.immutable;

  factory OsmosisLockupSyntheticLockupsByLockupIDResponse.deserialize(
      List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupSyntheticLockupsByLockupIDResponse(decode
        .getFields<List<int>>(1)
        .map((e) => OsmosisLockupSyntheticLock.deserialize(e))
        .toList());
  }

  factory OsmosisLockupSyntheticLockupsByLockupIDResponse.fromJson(
      Map<String, dynamic> json) {
    return OsmosisLockupSyntheticLockupsByLockupIDResponse(
        (json["synthetic_locks"] as List?)
                ?.map((e) => OsmosisLockupSyntheticLock.deserialize(e))
                .toList() ??
            <OsmosisLockupSyntheticLock>[]);
  }

  @override
  List<int> get fieldIds => [1];
  @override
  Map<String, dynamic> toJson() {
    return {
      "synthetic_locks": syntheticLocks.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => OsmosisLockupTypes.syntheticLockupsByLockupIDResponse;

  @override
  List get values => [syntheticLocks];
}
