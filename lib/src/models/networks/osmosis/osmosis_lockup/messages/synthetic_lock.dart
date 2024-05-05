import 'package:blockchain_utils/numbers/numbers.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_lockup/types/types.dart';

/// SyntheticLock is creating virtual lockup where new denom is combination of original denom and synthetic suffix.
/// At the time of synthetic lockup creation and deletion, accumulation store is also being updated and on querier side,
/// they can query as freely as native lockup.
class OsmosisLockupSyntheticLock extends CosmosMessage {
  /// Underlying Lock ID is the underlying native lock's id for this synthetic
  /// lockup. A synthetic lock MUST have an underlying lock.
  final BigInt? underlyingLockId;

  /// SynthDenom is the synthetic denom that is a combination of
  /// gamm share + bonding status + validator address.
  final String? synthDenom;

  /// used for unbonding synthetic lockups, for active synthetic lockups, this
  /// value is set to uninitialized value
  final ProtobufTimestamp endTime;

  /// Duration is the duration for a synthetic lock to mature
  /// at the point of unbonding has started.
  final ProtobufDuration duration;

  OsmosisLockupSyntheticLock({
    this.underlyingLockId,
    this.synthDenom,
    required this.endTime,
    required this.duration,
  });

  factory OsmosisLockupSyntheticLock.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OsmosisLockupSyntheticLock(
      underlyingLockId: decode.getField(1),
      synthDenom: decode.getField(2),
      endTime: ProtobufTimestamp.deserialize(decode.getField(3)),
      duration: ProtobufDuration.deserialize(decode.getField(4)),
    );
  }
  factory OsmosisLockupSyntheticLock.fromRpc(Map<String, dynamic> json) {
    return OsmosisLockupSyntheticLock(
        endTime: ProtobufTimestamp.fromString(json["end_time"]),
        duration: ProtobufDuration.fromString(json["duration"]),
        synthDenom: json["synth_denom"],
        underlyingLockId: BigintUtils.tryParse(json["underlying_lock_id"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "underlying_lock_id": underlyingLockId?.toString(),
      "synth_denom": synthDenom,
      "duration": duration.toJson(),
      "end_time": endTime.toJson()
    };
  }

  @override
  String get typeUrl => OsmosisLockupTypes.syntheticLock.typeUrl;

  @override
  List get values => [underlyingLockId, synthDenom, duration, endTime];
}
