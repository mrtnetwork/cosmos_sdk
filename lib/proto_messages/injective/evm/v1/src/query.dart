import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/injective/evm/v1/src/params.dart"
    as injective_evm_v1_params;
import "package:cosmos_sdk/proto_messages/injective/evm/v1/src/tx.dart"
    as injective_evm_v1_tx;
import "package:cosmos_sdk/proto_messages/injective/evm/v1/src/trace_config.dart"
    as injective_evm_v1_trace_config;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// QueryAccountRequest is the request type for the Query/Account RPC method.
class QueryAccountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAccountResponse> {
  /// address is the ethereum hex address to query the account for.
  final String? address;

  const QueryAccountRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/evm/v1/account/{address}",
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

  factory QueryAccountRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAccountRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryAccountRequest;
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
  /// balance is the balance of the EVM denomination.
  final String? balance;

  /// code_hash is the hex-formatted code bytes from the EOA.
  final String? codeHash;

  /// nonce is the account's sequence number.
  final BigInt? nonce;

  const QueryAccountResponse({this.balance, this.codeHash, this.nonce});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [balance, codeHash, nonce];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'balance': balance,
      'code_hash': codeHash,
      'nonce': config.encodeBigint(nonce),
    };
  }

  factory QueryAccountResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAccountResponse(
      balance: json.valueAsString<String?>(
        'balance',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      codeHash: json.valueAsString<String?>(
        'code_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      nonce: json.valueAsBigInt<BigInt?>(
        'nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAccountResponse(
      balance: decode.getString<String?>(1),
      codeHash: decode.getString<String?>(2),
      nonce: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryAccountResponse;
}

/// QueryCosmosAccountRequest is the request type for the Query/CosmosAccount RPC
/// method.
class QueryCosmosAccountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCosmosAccountResponse> {
  /// address is the ethereum hex address to query the account for.
  final String? address;

  const QueryCosmosAccountRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/evm/v1/cosmos_account/{address}",
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

  factory QueryCosmosAccountRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCosmosAccountRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryCosmosAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCosmosAccountRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryCosmosAccountRequest;
  @override
  QueryCosmosAccountResponse onQueryResponse(List<int> bytes) {
    return QueryCosmosAccountResponse.deserialize(bytes);
  }

  @override
  QueryCosmosAccountResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCosmosAccountResponse.fromJson(json);
  }
}

/// QueryCosmosAccountResponse is the response type for the Query/CosmosAccount
/// RPC method.
class QueryCosmosAccountResponse extends CosmosProtoMessage {
  /// cosmos_address is the cosmos address of the account.
  final String? cosmosAddress;

  /// sequence is the account's sequence number.
  final BigInt? sequence;

  /// account_number is the account number
  final BigInt? accountNumber;

  const QueryCosmosAccountResponse({
    this.cosmosAddress,
    this.sequence,
    this.accountNumber,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [cosmosAddress, sequence, accountNumber];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'cosmos_address': cosmosAddress,
      'sequence': config.encodeBigint(sequence),
      'account_number': config.encodeBigint(accountNumber),
    };
  }

  factory QueryCosmosAccountResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCosmosAccountResponse(
      cosmosAddress: json.valueAsString<String?>(
        'cosmos_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sequence: json.valueAsBigInt<BigInt?>(
        'sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      accountNumber: json.valueAsBigInt<BigInt?>(
        'account_number',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryCosmosAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCosmosAccountResponse(
      cosmosAddress: decode.getString<String?>(1),
      sequence: decode.getBigInt<BigInt?>(2),
      accountNumber: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryCosmosAccountResponse;
}

/// QueryValidatorAccountRequest is the request type for the
/// Query/ValidatorAccount RPC method.
class QueryValidatorAccountRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryValidatorAccountResponse> {
  /// cons_address is the validator cons address to query the account for.
  final String? consAddress;

  const QueryValidatorAccountRequest({this.consAddress});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/evm/v1/validator_account/{cons_address}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [consAddress];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'cons_address': consAddress};
  }

  factory QueryValidatorAccountRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryValidatorAccountRequest(
      consAddress: json.valueAsString<String?>(
        'cons_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryValidatorAccountRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorAccountRequest(
      consAddress: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryValidatorAccountRequest;
  @override
  QueryValidatorAccountResponse onQueryResponse(List<int> bytes) {
    return QueryValidatorAccountResponse.deserialize(bytes);
  }

  @override
  QueryValidatorAccountResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryValidatorAccountResponse.fromJson(json);
  }
}

/// QueryValidatorAccountResponse is the response type for the
/// Query/ValidatorAccount RPC method.
class QueryValidatorAccountResponse extends CosmosProtoMessage {
  /// account_address is the cosmos address of the account in bech32 format.
  final String? accountAddress;

  /// sequence is the account's sequence number.
  final BigInt? sequence;

  /// account_number is the account number
  final BigInt? accountNumber;

  const QueryValidatorAccountResponse({
    this.accountAddress,
    this.sequence,
    this.accountNumber,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.uint64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [accountAddress, sequence, accountNumber];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'account_address': accountAddress,
      'sequence': config.encodeBigint(sequence),
      'account_number': config.encodeBigint(accountNumber),
    };
  }

  factory QueryValidatorAccountResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryValidatorAccountResponse(
      accountAddress: json.valueAsString<String?>(
        'account_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sequence: json.valueAsBigInt<BigInt?>(
        'sequence',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      accountNumber: json.valueAsBigInt<BigInt?>(
        'account_number',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryValidatorAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryValidatorAccountResponse(
      accountAddress: decode.getString<String?>(1),
      sequence: decode.getBigInt<BigInt?>(2),
      accountNumber: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryValidatorAccountResponse;
}

/// QueryBalanceRequest is the request type for the Query/Balance RPC method.
class QueryBalanceRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBalanceResponse> {
  /// address is the ethereum hex address to query the balance for.
  final String? address;

  const QueryBalanceRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/evm/v1/balances/{address}",
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

  factory QueryBalanceRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBalanceRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBalanceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBalanceRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryBalanceRequest;
  @override
  QueryBalanceResponse onQueryResponse(List<int> bytes) {
    return QueryBalanceResponse.deserialize(bytes);
  }

  @override
  QueryBalanceResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBalanceResponse.fromJson(json);
  }
}

/// QueryBalanceResponse is the response type for the Query/Balance RPC method.
class QueryBalanceResponse extends CosmosProtoMessage {
  /// balance is the balance of the EVM denomination.
  final String? balance;

  const QueryBalanceResponse({this.balance});

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
  List<Object?> get protoValues => [balance];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'balance': balance};
  }

  factory QueryBalanceResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBalanceResponse(
      balance: json.valueAsString<String?>(
        'balance',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBalanceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBalanceResponse(balance: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryBalanceResponse;
}

/// QueryStorageRequest is the request type for the Query/Storage RPC method.
class QueryStorageRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryStorageResponse> {
  /// address is the ethereum hex address to query the storage state for.
  final String? address;

  /// key defines the key of the storage state
  final String? key;

  const QueryStorageRequest({this.address, this.key});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/evm/v1/storage/{address}/{key}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [address, key];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'address': address, 'key': key};
  }

  factory QueryStorageRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryStorageRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      key: json.valueAsString<String?>(
        'key',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryStorageRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryStorageRequest(
      address: decode.getString<String?>(1),
      key: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryStorageRequest;
  @override
  QueryStorageResponse onQueryResponse(List<int> bytes) {
    return QueryStorageResponse.deserialize(bytes);
  }

  @override
  QueryStorageResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryStorageResponse.fromJson(json);
  }
}

/// QueryStorageResponse is the response type for the Query/Storage RPC
/// method.
class QueryStorageResponse extends CosmosProtoMessage {
  /// value defines the storage state value hash associated with the given key.
  final String? value;

  const QueryStorageResponse({this.value});

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
  List<Object?> get protoValues => [value];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'value': value};
  }

  factory QueryStorageResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryStorageResponse(
      value: json.valueAsString<String?>(
        'value',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryStorageResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryStorageResponse(value: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryStorageResponse;
}

/// QueryCodeRequest is the request type for the Query/Code RPC method.
class QueryCodeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryCodeResponse> {
  /// address is the ethereum hex address to query the code for.
  final String? address;

  const QueryCodeRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/evm/v1/codes/{address}",
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

  factory QueryCodeRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCodeRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryCodeRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCodeRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryCodeRequest;
  @override
  QueryCodeResponse onQueryResponse(List<int> bytes) {
    return QueryCodeResponse.deserialize(bytes);
  }

  @override
  QueryCodeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryCodeResponse.fromJson(json);
  }
}

/// QueryCodeResponse is the response type for the Query/Code RPC
/// method.
class QueryCodeResponse extends CosmosProtoMessage {
  /// code represents the code bytes from an ethereum address.
  final BuBytes? code;

  QueryCodeResponse({List<int>? code}) : code = code?.asImmutableBytes;

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
  List<Object?> get protoValues => [code];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'code': config.encodeBinary(code)};
  }

  factory QueryCodeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryCodeResponse(
      code: config.decodeBinary<List<int>?>(
        json.valueAs('code', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryCodeResponse(code: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryCodeResponse;
}

/// QueryParamsRequest defines the request type for querying x/evm parameters.
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
          path: "/injective/evm/v1/params",
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
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse defines the response type for querying x/evm parameters.
class QueryParamsResponse extends CosmosProtoMessage {
  /// params define the evm module parameters.
  final injective_evm_v1_params.Params? params;

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
      params: json.valueTo<injective_evm_v1_params.Params?, Object>(
        key: 'params',
        parse:
            (v) => injective_evm_v1_params.Params.fromJson(
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
      params: decode.messageTo<injective_evm_v1_params.Params?>(
        1,
        (b) => injective_evm_v1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryParamsResponse;
}

/// EthCallRequest defines EthCall request
class EthCallRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<injective_evm_v1_tx.MsgEthereumTxResponse> {
  /// args uses the same json format as the json rpc api.
  final BuBytes? args;

  /// gas_cap defines the default gas cap to be used
  final BigInt? gasCap;

  /// proposer_address of the requested block in hex format
  final BuBytes? proposerAddress;

  /// chain_id is the eip155 chain id parsed from the requested block header
  final BigInt? chainId;

  /// state overrides encoded as json
  final BuBytes? overrides;

  EthCallRequest({
    List<int>? args,
    this.gasCap,
    List<int>? proposerAddress,
    this.chainId,
    List<int>? overrides,
  }) : args = args?.asImmutableBytes,
       proposerAddress = proposerAddress?.asImmutableBytes,
       overrides = overrides?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/evm/v1/eth_call",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/evm/v1/estimate_gas",
        ),
      ],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.bytes(3, options: const []),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.bytes(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    args,
    gasCap,
    proposerAddress,
    chainId,
    overrides,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'args': config.encodeBinary(args),
      'gas_cap': config.encodeBigint(gasCap),
      'proposer_address': config.encodeBinary(proposerAddress),
      'chain_id': config.encodeBigint(chainId),
      'overrides': config.encodeBinary(overrides),
    };
  }

  factory EthCallRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return EthCallRequest(
      args: config.decodeBinary<List<int>?>(
        json.valueAs('args', normalizeKeyLookup: config.normalizeKeys),
      ),
      gasCap: json.valueAsBigInt<BigInt?>(
        'gas_cap',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proposerAddress: config.decodeBinary<List<int>?>(
        json.valueAs(
          'proposer_address',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      chainId: json.valueAsBigInt<BigInt?>(
        'chain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      overrides: config.decodeBinary<List<int>?>(
        json.valueAs('overrides', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory EthCallRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EthCallRequest(
      args: decode.getBytes<List<int>?>(1),
      gasCap: decode.getBigInt<BigInt?>(2),
      proposerAddress: decode.getBytes<List<int>?>(3),
      chainId: decode.getBigInt<BigInt?>(4),
      overrides: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1EthCallRequest;
  @override
  injective_evm_v1_tx.MsgEthereumTxResponse onQueryResponse(List<int> bytes) {
    return injective_evm_v1_tx.MsgEthereumTxResponse.deserialize(bytes);
  }

  @override
  injective_evm_v1_tx.MsgEthereumTxResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return injective_evm_v1_tx.MsgEthereumTxResponse.fromJson(json);
  }
}

/// EstimateGasResponse defines EstimateGas response
class EstimateGasResponse extends CosmosProtoMessage {
  /// gas returns the estimated gas
  final BigInt? gas;

  /// ret is the returned data from evm function (result or data supplied with
  /// revert opcode)
  final BuBytes? ret;

  /// vm_error is the error returned by vm execution
  final String? vmError;

  EstimateGasResponse({this.gas, List<int>? ret, this.vmError})
    : ret = ret?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [gas, ret, vmError];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'gas': config.encodeBigint(gas),
      'ret': config.encodeBinary(ret),
      'vm_error': vmError,
    };
  }

  factory EstimateGasResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return EstimateGasResponse(
      gas: json.valueAsBigInt<BigInt?>(
        'gas',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ret: config.decodeBinary<List<int>?>(
        json.valueAs('ret', normalizeKeyLookup: config.normalizeKeys),
      ),
      vmError: json.valueAsString<String?>(
        'vm_error',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory EstimateGasResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateGasResponse(
      gas: decode.getBigInt<BigInt?>(1),
      ret: decode.getBytes<List<int>?>(2),
      vmError: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1EstimateGasResponse;
}

/// QueryTraceTxRequest defines TraceTx request
class QueryTraceTxRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTraceTxResponse> {
  /// msg is the MsgEthereumTx for the requested transaction
  final injective_evm_v1_tx.MsgEthereumTx? msg;

  /// tx_index is not necessary anymore
  /// trace_config holds extra parameters to trace functions.
  final injective_evm_v1_trace_config.TraceConfig? traceConfig;

  /// predecessors is an array of transactions included in the same block
  /// need to be replayed first to get correct context for tracing.
  final List<injective_evm_v1_tx.MsgEthereumTx> predecessors;

  /// block_number of requested transaction
  final BigInt? blockNumber;

  /// block_hash of requested transaction
  final String? blockHash;

  /// block_time of requested transaction
  final google_protobuf_timestamp.Timestamp? blockTime;

  /// proposer_address is the proposer of the requested block
  final BuBytes? proposerAddress;

  /// chain_id is the the eip155 chain id parsed from the requested block header
  final BigInt? chainId;

  QueryTraceTxRequest({
    this.msg,
    this.traceConfig,
    this.predecessors = const [],
    this.blockNumber,
    this.blockHash,
    this.blockTime,
    List<int>? proposerAddress,
    this.chainId,
  }) : proposerAddress = proposerAddress?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/evm/v1/trace_tx",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.bytes(8, options: const []),
        ProtoFieldConfig.int64(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    msg,
    traceConfig,
    predecessors,
    blockNumber,
    blockHash,
    blockTime,
    proposerAddress,
    chainId,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'msg': config.encodeMessage(msg),
      'trace_config': config.encodeMessage(traceConfig),
      'predecessors': predecessors.map((e) => config.encodeMessage(e)).toList(),
      'block_number': config.encodeBigint(blockNumber),
      'block_hash': blockHash,
      'block_time': blockTime?.toRfc3339(),
      'proposer_address': config.encodeBinary(proposerAddress),
      'chain_id': config.encodeBigint(chainId),
    };
  }

  factory QueryTraceTxRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTraceTxRequest(
      msg: json.valueTo<injective_evm_v1_tx.MsgEthereumTx?, Object>(
        key: 'msg',
        parse:
            (v) => injective_evm_v1_tx.MsgEthereumTx.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      traceConfig: json
          .valueTo<injective_evm_v1_trace_config.TraceConfig?, Object>(
            key: 'trace_config',
            parse:
                (v) => injective_evm_v1_trace_config.TraceConfig.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      predecessors:
          (json.valueEnsureAsList<dynamic>(
                'predecessors',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_evm_v1_tx.MsgEthereumTx,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_evm_v1_tx.MsgEthereumTx.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      blockNumber: json.valueAsBigInt<BigInt?>(
        'block_number',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockHash: json.valueAsString<String?>(
        'block_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockTime: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'block_time',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proposerAddress: config.decodeBinary<List<int>?>(
        json.valueAs(
          'proposer_address',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      chainId: json.valueAsBigInt<BigInt?>(
        'chain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTraceTxRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraceTxRequest(
      msg: decode.messageTo<injective_evm_v1_tx.MsgEthereumTx?>(
        1,
        (b) => injective_evm_v1_tx.MsgEthereumTx.deserialize(b),
      ),
      traceConfig: decode.messageTo<injective_evm_v1_trace_config.TraceConfig?>(
        3,
        (b) => injective_evm_v1_trace_config.TraceConfig.deserialize(b),
      ),
      predecessors:
          decode
              .getListOfBytes(4)
              .map((b) => injective_evm_v1_tx.MsgEthereumTx.deserialize(b))
              .toList(),
      blockNumber: decode.getBigInt<BigInt?>(5),
      blockHash: decode.getString<String?>(6),
      blockTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        7,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      proposerAddress: decode.getBytes<List<int>?>(8),
      chainId: decode.getBigInt<BigInt?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryTraceTxRequest;
  @override
  QueryTraceTxResponse onQueryResponse(List<int> bytes) {
    return QueryTraceTxResponse.deserialize(bytes);
  }

  @override
  QueryTraceTxResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTraceTxResponse.fromJson(json);
  }
}

/// QueryTraceTxResponse defines TraceTx response
class QueryTraceTxResponse extends CosmosProtoMessage {
  /// data is the response serialized in bytes
  final BuBytes? data;

  QueryTraceTxResponse({List<int>? data}) : data = data?.asImmutableBytes;

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

  factory QueryTraceTxResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTraceTxResponse(
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryTraceTxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraceTxResponse(data: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryTraceTxResponse;
}

/// QueryTraceCallRequest defines TraceCall request
class QueryTraceCallRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTraceCallResponse> {
  /// args uses the same json format as the json rpc api.
  final BuBytes? args;

  /// gas_cap defines the default gas cap to be used
  final BigInt? gasCap;

  /// proposer_address of the requested block in hex format
  final BuBytes? proposerAddress;

  /// trace_config holds extra parameters to trace functions.
  final injective_evm_v1_trace_config.TraceConfig? traceConfig;

  /// block_number of requested transaction
  final BigInt? blockNumber;

  /// block_hash of requested transaction
  final String? blockHash;

  /// block_time of requested transaction
  final google_protobuf_timestamp.Timestamp? blockTime;

  /// chain_id is the the eip155 chain id parsed from the requested block header
  final BigInt? chainId;

  QueryTraceCallRequest({
    List<int>? args,
    this.gasCap,
    List<int>? proposerAddress,
    this.traceConfig,
    this.blockNumber,
    this.blockHash,
    this.blockTime,
    this.chainId,
  }) : args = args?.asImmutableBytes,
       proposerAddress = proposerAddress?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/evm/v1/trace_call",
        ),
      ],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.uint64(2),
        ProtoFieldConfig.bytes(3, options: const []),
        ProtoFieldConfig.message(4),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.int64(8),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    args,
    gasCap,
    proposerAddress,
    traceConfig,
    blockNumber,
    blockHash,
    blockTime,
    chainId,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'args': config.encodeBinary(args),
      'gas_cap': config.encodeBigint(gasCap),
      'proposer_address': config.encodeBinary(proposerAddress),
      'trace_config': config.encodeMessage(traceConfig),
      'block_number': config.encodeBigint(blockNumber),
      'block_hash': blockHash,
      'block_time': blockTime?.toRfc3339(),
      'chain_id': config.encodeBigint(chainId),
    };
  }

  factory QueryTraceCallRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTraceCallRequest(
      args: config.decodeBinary<List<int>?>(
        json.valueAs('args', normalizeKeyLookup: config.normalizeKeys),
      ),
      gasCap: json.valueAsBigInt<BigInt?>(
        'gas_cap',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proposerAddress: config.decodeBinary<List<int>?>(
        json.valueAs(
          'proposer_address',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      traceConfig: json
          .valueTo<injective_evm_v1_trace_config.TraceConfig?, Object>(
            key: 'trace_config',
            parse:
                (v) => injective_evm_v1_trace_config.TraceConfig.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      blockNumber: json.valueAsBigInt<BigInt?>(
        'block_number',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockHash: json.valueAsString<String?>(
        'block_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockTime: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'block_time',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      chainId: json.valueAsBigInt<BigInt?>(
        'chain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTraceCallRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraceCallRequest(
      args: decode.getBytes<List<int>?>(1),
      gasCap: decode.getBigInt<BigInt?>(2),
      proposerAddress: decode.getBytes<List<int>?>(3),
      traceConfig: decode.messageTo<injective_evm_v1_trace_config.TraceConfig?>(
        4,
        (b) => injective_evm_v1_trace_config.TraceConfig.deserialize(b),
      ),
      blockNumber: decode.getBigInt<BigInt?>(5),
      blockHash: decode.getString<String?>(6),
      blockTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        7,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      chainId: decode.getBigInt<BigInt?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryTraceCallRequest;
  @override
  QueryTraceCallResponse onQueryResponse(List<int> bytes) {
    return QueryTraceCallResponse.deserialize(bytes);
  }

  @override
  QueryTraceCallResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTraceCallResponse.fromJson(json);
  }
}

/// QueryTraceCallResponse defines TraceCallResponse
class QueryTraceCallResponse extends CosmosProtoMessage {
  /// data is the response serialized in bytes
  final BuBytes? data;

  QueryTraceCallResponse({List<int>? data}) : data = data?.asImmutableBytes;

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

  factory QueryTraceCallResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTraceCallResponse(
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryTraceCallResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraceCallResponse(data: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryTraceCallResponse;
}

/// QueryTraceBlockRequest defines TraceTx request
class QueryTraceBlockRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTraceBlockResponse> {
  /// txs is an array of messages in the block
  final List<injective_evm_v1_tx.MsgEthereumTx> txs;

  /// trace_config holds extra parameters to trace functions.
  final injective_evm_v1_trace_config.TraceConfig? traceConfig;

  /// block_number of the traced block
  final BigInt? blockNumber;

  /// block_hash (hex) of the traced block
  final String? blockHash;

  /// block_time of the traced block
  final google_protobuf_timestamp.Timestamp? blockTime;

  /// proposer_address is the address of the requested block
  final BuBytes? proposerAddress;

  /// chain_id is the eip155 chain id parsed from the requested block header
  final BigInt? chainId;

  QueryTraceBlockRequest({
    this.txs = const [],
    this.traceConfig,
    this.blockNumber,
    this.blockHash,
    this.blockTime,
    List<int>? proposerAddress,
    this.chainId,
  }) : proposerAddress = proposerAddress?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/evm/v1/trace_block",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.int64(5),
        ProtoFieldConfig.string(6),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.bytes(8, options: const []),
        ProtoFieldConfig.int64(9),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    txs,
    traceConfig,
    blockNumber,
    blockHash,
    blockTime,
    proposerAddress,
    chainId,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'txs': txs.map((e) => config.encodeMessage(e)).toList(),
      'trace_config': config.encodeMessage(traceConfig),
      'block_number': config.encodeBigint(blockNumber),
      'block_hash': blockHash,
      'block_time': blockTime?.toRfc3339(),
      'proposer_address': config.encodeBinary(proposerAddress),
      'chain_id': config.encodeBigint(chainId),
    };
  }

  factory QueryTraceBlockRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTraceBlockRequest(
      txs:
          (json.valueEnsureAsList<dynamic>(
                'txs',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  injective_evm_v1_tx.MsgEthereumTx,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => injective_evm_v1_tx.MsgEthereumTx.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      traceConfig: json
          .valueTo<injective_evm_v1_trace_config.TraceConfig?, Object>(
            key: 'trace_config',
            parse:
                (v) => injective_evm_v1_trace_config.TraceConfig.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      blockNumber: json.valueAsBigInt<BigInt?>(
        'block_number',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockHash: json.valueAsString<String?>(
        'block_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockTime: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'block_time',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proposerAddress: config.decodeBinary<List<int>?>(
        json.valueAs(
          'proposer_address',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      chainId: json.valueAsBigInt<BigInt?>(
        'chain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTraceBlockRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraceBlockRequest(
      txs:
          decode
              .getListOfBytes(1)
              .map((b) => injective_evm_v1_tx.MsgEthereumTx.deserialize(b))
              .toList(),
      traceConfig: decode.messageTo<injective_evm_v1_trace_config.TraceConfig?>(
        3,
        (b) => injective_evm_v1_trace_config.TraceConfig.deserialize(b),
      ),
      blockNumber: decode.getBigInt<BigInt?>(5),
      blockHash: decode.getString<String?>(6),
      blockTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        7,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      proposerAddress: decode.getBytes<List<int>?>(8),
      chainId: decode.getBigInt<BigInt?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryTraceBlockRequest;
  @override
  QueryTraceBlockResponse onQueryResponse(List<int> bytes) {
    return QueryTraceBlockResponse.deserialize(bytes);
  }

  @override
  QueryTraceBlockResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTraceBlockResponse.fromJson(json);
  }
}

/// QueryTraceBlockResponse defines TraceBlock response
class QueryTraceBlockResponse extends CosmosProtoMessage {
  /// data is the response serialized in bytes
  final BuBytes? data;

  QueryTraceBlockResponse({List<int>? data}) : data = data?.asImmutableBytes;

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

  factory QueryTraceBlockResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTraceBlockResponse(
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory QueryTraceBlockResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraceBlockResponse(data: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryTraceBlockResponse;
}

/// QueryBaseFeeRequest defines the request type for querying the EIP1559 base
/// fee.
class QueryBaseFeeRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBaseFeeResponse> {
  const QueryBaseFeeRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/injective/evm/v1/base_fee",
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

  factory QueryBaseFeeRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBaseFeeRequest();
  }

  factory QueryBaseFeeRequest.deserialize(List<int> bytes) {
    return QueryBaseFeeRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryBaseFeeRequest;
  @override
  QueryBaseFeeResponse onQueryResponse(List<int> bytes) {
    return QueryBaseFeeResponse.deserialize(bytes);
  }

  @override
  QueryBaseFeeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBaseFeeResponse.fromJson(json);
  }
}

/// QueryBaseFeeResponse returns the EIP1559 base fee.
class QueryBaseFeeResponse extends CosmosProtoMessage {
  /// base_fee is the EIP1559 base fee
  final String? baseFee;

  const QueryBaseFeeResponse({this.baseFee});

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
  List<Object?> get protoValues => [baseFee];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'base_fee': baseFee};
  }

  factory QueryBaseFeeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBaseFeeResponse(
      baseFee: json.valueAsString<String?>(
        'base_fee',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBaseFeeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBaseFeeResponse(baseFee: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1QueryBaseFeeResponse;
}
