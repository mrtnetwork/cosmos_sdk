import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/initia/ibchooks/v1/src/types.dart"
    as initia_ibchooks_v1_types;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// QueryACLRequest is the request type for the Query/ACL RPC
/// method
class QueryACLRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryACLResponse> {
  /// Address is a contract address (wasm, evm) or a contract deployer address (move).
  final String? address;

  const QueryACLRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/ibchooks/v1/acls/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address};
  }

  factory QueryACLRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryACLRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryACLRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryACLRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIbchooksV1QueryACLRequest;
  @override
  QueryACLResponse onQueryResponse(List<int> bytes) {
    return QueryACLResponse.deserialize(bytes);
  }

  @override
  QueryACLResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryACLResponse.fromJson(json);
  }
}

/// QueryACLResponse is the response type for the Query/ACL RPC
/// method
class QueryACLResponse extends CosmosProtoMessage {
  final initia_ibchooks_v1_types.Acl? acl;

  const QueryACLResponse({this.acl});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [acl];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'acl': config.encodeMessage(acl)};
  }

  factory QueryACLResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryACLResponse(
      acl: json.valueTo<initia_ibchooks_v1_types.Acl?, Object>(
        key: 'acl',
        parse:
            (v) => initia_ibchooks_v1_types.Acl.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryACLResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryACLResponse(
      acl: decode.messageTo<initia_ibchooks_v1_types.Acl?>(
        1,
        (b) => initia_ibchooks_v1_types.Acl.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIbchooksV1QueryACLResponse;
}

/// QueryACLsRequest is the request type for the Query/ACLAddrs
/// RPC method
class QueryACLsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryACLsResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryACLsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/ibchooks/v1/acls",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory QueryACLsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryACLsRequest(
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

  factory QueryACLsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryACLsRequest(
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            1,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIbchooksV1QueryACLsRequest;
  @override
  QueryACLsResponse onQueryResponse(List<int> bytes) {
    return QueryACLsResponse.deserialize(bytes);
  }

  @override
  QueryACLsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryACLsResponse.fromJson(json);
  }
}

/// QueryACLsResponse is the response type for the
/// Query/ACLAddrs RPC method
class QueryACLsResponse extends CosmosProtoMessage {
  final List<initia_ibchooks_v1_types.Acl> acls;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryACLsResponse({this.acls = const [], this.pagination});

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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [acls, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'acls': acls.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryACLsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryACLsResponse(
      acls:
          (json.valueEnsureAsList<dynamic>(
                'acls',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<initia_ibchooks_v1_types.Acl, Object>(
                  value: e,
                  parse:
                      (v) => initia_ibchooks_v1_types.Acl.fromJson(
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

  factory QueryACLsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryACLsResponse(
      acls:
          decode
              .getListOfBytes(1)
              .map((b) => initia_ibchooks_v1_types.Acl.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.initiaIbchooksV1QueryACLsResponse;
}

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class QueryParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryParamsResponse> {
  const QueryParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/ibchooks/v1/params",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryParamsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryParamsRequest();
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return QueryParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIbchooksV1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params defines the parameters of the module.
  final initia_ibchooks_v1_types.Params? params;

  const QueryParamsResponse({this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'params': config.encodeMessage(params)};
  }

  factory QueryParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryParamsResponse(
      params: json.valueTo<initia_ibchooks_v1_types.Params?, Object>(
        key: 'params',
        parse:
            (v) => initia_ibchooks_v1_types.Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<initia_ibchooks_v1_types.Params?>(
        1,
        (b) => initia_ibchooks_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIbchooksV1QueryParamsResponse;
}
