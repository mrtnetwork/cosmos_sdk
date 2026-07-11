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
  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
      'code_hash': codeHash,
      'nonce': nonce?.toString(),
    };
  }

  factory QueryAccountResponse.fromJson(Map<String, dynamic> json) {
    return QueryAccountResponse(
      balance: json.valueAsString<String?>('balance', acceptCamelCase: true),
      codeHash: json.valueAsString<String?>('code_hash', acceptCamelCase: true),
      nonce: json.valueAsBigInt<BigInt?>('nonce', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'address': address};
  }

  factory QueryCosmosAccountRequest.fromJson(Map<String, dynamic> json) {
    return QueryCosmosAccountRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'cosmos_address': cosmosAddress,
      'sequence': sequence?.toString(),
      'account_number': accountNumber?.toString(),
    };
  }

  factory QueryCosmosAccountResponse.fromJson(Map<String, dynamic> json) {
    return QueryCosmosAccountResponse(
      cosmosAddress: json.valueAsString<String?>(
        'cosmos_address',
        acceptCamelCase: true,
      ),
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
      accountNumber: json.valueAsBigInt<BigInt?>(
        'account_number',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'cons_address': consAddress};
  }

  factory QueryValidatorAccountRequest.fromJson(Map<String, dynamic> json) {
    return QueryValidatorAccountRequest(
      consAddress: json.valueAsString<String?>(
        'cons_address',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'account_address': accountAddress,
      'sequence': sequence?.toString(),
      'account_number': accountNumber?.toString(),
    };
  }

  factory QueryValidatorAccountResponse.fromJson(Map<String, dynamic> json) {
    return QueryValidatorAccountResponse(
      accountAddress: json.valueAsString<String?>(
        'account_address',
        acceptCamelCase: true,
      ),
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
      accountNumber: json.valueAsBigInt<BigInt?>(
        'account_number',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'address': address};
  }

  factory QueryBalanceRequest.fromJson(Map<String, dynamic> json) {
    return QueryBalanceRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'balance': balance};
  }

  factory QueryBalanceResponse.fromJson(Map<String, dynamic> json) {
    return QueryBalanceResponse(
      balance: json.valueAsString<String?>('balance', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'address': address, 'key': key};
  }

  factory QueryStorageRequest.fromJson(Map<String, dynamic> json) {
    return QueryStorageRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      key: json.valueAsString<String?>('key', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'value': value};
  }

  factory QueryStorageResponse.fromJson(Map<String, dynamic> json) {
    return QueryStorageResponse(
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'address': address};
  }

  factory QueryCodeRequest.fromJson(Map<String, dynamic> json) {
    return QueryCodeRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
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
  final List<int>? code;

  const QueryCodeResponse({this.code});

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
  Map<String, dynamic> toJson() {
    return {
      'code': switch (code) {
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
      code: json.valueAsBytes<List<int>?>(
        'code',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {'params': params?.toJson()};
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      params: json.valueTo<stratos_evm_v1_evm.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => stratos_evm_v1_evm.Params.fromJson(v),
        acceptCamelCase: true,
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
  final List<int>? args;

  /// the default gas cap to be used
  final BigInt? gasCap;

  const EthCallRequest({this.args, this.gasCap});

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
  Map<String, dynamic> toJson() {
    return {
      'args': switch (args) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'gas_cap': gasCap?.toString(),
    };
  }

  factory EthCallRequest.fromJson(Map<String, dynamic> json) {
    return EthCallRequest(
      args: json.valueAsBytes<List<int>?>(
        'args',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      gasCap: json.valueAsBigInt<BigInt?>('gas_cap', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'gas': gas?.toString()};
  }

  factory EstimateGasResponse.fromJson(Map<String, dynamic> json) {
    return EstimateGasResponse(
      gas: json.valueAsBigInt<BigInt?>('gas', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'msg': msg?.toJson(),
      'trace_config': traceConfig?.toJson(),
      'predecessors': predecessors.map((e) => e.toJson()).toList(),
      'block_number': blockNumber?.toString(),
      'block_hash': blockHash,
      'block_time': blockTime?.toRfc3339(),
    };
  }

  factory QueryTraceTxRequest.fromJson(Map<String, dynamic> json) {
    return QueryTraceTxRequest(
      msg: json.valueTo<stratos_evm_v1_tx.MsgEthereumTx?, Map<String, dynamic>>(
        key: 'msg',
        parse: (v) => stratos_evm_v1_tx.MsgEthereumTx.fromJson(v),
        acceptCamelCase: true,
      ),
      traceConfig: json
          .valueTo<stratos_evm_v1_evm.TraceConfig?, Map<String, dynamic>>(
            key: 'trace_config',
            parse: (v) => stratos_evm_v1_evm.TraceConfig.fromJson(v),
            acceptCamelCase: true,
          ),
      predecessors:
          (json.valueEnsureAsList<dynamic>(
                'predecessors',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  stratos_evm_v1_tx.MsgEthereumTx,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => stratos_evm_v1_tx.MsgEthereumTx.fromJson(v),
                ),
              )
              .toList(),
      blockNumber: json.valueAsBigInt<BigInt?>(
        'block_number',
        acceptCamelCase: true,
      ),
      blockHash: json.valueAsString<String?>(
        'block_hash',
        acceptCamelCase: true,
      ),
      blockTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'block_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
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
  final List<int>? data;

  const QueryTraceTxResponse({this.data});

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

  factory QueryTraceTxResponse.fromJson(Map<String, dynamic> json) {
    return QueryTraceTxResponse(
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {
      'txs': txs.map((e) => e.toJson()).toList(),
      'trace_config': traceConfig?.toJson(),
      'block_number': blockNumber?.toString(),
      'block_hash': blockHash,
      'block_time': blockTime?.toRfc3339(),
    };
  }

  factory QueryTraceBlockRequest.fromJson(Map<String, dynamic> json) {
    return QueryTraceBlockRequest(
      txs:
          (json.valueEnsureAsList<dynamic>('txs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  stratos_evm_v1_tx.MsgEthereumTx,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => stratos_evm_v1_tx.MsgEthereumTx.fromJson(v),
                ),
              )
              .toList(),
      traceConfig: json
          .valueTo<stratos_evm_v1_evm.TraceConfig?, Map<String, dynamic>>(
            key: 'trace_config',
            parse: (v) => stratos_evm_v1_evm.TraceConfig.fromJson(v),
            acceptCamelCase: true,
          ),
      blockNumber: json.valueAsBigInt<BigInt?>(
        'block_number',
        acceptCamelCase: true,
      ),
      blockHash: json.valueAsString<String?>(
        'block_hash',
        acceptCamelCase: true,
      ),
      blockTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'block_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
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
  final List<int>? data;

  const QueryTraceBlockResponse({this.data});

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

  factory QueryTraceBlockResponse.fromJson(Map<String, dynamic> json) {
    return QueryTraceBlockResponse(
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryBaseFeeRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'base_fee': baseFee};
  }

  factory QueryBaseFeeResponse.fromJson(Map<String, dynamic> json) {
    return QueryBaseFeeResponse(
      baseFee: json.valueAsString<String?>('base_fee', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryBlockGasRequest.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'gas': gas?.toString()};
  }

  factory QueryBlockGasResponse.fromJson(Map<String, dynamic> json) {
    return QueryBlockGasResponse(
      gas: json.valueAsBigInt<BigInt?>('gas', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'address': address};
  }

  factory QueryAddressConvertRequest.fromJson(Map<String, dynamic> json) {
    return QueryAddressConvertRequest(
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'hex_address': hexAddress, 'bech32_address': bech32Address};
  }

  factory QueryAddressConvertResponse.fromJson(Map<String, dynamic> json) {
    return QueryAddressConvertResponse(
      hexAddress: json.valueAsString<String?>(
        'hex_address',
        acceptCamelCase: true,
      ),
      bech32Address: json.valueAsString<String?>(
        'bech32_address',
        acceptCamelCase: true,
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
