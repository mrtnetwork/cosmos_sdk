import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/initia/move/v1/src/types.dart"
    as initia_move_v1_types;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// QueryModuleRequest is the request type for the Query/Module RPC
/// method
class QueryModuleRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryModuleResponse> {
  /// address is the owner address of the module to query
  final String? address;

  /// module_name is the module name to query
  final String? moduleName;

  const QueryModuleRequest({this.address, this.moduleName});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/move/v1/accounts/{address}/modules/{module_name}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, moduleName];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address, 'module_name': moduleName};
  }

  factory QueryModuleRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryModuleRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      moduleName: json.valueAsString<String?>(
        'module_name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryModuleRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleRequest(
      address: decode.getString<String?>(1),
      moduleName: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryModuleRequest;
  @override
  QueryModuleResponse onQueryResponse(List<int> bytes) {
    return QueryModuleResponse.deserialize(bytes);
  }

  @override
  QueryModuleResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryModuleResponse.fromJson(json);
  }
}

/// QueryModuleResponse is the response type for the Query/Module RPC
/// method
class QueryModuleResponse extends CosmosProtoMessage {
  final initia_move_v1_types.Module? module;

  const QueryModuleResponse({this.module});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [module];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'module': config.encodeMessage(module)};
  }

  factory QueryModuleResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryModuleResponse(
      module: json.valueTo<initia_move_v1_types.Module?, Object>(
        key: 'module',
        parse:
            (v) => initia_move_v1_types.Module.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryModuleResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleResponse(
      module: decode.messageTo<initia_move_v1_types.Module?>(
        1,
        (b) => initia_move_v1_types.Module.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryModuleResponse;
}

/// QueryModulesRequest is the request type for the Query/Modules
/// RPC method
class QueryModulesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryModulesResponse> {
  /// address is the owner address of the modules to query
  final String? address;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryModulesRequest({this.address, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/move/v1/accounts/{address}/modules",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address, 'pagination': config.encodeMessage(pagination)};
  }

  factory QueryModulesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryModulesRequest(
      address: json.valueAsString<String?>(
        'address',
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

  factory QueryModulesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModulesRequest(
      address: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryModulesRequest;
  @override
  QueryModulesResponse onQueryResponse(List<int> bytes) {
    return QueryModulesResponse.deserialize(bytes);
  }

  @override
  QueryModulesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryModulesResponse.fromJson(json);
  }
}

/// QueryModulesResponse is the response type for the
/// Query/Modules RPC method
class QueryModulesResponse extends CosmosProtoMessage {
  final List<initia_move_v1_types.Module> modules;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryModulesResponse({this.modules = const [], this.pagination});

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
  List<Object?> get protoValues => [modules, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'modules': modules.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryModulesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryModulesResponse(
      modules:
          (json.valueEnsureAsList<dynamic>(
                'modules',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<initia_move_v1_types.Module, Object>(
                  value: e,
                  parse:
                      (v) => initia_move_v1_types.Module.fromJson(
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

  factory QueryModulesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModulesResponse(
      modules:
          decode
              .getListOfBytes(1)
              .map((b) => initia_move_v1_types.Module.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryModulesResponse;
}

/// QueryResourceRequest is the request type for the Query/Resource RPC
/// method
class QueryResourceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryResourceResponse> {
  /// address is the owner address of the module to query
  final String? address;

  /// struct_tag is the unique identifier of the resource to query
  final String? structTag;

  const QueryResourceRequest({this.address, this.structTag});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/move/v1/accounts/{address}/resources/by_struct_tag",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, structTag];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address, 'struct_tag': structTag};
  }

  factory QueryResourceRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryResourceRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      structTag: json.valueAsString<String?>(
        'struct_tag',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryResourceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryResourceRequest(
      address: decode.getString<String?>(1),
      structTag: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryResourceRequest;
  @override
  QueryResourceResponse onQueryResponse(List<int> bytes) {
    return QueryResourceResponse.deserialize(bytes);
  }

  @override
  QueryResourceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryResourceResponse.fromJson(json);
  }
}

/// QueryResourceResponse is the response type for the Query/Resource RPC
/// method
class QueryResourceResponse extends CosmosProtoMessage {
  final initia_move_v1_types.Resource? resource;

  const QueryResourceResponse({this.resource});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [resource];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'resource': config.encodeMessage(resource)};
  }

  factory QueryResourceResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryResourceResponse(
      resource: json.valueTo<initia_move_v1_types.Resource?, Object>(
        key: 'resource',
        parse:
            (v) => initia_move_v1_types.Resource.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryResourceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryResourceResponse(
      resource: decode.messageTo<initia_move_v1_types.Resource?>(
        1,
        (b) => initia_move_v1_types.Resource.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryResourceResponse;
}

/// QueryResourcesRequest is the request type for the Query/Resources RPC
/// method
class QueryResourcesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryResourcesResponse> {
  /// address is the owner address of the module to query
  final String? address;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryResourcesRequest({this.address, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/move/v1/accounts/{address}/resources",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address, 'pagination': config.encodeMessage(pagination)};
  }

  factory QueryResourcesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryResourcesRequest(
      address: json.valueAsString<String?>(
        'address',
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

  factory QueryResourcesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryResourcesRequest(
      address: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryResourcesRequest;
  @override
  QueryResourcesResponse onQueryResponse(List<int> bytes) {
    return QueryResourcesResponse.deserialize(bytes);
  }

  @override
  QueryResourcesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryResourcesResponse.fromJson(json);
  }
}

/// QueryResourcesResponse is the response type for the Query/Resources RPC
/// method
class QueryResourcesResponse extends CosmosProtoMessage {
  final List<initia_move_v1_types.Resource> resources;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryResourcesResponse({this.resources = const [], this.pagination});

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
  List<Object?> get protoValues => [resources, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'resources': resources.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryResourcesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryResourcesResponse(
      resources:
          (json.valueEnsureAsList<dynamic>(
                'resources',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<initia_move_v1_types.Resource, Object>(
                      value: e,
                      parse:
                          (v) => initia_move_v1_types.Resource.fromJson(
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

  factory QueryResourcesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryResourcesResponse(
      resources:
          decode
              .getListOfBytes(1)
              .map((b) => initia_move_v1_types.Resource.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryResourcesResponse;
}

/// QueryTableInfoRequest is the request type for the Query/TableInfo RPC
/// method
class QueryTableInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTableInfoResponse> {
  /// address is the table handle
  final String? address;

  const QueryTableInfoRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/move/v1/tables/{address}",
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

  factory QueryTableInfoRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTableInfoRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTableInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTableInfoRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryTableInfoRequest;
  @override
  QueryTableInfoResponse onQueryResponse(List<int> bytes) {
    return QueryTableInfoResponse.deserialize(bytes);
  }

  @override
  QueryTableInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTableInfoResponse.fromJson(json);
  }
}

/// QueryTableInfoResponse is the response type for the Query/TableInfo RPC
/// method
class QueryTableInfoResponse extends CosmosProtoMessage {
  final initia_move_v1_types.TableInfo? tableInfo;

  const QueryTableInfoResponse({this.tableInfo});

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
  List<Object?> get protoValues => [tableInfo];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'table_info': config.encodeMessage(tableInfo)};
  }

  factory QueryTableInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTableInfoResponse(
      tableInfo: json.valueTo<initia_move_v1_types.TableInfo?, Object>(
        key: 'table_info',
        parse:
            (v) => initia_move_v1_types.TableInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTableInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTableInfoResponse(
      tableInfo: decode.messageTo<initia_move_v1_types.TableInfo?>(
        1,
        (b) => initia_move_v1_types.TableInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryTableInfoResponse;
}

/// QueryTableEntryRequest is the request type for the Query/TableEntry RPC
/// method
class QueryTableEntryRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTableEntryResponse> {
  /// address is the table handle
  final String? address;

  /// a key of the table entry
  final BuBytes? keyBytes;

  QueryTableEntryRequest({this.address, List<int>? keyBytes})
    : keyBytes = keyBytes?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/move/v1/tables/{address}/entries/by_key_bytes",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, keyBytes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address, 'key_bytes': config.encodeBinary(keyBytes)};
  }

  factory QueryTableEntryRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTableEntryRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      keyBytes: config.decodeBinary<List<int>?>(
        json.valueAs('key_bytes', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryTableEntryRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTableEntryRequest(
      address: decode.getString<String?>(1),
      keyBytes: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryTableEntryRequest;
  @override
  QueryTableEntryResponse onQueryResponse(List<int> bytes) {
    return QueryTableEntryResponse.deserialize(bytes);
  }

  @override
  QueryTableEntryResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTableEntryResponse.fromJson(json);
  }
}

/// QueryTableEntryResponse is the response type for the Query/TableEntry RPC
/// method
class QueryTableEntryResponse extends CosmosProtoMessage {
  final initia_move_v1_types.TableEntry? tableEntry;

  const QueryTableEntryResponse({this.tableEntry});

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
  List<Object?> get protoValues => [tableEntry];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'table_entry': config.encodeMessage(tableEntry)};
  }

  factory QueryTableEntryResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTableEntryResponse(
      tableEntry: json.valueTo<initia_move_v1_types.TableEntry?, Object>(
        key: 'table_entry',
        parse:
            (v) => initia_move_v1_types.TableEntry.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTableEntryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTableEntryResponse(
      tableEntry: decode.messageTo<initia_move_v1_types.TableEntry?>(
        1,
        (b) => initia_move_v1_types.TableEntry.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryTableEntryResponse;
}

/// QueryTableEntriesRequest is the request type for the Query/TableEntries RPC
/// method
class QueryTableEntriesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTableEntriesResponse> {
  /// address is the table handle
  final String? address;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryTableEntriesRequest({this.address, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/move/v1/tables/{address}/entries",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address, 'pagination': config.encodeMessage(pagination)};
  }

  factory QueryTableEntriesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTableEntriesRequest(
      address: json.valueAsString<String?>(
        'address',
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

  factory QueryTableEntriesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTableEntriesRequest(
      address: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryTableEntriesRequest;
  @override
  QueryTableEntriesResponse onQueryResponse(List<int> bytes) {
    return QueryTableEntriesResponse.deserialize(bytes);
  }

  @override
  QueryTableEntriesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTableEntriesResponse.fromJson(json);
  }
}

/// QueryTableEntriesResponse is the response type for the Query/TableEntries RPC
/// method
class QueryTableEntriesResponse extends CosmosProtoMessage {
  final List<initia_move_v1_types.TableEntry> tableEntries;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryTableEntriesResponse({
    this.tableEntries = const [],
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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [tableEntries, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'table_entries':
          tableEntries.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryTableEntriesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTableEntriesResponse(
      tableEntries:
          (json.valueEnsureAsList<dynamic>(
                'table_entries',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<initia_move_v1_types.TableEntry, Object>(
                      value: e,
                      parse:
                          (v) => initia_move_v1_types.TableEntry.fromJson(
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

  factory QueryTableEntriesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTableEntriesResponse(
      tableEntries:
          decode
              .getListOfBytes(1)
              .map((b) => initia_move_v1_types.TableEntry.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryTableEntriesResponse;
}

/// QueryLegacyViewRequest is the request type for the QueryLegacyView
/// RPC method
class QueryLegacyViewRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryLegacyViewResponse> {
  /// Address is the owner address of the module to query
  final String? address;

  /// ModuleName is the module name of the entry function to query
  final String? moduleName;

  /// FunctionName is the name of a function to query
  final String? functionName;

  /// TypeArgs is the type arguments of a function to execute
  /// ex) "0x1::BasicCoin::Initia", "bool", "u8", "u64"
  final List<String> typeArgs;

  /// Args is the arguments of a function to execute
  /// - number: little endian
  /// - string: base64 bytes
  final List<BuBytes> args;

  QueryLegacyViewRequest({
    this.address,
    this.moduleName,
    this.functionName,
    this.typeArgs = const [],
    List<List<int>> args = const [],
  }) : args = args.map((e) => e.asImmutableBytes).toImutableList;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path:
              "/initia/move/v1/accounts/{address}/modules/{module_name}/view_functions/{function_name}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    address,
    moduleName,
    functionName,
    typeArgs,
    args,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': address,
      'module_name': moduleName,
      'function_name': functionName,
      'type_args': typeArgs.map((e) => e).toList(),
      'args': args.map((e) => config.encodeBinary(e)).toList(),
    };
  }

  factory QueryLegacyViewRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLegacyViewRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      moduleName: json.valueAsString<String?>(
        'module_name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      functionName: json.valueAsString<String?>(
        'function_name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      typeArgs:
          (json.valueEnsureAsList<dynamic>(
            'type_args',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      args:
          (json.valueEnsureAsList<dynamic>(
            'args',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => config.decodeBinary<List<int>>(e)).toList(),
    );
  }

  factory QueryLegacyViewRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLegacyViewRequest(
      address: decode.getString<String?>(1),
      moduleName: decode.getString<String?>(2),
      functionName: decode.getString<String?>(3),
      typeArgs: decode.getListOrEmpty<String>(4),
      args: decode.getListOfBytes(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryLegacyViewRequest;
  @override
  QueryLegacyViewResponse onQueryResponse(List<int> bytes) {
    return QueryLegacyViewResponse.deserialize(bytes);
  }

  @override
  QueryLegacyViewResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryLegacyViewResponse.fromJson(json);
  }
}

/// QueryLegacyViewResponse is the response type for the
/// QueryLegacyView RPC method
class QueryLegacyViewResponse extends CosmosProtoMessage {
  final String? data;

  final List<VMEvent> events;

  final BigInt? gasUsed;

  const QueryLegacyViewResponse({
    this.data,
    this.events = const [],
    this.gasUsed,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [data, events, gasUsed];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'data': data,
      'events': events.map((e) => config.encodeMessage(e)).toList(),
      'gas_used': config.encodeBigint(gasUsed),
    };
  }

  factory QueryLegacyViewResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryLegacyViewResponse(
      data: json.valueAsString<String?>(
        'data',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      events:
          (json.valueEnsureAsList<dynamic>(
                'events',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<VMEvent, Object>(
                  value: e,
                  parse:
                      (v) => VMEvent.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      gasUsed: json.valueAsBigInt<BigInt?>(
        'gas_used',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryLegacyViewResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryLegacyViewResponse(
      data: decode.getString<String?>(1),
      events:
          decode.getListOfBytes(2).map((b) => VMEvent.deserialize(b)).toList(),
      gasUsed: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryLegacyViewResponse;
}

/// QueryViewRequest is the request type for the QueryView
/// RPC method
class QueryViewRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryViewResponse> {
  /// Address is the owner address of the module to query
  final String? address;

  /// ModuleName is the module name of the entry function to query
  final String? moduleName;

  /// FunctionName is the name of a function to query
  final String? functionName;

  /// TypeArgs is the type arguments of a function to execute
  /// ex) "0x1::BasicCoin::Initia", "bool", "u8", "u64"
  final List<String> typeArgs;

  /// Args is the arguments of a function to execute
  /// - number: little endian
  /// - string: base64 bytes
  final List<BuBytes> args;

  QueryViewRequest({
    this.address,
    this.moduleName,
    this.functionName,
    this.typeArgs = const [],
    List<List<int>> args = const [],
  }) : args = args.map((e) => e.asImmutableBytes).toImutableList;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/initia/move/v1/view",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    address,
    moduleName,
    functionName,
    typeArgs,
    args,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': address,
      'module_name': moduleName,
      'function_name': functionName,
      'type_args': typeArgs.map((e) => e).toList(),
      'args': args.map((e) => config.encodeBinary(e)).toList(),
    };
  }

  factory QueryViewRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryViewRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      moduleName: json.valueAsString<String?>(
        'module_name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      functionName: json.valueAsString<String?>(
        'function_name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      typeArgs:
          (json.valueEnsureAsList<dynamic>(
            'type_args',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      args:
          (json.valueEnsureAsList<dynamic>(
            'args',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => config.decodeBinary<List<int>>(e)).toList(),
    );
  }

  factory QueryViewRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryViewRequest(
      address: decode.getString<String?>(1),
      moduleName: decode.getString<String?>(2),
      functionName: decode.getString<String?>(3),
      typeArgs: decode.getListOrEmpty<String>(4),
      args: decode.getListOfBytes(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryViewRequest;
  @override
  QueryViewResponse onQueryResponse(List<int> bytes) {
    return QueryViewResponse.deserialize(bytes);
  }

  @override
  QueryViewResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryViewResponse.fromJson(json);
  }
}

/// QueryViewResponse is the response type for the
/// QueryView RPC method
class QueryViewResponse extends CosmosProtoMessage {
  final String? data;

  final List<VMEvent> events;

  final BigInt? gasUsed;

  const QueryViewResponse({this.data, this.events = const [], this.gasUsed});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [data, events, gasUsed];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'data': data,
      'events': events.map((e) => config.encodeMessage(e)).toList(),
      'gas_used': config.encodeBigint(gasUsed),
    };
  }

  factory QueryViewResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryViewResponse(
      data: json.valueAsString<String?>(
        'data',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      events:
          (json.valueEnsureAsList<dynamic>(
                'events',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<VMEvent, Object>(
                  value: e,
                  parse:
                      (v) => VMEvent.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      gasUsed: json.valueAsBigInt<BigInt?>(
        'gas_used',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryViewResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryViewResponse(
      data: decode.getString<String?>(1),
      events:
          decode.getListOfBytes(2).map((b) => VMEvent.deserialize(b)).toList(),
      gasUsed: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryViewResponse;
}

/// QueryViewBatchRequest is the request type for the QueryViewBatch
/// RPC method
class QueryViewBatchRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryViewBatchResponse> {
  final List<QueryViewRequest> requests;

  const QueryViewBatchRequest({this.requests = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/initia/move/v1/view/batch",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [requests];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'requests': requests.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryViewBatchRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryViewBatchRequest(
      requests:
          (json.valueEnsureAsList<dynamic>(
                'requests',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<QueryViewRequest, Object>(
                  value: e,
                  parse:
                      (v) => QueryViewRequest.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryViewBatchRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryViewBatchRequest(
      requests:
          decode
              .getListOfBytes(1)
              .map((b) => QueryViewRequest.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryViewBatchRequest;
  @override
  QueryViewBatchResponse onQueryResponse(List<int> bytes) {
    return QueryViewBatchResponse.deserialize(bytes);
  }

  @override
  QueryViewBatchResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryViewBatchResponse.fromJson(json);
  }
}

/// QueryViewBatchResponse is the response type for the
/// QueryViewBatch RPC method
class QueryViewBatchResponse extends CosmosProtoMessage {
  final List<QueryViewResponse> responses;

  const QueryViewBatchResponse({this.responses = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [responses];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'responses': responses.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryViewBatchResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryViewBatchResponse(
      responses:
          (json.valueEnsureAsList<dynamic>(
                'responses',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<QueryViewResponse, Object>(
                  value: e,
                  parse:
                      (v) => QueryViewResponse.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryViewBatchResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryViewBatchResponse(
      responses:
          decode
              .getListOfBytes(1)
              .map((b) => QueryViewResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryViewBatchResponse;
}

/// QueryViewJSONRequest is the request type for the QueryViewJSON
/// RPC method
class QueryViewJSONRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryViewJSONResponse> {
  /// Address is the owner address of the module to query
  final String? address;

  /// ModuleName is the module name of the entry function to query
  final String? moduleName;

  /// FunctionName is the name of a function to query
  final String? functionName;

  /// TypeArgs is the type arguments of a function to execute
  /// ex) "0x1::BasicCoin::Initia", "bool", "u8", "u64"
  final List<String> typeArgs;

  /// Args is the arguments of a function to execute in json stringify format
  final List<String> args;

  const QueryViewJSONRequest({
    this.address,
    this.moduleName,
    this.functionName,
    this.typeArgs = const [],
    this.args = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/initia/move/v1/view/json",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 5,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    address,
    moduleName,
    functionName,
    typeArgs,
    args,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': address,
      'module_name': moduleName,
      'function_name': functionName,
      'type_args': typeArgs.map((e) => e).toList(),
      'args': args.map((e) => e).toList(),
    };
  }

  factory QueryViewJSONRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryViewJSONRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      moduleName: json.valueAsString<String?>(
        'module_name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      functionName: json.valueAsString<String?>(
        'function_name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      typeArgs:
          (json.valueEnsureAsList<dynamic>(
            'type_args',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      args:
          (json.valueEnsureAsList<dynamic>(
            'args',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory QueryViewJSONRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryViewJSONRequest(
      address: decode.getString<String?>(1),
      moduleName: decode.getString<String?>(2),
      functionName: decode.getString<String?>(3),
      typeArgs: decode.getListOrEmpty<String>(4),
      args: decode.getListOrEmpty<String>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryViewJSONRequest;
  @override
  QueryViewJSONResponse onQueryResponse(List<int> bytes) {
    return QueryViewJSONResponse.deserialize(bytes);
  }

  @override
  QueryViewJSONResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryViewJSONResponse.fromJson(json);
  }
}

/// QueryViewJSONResponse is the response type for the
/// QueryViewJSON RPC method
class QueryViewJSONResponse extends CosmosProtoMessage {
  final String? data;

  final List<VMEvent> events;

  final BigInt? gasUsed;

  const QueryViewJSONResponse({
    this.data,
    this.events = const [],
    this.gasUsed,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [data, events, gasUsed];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'data': data,
      'events': events.map((e) => config.encodeMessage(e)).toList(),
      'gas_used': config.encodeBigint(gasUsed),
    };
  }

  factory QueryViewJSONResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryViewJSONResponse(
      data: json.valueAsString<String?>(
        'data',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      events:
          (json.valueEnsureAsList<dynamic>(
                'events',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<VMEvent, Object>(
                  value: e,
                  parse:
                      (v) => VMEvent.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      gasUsed: json.valueAsBigInt<BigInt?>(
        'gas_used',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryViewJSONResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryViewJSONResponse(
      data: decode.getString<String?>(1),
      events:
          decode.getListOfBytes(2).map((b) => VMEvent.deserialize(b)).toList(),
      gasUsed: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryViewJSONResponse;
}

/// QueryViewJSONBatchRequest is the request type for the QueryViewJSONBatch
/// RPC method
class QueryViewJSONBatchRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryViewJSONBatchResponse> {
  final List<QueryViewJSONRequest> requests;

  const QueryViewJSONBatchRequest({this.requests = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/initia/move/v1/view/json/batch",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [requests];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'requests': requests.map((e) => config.encodeMessage(e)).toList()};
  }

  factory QueryViewJSONBatchRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryViewJSONBatchRequest(
      requests:
          (json.valueEnsureAsList<dynamic>(
                'requests',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<QueryViewJSONRequest, Object>(
                  value: e,
                  parse:
                      (v) => QueryViewJSONRequest.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryViewJSONBatchRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryViewJSONBatchRequest(
      requests:
          decode
              .getListOfBytes(1)
              .map((b) => QueryViewJSONRequest.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryViewJSONBatchRequest;
  @override
  QueryViewJSONBatchResponse onQueryResponse(List<int> bytes) {
    return QueryViewJSONBatchResponse.deserialize(bytes);
  }

  @override
  QueryViewJSONBatchResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryViewJSONBatchResponse.fromJson(json);
  }
}

/// QueryViewJSONBatchResponse is the response type for the
/// QueryViewJSONBatch RPC method
class QueryViewJSONBatchResponse extends CosmosProtoMessage {
  final List<QueryViewJSONResponse> responses;

  const QueryViewJSONBatchResponse({this.responses = const []});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [responses];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'responses': responses.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QueryViewJSONBatchResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryViewJSONBatchResponse(
      responses:
          (json.valueEnsureAsList<dynamic>(
                'responses',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<QueryViewJSONResponse, Object>(
                  value: e,
                  parse:
                      (v) => QueryViewJSONResponse.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QueryViewJSONBatchResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryViewJSONBatchResponse(
      responses:
          decode
              .getListOfBytes(1)
              .map((b) => QueryViewJSONResponse.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryViewJSONBatchResponse;
}

/// VMEvent is the event emitted from vm.
class VMEvent extends CosmosProtoMessage {
  final String? typeTag;

  final String? data;

  const VMEvent({this.typeTag, this.data});

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
  List<Object?> get protoValues => [typeTag, data];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'type_tag': typeTag, 'data': data};
  }

  factory VMEvent.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return VMEvent(
      typeTag: json.valueAsString<String?>(
        'type_tag',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      data: json.valueAsString<String?>(
        'data',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory VMEvent.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return VMEvent(
      typeTag: decode.getString<String?>(1),
      data: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1VMEvent;
}

/// QueryScriptABIRequest is the request type for the Query/ScriptABI
/// RPC method
class QueryScriptABIRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryScriptABIResponse> {
  /// CodeBytes is the script code for query operation
  final BuBytes? codeBytes;

  QueryScriptABIRequest({List<int>? codeBytes})
    : codeBytes = codeBytes?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/initia/move/v1/script/abi",
        ),
      ],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [codeBytes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'code_bytes': config.encodeBinary(codeBytes)};
  }

  factory QueryScriptABIRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryScriptABIRequest(
      codeBytes: config.decodeBinary<List<int>?>(
        json.valueAs('code_bytes', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryScriptABIRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryScriptABIRequest(codeBytes: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryScriptABIRequest;
  @override
  QueryScriptABIResponse onQueryResponse(List<int> bytes) {
    return QueryScriptABIResponse.deserialize(bytes);
  }

  @override
  QueryScriptABIResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryScriptABIResponse.fromJson(json);
  }
}

/// QueryScriptABIResponse is the response type for the
/// Query/ScriptABI RPC method
class QueryScriptABIResponse extends CosmosProtoMessage {
  final BuBytes? abi;

  QueryScriptABIResponse({List<int>? abi}) : abi = abi?.asImmutableBytes;

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
  List<Object?> get protoValues => [abi];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'abi': config.encodeBinary(abi)};
  }

  factory QueryScriptABIResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryScriptABIResponse(
      abi: config.decodeBinary<List<int>?>(
        json.valueAs('abi', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryScriptABIResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryScriptABIResponse(abi: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryScriptABIResponse;
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
          path: "/initia/move/v1/params",
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
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryParamsRequest;
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
  final initia_move_v1_types.Params? params;

  const QueryParamsResponse({this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
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
      params: json.valueTo<initia_move_v1_types.Params?, Object>(
        key: 'params',
        parse:
            (v) => initia_move_v1_types.Params.fromJson(
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
      params: decode.messageTo<initia_move_v1_types.Params?>(
        1,
        (b) => initia_move_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryParamsResponse;
}

/// QueryMetadataRequest is the request type for the Query/Metadata RPC method.
class QueryMetadataRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryMetadataResponse> {
  final String? denom;

  const QueryMetadataRequest({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/move/v1/metadata",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'denom': denom};
  }

  factory QueryMetadataRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMetadataRequest(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryMetadataRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMetadataRequest(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryMetadataRequest;
  @override
  QueryMetadataResponse onQueryResponse(List<int> bytes) {
    return QueryMetadataResponse.deserialize(bytes);
  }

  @override
  QueryMetadataResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryMetadataResponse.fromJson(json);
  }
}

/// QueryMetadataResponse is the response type for the Query/Metadata RPC method.
class QueryMetadataResponse extends CosmosProtoMessage {
  final String? metadata;

  const QueryMetadataResponse({this.metadata});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [metadata];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'metadata': metadata};
  }

  factory QueryMetadataResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryMetadataResponse(
      metadata: json.valueAsString<String?>(
        'metadata',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryMetadataResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryMetadataResponse(metadata: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryMetadataResponse;
}

/// QueryDenomRequest is the request type for the Query/Denom RPC method.
class QueryDenomRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDenomResponse> {
  final String? metadata;

  const QueryDenomRequest({this.metadata});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/move/v1/denom",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [metadata];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'metadata': metadata};
  }

  factory QueryDenomRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDenomRequest(
      metadata: json.valueAsString<String?>(
        'metadata',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDenomRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomRequest(metadata: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryDenomRequest;
  @override
  QueryDenomResponse onQueryResponse(List<int> bytes) {
    return QueryDenomResponse.deserialize(bytes);
  }

  @override
  QueryDenomResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDenomResponse.fromJson(json);
  }
}

/// QueryDenomResponse is the response type for the Query/Denom RPC method.
class QueryDenomResponse extends CosmosProtoMessage {
  final String? denom;

  const QueryDenomResponse({this.denom});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [denom];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'denom': denom};
  }

  factory QueryDenomResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDenomResponse(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDenomResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDenomResponse(denom: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryDenomResponse;
}

/// QueryDexPairRequest is the request type for the Query/DexPair RPC method.
class QueryDexPairRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDexPairResponse> {
  final String? metadataQuote;

  const QueryDexPairRequest({this.metadataQuote});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/move/v1/dex/pairs/{metadata_quote}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [metadataQuote];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'metadata_quote': metadataQuote};
  }

  factory QueryDexPairRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDexPairRequest(
      metadataQuote: json.valueAsString<String?>(
        'metadata_quote',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDexPairRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDexPairRequest(metadataQuote: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryDexPairRequest;
  @override
  QueryDexPairResponse onQueryResponse(List<int> bytes) {
    return QueryDexPairResponse.deserialize(bytes);
  }

  @override
  QueryDexPairResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDexPairResponse.fromJson(json);
  }
}

/// QueryDexPairResponse is the response type for the Query/DexPair RPC method.
class QueryDexPairResponse extends CosmosProtoMessage {
  final initia_move_v1_types.DexPair? dexPair;

  const QueryDexPairResponse({this.dexPair});

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
  List<Object?> get protoValues => [dexPair];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'dex_pair': config.encodeMessage(dexPair)};
  }

  factory QueryDexPairResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDexPairResponse(
      dexPair: json.valueTo<initia_move_v1_types.DexPair?, Object>(
        key: 'dex_pair',
        parse:
            (v) => initia_move_v1_types.DexPair.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryDexPairResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDexPairResponse(
      dexPair: decode.messageTo<initia_move_v1_types.DexPair?>(
        1,
        (b) => initia_move_v1_types.DexPair.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryDexPairResponse;
}

/// QueryDexPairsRequest is the request type for the Query/DexPairs RPC method.
class QueryDexPairsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDexPairsResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryDexPairsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/move/v1/dex/pairs",
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

  factory QueryDexPairsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDexPairsRequest(
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

  factory QueryDexPairsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDexPairsRequest(
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
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryDexPairsRequest;
  @override
  QueryDexPairsResponse onQueryResponse(List<int> bytes) {
    return QueryDexPairsResponse.deserialize(bytes);
  }

  @override
  QueryDexPairsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDexPairsResponse.fromJson(json);
  }
}

/// QueryDexPairsResponse is the response type for the Query/DexPairs RPC method.
class QueryDexPairsResponse extends CosmosProtoMessage {
  final List<initia_move_v1_types.DexPair> dexPairs;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryDexPairsResponse({this.dexPairs = const [], this.pagination});

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
  List<Object?> get protoValues => [dexPairs, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'dex_pairs': dexPairs.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryDexPairsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryDexPairsResponse(
      dexPairs:
          (json.valueEnsureAsList<dynamic>(
                'dex_pairs',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<initia_move_v1_types.DexPair, Object>(
                  value: e,
                  parse:
                      (v) => initia_move_v1_types.DexPair.fromJson(
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

  factory QueryDexPairsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDexPairsResponse(
      dexPairs:
          decode
              .getListOfBytes(1)
              .map((b) => initia_move_v1_types.DexPair.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.initiaMoveV1QueryDexPairsResponse;
}
