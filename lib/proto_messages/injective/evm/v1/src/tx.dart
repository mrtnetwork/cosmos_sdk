import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/injective/evm/v1/src/log.dart"
    as injective_evm_v1_log;
import "package:cosmos_sdk/proto_messages/injective/evm/v1/src/params.dart"
    as injective_evm_v1_params;

/// MsgEthereumTx encapsulates an Ethereum transaction as an SDK message.
class MsgEthereumTx extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgEthereumTxResponse> {
  /// data is inner transaction data of the Ethereum transaction
  final google_protobuf_any.Any? data;

  /// size is the encoded storage size of the transaction (DEPRECATED)
  final double? size;

  /// hash of the transaction in hex format
  final String? deprecatedHash;

  final String? deprecatedFrom;

  /// from is the bytes of ethereum signer address. This address value is checked
  /// against the address derived from the signature (V, R, S) using the
  /// secp256k1 elliptic curve
  final BuBytes? from;

  /// raw is the raw bytes of the ethereum transaction
  final BuBytes? raw;

  MsgEthereumTx({
    this.data,
    this.size,
    this.deprecatedHash,
    this.deprecatedFrom,
    List<int>? from,
    List<int>? raw,
  }) : from = from?.asImmutableBytes,
       raw = raw?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/injective/evm/v1/ethereum_tx",
        ),
      ],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.double(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(
          4,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.bytes(5),
        ProtoFieldConfig.bytes(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    data,
    size,
    deprecatedHash,
    deprecatedFrom,
    from,
    raw,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'data': config.encodeMessage(data),
      'size': size,
      'deprecated_hash': deprecatedHash,
      'deprecated_from': deprecatedFrom,
      'from': config.encodeBinary(from),
      'raw': config.encodeBinary(raw),
    };
  }

  factory MsgEthereumTx.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgEthereumTx(
      data: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'data',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      size: json.valueAsDouble<double?>(
        'size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      deprecatedHash: json.valueAsString<String?>(
        'deprecated_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      deprecatedFrom: json.valueAsString<String?>(
        'deprecated_from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      from: config.decodeBinary<List<int>?>(
        json.valueAs('from', normalizeKeyLookup: config.normalizeKeys),
      ),
      raw: config.decodeBinary<List<int>?>(
        json.valueAs('raw', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgEthereumTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgEthereumTx(
      data: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      size: decode.getDouble<double?>(2),
      deprecatedHash: decode.getString<String?>(3),
      deprecatedFrom: decode.getString<String?>(4),
      from: decode.getBytes<List<int>?>(5),
      raw: decode.getBytes<List<int>?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1MsgEthereumTx;
  @override
  MsgEthereumTxResponse onServiceResponse(List<int> bytes) {
    return MsgEthereumTxResponse.deserialize(bytes);
  }

  @override
  MsgEthereumTxResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgEthereumTxResponse.fromJson(json);
  }
}

/// MsgEthereumTxResponse defines the Msg/EthereumTx response type.
class MsgEthereumTxResponse extends CosmosProtoMessage {
  /// hash of the ethereum transaction in hex format. This hash differs from the
  /// Tendermint sha256 hash of the transaction bytes. See
  /// https://github.com/tendermint/tendermint/issues/6539 for reference
  final String? hash;

  /// logs contains the transaction hash and the proto-compatible ethereum
  /// logs.
  final List<injective_evm_v1_log.Log> logs;

  /// ret is the returned data from evm function (result or data supplied with
  /// revert opcode)
  final BuBytes? ret;

  /// vm_error is the error returned by vm execution
  final String? vmError;

  /// gas_used specifies how much gas was consumed by the transaction
  final BigInt? gasUsed;

  /// include the block hash for json-rpc to use
  final BuBytes? blockHash;

  /// execution_gas_used specifies the actual gas consumed during EVM execution.
  /// This is used for accurate gas estimation.
  final BigInt? executionGasUsed;

  MsgEthereumTxResponse({
    this.hash,
    this.logs = const [],
    List<int>? ret,
    this.vmError,
    this.gasUsed,
    List<int>? blockHash,
    this.executionGasUsed,
  }) : ret = ret?.asImmutableBytes,
       blockHash = blockHash?.asImmutableBytes;

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
        ),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.bytes(6),
        ProtoFieldConfig.uint64(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    hash,
    logs,
    ret,
    vmError,
    gasUsed,
    blockHash,
    executionGasUsed,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'hash': hash,
      'logs': logs.map((e) => config.encodeMessage(e)).toList(),
      'ret': config.encodeBinary(ret),
      'vm_error': vmError,
      'gas_used': config.encodeBigint(gasUsed),
      'block_hash': config.encodeBinary(blockHash),
      'execution_gas_used': config.encodeBigint(executionGasUsed),
    };
  }

  factory MsgEthereumTxResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgEthereumTxResponse(
      hash: json.valueAsString<String?>(
        'hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      logs:
          (json.valueEnsureAsList<dynamic>(
                'logs',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<injective_evm_v1_log.Log, Object>(
                  value: e,
                  parse:
                      (v) => injective_evm_v1_log.Log.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      ret: config.decodeBinary<List<int>?>(
        json.valueAs('ret', normalizeKeyLookup: config.normalizeKeys),
      ),
      vmError: json.valueAsString<String?>(
        'vm_error',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      gasUsed: json.valueAsBigInt<BigInt?>(
        'gas_used',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockHash: config.decodeBinary<List<int>?>(
        json.valueAs('block_hash', normalizeKeyLookup: config.normalizeKeys),
      ),
      executionGasUsed: json.valueAsBigInt<BigInt?>(
        'execution_gas_used',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgEthereumTxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgEthereumTxResponse(
      hash: decode.getString<String?>(1),
      logs:
          decode
              .getListOfBytes(2)
              .map((b) => injective_evm_v1_log.Log.deserialize(b))
              .toList(),
      ret: decode.getBytes<List<int>?>(3),
      vmError: decode.getString<String?>(4),
      gasUsed: decode.getBigInt<BigInt?>(5),
      blockHash: decode.getBytes<List<int>?>(6),
      executionGasUsed: decode.getBigInt<BigInt?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1MsgEthereumTxResponse;
}

/// MsgUpdateParams defines a Msg for updating the x/evm module parameters.
class MsgUpdateParams extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateParamsResponse> {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the x/evm parameters to update.
  /// NOTE: All parameters must be supplied.
  final injective_evm_v1_params.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, params];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'authority': authority, 'params': config.encodeMessage(params)};
  }

  factory MsgUpdateParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
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

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<injective_evm_v1_params.Params?>(
        2,
        (b) => injective_evm_v1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse defines the response structure for executing a
/// MsgUpdateParams message.
class MsgUpdateParamsResponse extends CosmosProtoMessage {
  const MsgUpdateParamsResponse();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
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

  factory MsgUpdateParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.injectiveEvmV1MsgUpdateParamsResponse;
}
