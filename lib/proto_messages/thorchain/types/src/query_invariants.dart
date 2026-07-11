import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryInvariantRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryInvariantResponse> {
  final String? path;

  final String? height;

  const QueryInvariantRequest({this.path, this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/invariant/{path}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [path, height];

  @override
  Map<String, dynamic> toJson() {
    return {'path': path, 'height': height};
  }

  factory QueryInvariantRequest.fromJson(Map<String, dynamic> json) {
    return QueryInvariantRequest(
      path: json.valueAsString<String?>('path', acceptCamelCase: true),
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryInvariantRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInvariantRequest(
      path: decode.getString<String?>(1),
      height: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryInvariantRequest;
  @override
  QueryInvariantResponse onQueryResponse(List<int> bytes) {
    return QueryInvariantResponse.deserialize(bytes);
  }

  @override
  QueryInvariantResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryInvariantResponse.fromJson(json);
  }
}

class QueryInvariantResponse extends CosmosProtoMessage {
  /// The name of the invariant.
  final String? invariant;

  /// Returns true if the invariant is broken.
  final bool? broken;

  /// Informative message about the invariant result.
  final List<String> msg;

  const QueryInvariantResponse({
    this.invariant,
    this.broken,
    this.msg = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bool(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [invariant, broken, msg];

  @override
  Map<String, dynamic> toJson() {
    return {
      'invariant': invariant,
      'broken': broken,
      'msg': msg.map((e) => e).toList(),
    };
  }

  factory QueryInvariantResponse.fromJson(Map<String, dynamic> json) {
    return QueryInvariantResponse(
      invariant: json.valueAsString<String?>(
        'invariant',
        acceptCamelCase: true,
      ),
      broken: json.valueAsBool<bool?>('broken', acceptCamelCase: true),
      msg:
          (json.valueEnsureAsList<dynamic>(
            'msg',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryInvariantResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInvariantResponse(
      invariant: decode.getString<String?>(1),
      broken: decode.getBool<bool?>(2),
      msg: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryInvariantResponse;
}

class QueryInvariantsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryInvariantsResponse> {
  final String? height;

  const QueryInvariantsRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/invariants",
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

  factory QueryInvariantsRequest.fromJson(Map<String, dynamic> json) {
    return QueryInvariantsRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryInvariantsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInvariantsRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryInvariantsRequest;
  @override
  QueryInvariantsResponse onQueryResponse(List<int> bytes) {
    return QueryInvariantsResponse.deserialize(bytes);
  }

  @override
  QueryInvariantsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryInvariantsResponse.fromJson(json);
  }
}

class QueryInvariantsResponse extends CosmosProtoMessage {
  final List<String> invariants;

  const QueryInvariantsResponse({this.invariants = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [invariants];

  @override
  Map<String, dynamic> toJson() {
    return {'invariants': invariants.map((e) => e).toList()};
  }

  factory QueryInvariantsResponse.fromJson(Map<String, dynamic> json) {
    return QueryInvariantsResponse(
      invariants:
          (json.valueEnsureAsList<dynamic>(
            'invariants',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryInvariantsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryInvariantsResponse(
      invariants: decode.getListOrEmpty<String>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryInvariantsResponse;
}
