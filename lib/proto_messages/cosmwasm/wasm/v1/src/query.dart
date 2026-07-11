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
  Map<String, dynamic> toJson() {
    return {'address': address};
  }

  factory QueryContractInfoRequest.fromJson(Map<String, dynamic> json) {
    return QueryContractInfoRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'address': address, 'contract_info': contractInfo?.toJson()};
  }

  factory QueryContractInfoResponse.fromJson(Map<String, dynamic> json) {
    return QueryContractInfoResponse(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      contractInfo: json
          .valueTo<cosmwasm_wasm_v1_types.ContractInfo?, Map<String, dynamic>>(
            key: 'contract_info',
            parse: (v) => cosmwasm_wasm_v1_types.ContractInfo.fromJson(v),
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'address': address, 'pagination': pagination?.toJson()};
  }

  factory QueryContractHistoryRequest.fromJson(Map<String, dynamic> json) {
    return QueryContractHistoryRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'entries': entries.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryContractHistoryResponse.fromJson(Map<String, dynamic> json) {
    return QueryContractHistoryResponse(
      entries:
          (json.valueEnsureAsList<dynamic>('entries', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmwasm_wasm_v1_types.ContractCodeHistoryEntry,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) => cosmwasm_wasm_v1_types
                          .ContractCodeHistoryEntry.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'code_id': codeId?.toString(), 'pagination': pagination?.toJson()};
  }

  factory QueryContractsByCodeRequest.fromJson(Map<String, dynamic> json) {
    return QueryContractsByCodeRequest(
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'contracts': contracts.map((e) => e).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryContractsByCodeResponse.fromJson(Map<String, dynamic> json) {
    return QueryContractsByCodeResponse(
      contracts:
          (json.valueEnsureAsList<dynamic>(
            'contracts',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
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
  Map<String, dynamic> toJson() {
    return {'address': address, 'pagination': pagination?.toJson()};
  }

  factory QueryAllContractStateRequest.fromJson(Map<String, dynamic> json) {
    return QueryAllContractStateRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'models': models.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAllContractStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryAllContractStateResponse(
      models:
          (json.valueEnsureAsList<dynamic>('models', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmwasm_wasm_v1_types.Model,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmwasm_wasm_v1_types.Model.fromJson(v),
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

  final List<int>? queryData;

  const QueryRawContractStateRequest({this.address, this.queryData});

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
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'query_data': switch (queryData) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryRawContractStateRequest.fromJson(Map<String, dynamic> json) {
    return QueryRawContractStateRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      queryData: json.valueAsBytes<List<int>?>(
        'query_data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  final List<int>? data;

  const QueryRawContractStateResponse({this.data});

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
  Map<String, dynamic> toJson() {
    return {
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryRawContractStateResponse.fromJson(Map<String, dynamic> json) {
    return QueryRawContractStateResponse(
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  final List<int>? queryData;

  const QuerySmartContractStateRequest({this.address, this.queryData});

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
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'query_data': switch (queryData) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QuerySmartContractStateRequest.fromJson(Map<String, dynamic> json) {
    return QuerySmartContractStateRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      queryData: json.valueAsBytes<List<int>?>(
        'query_data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  final List<int>? data;

  const QuerySmartContractStateResponse({this.data});

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
  Map<String, dynamic> toJson() {
    return {
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QuerySmartContractStateResponse.fromJson(Map<String, dynamic> json) {
    return QuerySmartContractStateResponse(
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {'code_id': codeId?.toString()};
  }

  factory QueryCodeRequest.fromJson(Map<String, dynamic> json) {
    return QueryCodeRequest(
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'code_id': codeId?.toString()};
  }

  factory QueryCodeInfoRequest.fromJson(Map<String, dynamic> json) {
    return QueryCodeInfoRequest(
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
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

  final List<int>? checksum;

  final cosmwasm_wasm_v1_types.AccessConfig? instantiatePermission;

  const QueryCodeInfoResponse({
    this.codeId,
    this.creator,
    this.checksum,
    this.instantiatePermission,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'code_id': codeId?.toString(),
      'creator': creator,
      'checksum': switch (checksum) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'instantiate_permission': instantiatePermission?.toJson(),
    };
  }

  factory QueryCodeInfoResponse.fromJson(Map<String, dynamic> json) {
    return QueryCodeInfoResponse(
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      checksum: json.valueAsBytes<List<int>?>(
        'checksum',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      instantiatePermission: json
          .valueTo<cosmwasm_wasm_v1_types.AccessConfig?, Map<String, dynamic>>(
            key: 'instantiate_permission',
            parse: (v) => cosmwasm_wasm_v1_types.AccessConfig.fromJson(v),
            acceptCamelCase: true,
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

  final List<int>? dataHash;

  /// Used in v1beta1
  final cosmwasm_wasm_v1_types.AccessConfig? instantiatePermission;

  const CodeInfoResponse({
    this.codeId,
    this.creator,
    this.dataHash,
    this.instantiatePermission,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'code_id': codeId?.toString(),
      'creator': creator,
      'data_hash': switch (dataHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'instantiate_permission': instantiatePermission?.toJson(),
    };
  }

  factory CodeInfoResponse.fromJson(Map<String, dynamic> json) {
    return CodeInfoResponse(
      codeId: json.valueAsBigInt<BigInt?>('code_id', acceptCamelCase: true),
      creator: json.valueAsString<String?>('creator', acceptCamelCase: true),
      dataHash: json.valueAsBytes<List<int>?>(
        'data_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      instantiatePermission: json
          .valueTo<cosmwasm_wasm_v1_types.AccessConfig?, Map<String, dynamic>>(
            key: 'instantiate_permission',
            parse: (v) => cosmwasm_wasm_v1_types.AccessConfig.fromJson(v),
            acceptCamelCase: true,
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

  final List<int>? data;

  const QueryCodeResponse({this.codeInfo, this.data});

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
  Map<String, dynamic> toJson() {
    return {
      'code_info': codeInfo?.toJson(),
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryCodeResponse.fromJson(Map<String, dynamic> json) {
    return QueryCodeResponse(
      codeInfo: json.valueTo<CodeInfoResponse?, Map<String, dynamic>>(
        key: 'code_info',
        parse: (v) => CodeInfoResponse.fromJson(v),
        acceptCamelCase: true,
      ),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QueryCodesRequest.fromJson(Map<String, dynamic> json) {
    return QueryCodesRequest(
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
  Map<String, dynamic> toJson() {
    return {
      'code_infos': codeInfos.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryCodesResponse.fromJson(Map<String, dynamic> json) {
    return QueryCodesResponse(
      codeInfos:
          (json.valueEnsureAsList<dynamic>('code_infos', acceptCamelCase: true))
              .map(
                (e) =>
                    JsonParser.valueTo<CodeInfoResponse, Map<String, dynamic>>(
                      value: e,
                      parse: (v) => CodeInfoResponse.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {'pagination': pagination?.toJson()};
  }

  factory QueryPinnedCodesRequest.fromJson(Map<String, dynamic> json) {
    return QueryPinnedCodesRequest(
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
  Map<String, dynamic> toJson() {
    return {
      'code_ids': codeIds.map((e) => e.toString()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryPinnedCodesResponse.fromJson(Map<String, dynamic> json) {
    return QueryPinnedCodesResponse(
      codeIds:
          (json.valueEnsureAsList<dynamic>(
            'code_ids',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsBigInt<BigInt>(e)).toList(),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryParamsRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json
          .valueTo<cosmwasm_wasm_v1_types.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => cosmwasm_wasm_v1_types.Params.fromJson(v),
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'creator_address': creatorAddress,
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryContractsByCreatorRequest.fromJson(Map<String, dynamic> json) {
    return QueryContractsByCreatorRequest(
      creatorAddress: json.valueAsString<String?>(
        'creator_address',
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
  Map<String, dynamic> toJson() {
    return {
      'contract_addresses': contractAddresses.map((e) => e).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryContractsByCreatorResponse.fromJson(Map<String, dynamic> json) {
    return QueryContractsByCreatorResponse(
      contractAddresses:
          (json.valueEnsureAsList<dynamic>(
            'contract_addresses',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryWasmLimitsConfigRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'config': config};
  }

  factory QueryWasmLimitsConfigResponse.fromJson(Map<String, dynamic> json) {
    return QueryWasmLimitsConfigResponse(
      config: json.valueAsString<String?>('config', acceptCamelCase: true),
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
  final List<int>? initArgs;

  const QueryBuildAddressRequest({
    this.codeHash,
    this.creatorAddress,
    this.salt,
    this.initArgs,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'code_hash': codeHash,
      'creator_address': creatorAddress,
      'salt': salt,
      'init_args': switch (initArgs) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory QueryBuildAddressRequest.fromJson(Map<String, dynamic> json) {
    return QueryBuildAddressRequest(
      codeHash: json.valueAsString<String?>('code_hash', acceptCamelCase: true),
      creatorAddress: json.valueAsString<String?>(
        'creator_address',
        acceptCamelCase: true,
      ),
      salt: json.valueAsString<String?>('salt', acceptCamelCase: true),
      initArgs: json.valueAsBytes<List<int>?>(
        'init_args',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {'address': address};
  }

  factory QueryBuildAddressResponse.fromJson(Map<String, dynamic> json) {
    return QueryBuildAddressResponse(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
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
