import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

class EpochInfo extends CosmosProtoMessage {
  final String? identifier;

  final google_protobuf_timestamp.Timestamp? startTime;

  final google_protobuf_duration.Duration? duration;

  final BigInt? currentEpoch;

  final google_protobuf_timestamp.Timestamp? currentEpochStartTime;

  final bool? epochCountingStarted;

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
        ProtoFieldConfig.int64(7),
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
      currentEpochStartHeight: decode.getBigInt<BigInt?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideEpochsEpochInfo;
}
