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
  Map<String, dynamic> toJson() {
    return {
      'epoch_identifier': epochIdentifier,
      'epoch_number': epochNumber?.toString(),
      'next_epoch_start_time': nextEpochStartTime?.toString(),
      'duration': duration?.toString(),
    };
  }

  factory EpochTracker.fromJson(Map<String, dynamic> json) {
    return EpochTracker(
      epochIdentifier: json.valueAsString<String?>(
        'epoch_identifier',
        acceptCamelCase: true,
      ),
      epochNumber: json.valueAsBigInt<BigInt?>(
        'epoch_number',
        acceptCamelCase: true,
      ),
      nextEpochStartTime: json.valueAsBigInt<BigInt?>(
        'next_epoch_start_time',
        acceptCamelCase: true,
      ),
      duration: json.valueAsBigInt<BigInt?>('duration', acceptCamelCase: true),
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
