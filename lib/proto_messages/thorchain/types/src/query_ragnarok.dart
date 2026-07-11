import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryRagnarokRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRagnarokResponse> {
  final String? height;

  const QueryRagnarokRequest({this.height});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/thorchain/ragnarok",
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

  factory QueryRagnarokRequest.fromJson(Map<String, dynamic> json) {
    return QueryRagnarokRequest(
      height: json.valueAsString<String?>('height', acceptCamelCase: true),
    );
  }

  factory QueryRagnarokRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRagnarokRequest(height: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryRagnarokRequest;
  @override
  QueryRagnarokResponse onQueryResponse(List<int> bytes) {
    return QueryRagnarokResponse.deserialize(bytes);
  }

  @override
  QueryRagnarokResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRagnarokResponse.fromJson(json);
  }
}

class QueryRagnarokResponse extends CosmosProtoMessage {
  final bool? inProgress;

  const QueryRagnarokResponse({this.inProgress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [inProgress];

  @override
  Map<String, dynamic> toJson() {
    return {'in_progress': inProgress};
  }

  factory QueryRagnarokResponse.fromJson(Map<String, dynamic> json) {
    return QueryRagnarokResponse(
      inProgress: json.valueAsBool<bool?>('in_progress', acceptCamelCase: true),
    );
  }

  factory QueryRagnarokResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRagnarokResponse(inProgress: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesQueryRagnarokResponse;
}
