import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/evm/vm/v1/src/evm.dart"
    as cosmos_evm_vm_v1_evm;

/// MsgEthereumTx encapsulates an Ethereum transaction as an SDK message.
class MsgEthereumTx extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgEthereumTxResponse>,
        ICosmosProtoAminoMessage {
  /// from is the bytes of ethereum signer address. This address value is checked
  /// against the address derived from the signature (V, R, S) using the
  /// secp256k1 elliptic curve
  final BuBytes? from;

  /// raw is the raw ethereum transaction
  final BuBytes? raw;

  MsgEthereumTx({List<int>? from, List<int>? raw})
    : from = from?.asImmutableBytes,
      raw = raw?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos/evm/MsgEthereumTx",
        ),
        ProtoOptionHttp(
          name: "google.api.http.post",
          method: RequestMethod.post,
          path: "/cosmos/evm/vm/v1/ethereum_tx",
        ),
      ],
      fields: [
        ProtoFieldConfig.bytes(5),
        ProtoFieldConfig.bytes(6, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [from, raw];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': config.encodeBinary(from), 'raw': config.encodeBinary(raw)};
  }

  factory MsgEthereumTx.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgEthereumTx(
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
      from: decode.getBytes<List<int>?>(5),
      raw: decode.getBytes<List<int>?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvmVmV1MsgEthereumTx;
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
  /// CometBFT sha256 hash of the transaction bytes. See
  /// https://github.com/tendermint/tendermint/issues/6539 for reference
  final String? hash;

  /// logs contains the transaction hash and the proto-compatible ethereum
  /// logs.
  final List<cosmos_evm_vm_v1_evm.Log> logs;

  /// ret is the returned data from evm function (result or data supplied with
  /// revert opcode)
  final BuBytes? ret;

  /// vm_error is the error returned by vm execution
  final String? vmError;

  /// gas_used specifies how much gas was consumed by the transaction
  final BigInt? gasUsed;

  /// max_used_gas specifies the gas consumed by the transaction, not including
  /// refunds
  final BigInt? maxUsedGas;

  /// include the block hash for json-rpc to use
  final BuBytes? blockHash;

  /// include the block timestamp for json-rpc to use
  final BigInt? blockTimestamp;

  MsgEthereumTxResponse({
    this.hash,
    this.logs = const [],
    List<int>? ret,
    this.vmError,
    this.gasUsed,
    this.maxUsedGas,
    List<int>? blockHash,
    this.blockTimestamp,
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
        ProtoFieldConfig.uint64(6),
        ProtoFieldConfig.bytes(7),
        ProtoFieldConfig.uint64(8),
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
    maxUsedGas,
    blockHash,
    blockTimestamp,
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
      'max_used_gas': config.encodeBigint(maxUsedGas),
      'block_hash': config.encodeBinary(blockHash),
      'block_timestamp': config.encodeBigint(blockTimestamp),
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
                (e) => JsonParser.valueTo<cosmos_evm_vm_v1_evm.Log, Object>(
                  value: e,
                  parse:
                      (v) => cosmos_evm_vm_v1_evm.Log.fromJson(
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
      maxUsedGas: json.valueAsBigInt<BigInt?>(
        'max_used_gas',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockHash: config.decodeBinary<List<int>?>(
        json.valueAs('block_hash', normalizeKeyLookup: config.normalizeKeys),
      ),
      blockTimestamp: json.valueAsBigInt<BigInt?>(
        'block_timestamp',
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
              .map((b) => cosmos_evm_vm_v1_evm.Log.deserialize(b))
              .toList(),
      ret: decode.getBytes<List<int>?>(3),
      vmError: decode.getString<String?>(4),
      gasUsed: decode.getBigInt<BigInt?>(5),
      maxUsedGas: decode.getBigInt<BigInt?>(6),
      blockHash: decode.getBytes<List<int>?>(7),
      blockTimestamp: decode.getBigInt<BigInt?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvmVmV1MsgEthereumTxResponse;
}

/// MsgUpdateParams defines a Msg for updating the x/vm module parameters.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the x/vm parameters to update.
  /// NOTE: All parameters must be supplied.
  final cosmos_evm_vm_v1_evm.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos/evm/x/vm/MsgUpdateParams",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
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
      params: json.valueTo<cosmos_evm_vm_v1_evm.Params?, Object>(
        key: 'params',
        parse:
            (v) => cosmos_evm_vm_v1_evm.Params.fromJson(
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
      params: decode.messageTo<cosmos_evm_vm_v1_evm.Params?>(
        2,
        (b) => cosmos_evm_vm_v1_evm.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvmVmV1MsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl.cosmosEvmVmV1MsgUpdateParamsResponse;
}

/// MsgRegisterPreinstalls defines a Msg for creating preinstalls in evm state.
class MsgRegisterPreinstalls extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRegisterPreinstallsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address of the governance account.
  final String? authority;

  /// preinstalls defines the preinstalls to create.
  final List<cosmos_evm_vm_v1_evm.Preinstall> preinstalls;

  const MsgRegisterPreinstalls({this.authority, this.preinstalls = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos/evm/x/vm/MsgRegisterPreinstalls",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, preinstalls];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'authority': authority,
      'preinstalls': preinstalls.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory MsgRegisterPreinstalls.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRegisterPreinstalls(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      preinstalls:
          (json.valueEnsureAsList<dynamic>(
                'preinstalls',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_evm_vm_v1_evm.Preinstall, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_evm_vm_v1_evm.Preinstall.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory MsgRegisterPreinstalls.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRegisterPreinstalls(
      authority: decode.getString<String?>(1),
      preinstalls:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_evm_vm_v1_evm.Preinstall.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvmVmV1MsgRegisterPreinstalls;
  @override
  MsgRegisterPreinstallsResponse onServiceResponse(List<int> bytes) {
    return MsgRegisterPreinstallsResponse.deserialize(bytes);
  }

  @override
  MsgRegisterPreinstallsResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRegisterPreinstallsResponse.fromJson(json);
  }
}

/// MsgRegisterPreinstallsResponse defines the response structure for executing a
/// MsgRegisterPreinstalls message.
class MsgRegisterPreinstallsResponse extends CosmosProtoMessage {
  const MsgRegisterPreinstallsResponse();

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

  factory MsgRegisterPreinstallsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRegisterPreinstallsResponse();
  }

  factory MsgRegisterPreinstallsResponse.deserialize(List<int> bytes) {
    return MsgRegisterPreinstallsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvmVmV1MsgRegisterPreinstallsResponse;
}
