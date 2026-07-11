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
  Map<String, dynamic> toJson() {
    return {
      'seed': seed?.toString(),
      'actor': actor,
      'key_length': keyLength?.toString(),
      'value_length': valueLength?.toString(),
      'iterations': iterations,
      'delete': delete,
      'exists': exists,
    };
  }

  factory Op.fromJson(Map<String, dynamic> json) {
    return Op(
      seed: json.valueAsBigInt<BigInt?>('seed', acceptCamelCase: true),
      actor: json.valueAsString<String?>('actor', acceptCamelCase: true),
      keyLength: json.valueAsBigInt<BigInt?>(
        'key_length',
        acceptCamelCase: true,
      ),
      valueLength: json.valueAsBigInt<BigInt?>(
        'value_length',
        acceptCamelCase: true,
      ),
      iterations: json.valueAsInt<int?>('iterations', acceptCamelCase: true),
      delete: json.valueAsBool<bool?>('delete', acceptCamelCase: true),
      exists: json.valueAsBool<bool?>('exists', acceptCamelCase: true),
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
