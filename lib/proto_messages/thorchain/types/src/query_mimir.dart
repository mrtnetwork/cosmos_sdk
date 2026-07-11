import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/type_mimir.dart"
    as types_type_mimir;

class QueryMimirValuesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMimirValuesResponse> {
  final String? height;

  const QueryMimirValuesRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/mimir",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryMimirValuesRequest.fromJson(Map<String, dynamic> json) {
    return QueryMimirValuesRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryMimirValuesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMimirValuesRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryMimirValuesRequest;
  @override
  QueryMimirValuesResponse onQueryResponse(List<int> bytes) {
    return QueryMimirValuesResponse.deserialize(bytes);
  }

  @override
  QueryMimirValuesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMimirValuesResponse.fromJson(json);
  }
}

class QueryMimirValuesResponse extends CosmosProtoMessage {
  final List<Mimir> mimirs;

  const QueryMimirValuesResponse({this.mimirs = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [mimirs];

  @override
  Map<String, dynamic> toJson() {
    return {'mimirs': mimirs.map((e) => e.toJson()).toList()};
  }

  factory QueryMimirValuesResponse.fromJson(Map<String, dynamic> json) {
    return QueryMimirValuesResponse(
      mimirs:
          (json.valueEnsureAsList<dynamic>('mimirs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Mimir, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Mimir.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryMimirValuesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMimirValuesResponse(
      mimirs:
          decode.getListOfBytes(1).map((b) => Mimir.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryMimirValuesResponse;
}

class QueryMimirWithKeyRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMimirWithKeyResponse> {
  final String? key;

  final String? height;

  const QueryMimirWithKeyRequest({this.key, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/mimir/key/{key}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [key, height];

  @override
  Map<String, dynamic> toJson() {
    return {'key': key, 'height': height};
  }

  factory QueryMimirWithKeyRequest.fromJson(Map<String, dynamic> json) {
    return QueryMimirWithKeyRequest(
      key: json.valueAsString<String?>('key', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryMimirWithKeyRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMimirWithKeyRequest(
      key: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryMimirWithKeyRequest;
  @override
  QueryMimirWithKeyResponse onQueryResponse(List<int> bytes) {
    return QueryMimirWithKeyResponse.deserialize(bytes);
  }

  @override
  QueryMimirWithKeyResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMimirWithKeyResponse.fromJson(json);
  }
}

class QueryMimirWithKeyResponse extends CosmosProtoMessage {
  final BigInt? value;

  const QueryMimirWithKeyResponse({this.value});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [value];

  @override
  Map<String, dynamic> toJson() {
    return {'value': value?.toString()};
  }

  factory QueryMimirWithKeyResponse.fromJson(Map<String, dynamic> json) {
    return QueryMimirWithKeyResponse(
      value: json.valueAsBigInt<BigInt?>('value', acceptCamelCase: true),
    );
  }

  factory QueryMimirWithKeyResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMimirWithKeyResponse(value: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryMimirWithKeyResponse;
}

class QueryMimirAdminValuesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMimirAdminValuesResponse> {
  final String? height;

  const QueryMimirAdminValuesRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/mimir/admin",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryMimirAdminValuesRequest.fromJson(Map<String, dynamic> json) {
    return QueryMimirAdminValuesRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryMimirAdminValuesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMimirAdminValuesRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryMimirAdminValuesRequest;
  @override
  QueryMimirAdminValuesResponse onQueryResponse(List<int> bytes) {
    return QueryMimirAdminValuesResponse.deserialize(bytes);
  }

  @override
  QueryMimirAdminValuesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMimirAdminValuesResponse.fromJson(json);
  }
}

class QueryMimirAdminValuesResponse extends CosmosProtoMessage {
  final List<Mimir> adminMimirs;

  const QueryMimirAdminValuesResponse({this.adminMimirs = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [adminMimirs];

  @override
  Map<String, dynamic> toJson() {
    return {'admin_mimirs': adminMimirs.map((e) => e.toJson()).toList()};
  }

  factory QueryMimirAdminValuesResponse.fromJson(Map<String, dynamic> json) {
    return QueryMimirAdminValuesResponse(
      adminMimirs:
          (json.valueEnsureAsList<dynamic>(
                'admin_mimirs',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<Mimir, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Mimir.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryMimirAdminValuesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMimirAdminValuesResponse(
      adminMimirs:
          decode.getListOfBytes(1).map((b) => Mimir.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryMimirAdminValuesResponse;
}

class QueryMimirNodesAllValuesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMimirNodesAllValuesResponse> {
  final String? height;

  const QueryMimirNodesAllValuesRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/mimir/nodes_all",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryMimirNodesAllValuesRequest.fromJson(Map<String, dynamic> json) {
    return QueryMimirNodesAllValuesRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryMimirNodesAllValuesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMimirNodesAllValuesRequest(
      height: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryMimirNodesAllValuesRequest;
  @override
  QueryMimirNodesAllValuesResponse onQueryResponse(List<int> bytes) {
    return QueryMimirNodesAllValuesResponse.deserialize(bytes);
  }

  @override
  QueryMimirNodesAllValuesResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryMimirNodesAllValuesResponse.fromJson(json);
  }
}

class QueryMimirNodesAllValuesResponse extends CosmosProtoMessage {
  final List<types_type_mimir.NodeMimir> mimirs;

  const QueryMimirNodesAllValuesResponse({this.mimirs = const []});

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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [mimirs];

  @override
  Map<String, dynamic> toJson() {
    return {'mimirs': mimirs.map((e) => e.toJson()).toList()};
  }

  factory QueryMimirNodesAllValuesResponse.fromJson(Map<String, dynamic> json) {
    return QueryMimirNodesAllValuesResponse(
      mimirs:
          (json.valueEnsureAsList<dynamic>('mimirs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  types_type_mimir.NodeMimir,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => types_type_mimir.NodeMimir.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryMimirNodesAllValuesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMimirNodesAllValuesResponse(
      mimirs:
          decode
              .getListOfBytes(1)
              .map((b) => types_type_mimir.NodeMimir.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryMimirNodesAllValuesResponse;
}

class QueryMimirNodesValuesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMimirNodesValuesResponse> {
  final String? height;

  const QueryMimirNodesValuesRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/mimir/nodes",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [height];

  @override
  Map<String, dynamic> toJson() {
    return {'height': height};
  }

  factory QueryMimirNodesValuesRequest.fromJson(Map<String, dynamic> json) {
    return QueryMimirNodesValuesRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryMimirNodesValuesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMimirNodesValuesRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryMimirNodesValuesRequest;
  @override
  QueryMimirNodesValuesResponse onQueryResponse(List<int> bytes) {
    return QueryMimirNodesValuesResponse.deserialize(bytes);
  }

  @override
  QueryMimirNodesValuesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMimirNodesValuesResponse.fromJson(json);
  }
}

class QueryMimirNodesValuesResponse extends CosmosProtoMessage {
  final List<Mimir> mimirs;

  const QueryMimirNodesValuesResponse({this.mimirs = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [mimirs];

  @override
  Map<String, dynamic> toJson() {
    return {'mimirs': mimirs.map((e) => e.toJson()).toList()};
  }

  factory QueryMimirNodesValuesResponse.fromJson(Map<String, dynamic> json) {
    return QueryMimirNodesValuesResponse(
      mimirs:
          (json.valueEnsureAsList<dynamic>('mimirs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<Mimir, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Mimir.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryMimirNodesValuesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMimirNodesValuesResponse(
      mimirs:
          decode.getListOfBytes(1).map((b) => Mimir.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryMimirNodesValuesResponse;
}

class QueryMimirNodeValuesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMimirNodeValuesResponse> {
  final String? address;

  final String? height;

  const QueryMimirNodeValuesRequest({this.address, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/mimir/node/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, height];

  @override
  Map<String, dynamic> toJson() {
    return {'address': address, 'height': height};
  }

  factory QueryMimirNodeValuesRequest.fromJson(Map<String, dynamic> json) {
    return QueryMimirNodeValuesRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryMimirNodeValuesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMimirNodeValuesRequest(
      address: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryMimirNodeValuesRequest;
  @override
  QueryMimirNodeValuesResponse onQueryResponse(List<int> bytes) {
    return QueryMimirNodeValuesResponse.deserialize(bytes);
  }

  @override
  QueryMimirNodeValuesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMimirNodeValuesResponse.fromJson(json);
  }
}

class QueryMimirNodeValuesResponse extends CosmosProtoMessage {
  final List<Mimir> nodeMimirs;

  const QueryMimirNodeValuesResponse({this.nodeMimirs = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [nodeMimirs];

  @override
  Map<String, dynamic> toJson() {
    return {'node_mimirs': nodeMimirs.map((e) => e.toJson()).toList()};
  }

  factory QueryMimirNodeValuesResponse.fromJson(Map<String, dynamic> json) {
    return QueryMimirNodeValuesResponse(
      nodeMimirs:
          (json.valueEnsureAsList<dynamic>(
                'node_mimirs',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<Mimir, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => Mimir.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory QueryMimirNodeValuesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMimirNodeValuesResponse(
      nodeMimirs:
          decode.getListOfBytes(1).map((b) => Mimir.deserialize(b)).toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryMimirNodeValuesResponse;
}

class Mimir extends CosmosProtoMessage {
  final String? key;

  final BigInt? value;

  const Mimir({this.key, this.value});

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
  List<Object?> get protoValues => [key, value];

  @override
  Map<String, dynamic> toJson() {
    return {'key': key, 'value': value?.toString()};
  }

  factory Mimir.fromJson(Map<String, dynamic> json) {
    return Mimir(
      key: json.valueAsString<String?>('key', acceptCamelCase: true),
      value: json.valueAsBigInt<BigInt?>('value', acceptCamelCase: true),
    );
  }

  factory Mimir.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Mimir(
      key: decode.getString<String?>(1),
      value: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMimir;
}
