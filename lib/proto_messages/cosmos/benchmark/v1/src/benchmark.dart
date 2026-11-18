import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// Op is a message describing a benchmark operation.
class Op extends CosmosProtoMessage {
  final BigInt? seed;

  final String? actor;

  final BigInt? keyLength;

  final BigInt? valueLength;

  final int? iterations;

  final bool? delete;

  final bool? exists;

  const Op({
    this.seed,
    this.actor,
    this.keyLength,
    this.valueLength,
    this.iterations,
    this.delete,
    this.exists,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.uint32(5),
        ProtoFieldConfig.bool(6),
        ProtoFieldConfig.bool(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    seed,
    actor,
    keyLength,
    valueLength,
    iterations,
    delete,
    exists,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'seed': config.encodeBigint(seed),
      'actor': actor,
      'key_length': config.encodeBigint(keyLength),
      'value_length': config.encodeBigint(valueLength),
      'iterations': iterations,
      'delete': delete,
      'exists': exists,
    };
  }

  factory Op.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Op(
      seed: json.valueAsBigInt<BigInt?>(
        'seed',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      actor: json.valueAsString<String?>(
        'actor',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      keyLength: json.valueAsBigInt<BigInt?>(
        'key_length',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      valueLength: json.valueAsBigInt<BigInt?>(
        'value_length',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      iterations: json.valueAsInt<int?>(
        'iterations',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      delete: json.valueAsBool<bool?>(
        'delete',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      exists: json.valueAsBool<bool?>(
        'exists',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Op.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Op(
      seed: decode.getBigInt<BigInt?>(1),
      actor: decode.getString<String?>(2),
      keyLength: decode.getBigInt<BigInt?>(3),
      valueLength: decode.getBigInt<BigInt?>(4),
      iterations: decode.getInt<int?>(5),
      delete: decode.getBool<bool?>(6),
      exists: decode.getBool<bool?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBenchmarkV1Op;
}
