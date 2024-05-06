import 'package:blockchain_utils/numbers/numbers.dart';
import 'package:cosmos_sdk/src/models/networks/osmosis/osmosis_epochs_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EpochInfo is a struct that describes the data going into a timer defined by the x/epochs module.
class OmosisEpochsEpochInfo extends CosmosMessage {
  /// identifier is a unique reference to this particular timer.
  final String? identifier;

  /// start_time is the time at which the timer first ever ticks.
  /// If start_time is in the future, the epoch will not begin until the start
  /// time.
  final ProtobufTimestamp startTime;

  /// duration is the time in between epoch ticks.
  /// In order for intended behavior to be met, duration should
  /// be greater than the chains expected block time.
  /// Duration must be non-zero.
  final ProtobufDuration duration;

  /// current_epoch is the current epoch number, or in other words,
  /// how many times has the timer 'ticked'.
  /// The first tick (current_epoch=1) is defined as
  /// the first block whose blocktime is greater than the EpochInfo start_time.
  final BigInt? currentEpoch;

  /// current_epoch_start_time describes the start time of the current timer
  /// interval. The interval is (current_epoch_start_time,
  /// current_epoch_start_time + duration] When the timer ticks, this is set to
  /// current_epoch_start_time = last_epoch_start_time + duration only one timer
  /// tick for a given identifier can occur per block.
  //
  /// NOTE! The current_epoch_start_time may diverge significantly from the
  /// wall-clock time the epoch began at. Wall-clock time of epoch start may be
  /// >> current_epoch_start_time. Suppose current_epoch_start_time = 10,
  /// duration = 5. Suppose the chain goes offline at t=14, and comes back online
  /// at t=30, and produces blocks at every successive time. (t=31, 32, etc.)
  /// * The t=30 block will start the epoch for (10, 15]
  /// * The t=31 block will start the epoch for (15, 20]
  /// * The t=32 block will start the epoch for (20, 25]
  /// * The t=33 block will start the epoch for (25, 30]
  /// * The t=34 block will start the epoch for (30, 35]
  /// * The **t=36** block will start the epoch for (35, 40]
  final ProtobufTimestamp currentEpochStartTime;

  /// epoch_counting_started is a boolean, that indicates whether this
  /// epoch timer has began yet.
  final bool? epochCountingStarted;

  /// current_epoch_start_height is the block height at which the current epoch
  /// started. (The block height at which the timer last ticked)
  final BigInt? currentEpochStartHeight;

  OmosisEpochsEpochInfo(
      {this.identifier,
      required this.startTime,
      required this.duration,
      required this.currentEpoch,
      required this.currentEpochStartTime,
      this.epochCountingStarted,
      this.currentEpochStartHeight});
  factory OmosisEpochsEpochInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return OmosisEpochsEpochInfo(
        identifier: decode.getField(1),
        startTime: ProtobufTimestamp.deserialize(decode.getField(2)),
        duration: ProtobufDuration.deserialize(decode.getField(3)),
        currentEpoch: decode.getField(4),
        currentEpochStartTime:
            ProtobufTimestamp.deserialize(decode.getField(5)),
        epochCountingStarted: decode.getField(6),
        currentEpochStartHeight: decode.getField(8));
  }

  factory OmosisEpochsEpochInfo.fromRpc(Map<String, dynamic> json) {
    return OmosisEpochsEpochInfo(
        identifier: json["identifier"],
        startTime: ProtobufTimestamp.fromString(json["start_time"]),
        duration: ProtobufDuration.deserialize(json["duration"]),
        currentEpoch: BigintUtils.tryParse(json["current_epoch"]),
        currentEpochStartTime:
            ProtobufTimestamp.fromString(json["current_epoch_start_time"]),
        epochCountingStarted: json["epoch_counting_started"],
        currentEpochStartHeight:
            BigintUtils.tryParse(json["current_epoch_start_height"]));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "identifier": identifier,
      "start_time": startTime.toJson(),
      "duration": duration.toJson(),
      "current_epoch": currentEpoch?.toString(),
      "current_epoch_start_time": currentEpochStartTime.toJson(),
      "epoch_counting_started": epochCountingStarted,
      "current_epoch_start_height": currentEpochStartHeight?.toString()
    };
  }

  @override
  List get values => [
        identifier,
        startTime,
        duration,
        currentEpoch,
        currentEpochStartTime,
        epochCountingStarted,
        currentEpochStartHeight
      ];

  @override
  @override
  String get typeUrl => OsmosisEpochsV1beta1Types.epochInfo.typeUrl;
}
