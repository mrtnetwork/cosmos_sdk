import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'lock_query_type.dart';

/// QueryCondition is a struct used for querying locks upon different conditions.
/// Duration field and timestamp fields could be optional, depending on the LockQueryType.
class OsmosisLockupQueryCondition extends CosmosMessage {
  /// LockQueryType is a type of lock query, ByLockDuration | ByLockTime
  final OsmosisLockupLockQueryType? lockQueryType;

  /// Denom represents the token denomination we are looking to lock up
  final String? denom;

  /// Duration is used to query locks with longer duration than the specified
  /// duration. Duration field must not be nil when the lock query type is
  /// `ByLockDuration`.
  final ProtobufDuration duration;

  /// Timestamp is used by locks started before the specified duration.
  /// Timestamp field must not be nil when the lock query type is `ByLockTime`.
  /// Querying locks with timestamp is currently not implemented.s
  final ProtobufTimestamp timestamp;
  OsmosisLockupQueryCondition(
      {this.lockQueryType,
      this.denom,
      required this.duration,
      required this.timestamp});

  factory OsmosisLockupQueryCondition.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupQueryCondition(
        lockQueryType: decode.getResult(1)?.to<OsmosisLockupLockQueryType, int>(
            (e) => OsmosisLockupLockQueryType.fromValue(e)),
        denom: decode.getField(2),
        duration: ProtobufDuration.deserialize(decode.getField(3)),
        timestamp: ProtobufTimestamp.deserialize(decode.getField(4)));
  }

  factory OsmosisLockupQueryCondition.fromRpc(Map<String, dynamic> json) {
    return OsmosisLockupQueryCondition(
        duration: ProtobufDuration.fromString(json["duration"]),
        timestamp: ProtobufTimestamp.fromString(json["timestamp"]),
        denom: json["denom"],
        lockQueryType: json["lock_query_type"] == null
            ? null
            : OsmosisLockupLockQueryType.fromName(json["lock_query_type"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "lock_query_type": lockQueryType?.value,
      "denom": denom,
      "duration": duration.toJson(),
      "timestamp": timestamp.toJson()
    };
  }

  @override
  String get typeUrl => OsmosisLockupTypes.periodLock.typeUrl;

  @override
  List get values => [lockQueryType?.value, denom, duration, timestamp];
}
