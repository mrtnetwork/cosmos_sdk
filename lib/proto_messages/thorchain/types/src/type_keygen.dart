import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

enum KeygenType implements ProtoEnumVariant {
  unknownKeygen(0, 'UnknownKeygen'),
  asgardKeygen(1, 'AsgardKeygen'),
  xMRMonovaultKeygen(2, 'XMRMonovaultKeygen');

  const KeygenType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static KeygenType fromValue(int? value) {
    return KeygenType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "KeygenType", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static KeygenType from(Object? value) {
    return KeygenType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "KeygenType", value: value),
    );
  }
}

class Keygen extends CosmosProtoMessage {
  final String? id;

  final KeygenType? type;

  final List<String> members;

  const Keygen({this.id, this.type, this.members = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.enumType(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [id, type, members];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type?.protoName,
      'members': members.map((e) => e).toList(),
    };
  }

  factory Keygen.fromJson(Map<String, dynamic> json) {
    return Keygen(
      id: json.valueAsString<String?>('id', acceptCamelCase: true),
      type: json.valueTo<KeygenType?, Object?>(
        key: 'type',
        parse: (v) => KeygenType.from(v),
      ),
      members:
          (json.valueEnsureAsList<dynamic>(
            'members',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory Keygen.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Keygen(
      id: decode.getString<String?>(1),
      type: decode.getEnum<KeygenType?>(2, KeygenType.values),
      members: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesKeygen;
}

class KeygenBlock extends CosmosProtoMessage {
  final BigInt? height;

  final List<Keygen> keygens;

  const KeygenBlock({this.height, this.keygens = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [height, keygens];

  @override
  Map<String, dynamic> toJson() {
    return {
      'height': height?.toString(),
      'keygens': keygens.map((e) => e.toJson()).toList(),
    };
  }

  factory KeygenBlock.fromJson(Map<String, dynamic> json) {
    return KeygenBlock(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      keygens:
          (json.valueEnsureAsList<dynamic>('keygens', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Keygen, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Keygen.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory KeygenBlock.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return KeygenBlock(
      height: decode.getBigInt<BigInt?>(1),
      keygens:
          decode.getListOfBytes(4).map((b) => Keygen.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesKeygenBlock;
}
