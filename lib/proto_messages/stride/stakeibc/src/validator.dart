import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class Validator extends CosmosProtoMessage {
  final String? name;

  final String? address;

  final BigInt? weight;

  final String? delegation;

  final String? slashQueryProgressTracker;

  final String? slashQueryCheckpoint;

  final String? sharesToTokensRate;

  final BigInt? delegationChangesInProgress;

  final bool? slashQueryInProgress;

  const Validator({
    this.name,
    this.address,
    this.weight,
    this.delegation,
    this.slashQueryProgressTracker,
    this.slashQueryCheckpoint,
    this.sharesToTokensRate,
    this.delegationChangesInProgress,
    this.slashQueryInProgress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.uint64(6),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.string(12, options: const []),
        ProtoFieldConfig.string(10, options: const []),
        ProtoFieldConfig.int64(11),
        ProtoFieldConfig.bool(13),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    address,
    weight,
    delegation,
    slashQueryProgressTracker,
    slashQueryCheckpoint,
    sharesToTokensRate,
    delegationChangesInProgress,
    slashQueryInProgress,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'weight': weight?.toString(),
      'delegation': delegation,
      'slash_query_progress_tracker': slashQueryProgressTracker,
      'slash_query_checkpoint': slashQueryCheckpoint,
      'shares_to_tokens_rate': sharesToTokensRate,
      'delegation_changes_in_progress': delegationChangesInProgress?.toString(),
      'slash_query_in_progress': slashQueryInProgress,
    };
  }

  factory Validator.fromJson(Map<String, dynamic> json) {
    return Validator(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      weight: json.valueAsBigInt<BigInt?>('weight', acceptCamelCase: true),
      delegation: json.valueAsString<String?>(
        'delegation',
        acceptCamelCase: true,
      ),
      slashQueryProgressTracker: json.valueAsString<String?>(
        'slash_query_progress_tracker',
        acceptCamelCase: true,
      ),
      slashQueryCheckpoint: json.valueAsString<String?>(
        'slash_query_checkpoint',
        acceptCamelCase: true,
      ),
      sharesToTokensRate: json.valueAsString<String?>(
        'shares_to_tokens_rate',
        acceptCamelCase: true,
      ),
      delegationChangesInProgress: json.valueAsBigInt<BigInt?>(
        'delegation_changes_in_progress',
        acceptCamelCase: true,
      ),
      slashQueryInProgress: json.valueAsBool<bool?>(
        'slash_query_in_progress',
        acceptCamelCase: true,
      ),
    );
  }

  factory Validator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Validator(
      name: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
      weight: decode.getBigInt<BigInt?>(6),
      delegation: decode.getString<String?>(5),
      slashQueryProgressTracker: decode.getString<String?>(9),
      slashQueryCheckpoint: decode.getString<String?>(12),
      sharesToTokensRate: decode.getString<String?>(10),
      delegationChangesInProgress: decode.getBigInt<BigInt?>(11),
      slashQueryInProgress: decode.getBool<bool?>(13),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.strideStakeibcValidator;
}
