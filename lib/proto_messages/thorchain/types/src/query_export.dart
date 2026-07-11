import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryExportRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryExportResponse> {
  final String? height;

  const QueryExportRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/export",
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

  factory QueryExportRequest.fromJson(Map<String, dynamic> json) {
    return QueryExportRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryExportRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryExportRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryExportRequest;
  @override
  QueryExportResponse onQueryResponse(List<int> bytes) {
    return QueryExportResponse.deserialize(bytes);
  }

  @override
  QueryExportResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryExportResponse.fromJson(json);
  }
}

class QueryExportResponse extends CosmosProtoMessage {
  final List<int>? content;

  const QueryExportResponse({this.content});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [content];

  @override
  Map<String, dynamic> toJson() {
    return {
      'content': switch (content) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryExportResponse.fromJson(Map<String, dynamic> json) {
    return QueryExportResponse(
      content: json.valueAsBytes<List<int>?>(
        'content',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory QueryExportResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryExportResponse(content: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryExportResponse;
}
