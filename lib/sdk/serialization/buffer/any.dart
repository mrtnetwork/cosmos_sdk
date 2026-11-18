import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

sealed class Any extends CosmosProtoMessage {
  const Any();
  String? get typeUrl;
  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufAny;

  factory Any.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    final type = json.valueAsString<String>("@type");
    if (json.length == 2 && json.hasValue("value")) {
      final value = json["value"];
      if (value is String) {
        try {
          final binary = config.decodeBinary(value);
          return AnyBinary(typeUrl: type, value: binary);
        } catch (_) {}
      }
    }
    return AnyJson.fromJson(json);
  }

  factory Any.deserialize(List<int> bytes) {
    return AnyBinary.deserialize(bytes);
  }
}

class AnyBinary extends Any {
  @override
  final String? typeUrl;

  /// Must be a valid serialized protocol buffer of the above specified type.
  final List<int>? value;

  const AnyBinary({this.typeUrl, this.value});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [typeUrl, value];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'@type': typeUrl, 'value': config.encodeBinary(value)};
  }

  factory AnyBinary.fromJson(Map<String, dynamic> json) {
    return AnyBinary(
      typeUrl: json.valueAsString<String?>('@type'),
      value: json.valueAsBytes<List<int>?>(
        'value',
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory AnyBinary.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AnyBinary(
      typeUrl: decode.getString<String?>(1),
      value: decode.getBytes<List<int>?>(2),
    );
  }
  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufAny;
}

class AnyJson extends Any {
  @override
  final String typeUrl;
  final Map<String, dynamic> value;

  const AnyJson({required this.typeUrl, required this.value});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    throw BuError(
      DefaultErrorType.unsupported,
      "google.protobuf.Any requires custom ProtoJSON serialization.",
    );
  }

  @override
  List<Object?> get protoValues => [typeUrl, value];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'@type': typeUrl, ...value};
  }

  static Any fromJson(Map<String, dynamic> json) {
    final type = json.valueAsString<String>('@type');
    final j = json.clone().notNullValue;
    j.remove("@type");
    if (j.isEmpty) return AnyBinary(typeUrl: type);
    return AnyJson(typeUrl: type, value: j);
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.googleProtobufAny;
}
