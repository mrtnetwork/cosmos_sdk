import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmwasm/wasm/v1/src/types.dart"
    as cosmwasm_wasm_v1_types;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// QueryContractInfoRequest is the request type for the Query/ContractInfo RPC
/// method
class QueryContractInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryContractInfoResponse> {
  /// address is the address of the contract to query
  final String? address;

  const QueryContractInfoRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/contract/{address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
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

  factory QueryContractInfoRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractInfoRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryContractInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractInfoRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryContractInfoRequest;
  @override
  QueryContractInfoResponse onQueryResponse(List<int> bytes) {
    return QueryContractInfoResponse.deserialize(bytes);
  }

  @override
  QueryContractInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryContractInfoResponse.fromJson(json);
  }
}

/// QueryContractInfoResponse is the response type for the Query/ContractInfo RPC
/// method
class QueryContractInfoResponse extends CosmosProtoMessage {
  /// address is the address of the contract
  final String? address;

  final cosmwasm_wasm_v1_types.ContractInfo? contractInfo;

  const QueryContractInfoResponse({this.address, this.contractInfo});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, contractInfo];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': address,
      'contract_info': config.encodeMessage(contractInfo),
    };
  }

  factory QueryContractInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractInfoResponse(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      contractInfo: json.valueTo<cosmwasm_wasm_v1_types.ContractInfo?, Object>(
        key: 'contract_info',
        parse:
            (v) => cosmwasm_wasm_v1_types.ContractInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryContractInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractInfoResponse(
      address: decode.getString<String?>(1),
      contractInfo: decode.messageTo<cosmwasm_wasm_v1_types.ContractInfo?>(
        2,
        (b) => cosmwasm_wasm_v1_types.ContractInfo.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryContractInfoResponse;
}

/// QueryContractHistoryRequest is the request type for the Query/ContractHistory
/// RPC method
class QueryContractHistoryRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryContractHistoryResponse> {
  /// address is the address of the contract to query
  final String? address;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryContractHistoryRequest({this.address, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/contract/{address}/history",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
      ],
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

  factory QueryContractHistoryRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractHistoryRequest(
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

  factory QueryContractHistoryRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractHistoryRequest(
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryContractHistoryRequest;
  @override
  QueryContractHistoryResponse onQueryResponse(List<int> bytes) {
    return QueryContractHistoryResponse.deserialize(bytes);
  }

  @override
  QueryContractHistoryResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryContractHistoryResponse.fromJson(json);
  }
}

/// QueryContractHistoryResponse is the response type for the
/// Query/ContractHistory RPC method
class QueryContractHistoryResponse extends CosmosProtoMessage {
  final List<cosmwasm_wasm_v1_types.ContractCodeHistoryEntry> entries;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryContractHistoryResponse({
    this.entries = const [],
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
  List<Object?> get protoValues => [entries, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'entries': entries.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryContractHistoryResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractHistoryResponse(
      entries:
          (json.valueEnsureAsList<dynamic>(
                'entries',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmwasm_wasm_v1_types.ContractCodeHistoryEntry,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => cosmwasm_wasm_v1_types
                          .ContractCodeHistoryEntry.fromJson(
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

  factory QueryContractHistoryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractHistoryResponse(
      entries:
          decode
              .getListOfBytes(1)
              .map(
                (b) => cosmwasm_wasm_v1_types
                    .ContractCodeHistoryEntry.deserialize(b),
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryContractHistoryResponse;
}

/// QueryContractsByCodeRequest is the request type for the Query/ContractsByCode
/// RPC method
class QueryContractsByCodeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryContractsByCodeResponse> {
  final BigInt? codeId;

  /// grpc-gateway_out does not support Go style CodeID
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryContractsByCodeRequest({this.codeId, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/code/{code_id}/contracts",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [codeId, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_id': config.encodeBigint(codeId),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryContractsByCodeRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractsByCodeRequest(
      codeId: json.valueAsBigInt<BigInt?>(
        'code_id',
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

  factory QueryContractsByCodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractsByCodeRequest(
      codeId: decode.getBigInt<BigInt?>(1),
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryContractsByCodeRequest;
  @override
  QueryContractsByCodeResponse onQueryResponse(List<int> bytes) {
    return QueryContractsByCodeResponse.deserialize(bytes);
  }

  @override
  QueryContractsByCodeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryContractsByCodeResponse.fromJson(json);
  }
}

/// QueryContractsByCodeResponse is the response type for the
/// Query/ContractsByCode RPC method
class QueryContractsByCodeResponse extends CosmosProtoMessage {
  /// contracts are a set of contract addresses
  final List<String> contracts;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryContractsByCodeResponse({
    this.contracts = const [],
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
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [contracts, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'contracts': contracts.map((e) => e).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryContractsByCodeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractsByCodeResponse(
      contracts:
          (json.valueEnsureAsList<dynamic>(
            'contracts',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
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

  factory QueryContractsByCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractsByCodeResponse(
      contracts: decode.getListOrEmpty<String>(1),
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryContractsByCodeResponse;
}

/// QueryAllContractStateRequest is the request type for the
/// Query/AllContractState RPC method
class QueryAllContractStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAllContractStateResponse> {
  /// address is the address of the contract
  final String? address;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAllContractStateRequest({this.address, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/contract/{address}/state",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
      ],
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

  factory QueryAllContractStateRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllContractStateRequest(
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

  factory QueryAllContractStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllContractStateRequest(
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryAllContractStateRequest;
  @override
  QueryAllContractStateResponse onQueryResponse(List<int> bytes) {
    return QueryAllContractStateResponse.deserialize(bytes);
  }

  @override
  QueryAllContractStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAllContractStateResponse.fromJson(json);
  }
}

/// QueryAllContractStateResponse is the response type for the
/// Query/AllContractState RPC method
class QueryAllContractStateResponse extends CosmosProtoMessage {
  final List<cosmwasm_wasm_v1_types.Model> models;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAllContractStateResponse({
    this.models = const [],
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
  List<Object?> get protoValues => [models, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'models': models.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryAllContractStateResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAllContractStateResponse(
      models:
          (json.valueEnsureAsList<dynamic>(
                'models',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<cosmwasm_wasm_v1_types.Model, Object>(
                  value: e,
                  parse:
                      (v) => cosmwasm_wasm_v1_types.Model.fromJson(
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

  factory QueryAllContractStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAllContractStateResponse(
      models:
          decode
              .getListOfBytes(1)
              .map((b) => cosmwasm_wasm_v1_types.Model.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryAllContractStateResponse;
}

/// QueryRawContractStateRequest is the request type for the
/// Query/RawContractState RPC method
class QueryRawContractStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryRawContractStateResponse> {
  /// address is the address of the contract
  final String? address;

  final BuBytes? queryData;

  QueryRawContractStateRequest({this.address, List<int>? queryData})
    : queryData = queryData?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/contract/{address}/raw/{query_data}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, queryData];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address, 'query_data': config.encodeBinary(queryData)};
  }

  factory QueryRawContractStateRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryRawContractStateRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      queryData: config.decodeBinary<List<int>?>(
        json.valueAs('query_data', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryRawContractStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRawContractStateRequest(
      address: decode.getString<String?>(1),
      queryData: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryRawContractStateRequest;
  @override
  QueryRawContractStateResponse onQueryResponse(List<int> bytes) {
    return QueryRawContractStateResponse.deserialize(bytes);
  }

  @override
  QueryRawContractStateResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryRawContractStateResponse.fromJson(json);
  }
}

/// QueryRawContractStateResponse is the response type for the
/// Query/RawContractState RPC method
class QueryRawContractStateResponse extends CosmosProtoMessage {
  /// Data contains the raw store data
  final BuBytes? data;

  QueryRawContractStateResponse({List<int>? data})
    : data = data?.asImmutableBytes;

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
  List<Object?> get protoValues => [data];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'data': config.encodeBinary(data)};
  }

  factory QueryRawContractStateResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryRawContractStateResponse(
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryRawContractStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryRawContractStateResponse(data: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryRawContractStateResponse;
}

/// QuerySmartContractStateRequest is the request type for the
/// Query/SmartContractState RPC method
class QuerySmartContractStateRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySmartContractStateResponse> {
  /// address is the address of the contract
  final String? address;

  /// QueryData contains the query data passed to the contract
  final BuBytes? queryData;

  QuerySmartContractStateRequest({this.address, List<int>? queryData})
    : queryData = queryData?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/contract/{address}/smart/{query_data}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(
          2,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "inline_json"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, queryData];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address, 'query_data': config.encodeBinary(queryData)};
  }

  factory QuerySmartContractStateRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySmartContractStateRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      queryData: config.decodeBinary<List<int>?>(
        json.valueAs('query_data', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QuerySmartContractStateRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySmartContractStateRequest(
      address: decode.getString<String?>(1),
      queryData: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QuerySmartContractStateRequest;
  @override
  QuerySmartContractStateResponse onQueryResponse(List<int> bytes) {
    return QuerySmartContractStateResponse.deserialize(bytes);
  }

  @override
  QuerySmartContractStateResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QuerySmartContractStateResponse.fromJson(json);
  }
}

/// QuerySmartContractStateResponse is the response type for the
/// Query/SmartContractState RPC method
class QuerySmartContractStateResponse extends CosmosProtoMessage {
  /// Data contains the json data returned from the smart contract
  final BuBytes? data;

  QuerySmartContractStateResponse({List<int>? data})
    : data = data?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(
          1,
          options: [
            ProtoOptionString(name: "amino.encoding", value: "inline_json"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [data];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'data': config.encodeBinary(data)};
  }

  factory QuerySmartContractStateResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySmartContractStateResponse(
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QuerySmartContractStateResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySmartContractStateResponse(
      data: decode.getBytes<List<int>?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QuerySmartContractStateResponse;
}

/// QueryCodeRequest is the request type for the Query/Code RPC method
class QueryCodeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCodeResponse> {
  final BigInt? codeId;

  const QueryCodeRequest({this.codeId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/code/{code_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [codeId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'code_id': config.encodeBigint(codeId)};
  }

  factory QueryCodeRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCodeRequest(
      codeId: json.valueAsBigInt<BigInt?>(
        'code_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryCodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCodeRequest(codeId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryCodeRequest;
  @override
  QueryCodeResponse onQueryResponse(List<int> bytes) {
    return QueryCodeResponse.deserialize(bytes);
  }

  @override
  QueryCodeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCodeResponse.fromJson(json);
  }
}

/// grpc-gateway_out does not support Go style CodeID
/// QueryCodeInfoRequest is the request type for the Query/CodeInfo RPC method
class QueryCodeInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCodeInfoResponse> {
  final BigInt? codeId;

  const QueryCodeInfoRequest({this.codeId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/code-info/{code_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [codeId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'code_id': config.encodeBigint(codeId)};
  }

  factory QueryCodeInfoRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCodeInfoRequest(
      codeId: json.valueAsBigInt<BigInt?>(
        'code_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryCodeInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCodeInfoRequest(codeId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryCodeInfoRequest;
  @override
  QueryCodeInfoResponse onQueryResponse(List<int> bytes) {
    return QueryCodeInfoResponse.deserialize(bytes);
  }

  @override
  QueryCodeInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCodeInfoResponse.fromJson(json);
  }
}

/// grpc-gateway_out does not support Go style CodeID
/// QueryCodeInfoResponse is the response type for the Query/CodeInfo RPC method
class QueryCodeInfoResponse extends CosmosProtoMessage {
  final BigInt? codeId;

  final String? creator;

  final BuBytes? checksum;

  final cosmwasm_wasm_v1_types.AccessConfig? instantiatePermission;

  QueryCodeInfoResponse({
    this.codeId,
    this.creator,
    List<int>? checksum,
    this.instantiatePermission,
  }) : checksum = checksum?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.bytes(3, options: const []),
        ProtoFieldConfig.message(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    codeId,
    creator,
    checksum,
    instantiatePermission,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_id': config.encodeBigint(codeId),
      'creator': creator,
      'checksum': config.encodeBinary(checksum),
      'instantiate_permission': config.encodeMessage(instantiatePermission),
    };
  }

  factory QueryCodeInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCodeInfoResponse(
      codeId: json.valueAsBigInt<BigInt?>(
        'code_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      creator: json.valueAsString<String?>(
        'creator',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      checksum: config.decodeBinary<List<int>?>(
        json.valueAs('checksum', normalizeKeyLookup: config.normalizeKeys),
      ),
      instantiatePermission: json
          .valueTo<cosmwasm_wasm_v1_types.AccessConfig?, Object>(
            key: 'instantiate_permission',
            parse:
                (v) => cosmwasm_wasm_v1_types.AccessConfig.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryCodeInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCodeInfoResponse(
      codeId: decode.getBigInt<BigInt?>(1),
      creator: decode.getString<String?>(2),
      checksum: decode.getBytes<List<int>?>(3),
      instantiatePermission: decode
          .messageTo<cosmwasm_wasm_v1_types.AccessConfig?>(
            4,
            (b) => cosmwasm_wasm_v1_types.AccessConfig.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryCodeInfoResponse;
}

/// CodeInfoResponse contains code meta data from CodeInfo
class CodeInfoResponse extends CosmosProtoMessage {
  final BigInt? codeId;

  /// id for legacy support
  final String? creator;

  final BuBytes? dataHash;

  /// Used in v1beta1
  final cosmwasm_wasm_v1_types.AccessConfig? instantiatePermission;

  CodeInfoResponse({
    this.codeId,
    this.creator,
    List<int>? dataHash,
    this.instantiatePermission,
  }) : dataHash = dataHash?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.bytes(3, options: const []),
        ProtoFieldConfig.message(
          6,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    codeId,
    creator,
    dataHash,
    instantiatePermission,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_id': config.encodeBigint(codeId),
      'creator': creator,
      'data_hash': config.encodeBinary(dataHash),
      'instantiate_permission': config.encodeMessage(instantiatePermission),
    };
  }

  factory CodeInfoResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return CodeInfoResponse(
      codeId: json.valueAsBigInt<BigInt?>(
        'code_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      creator: json.valueAsString<String?>(
        'creator',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      dataHash: config.decodeBinary<List<int>?>(
        json.valueAs('data_hash', normalizeKeyLookup: config.normalizeKeys),
      ),
      instantiatePermission: json
          .valueTo<cosmwasm_wasm_v1_types.AccessConfig?, Object>(
            key: 'instantiate_permission',
            parse:
                (v) => cosmwasm_wasm_v1_types.AccessConfig.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory CodeInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CodeInfoResponse(
      codeId: decode.getBigInt<BigInt?>(1),
      creator: decode.getString<String?>(2),
      dataHash: decode.getBytes<List<int>?>(3),
      instantiatePermission: decode
          .messageTo<cosmwasm_wasm_v1_types.AccessConfig?>(
            6,
            (b) => cosmwasm_wasm_v1_types.AccessConfig.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1CodeInfoResponse;
}

/// QueryCodeResponse is the response type for the Query/Code RPC method
class QueryCodeResponse extends CosmosProtoMessage {
  final CodeInfoResponse? codeInfo;

  final BuBytes? data;

  QueryCodeResponse({this.codeInfo, List<int>? data})
    : data = data?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.bytes(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [codeInfo, data];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_info': config.encodeMessage(codeInfo),
      'data': config.encodeBinary(data),
    };
  }

  factory QueryCodeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCodeResponse(
      codeInfo: json.valueTo<CodeInfoResponse?, Object>(
        key: 'code_info',
        parse:
            (v) => CodeInfoResponse.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCodeResponse(
      codeInfo: decode.messageTo<CodeInfoResponse?>(
        1,
        (b) => CodeInfoResponse.deserialize(b),
      ),
      data: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryCodeResponse;
}

/// QueryCodesRequest is the request type for the Query/Codes RPC method
class QueryCodesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCodesResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryCodesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/code",
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

  factory QueryCodesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCodesRequest(
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

  factory QueryCodesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCodesRequest(
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryCodesRequest;
  @override
  QueryCodesResponse onQueryResponse(List<int> bytes) {
    return QueryCodesResponse.deserialize(bytes);
  }

  @override
  QueryCodesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCodesResponse.fromJson(json);
  }
}

/// QueryCodesResponse is the response type for the Query/Codes RPC method
class QueryCodesResponse extends CosmosProtoMessage {
  final List<CodeInfoResponse> codeInfos;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryCodesResponse({this.codeInfos = const [], this.pagination});

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
  List<Object?> get protoValues => [codeInfos, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_infos': codeInfos.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryCodesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCodesResponse(
      codeInfos:
          (json.valueEnsureAsList<dynamic>(
                'code_infos',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<CodeInfoResponse, Object>(
                  value: e,
                  parse:
                      (v) => CodeInfoResponse.fromJson(
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

  factory QueryCodesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCodesResponse(
      codeInfos:
          decode
              .getListOfBytes(1)
              .map((b) => CodeInfoResponse.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryCodesResponse;
}

/// QueryPinnedCodesRequest is the request type for the Query/PinnedCodes
/// RPC method
class QueryPinnedCodesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryPinnedCodesResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryPinnedCodesRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/codes/pinned",
        ),
      ],
      fields: [ProtoFieldConfig.message(2)],
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

  factory QueryPinnedCodesRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPinnedCodesRequest(
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

  factory QueryPinnedCodesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPinnedCodesRequest(
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryPinnedCodesRequest;
  @override
  QueryPinnedCodesResponse onQueryResponse(List<int> bytes) {
    return QueryPinnedCodesResponse.deserialize(bytes);
  }

  @override
  QueryPinnedCodesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryPinnedCodesResponse.fromJson(json);
  }
}

/// QueryPinnedCodesResponse is the response type for the
/// Query/PinnedCodes RPC method
class QueryPinnedCodesResponse extends CosmosProtoMessage {
  final List<BigInt> codeIds;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryPinnedCodesResponse({this.codeIds = const [], this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.uint64,
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [codeIds, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_ids': codeIds.map((e) => config.encodeBigint(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryPinnedCodesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryPinnedCodesResponse(
      codeIds:
          (json.valueEnsureAsList<dynamic>(
            'code_ids',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
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

  factory QueryPinnedCodesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryPinnedCodesResponse(
      codeIds: decode.getListOrEmpty<BigInt>(1),
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryPinnedCodesResponse;
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
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/codes/params",
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryParamsRequest;
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
  final cosmwasm_wasm_v1_types.Params? params;

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
      params: json.valueTo<cosmwasm_wasm_v1_types.Params?, Object>(
        key: 'params',
        parse:
            (v) => cosmwasm_wasm_v1_types.Params.fromJson(
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
      params: decode.messageTo<cosmwasm_wasm_v1_types.Params?>(
        1,
        (b) => cosmwasm_wasm_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryParamsResponse;
}

/// QueryContractsByCreatorRequest is the request type for the
/// Query/ContractsByCreator RPC method.
class QueryContractsByCreatorRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryContractsByCreatorResponse> {
  /// CreatorAddress is the address of contract creator
  final String? creatorAddress;

  /// Pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryContractsByCreatorRequest({this.creatorAddress, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/contracts/creator/{creator_address}",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [creatorAddress, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'creator_address': creatorAddress,
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryContractsByCreatorRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractsByCreatorRequest(
      creatorAddress: json.valueAsString<String?>(
        'creator_address',
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

  factory QueryContractsByCreatorRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractsByCreatorRequest(
      creatorAddress: decode.getString<String?>(1),
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryContractsByCreatorRequest;
  @override
  QueryContractsByCreatorResponse onQueryResponse(List<int> bytes) {
    return QueryContractsByCreatorResponse.deserialize(bytes);
  }

  @override
  QueryContractsByCreatorResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryContractsByCreatorResponse.fromJson(json);
  }
}

/// QueryContractsByCreatorResponse is the response type for the
/// Query/ContractsByCreator RPC method.
class QueryContractsByCreatorResponse extends CosmosProtoMessage {
  /// ContractAddresses result set
  final List<String> contractAddresses;

  /// Pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryContractsByCreatorResponse({
    this.contractAddresses = const [],
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
          elementType: ProtoFieldType.string,
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [contractAddresses, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'contract_addresses': contractAddresses.map((e) => e).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryContractsByCreatorResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryContractsByCreatorResponse(
      contractAddresses:
          (json.valueEnsureAsList<dynamic>(
            'contract_addresses',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
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

  factory QueryContractsByCreatorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryContractsByCreatorResponse(
      contractAddresses: decode.getListOrEmpty<String>(1),
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
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryContractsByCreatorResponse;
}

/// QueryWasmLimitsConfigRequest is the request type for the
/// Query/WasmLimitsConfig RPC method.
class QueryWasmLimitsConfigRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryWasmLimitsConfigResponse> {
  const QueryWasmLimitsConfigRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/wasm-limits-config",
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

  factory QueryWasmLimitsConfigRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryWasmLimitsConfigRequest();
  }

  factory QueryWasmLimitsConfigRequest.deserialize(List<int> bytes) {
    return QueryWasmLimitsConfigRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryWasmLimitsConfigRequest;
  @override
  QueryWasmLimitsConfigResponse onQueryResponse(List<int> bytes) {
    return QueryWasmLimitsConfigResponse.deserialize(bytes);
  }

  @override
  QueryWasmLimitsConfigResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryWasmLimitsConfigResponse.fromJson(json);
  }
}

/// QueryWasmLimitsConfigResponse is the response type for the
/// Query/WasmLimitsConfig RPC method. It contains the JSON encoded limits for
/// static validation of Wasm files.
class QueryWasmLimitsConfigResponse extends CosmosProtoMessage {
  final String? config;

  const QueryWasmLimitsConfigResponse({this.config});

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
  List<Object?> get protoValues => [config];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'config': this.config};
  }

  factory QueryWasmLimitsConfigResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryWasmLimitsConfigResponse(
      config: json.valueAsString<String?>(
        'config',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryWasmLimitsConfigResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryWasmLimitsConfigResponse(config: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryWasmLimitsConfigResponse;
}

/// QueryBuildAddressRequest is the request type for the Query/BuildAddress RPC
/// method.
class QueryBuildAddressRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBuildAddressResponse> {
  /// CodeHash is the hash of the code
  final String? codeHash;

  /// CreatorAddress is the address of the contract instantiator
  final String? creatorAddress;

  /// Salt is a hex encoded salt
  final String? salt;

  /// InitArgs are optional json encoded init args to be used in contract address
  /// building if provided
  final BuBytes? initArgs;

  QueryBuildAddressRequest({
    this.codeHash,
    this.creatorAddress,
    this.salt,
    List<int>? initArgs,
  }) : initArgs = initArgs?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "cosmos.query.v1.module_query_safe", value: true),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmwasm/wasm/v1/build_address",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.bytes(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [codeHash, creatorAddress, salt, initArgs];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'code_hash': codeHash,
      'creator_address': creatorAddress,
      'salt': salt,
      'init_args': config.encodeBinary(initArgs),
    };
  }

  factory QueryBuildAddressRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBuildAddressRequest(
      codeHash: json.valueAsString<String?>(
        'code_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      creatorAddress: json.valueAsString<String?>(
        'creator_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      salt: json.valueAsString<String?>(
        'salt',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      initArgs: config.decodeBinary<List<int>?>(
        json.valueAs('init_args', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryBuildAddressRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBuildAddressRequest(
      codeHash: decode.getString<String?>(1),
      creatorAddress: decode.getString<String?>(2),
      salt: decode.getString<String?>(3),
      initArgs: decode.getBytes<List<int>?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryBuildAddressRequest;
  @override
  QueryBuildAddressResponse onQueryResponse(List<int> bytes) {
    return QueryBuildAddressResponse.deserialize(bytes);
  }

  @override
  QueryBuildAddressResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBuildAddressResponse.fromJson(json);
  }
}

/// QueryBuildAddressResponse is the response type for the Query/BuildAddress RPC
/// method.
class QueryBuildAddressResponse extends CosmosProtoMessage {
  /// Address is the contract address
  final String? address;

  const QueryBuildAddressResponse({this.address});

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
  List<Object?> get protoValues => [address];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address};
  }

  factory QueryBuildAddressResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBuildAddressResponse(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBuildAddressResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBuildAddressResponse(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmwasmWasmV1QueryBuildAddressResponse;
}
