import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/cosmos/authz/v1beta1/src/authz.dart"
    as cosmos_authz_v1beta1_authz;

/// QueryGrantsRequest is the request type for the Query/Grants RPC method.
class QueryGrantsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGrantsResponse> {
  final String? granter;

  final String? grantee;

  /// Optional, msg_type_url, when set, will query only grants matching given msg type.
  final String? msgTypeUrl;

  /// pagination defines a pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryGrantsRequest({
    this.granter,
    this.grantee,
    this.msgTypeUrl,
    this.pagination,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/authz/v1beta1/grants",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.message(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [granter, grantee, msgTypeUrl, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'granter': granter,
      'grantee': grantee,
      'msg_type_url': msgTypeUrl,
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryGrantsRequest.fromJson(Map<String, dynamic> json) {
    return QueryGrantsRequest(
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
      grantee: json.valueAsString<String?>('grantee', acceptCamelCase: true),
      msgTypeUrl: json.valueAsString<String?>(
        'msg_type_url',
        acceptCamelCase: true,
      ),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGrantsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGrantsRequest(
      granter: decode.getString<String?>(1),
      grantee: decode.getString<String?>(2),
      msgTypeUrl: decode.getString<String?>(3),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            4,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1QueryGrantsRequest;
  @override
  QueryGrantsResponse onQueryResponse(List<int> bytes) {
    return QueryGrantsResponse.deserialize(bytes);
  }

  @override
  QueryGrantsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGrantsResponse.fromJson(json);
  }
}

/// QueryGrantsResponse is the response type for the Query/Authorizations RPC method.
class QueryGrantsResponse extends CosmosProtoMessage {
  /// authorizations is a list of grants granted for grantee by granter.
  final List<cosmos_authz_v1beta1_authz.Grant> grants;

  /// pagination defines a pagination for the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryGrantsResponse({this.grants = const [], this.pagination});

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
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [grants, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'grants': grants.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryGrantsResponse.fromJson(Map<String, dynamic> json) {
    return QueryGrantsResponse(
      grants:
          (json.valueEnsureAsList<dynamic>('grants', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_authz_v1beta1_authz.Grant,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_authz_v1beta1_authz.Grant.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGrantsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGrantsResponse(
      grants:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_authz_v1beta1_authz.Grant.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1QueryGrantsResponse;
}

/// QueryGranterGrantsRequest is the request type for the Query/GranterGrants RPC method.
class QueryGranterGrantsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGranterGrantsResponse> {
  final String? granter;

  /// pagination defines a pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryGranterGrantsRequest({this.granter, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/authz/v1beta1/grants/granter/{granter}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [granter, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'granter': granter, 'pagination': pagination?.toJson()};
  }

  factory QueryGranterGrantsRequest.fromJson(Map<String, dynamic> json) {
    return QueryGranterGrantsRequest(
      granter: json.valueAsString<String?>('granter', acceptCamelCase: true),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGranterGrantsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGranterGrantsRequest(
      granter: decode.getString<String?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1QueryGranterGrantsRequest;
  @override
  QueryGranterGrantsResponse onQueryResponse(List<int> bytes) {
    return QueryGranterGrantsResponse.deserialize(bytes);
  }

  @override
  QueryGranterGrantsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGranterGrantsResponse.fromJson(json);
  }
}

/// QueryGranterGrantsResponse is the response type for the Query/GranterGrants RPC method.
class QueryGranterGrantsResponse extends CosmosProtoMessage {
  /// grants is a list of grants granted by the granter.
  final List<cosmos_authz_v1beta1_authz.GrantAuthorization> grants;

  /// pagination defines a pagination for the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryGranterGrantsResponse({this.grants = const [], this.pagination});

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
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [grants, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'grants': grants.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryGranterGrantsResponse.fromJson(Map<String, dynamic> json) {
    return QueryGranterGrantsResponse(
      grants:
          (json.valueEnsureAsList<dynamic>('grants', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_authz_v1beta1_authz.GrantAuthorization,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => cosmos_authz_v1beta1_authz
                          .GrantAuthorization.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGranterGrantsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGranterGrantsResponse(
      grants:
          decode
              .getListOfBytes(1)
              .map(
                (b) => cosmos_authz_v1beta1_authz
                    .GrantAuthorization.deserialize(b),
              )
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1QueryGranterGrantsResponse;
}

/// QueryGranteeGrantsRequest is the request type for the Query/GranteeGrants RPC method.
class QueryGranteeGrantsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryGranteeGrantsResponse> {
  final String? grantee;

  /// pagination defines a pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryGranteeGrantsRequest({this.grantee, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/authz/v1beta1/grants/grantee/{grantee}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [grantee, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {'grantee': grantee, 'pagination': pagination?.toJson()};
  }

  factory QueryGranteeGrantsRequest.fromJson(Map<String, dynamic> json) {
    return QueryGranteeGrantsRequest(
      grantee: json.valueAsString<String?>('grantee', acceptCamelCase: true),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGranteeGrantsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGranteeGrantsRequest(
      grantee: decode.getString<String?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1QueryGranteeGrantsRequest;
  @override
  QueryGranteeGrantsResponse onQueryResponse(List<int> bytes) {
    return QueryGranteeGrantsResponse.deserialize(bytes);
  }

  @override
  QueryGranteeGrantsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryGranteeGrantsResponse.fromJson(json);
  }
}

/// QueryGranteeGrantsResponse is the response type for the Query/GranteeGrants RPC method.
class QueryGranteeGrantsResponse extends CosmosProtoMessage {
  /// grants is a list of grants granted to the grantee.
  final List<cosmos_authz_v1beta1_authz.GrantAuthorization> grants;

  /// pagination defines a pagination for the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryGranteeGrantsResponse({this.grants = const [], this.pagination});

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
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [grants, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'grants': grants.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryGranteeGrantsResponse.fromJson(Map<String, dynamic> json) {
    return QueryGranteeGrantsResponse(
      grants:
          (json.valueEnsureAsList<dynamic>('grants', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_authz_v1beta1_authz.GrantAuthorization,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => cosmos_authz_v1beta1_authz
                          .GrantAuthorization.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryGranteeGrantsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryGranteeGrantsResponse(
      grants:
          decode
              .getListOfBytes(1)
              .map(
                (b) => cosmos_authz_v1beta1_authz
                    .GrantAuthorization.deserialize(b),
              )
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthzV1beta1QueryGranteeGrantsResponse;
}
