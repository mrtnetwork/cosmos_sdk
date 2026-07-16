import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

/// EpochInfo is a struct that describes the data going into
/// a timer defined by the x/epochs module.
class EpochInfo extends CosmosProtoMessage {
  /// identifier is a unique reference to this particular timer.
  final String? identifier;

  /// start_time is the time at which the timer first ever ticks.
  /// If start_time is in the future, the epoch will not begin until the start
  /// time.
  final google_protobuf_timestamp.Timestamp? startTime;

  /// duration is the time in between epoch ticks.
  /// In order for intended behavior to be met, duration should
  /// be greater than the chains expected block time.
  /// Duration must be non-zero.
  final google_protobuf_duration.Duration? duration;

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
  ///
  /// NOTE! The current_epoch_start_time may diverge significantly from the
  /// wall-clock time the epoch began at. Wall-clock time of epoch start may be
  /// &gt;&gt; current_epoch_start_time. Suppose current_epoch_start_time = 10,
  /// duration = 5. Suppose the chain goes offline at t=14, and comes back online
  /// at t=30, and produces blocks at every successive time. (t=31, 32, etc.)
  /// * The t=30 block will start the epoch for (10, 15]
  /// * The t=31 block will start the epoch for (15, 20]
  /// * The t=32 block will start the epoch for (20, 25]
  /// * The t=33 block will start the epoch for (25, 30]
  /// * The t=34 block will start the epoch for (30, 35]
  /// * The **t=36** block will start the epoch for (35, 40]
  final google_protobuf_timestamp.Timestamp? currentEpochStartTime;

  /// epoch_counting_started is a boolean, that indicates whether this
  /// epoch timer has began yet.
  final bool? epochCountingStarted;

  /// current_epoch_start_height is the block height at which the current epoch
  /// started. (The block height at which the timer last ticked)
  final BigInt? currentEpochStartHeight;

  const EpochInfo({
    this.identifier,
    this.startTime,
    this.duration,
    this.currentEpoch,
    this.currentEpochStartTime,
    this.epochCountingStarted,
    this.currentEpochStartHeight,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.bool(6),
        ProtoFieldConfig.int64(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    identifier,
    startTime,
    duration,
    currentEpoch,
    currentEpochStartTime,
    epochCountingStarted,
    currentEpochStartHeight,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'start_time': startTime?.toRfc3339(),
      'duration': duration?.encodeString(asNanos: true),
      'current_epoch': currentEpoch?.toString(),
      'current_epoch_start_time': currentEpochStartTime?.toRfc3339(),
      'epoch_counting_started': epochCountingStarted,
      'current_epoch_start_height': currentEpochStartHeight?.toString(),
    };
  }

  factory EpochInfo.fromJson(Map<String, dynamic> json) {
    return EpochInfo(
      identifier: json.valueAsString<String?>(
        'identifier',
        acceptCamelCase: true,
      ),
      startTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'start_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      duration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      currentEpoch: json.valueAsBigInt<BigInt?>(
        'current_epoch',
        acceptCamelCase: true,
      ),
      currentEpochStartTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'current_epoch_start_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      epochCountingStarted: json.valueAsBool<bool?>(
        'epoch_counting_started',
        acceptCamelCase: true,
      ),
      currentEpochStartHeight: json.valueAsBigInt<BigInt?>(
        'current_epoch_start_height',
        acceptCamelCase: true,
      ),
    );
  }

  factory EpochInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EpochInfo(
      identifier: decode.getString<String?>(1),
      startTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        2,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      duration: decode.messageTo<google_protobuf_duration.Duration?>(
        3,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      currentEpoch: decode.getBigInt<BigInt?>(4),
      currentEpochStartTime: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            5,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
      epochCountingStarted: decode.getBool<bool?>(6),
      currentEpochStartHeight: decode.getBigInt<BigInt?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisEpochsV1beta1EpochInfo;
}
