import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class QueryDenomAdminRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomAdminResponse> {
  final String? denom;

  const QueryDenomAdminRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/denoms/{denom}/admin",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson() {
    return {'denom': denom};
  }

  factory QueryDenomAdminRequest.fromJson(Map<String, dynamic> json) {
    return QueryDenomAdminRequest(
      denom: json.valueAsString<String?>('denom', acceptCamelCase: true),
    );
  }

  factory QueryDenomAdminRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomAdminRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainDenomV1QueryDenomAdminRequest;
  @override
  QueryDenomAdminResponse onQueryResponse(List<int> bytes) {
    return QueryDenomAdminResponse.deserialize(bytes);
  }

  @override
  QueryDenomAdminResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomAdminResponse.fromJson(json);
  }
}

class QueryDenomAdminResponse extends CosmosProtoMessage {
  final String? admin;

  const QueryDenomAdminResponse({this.admin});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [admin];

  @override
  Map<String, dynamic> toJson() {
    return {'admin': admin};
  }

  factory QueryDenomAdminResponse.fromJson(Map<String, dynamic> json) {
    return QueryDenomAdminResponse(
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
    );
  }

  factory QueryDenomAdminResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomAdminResponse(admin: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.thorchainDenomV1QueryDenomAdminResponse;
}
