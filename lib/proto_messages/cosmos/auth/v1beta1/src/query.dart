import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/auth/v1beta1/src/auth.dart"
    as cosmos_auth_v1beta1_auth;

/// QueryAccountsRequest is the request type for the Query/Accounts RPC method.
class QueryAccountsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAccountsResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryAccountsRequest({this.pagination});

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
          path: "/cosmos/auth/v1beta1/accounts",
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

  factory QueryAccountsRequest.fromJson(Map<String, dynamic> json) {
    return QueryAccountsRequest(
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

  factory QueryAccountsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountsRequest(
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
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1QueryAccountsRequest;
  @override
  QueryAccountsResponse onQueryResponse(List<int> bytes) {
    return QueryAccountsResponse.deserialize(bytes);
  }

  @override
  QueryAccountsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAccountsResponse.fromJson(json);
  }
}

/// QueryAccountsResponse is the response type for the Query/Accounts RPC method.
class QueryAccountsResponse extends CosmosProtoMessage {
  /// accounts are the existing accounts
  final List<google_protobuf_any.Any> accounts;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryAccountsResponse({this.accounts = const [], this.pagination});

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
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [accounts, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'accounts': accounts.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryAccountsResponse.fromJson(Map<String, dynamic> json) {
    return QueryAccountsResponse(
      accounts:
          (json.valueEnsureAsList<dynamic>('accounts', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
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

  factory QueryAccountsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountsResponse(
      accounts:
          decode
              .getListOfBytes(1)
              .map((b) => google_protobuf_any.Any.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1QueryAccountsResponse;
}

/// QueryAccountRequest is the request type for the Query/Account RPC method.
class QueryAccountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAccountResponse> {
  /// address defines the address to query for.
  final String? address;

  const QueryAccountRequest({this.address});

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
          path: "/cosmos/auth/v1beta1/accounts/{address}",
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

  factory QueryAccountRequest.fromJson(Map<String, dynamic> json) {
    return QueryAccountRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1QueryAccountRequest;
  @override
  QueryAccountResponse onQueryResponse(List<int> bytes) {
    return QueryAccountResponse.deserialize(bytes);
  }

  @override
  QueryAccountResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAccountResponse.fromJson(json);
  }
}

/// QueryAccountResponse is the response type for the Query/Account RPC method.
class QueryAccountResponse extends CosmosProtoMessage {
  /// account defines the account of the corresponding address.
  final google_protobuf_any.Any? account;

  const QueryAccountResponse({this.account});

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
  List<Object?> get protoValues => [account];

  @override
  Map<String, dynamic> toJson() {
    return {'account': account?.toJson()};
  }

  factory QueryAccountResponse.fromJson(Map<String, dynamic> json) {
    return QueryAccountResponse(
      account: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'account',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountResponse(
      account: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1QueryAccountResponse;
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
          path: "/cosmos/auth/v1beta1/params",
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
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1QueryParamsRequest;
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
  final cosmos_auth_v1beta1_auth.Params? params;

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
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json
          .valueTo<cosmos_auth_v1beta1_auth.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => cosmos_auth_v1beta1_auth.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<cosmos_auth_v1beta1_auth.Params?>(
        1,
        (b) => cosmos_auth_v1beta1_auth.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1QueryParamsResponse;
}

/// QueryModuleAccountsRequest is the request type for the Query/ModuleAccounts RPC method.
class QueryModuleAccountsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryModuleAccountsResponse> {
  const QueryModuleAccountsRequest();

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
          path: "/cosmos/auth/v1beta1/module_accounts",
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

  factory QueryModuleAccountsRequest.fromJson(Map<String, dynamic> json) {
    return QueryModuleAccountsRequest();
  }

  factory QueryModuleAccountsRequest.deserialize(List<int> bytes) {
    return QueryModuleAccountsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1QueryModuleAccountsRequest;
  @override
  QueryModuleAccountsResponse onQueryResponse(List<int> bytes) {
    return QueryModuleAccountsResponse.deserialize(bytes);
  }

  @override
  QueryModuleAccountsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryModuleAccountsResponse.fromJson(json);
  }
}

/// QueryModuleAccountsResponse is the response type for the Query/ModuleAccounts RPC method.
class QueryModuleAccountsResponse extends CosmosProtoMessage {
  final List<google_protobuf_any.Any> accounts;

  const QueryModuleAccountsResponse({this.accounts = const []});

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
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [accounts];

  @override
  Map<String, dynamic> toJson() {
    return {'accounts': accounts.map((e) => e.toJson()).toList()};
  }

  factory QueryModuleAccountsResponse.fromJson(Map<String, dynamic> json) {
    return QueryModuleAccountsResponse(
      accounts:
          (json.valueEnsureAsList<dynamic>('accounts', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
              )
              .toList(),
    );
  }

  factory QueryModuleAccountsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleAccountsResponse(
      accounts:
          decode
              .getListOfBytes(1)
              .map((b) => google_protobuf_any.Any.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1QueryModuleAccountsResponse;
}

/// QueryModuleAccountByNameRequest is the request type for the Query/ModuleAccountByName RPC method.
class QueryModuleAccountByNameRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryModuleAccountByNameResponse> {
  final String? name;

  const QueryModuleAccountByNameRequest({this.name});

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
          path: "/cosmos/auth/v1beta1/module_accounts/{name}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [name];

  @override
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  factory QueryModuleAccountByNameRequest.fromJson(Map<String, dynamic> json) {
    return QueryModuleAccountByNameRequest(
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
    );
  }

  factory QueryModuleAccountByNameRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleAccountByNameRequest(name: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosAuthV1beta1QueryModuleAccountByNameRequest;
  @override
  QueryModuleAccountByNameResponse onQueryResponse(List<int> bytes) {
    return QueryModuleAccountByNameResponse.deserialize(bytes);
  }

  @override
  QueryModuleAccountByNameResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryModuleAccountByNameResponse.fromJson(json);
  }
}

/// QueryModuleAccountByNameResponse is the response type for the Query/ModuleAccountByName RPC method.
class QueryModuleAccountByNameResponse extends CosmosProtoMessage {
  final google_protobuf_any.Any? account;

  const QueryModuleAccountByNameResponse({this.account});

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
  List<Object?> get protoValues => [account];

  @override
  Map<String, dynamic> toJson() {
    return {'account': account?.toJson()};
  }

  factory QueryModuleAccountByNameResponse.fromJson(Map<String, dynamic> json) {
    return QueryModuleAccountByNameResponse(
      account: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'account',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryModuleAccountByNameResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryModuleAccountByNameResponse(
      account: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosAuthV1beta1QueryModuleAccountByNameResponse;
}

/// Bech32PrefixRequest is the request type for Bech32Prefix rpc method.
class Bech32PrefixRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<Bech32PrefixResponse> {
  const Bech32PrefixRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/auth/v1beta1/bech32",
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

  factory Bech32PrefixRequest.fromJson(Map<String, dynamic> json) {
    return Bech32PrefixRequest();
  }

  factory Bech32PrefixRequest.deserialize(List<int> bytes) {
    return Bech32PrefixRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1Bech32PrefixRequest;
  @override
  Bech32PrefixResponse onQueryResponse(List<int> bytes) {
    return Bech32PrefixResponse.deserialize(bytes);
  }

  @override
  Bech32PrefixResponse onQueryResponseJson(Map<String, dynamic> json) {
    return Bech32PrefixResponse.fromJson(json);
  }
}

/// Bech32PrefixResponse is the response type for Bech32Prefix rpc method.
class Bech32PrefixResponse extends CosmosProtoMessage {
  final String? bech32Prefix;

  const Bech32PrefixResponse({this.bech32Prefix});

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
  List<Object?> get protoValues => [bech32Prefix];

  @override
  Map<String, dynamic> toJson() {
    return {'bech32_prefix': bech32Prefix};
  }

  factory Bech32PrefixResponse.fromJson(Map<String, dynamic> json) {
    return Bech32PrefixResponse(
      bech32Prefix: json.valueAsString<String?>(
        'bech32_prefix',
        acceptCamelCase: true,
      ),
    );
  }

  factory Bech32PrefixResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Bech32PrefixResponse(bech32Prefix: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1Bech32PrefixResponse;
}

/// AddressBytesToStringRequest is the request type for AddressString rpc method.
class AddressBytesToStringRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AddressBytesToStringResponse> {
  final List<int>? addressBytes;

  const AddressBytesToStringRequest({this.addressBytes});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/auth/v1beta1/bech32/{address_bytes}",
        ),
      ],
      fields: [ProtoFieldConfig.bytes(1)],
    );
  }

  @override
  List<Object?> get protoValues => [addressBytes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address_bytes': switch (addressBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory AddressBytesToStringRequest.fromJson(Map<String, dynamic> json) {
    return AddressBytesToStringRequest(
      addressBytes: json.valueAsBytes<List<int>?>(
        'address_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory AddressBytesToStringRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AddressBytesToStringRequest(
      addressBytes: decode.getBytes<List<int>?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1AddressBytesToStringRequest;
  @override
  AddressBytesToStringResponse onQueryResponse(List<int> bytes) {
    return AddressBytesToStringResponse.deserialize(bytes);
  }

  @override
  AddressBytesToStringResponse onQueryResponseJson(Map<String, dynamic> json) {
    return AddressBytesToStringResponse.fromJson(json);
  }
}

/// AddressBytesToStringResponse is the response type for AddressString rpc method.
class AddressBytesToStringResponse extends CosmosProtoMessage {
  final String? addressString;

  const AddressBytesToStringResponse({this.addressString});

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
  List<Object?> get protoValues => [addressString];

  @override
  Map<String, dynamic> toJson() {
    return {'address_string': addressString};
  }

  factory AddressBytesToStringResponse.fromJson(Map<String, dynamic> json) {
    return AddressBytesToStringResponse(
      addressString: json.valueAsString<String?>(
        'address_string',
        acceptCamelCase: true,
      ),
    );
  }

  factory AddressBytesToStringResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AddressBytesToStringResponse(
      addressString: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1AddressBytesToStringResponse;
}

/// AddressStringToBytesRequest is the request type for AccountBytes rpc method.
class AddressStringToBytesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<AddressStringToBytesResponse> {
  final String? addressString;

  const AddressStringToBytesRequest({this.addressString});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/auth/v1beta1/bech32/{address_string}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [addressString];

  @override
  Map<String, dynamic> toJson() {
    return {'address_string': addressString};
  }

  factory AddressStringToBytesRequest.fromJson(Map<String, dynamic> json) {
    return AddressStringToBytesRequest(
      addressString: json.valueAsString<String?>(
        'address_string',
        acceptCamelCase: true,
      ),
    );
  }

  factory AddressStringToBytesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AddressStringToBytesRequest(
      addressString: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1AddressStringToBytesRequest;
  @override
  AddressStringToBytesResponse onQueryResponse(List<int> bytes) {
    return AddressStringToBytesResponse.deserialize(bytes);
  }

  @override
  AddressStringToBytesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return AddressStringToBytesResponse.fromJson(json);
  }
}

/// AddressStringToBytesResponse is the response type for AddressBytes rpc method.
class AddressStringToBytesResponse extends CosmosProtoMessage {
  final List<int>? addressBytes;

  const AddressStringToBytesResponse({this.addressBytes});

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
  List<Object?> get protoValues => [addressBytes];

  @override
  Map<String, dynamic> toJson() {
    return {
      'address_bytes': switch (addressBytes) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory AddressStringToBytesResponse.fromJson(Map<String, dynamic> json) {
    return AddressStringToBytesResponse(
      addressBytes: json.valueAsBytes<List<int>?>(
        'address_bytes',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory AddressStringToBytesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return AddressStringToBytesResponse(
      addressBytes: decode.getBytes<List<int>?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1AddressStringToBytesResponse;
}

/// QueryAccountAddressByIDRequest is the request type for AccountAddressByID rpc method
class QueryAccountAddressByIDRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAccountAddressByIDResponse> {
  /// Deprecated, use account_id instead
  ///
  /// id is the account number of the address to be queried. This field
  /// should have been an uint64 (like all account numbers), and will be
  /// updated to uint64 in a future version of the auth query.
  final BigInt? id;

  /// account_id is the account number of the address to be queried.
  final BigInt? accountId;

  const QueryAccountAddressByIDRequest({this.id, this.accountId});

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
          path: "/cosmos/auth/v1beta1/address_by_id/{id}",
        ),
      ],
      fields: [
        ProtoFieldConfig.int64(
          1,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.uint64(
          2,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.47",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [id, accountId];

  @override
  Map<String, dynamic> toJson() {
    return {'id': id?.toString(), 'account_id': accountId?.toString()};
  }

  factory QueryAccountAddressByIDRequest.fromJson(Map<String, dynamic> json) {
    return QueryAccountAddressByIDRequest(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
      accountId: json.valueAsBigInt<BigInt?>(
        'account_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryAccountAddressByIDRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountAddressByIDRequest(
      id: decode.getBigInt<BigInt?>(1),
      accountId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1QueryAccountAddressByIDRequest;
  @override
  QueryAccountAddressByIDResponse onQueryResponse(List<int> bytes) {
    return QueryAccountAddressByIDResponse.deserialize(bytes);
  }

  @override
  QueryAccountAddressByIDResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryAccountAddressByIDResponse.fromJson(json);
  }
}

/// QueryAccountAddressByIDResponse is the response type for AccountAddressByID rpc method
class QueryAccountAddressByIDResponse extends CosmosProtoMessage {
  final String? accountAddress;

  const QueryAccountAddressByIDResponse({this.accountAddress});

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
  List<Object?> get protoValues => [accountAddress];

  @override
  Map<String, dynamic> toJson() {
    return {'account_address': accountAddress};
  }

  factory QueryAccountAddressByIDResponse.fromJson(Map<String, dynamic> json) {
    return QueryAccountAddressByIDResponse(
      accountAddress: json.valueAsString<String?>(
        'account_address',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryAccountAddressByIDResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountAddressByIDResponse(
      accountAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .cosmosAuthV1beta1QueryAccountAddressByIDResponse;
}

/// QueryAccountInfoRequest is the Query/AccountInfo request type.
class QueryAccountInfoRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAccountInfoResponse> {
  /// address is the account address string.
  final String? address;

  const QueryAccountInfoRequest({this.address});

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
          path: "/cosmos/auth/v1beta1/account_info/{address}",
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

  factory QueryAccountInfoRequest.fromJson(Map<String, dynamic> json) {
    return QueryAccountInfoRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
    );
  }

  factory QueryAccountInfoRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountInfoRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1QueryAccountInfoRequest;
  @override
  QueryAccountInfoResponse onQueryResponse(List<int> bytes) {
    return QueryAccountInfoResponse.deserialize(bytes);
  }

  @override
  QueryAccountInfoResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAccountInfoResponse.fromJson(json);
  }
}

/// QueryAccountInfoResponse is the Query/AccountInfo response type.
class QueryAccountInfoResponse extends CosmosProtoMessage {
  /// info is the account info which is represented by BaseAccount.
  final cosmos_auth_v1beta1_auth.BaseAccount? info;

  const QueryAccountInfoResponse({this.info});

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
  List<Object?> get protoValues => [info];

  @override
  Map<String, dynamic> toJson() {
    return {'info': info?.toJson()};
  }

  factory QueryAccountInfoResponse.fromJson(Map<String, dynamic> json) {
    return QueryAccountInfoResponse(
      info: json
          .valueTo<cosmos_auth_v1beta1_auth.BaseAccount?, Map<String, dynamic>>(
            key: 'info',
            parse: (v) => cosmos_auth_v1beta1_auth.BaseAccount.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory QueryAccountInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountInfoResponse(
      info: decode.messageTo<cosmos_auth_v1beta1_auth.BaseAccount?>(
        1,
        (b) => cosmos_auth_v1beta1_auth.BaseAccount.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosAuthV1beta1QueryAccountInfoResponse;
}
