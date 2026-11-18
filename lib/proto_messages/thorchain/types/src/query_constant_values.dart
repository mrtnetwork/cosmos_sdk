import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryConstantValuesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConstantValuesResponse> {
  final String? height;

  const QueryConstantValuesRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/constants",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': height};
  }

  factory QueryConstantValuesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryConstantValuesRequest(
      height: json.valueAsString<String?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryConstantValuesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConstantValuesRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryConstantValuesRequest;
  @override
  QueryConstantValuesResponse onQueryResponse(List<int> bytes) {
    return QueryConstantValuesResponse.deserialize(bytes);
  }

  @override
  QueryConstantValuesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryConstantValuesResponse.fromJson(json);
  }
}

class QueryConstantValuesResponse extends CosmosProtoMessage {
  final List<Int64Constants> int64Values;

  final List<BoolConstants> boolValues;

  final List<StringConstants> stringValues;

  const QueryConstantValuesResponse({
    this.int64Values = const [],
    this.boolValues = const [],
    this.stringValues = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [int64Values, boolValues, stringValues];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'int_64_values': int64Values.map((e) => config.encodeMessage(e)).toList(),
      'bool_values': boolValues.map((e) => config.encodeMessage(e)).toList(),
      'string_values':
          stringValues.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryConstantValuesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryConstantValuesResponse(
      int64Values:
          (json.valueEnsureAsList<dynamic>(
                'int_64_values',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Int64Constants, Object>(
                  value: e,
                  parse:
                      (v) => Int64Constants.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      boolValues:
          (json.valueEnsureAsList<dynamic>(
                'bool_values',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<BoolConstants, Object>(
                  value: e,
                  parse:
                      (v) => BoolConstants.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      stringValues:
          (json.valueEnsureAsList<dynamic>(
                'string_values',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<StringConstants, Object>(
                  value: e,
                  parse:
                      (v) => StringConstants.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryConstantValuesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConstantValuesResponse(
      int64Values:
          decode
              .getListOfBytes(1)
              .map((b) => Int64Constants.deserialize(b))
              .toList(),
      boolValues:
          decode
              .getListOfBytes(2)
              .map((b) => BoolConstants.deserialize(b))
              .toList(),
      stringValues:
          decode
              .getListOfBytes(3)
              .map((b) => StringConstants.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryConstantValuesResponse;
}

class Int64Constants extends CosmosProtoMessage {
  final String? name;

  final BigInt? value;

  const Int64Constants({this.name, this.value});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.int64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [name, value];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'name': name, 'value': config.encodeBigint(value)};
  }

  factory Int64Constants.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Int64Constants(
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      value: json.valueAsBigInt<BigInt?>(
        'value',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Int64Constants.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Int64Constants(
      name: decode.getString<String?>(1),
      value: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesInt64Constants;
}

class BoolConstants extends CosmosProtoMessage {
  final String? name;

  final bool? value;

  const BoolConstants({this.name, this.value});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bool(2)],
    );
  }

  @override
  List<Object?> get protoValues => [name, value];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'name': name, 'value': value};
  }

  factory BoolConstants.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BoolConstants(
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      value: json.valueAsBool<bool?>(
        'value',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BoolConstants.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BoolConstants(
      name: decode.getString<String?>(1),
      value: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesBoolConstants;
}

class StringConstants extends CosmosProtoMessage {
  final String? name;

  final String? value;

  const StringConstants({this.name, this.value});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [name, value];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'name': name, 'value': value};
  }

  factory StringConstants.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return StringConstants(
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      value: json.valueAsString<String?>(
        'value',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory StringConstants.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return StringConstants(
      name: decode.getString<String?>(1),
      value: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesStringConstants;
}
