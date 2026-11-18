import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class EpochTracker extends CosmosProtoMessage {
  final String? epochIdentifier;

  final BigInt? epochNumber;

  final BigInt? nextEpochStartTime;

  final BigInt? duration;

  const EpochTracker({
    this.epochIdentifier,
    this.epochNumber,
    this.nextEpochStartTime,
    this.duration,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    epochIdentifier,
    epochNumber,
    nextEpochStartTime,
    duration,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'epoch_identifier': epochIdentifier,
      'epoch_number': config.encodeBigint(epochNumber),
      'next_epoch_start_time': config.encodeBigint(nextEpochStartTime),
      'duration': config.encodeBigint(duration),
    };
  }

  factory EpochTracker.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return EpochTracker(
      epochIdentifier: json.valueAsString<String?>(
        'epoch_identifier',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      epochNumber: json.valueAsBigInt<BigInt?>(
        'epoch_number',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      nextEpochStartTime: json.valueAsBigInt<BigInt?>(
        'next_epoch_start_time',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      duration: json.valueAsBigInt<BigInt?>(
        'duration',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory EpochTracker.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EpochTracker(
      epochIdentifier: decode.getString<String?>(1),
      epochNumber: decode.getBigInt<BigInt?>(2),
      nextEpochStartTime: decode.getBigInt<BigInt?>(3),
      duration: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcEpochTracker;
}
