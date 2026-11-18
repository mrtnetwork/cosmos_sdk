import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/feegrant/v1beta1/src/feegrant.dart"
    as cosmos_feegrant_v1beta1_feegrant;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// QueryAllowanceRequest is the request type for the Query/Allowance RPC method.
class QueryAllowanceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllowanceResponse> {
  /// granter is the address of the user granting an allowance of their funds.
  final String? granter;

  /// grantee is the address of the user being granted an allowance of another user's funds.
  final String? grantee;

  const QueryAllowanceRequest({this.granter, this.grantee});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/feegrant/v1beta1/allowance/{granter}/{grantee}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [granter, grantee];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'granter': granter, 'grantee': grantee};
  }

  factory QueryAllowanceRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllowanceRequest(
      granter: json.valueAsString<String?>(
        'granter',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      grantee: json.valueAsString<String?>(
        'grantee',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAllowanceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllowanceRequest(
      granter: decode.getString<String?>(1),
      grantee: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosFeegrantV1beta1QueryAllowanceRequest;
  @override
  QueryAllowanceResponse onQueryResponse(List<int> bytes) {
    return QueryAllowanceResponse.deserialize(bytes);
  }

  @override
  QueryAllowanceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllowanceResponse.fromJson(json);
  }
}

/// QueryAllowanceResponse is the response type for the Query/Allowance RPC method.
class QueryAllowanceResponse extends CosmosProtoMessage {
  /// allowance is an allowance granted for grantee by granter.
  final cosmos_feegrant_v1beta1_feegrant.Grant? allowance;

  const QueryAllowanceResponse({this.allowance});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [allowance];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'allowance': config.encodeMessage(allowance)};
  }

  factory QueryAllowanceResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllowanceResponse(
      allowance: json.valueTo<cosmos_feegrant_v1beta1_feegrant.Grant?, Object>(
        key: 'allowance',
        parse:
            (v) => cosmos_feegrant_v1beta1_feegrant.Grant.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAllowanceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllowanceResponse(
      allowance: decode.messageTo<cosmos_feegrant_v1beta1_feegrant.Grant?>(
        1,
        (b) => cosmos_feegrant_v1beta1_feegrant.Grant.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosFeegrantV1beta1QueryAllowanceResponse;
}

/// QueryAllowancesRequest is the request type for the Query/Allowances RPC method.
class QueryAllowancesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllowancesResponse> {
  final String? grantee;

  /// pagination defines a pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllowancesRequest({this.grantee, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/feegrant/v1beta1/allowances/{grantee}",
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'grantee': grantee, 'pagination': config.encodeMessage(pagination)};
  }

  factory QueryAllowancesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllowancesRequest(
      grantee: json.valueAsString<String?>(
        'grantee',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryAllowancesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllowancesRequest(
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
      DefaultCosmosProtoTypeUrl.cosmosFeegrantV1beta1QueryAllowancesRequest;
  @override
  QueryAllowancesResponse onQueryResponse(List<int> bytes) {
    return QueryAllowancesResponse.deserialize(bytes);
  }

  @override
  QueryAllowancesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllowancesResponse.fromJson(json);
  }
}

/// QueryAllowancesResponse is the response type for the Query/Allowances RPC method.
class QueryAllowancesResponse extends CosmosProtoMessage {
  /// allowances are allowance's granted for grantee by granter.
  final List<cosmos_feegrant_v1beta1_feegrant.Grant> allowances;

  /// pagination defines a pagination for the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllowancesResponse({this.allowances = const [], this.pagination});

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
  List<Object?> get protoValues => [allowances, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'allowances': allowances.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryAllowancesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllowancesResponse(
      allowances:
          (json.valueEnsureAsList<dynamic>(
                'allowances',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_feegrant_v1beta1_feegrant.Grant,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => cosmos_feegrant_v1beta1_feegrant.Grant.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryAllowancesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllowancesResponse(
      allowances:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_feegrant_v1beta1_feegrant.Grant.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.cosmosFeegrantV1beta1QueryAllowancesResponse;
}

/// QueryAllowancesByGranterRequest is the request type for the Query/AllowancesByGranter RPC method.
class QueryAllowancesByGranterRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllowancesByGranterResponse> {
  final String? granter;

  /// pagination defines a pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllowancesByGranterRequest({this.granter, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/feegrant/v1beta1/issued/{granter}",
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'granter': granter, 'pagination': config.encodeMessage(pagination)};
  }

  factory QueryAllowancesByGranterRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllowancesByGranterRequest(
      granter: json.valueAsString<String?>(
        'granter',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryAllowancesByGranterRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllowancesByGranterRequest(
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
      DefaultCosmosProtoTypeUrl
          .cosmosFeegrantV1beta1QueryAllowancesByGranterRequest;
  @override
  QueryAllowancesByGranterResponse onQueryResponse(List<int> bytes) {
    return QueryAllowancesByGranterResponse.deserialize(bytes);
  }

  @override
  QueryAllowancesByGranterResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAllowancesByGranterResponse.fromJson(json);
  }
}

/// QueryAllowancesByGranterResponse is the response type for the Query/AllowancesByGranter RPC method.
class QueryAllowancesByGranterResponse extends CosmosProtoMessage {
  /// allowances that have been issued by the granter.
  final List<cosmos_feegrant_v1beta1_feegrant.Grant> allowances;

  /// pagination defines a pagination for the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllowancesByGranterResponse({
    this.allowances = const [],
    this.pagination,
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
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [allowances, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'allowances': allowances.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryAllowancesByGranterResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllowancesByGranterResponse(
      allowances:
          (json.valueEnsureAsList<dynamic>(
                'allowances',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_feegrant_v1beta1_feegrant.Grant,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => cosmos_feegrant_v1beta1_feegrant.Grant.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryAllowancesByGranterResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllowancesByGranterResponse(
      allowances:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_feegrant_v1beta1_feegrant.Grant.deserialize(b))
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
      DefaultCosmosProtoTypeUrl
          .cosmosFeegrantV1beta1QueryAllowancesByGranterResponse;
}
