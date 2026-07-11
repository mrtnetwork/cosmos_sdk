import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

/// Copyright Tharsis Labs Ltd.(Evmos)
/// SPDX-License-Identifier:ENCL-1.0(https://github.com/evmos/evmos/blob/main/LICENSE)
/// EpochInfo defines the message interface containing the relevant informations about
/// an epoch.
class EpochInfo extends CosmosProtoMessage {
  /// identifier of the epoch
  final String? identifier;

  /// start_time of the epoch
  final google_protobuf_timestamp.Timestamp? startTime;

  /// duration of the epoch
  final google_protobuf_duration.Duration? duration;

  /// current_epoch is the integer identifier of the epoch
  final BigInt? currentEpoch;

  /// current_epoch_start_time defines the timestamp of the start of the epoch
  final google_protobuf_timestamp.Timestamp? currentEpochStartTime;

  /// epoch_counting_started reflects if the counting for the epoch has started
  final bool? epochCountingStarted;

  /// current_epoch_start_height of the epoch
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
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.message(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
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
      DefaultCosmosProtoTypeUrl.evmosEpochsV1EpochInfo;
}
