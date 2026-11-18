import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/stratos/evm/v1/src/evm.dart"
    as stratos_evm_v1_evm;
import "package:cosmos_sdk/proto_messages/stratos/evm/v1/src/tx.dart"
    as stratos_evm_v1_tx;
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
          path: "/stratos/evm/v1/account/{address}",
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryAccountRequest;
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

  /// code hash is the hex-formatted code bytes from the EOA.
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryAccountResponse;
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
          path: "/stratos/evm/v1/cosmos_account/{address}",
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryCosmosAccountRequest;
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

  /// account_number is the account numbert
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryCosmosAccountResponse;
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
          path: "/stratos/evm/v1/validator_account/{cons_address}",
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryValidatorAccountRequest;
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryValidatorAccountResponse;
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
          path: "/stratos/evm/v1/balances/{address}",
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryBalanceRequest;
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryBalanceResponse;
}

/// QueryStorageRequest is the request type for the Query/Storage RPC method.
class QueryStorageRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryStorageResponse> {
  /// / address is the ethereum hex address to query the storage state for.
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
          path: "/stratos/evm/v1/storage/{address}/{key}",
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryStorageRequest;
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
  /// key defines the storage state value hash associated with the given key.
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryStorageResponse;
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
          path: "/stratos/evm/v1/codes/{address}",
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryCodeRequest;
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryCodeResponse;
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
          path: "/stratos/evm/v1/params",
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryParamsRequest;
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
  final stratos_evm_v1_evm.Params? params;

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
      params: json.valueTo<stratos_evm_v1_evm.Params?, Object>(
        key: 'params',
        parse:
            (v) => stratos_evm_v1_evm.Params.fromJson(
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
      params: decode.messageTo<stratos_evm_v1_evm.Params?>(
        1,
        (b) => stratos_evm_v1_evm.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryParamsResponse;
}

/// EthCallRequest defines EthCall request
class EthCallRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<stratos_evm_v1_tx.MsgEthereumTxResponse> {
  /// same json format as the json rpc api.
  final BuBytes? args;

  /// the default gas cap to be used
  final BigInt? gasCap;

  EthCallRequest({List<int>? args, this.gasCap})
    : args = args?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/evm/v1/eth_call",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/evm/v1/estimate_gas",
        ),
      ],
      fields: [ProtoFieldConfig.bytes(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [args, gasCap];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'args': config.encodeBinary(args),
      'gas_cap': config.encodeBigint(gasCap),
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
    );
  }

  factory EthCallRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EthCallRequest(
      args: decode.getBytes<List<int>?>(1),
      gasCap: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1EthCallRequest;
  @override
  stratos_evm_v1_tx.MsgEthereumTxResponse onQueryResponse(List<int> bytes) {
    return stratos_evm_v1_tx.MsgEthereumTxResponse.deserialize(bytes);
  }

  @override
  stratos_evm_v1_tx.MsgEthereumTxResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return stratos_evm_v1_tx.MsgEthereumTxResponse.fromJson(json);
  }
}

/// EstimateGasResponse defines EstimateGas response
class EstimateGasResponse extends CosmosProtoMessage {
  /// the estimated gas
  final BigInt? gas;

  const EstimateGasResponse({this.gas});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [gas];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'gas': config.encodeBigint(gas)};
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
    );
  }

  factory EstimateGasResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EstimateGasResponse(gas: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1EstimateGasResponse;
}

/// QueryTraceTxRequest defines TraceTx request
class QueryTraceTxRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTraceTxResponse> {
  /// msgEthereumTx for the requested transaction
  final stratos_evm_v1_tx.MsgEthereumTx? msg;

  /// TraceConfig holds extra parameters to trace functions.
  final stratos_evm_v1_evm.TraceConfig? traceConfig;

  /// the predecessor transactions included in the same block
  /// need to be replayed first to get correct context for tracing.
  final List<stratos_evm_v1_tx.MsgEthereumTx> predecessors;

  /// block number of requested transaction
  final BigInt? blockNumber;

  /// block hex hash of requested transaction
  final String? blockHash;

  /// block time of requested transaction
  final google_protobuf_timestamp.Timestamp? blockTime;

  const QueryTraceTxRequest({
    this.msg,
    this.traceConfig,
    this.predecessors = const [],
    this.blockNumber,
    this.blockHash,
    this.blockTime,
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
          path: "/stratos/evm/v1/trace_tx",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.int64(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.message(6, options: const []),
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
    };
  }

  factory QueryTraceTxRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTraceTxRequest(
      msg: json.valueTo<stratos_evm_v1_tx.MsgEthereumTx?, Object>(
        key: 'msg',
        parse:
            (v) => stratos_evm_v1_tx.MsgEthereumTx.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      traceConfig: json.valueTo<stratos_evm_v1_evm.TraceConfig?, Object>(
        key: 'trace_config',
        parse:
            (v) => stratos_evm_v1_evm.TraceConfig.fromJson(
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
                (e) =>
                    JsonParser.valueTo<stratos_evm_v1_tx.MsgEthereumTx, Object>(
                      value: e,
                      parse:
                          (v) => stratos_evm_v1_tx.MsgEthereumTx.fromJson(
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
    );
  }

  factory QueryTraceTxRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraceTxRequest(
      msg: decode.messageTo<stratos_evm_v1_tx.MsgEthereumTx?>(
        1,
        (b) => stratos_evm_v1_tx.MsgEthereumTx.deserialize(b),
      ),
      traceConfig: decode.messageTo<stratos_evm_v1_evm.TraceConfig?>(
        2,
        (b) => stratos_evm_v1_evm.TraceConfig.deserialize(b),
      ),
      predecessors:
          decode
              .getListOfBytes(3)
              .map((b) => stratos_evm_v1_tx.MsgEthereumTx.deserialize(b))
              .toList(),
      blockNumber: decode.getBigInt<BigInt?>(4),
      blockHash: decode.getString<String?>(5),
      blockTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        6,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryTraceTxRequest;
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
  /// response serialized in bytes
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryTraceTxResponse;
}

/// QueryTraceBlockRequest defines TraceTx request
class QueryTraceBlockRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTraceBlockResponse> {
  /// txs messages in the block
  final List<stratos_evm_v1_tx.MsgEthereumTx> txs;

  /// TraceConfig holds extra parameters to trace functions.
  final stratos_evm_v1_evm.TraceConfig? traceConfig;

  /// block number
  final BigInt? blockNumber;

  /// block hex hash
  final String? blockHash;

  /// block time
  final google_protobuf_timestamp.Timestamp? blockTime;

  const QueryTraceBlockRequest({
    this.txs = const [],
    this.traceConfig,
    this.blockNumber,
    this.blockHash,
    this.blockTime,
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
          path: "/stratos/evm/v1/trace_block",
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
                (e) =>
                    JsonParser.valueTo<stratos_evm_v1_tx.MsgEthereumTx, Object>(
                      value: e,
                      parse:
                          (v) => stratos_evm_v1_tx.MsgEthereumTx.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
      traceConfig: json.valueTo<stratos_evm_v1_evm.TraceConfig?, Object>(
        key: 'trace_config',
        parse:
            (v) => stratos_evm_v1_evm.TraceConfig.fromJson(
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
    );
  }

  factory QueryTraceBlockRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTraceBlockRequest(
      txs:
          decode
              .getListOfBytes(1)
              .map((b) => stratos_evm_v1_tx.MsgEthereumTx.deserialize(b))
              .toList(),
      traceConfig: decode.messageTo<stratos_evm_v1_evm.TraceConfig?>(
        3,
        (b) => stratos_evm_v1_evm.TraceConfig.deserialize(b),
      ),
      blockNumber: decode.getBigInt<BigInt?>(5),
      blockHash: decode.getString<String?>(6),
      blockTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        7,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryTraceBlockRequest;
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryTraceBlockResponse;
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
          path: "/stratos/evm/v1/base_fee",
        ),
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/evm/v1/base_fee_param",
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryBaseFeeRequest;
  @override
  QueryBaseFeeResponse onQueryResponse(List<int> bytes) {
    return QueryBaseFeeResponse.deserialize(bytes);
  }

  @override
  QueryBaseFeeResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBaseFeeResponse.fromJson(json);
  }
}

/// BaseFeeResponse returns the EIP1559 base fee.
class QueryBaseFeeResponse extends CosmosProtoMessage {
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryBaseFeeResponse;
}

/// QueryBlockGasRequest defines the request type for querying the EIP1559 base
/// fee.
class QueryBlockGasRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryBlockGasResponse> {
  const QueryBlockGasRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/evm/v1/block_gas",
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

  factory QueryBlockGasRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBlockGasRequest();
  }

  factory QueryBlockGasRequest.deserialize(List<int> bytes) {
    return QueryBlockGasRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryBlockGasRequest;
  @override
  QueryBlockGasResponse onQueryResponse(List<int> bytes) {
    return QueryBlockGasResponse.deserialize(bytes);
  }

  @override
  QueryBlockGasResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryBlockGasResponse.fromJson(json);
  }
}

/// QueryBlockGasResponse returns block gas used for a given height.
class QueryBlockGasResponse extends CosmosProtoMessage {
  final BigInt? gas;

  const QueryBlockGasResponse({this.gas});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [gas];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'gas': config.encodeBigint(gas)};
  }

  factory QueryBlockGasResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryBlockGasResponse(
      gas: json.valueAsBigInt<BigInt?>(
        'gas',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryBlockGasResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryBlockGasResponse(gas: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryBlockGasResponse;
}

/// QueryAddressConvertRequest defines AddressConvert request
class QueryAddressConvertRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryAddressConvertResponse> {
  /// hex address or bech32 address
  final String? address;

  const QueryAddressConvertRequest({this.address});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/stratos/evm/v1/address_convert",
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

  factory QueryAddressConvertRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAddressConvertRequest(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAddressConvertRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAddressConvertRequest(address: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryAddressConvertRequest;
  @override
  QueryAddressConvertResponse onQueryResponse(List<int> bytes) {
    return QueryAddressConvertResponse.deserialize(bytes);
  }

  @override
  QueryAddressConvertResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryAddressConvertResponse.fromJson(json);
  }
}

/// QueryAddressConvertResponse returns address check result and hex/bech32 address
class QueryAddressConvertResponse extends CosmosProtoMessage {
  final String? hexAddress;

  final String? bech32Address;

  const QueryAddressConvertResponse({this.hexAddress, this.bech32Address});

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
  List<Object?> get protoValues => [hexAddress, bech32Address];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'hex_address': hexAddress, 'bech32_address': bech32Address};
  }

  factory QueryAddressConvertResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryAddressConvertResponse(
      hexAddress: json.valueAsString<String?>(
        'hex_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      bech32Address: json.valueAsString<String?>(
        'bech32_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryAddressConvertResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryAddressConvertResponse(
      hexAddress: decode.getString<String?>(1),
      bech32Address: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1QueryAddressConvertResponse;
}
