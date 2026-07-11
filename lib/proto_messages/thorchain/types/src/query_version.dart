import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryVersionRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVersionResponse> {
  final String? height;

  const QueryVersionRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/version",
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

  factory QueryVersionRequest.fromJson(Map<String, dynamic> json) {
    return QueryVersionRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryVersionRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVersionRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryVersionRequest;
  @override
  QueryVersionResponse onQueryResponse(List<int> bytes) {
    return QueryVersionResponse.deserialize(bytes);
  }

  @override
  QueryVersionResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVersionResponse.fromJson(json);
  }
}

class QueryVersionResponse extends CosmosProtoMessage {
  /// current version
  final String? current;

  /// next version (minimum version for a node to become Active)
  final String? next;

  /// height at which the minimum joining version last changed
  final BigInt? nextSinceHeight;

  /// querier version
  final String? querier;

  const QueryVersionResponse({
    this.current,
    this.next,
    this.nextSinceHeight,
    this.querier,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [current, next, nextSinceHeight, querier];

  @override
  Map<String, dynamic> toJson() {
    return {
      'current': current,
      'next': next,
      'next_since_height': nextSinceHeight?.toString(),
      'querier': querier,
    };
  }

  factory QueryVersionResponse.fromJson(Map<String, dynamic> json) {
    return QueryVersionResponse(
      current: json.valueAsString<String?>('current', acceptCamelCase: true),
      next: json.valueAsString<String?>('next', acceptCamelCase: true),
      nextSinceHeight: json.valueAsBigInt<BigInt?>(
        'next_since_height',
        acceptCamelCase: true,
      ),
      querier: json.valueAsString<String?>('querier', acceptCamelCase: true),
    );
  }

  factory QueryVersionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVersionResponse(
      current: decode.getString<String?>(1),
      next: decode.getString<String?>(2),
      nextSinceHeight: decode.getBigInt<BigInt?>(3),
      querier: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryVersionResponse;
}
