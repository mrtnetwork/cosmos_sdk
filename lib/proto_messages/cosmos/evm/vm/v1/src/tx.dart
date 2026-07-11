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
  final List<int>? from;

  /// raw is the raw ethereum transaction
  final List<int>? raw;

  const MsgEthereumTx({this.from, this.raw});

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
  Map<String, dynamic> toJson() {
    return {
      'from': switch (from) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'raw': switch (raw) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgEthereumTx.fromJson(Map<String, dynamic> json) {
    return MsgEthereumTx(
      from: json.valueAsBytes<List<int>?>(
        'from',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      raw: json.valueAsBytes<List<int>?>(
        'raw',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  final List<int>? ret;

  /// vm_error is the error returned by vm execution
  final String? vmError;

  /// gas_used specifies how much gas was consumed by the transaction
  final BigInt? gasUsed;

  /// max_used_gas specifies the gas consumed by the transaction, not including
  /// refunds
  final BigInt? maxUsedGas;

  /// include the block hash for json-rpc to use
  final List<int>? blockHash;

  /// include the block timestamp for json-rpc to use
  final BigInt? blockTimestamp;

  const MsgEthereumTxResponse({
    this.hash,
    this.logs = const [],
    this.ret,
    this.vmError,
    this.gasUsed,
    this.maxUsedGas,
    this.blockHash,
    this.blockTimestamp,
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
  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'logs': logs.map((e) => e.toJson()).toList(),
      'ret': switch (ret) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'vm_error': vmError,
      'gas_used': gasUsed?.toString(),
      'max_used_gas': maxUsedGas?.toString(),
      'block_hash': switch (blockHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'block_timestamp': blockTimestamp?.toString(),
    };
  }

  factory MsgEthereumTxResponse.fromJson(Map<String, dynamic> json) {
    return MsgEthereumTxResponse(
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
      logs:
          (json.valueEnsureAsList<dynamic>('logs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_evm_vm_v1_evm.Log,
                  Map<String, dynamic>
                >(value: e, parse: (v) => cosmos_evm_vm_v1_evm.Log.fromJson(v)),
              )
              .toList(),
      ret: json.valueAsBytes<List<int>?>(
        'ret',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      vmError: json.valueAsString<String?>('vm_error', acceptCamelCase: true),
      gasUsed: json.valueAsBigInt<BigInt?>('gas_used', acceptCamelCase: true),
      maxUsedGas: json.valueAsBigInt<BigInt?>(
        'max_used_gas',
        acceptCamelCase: true,
      ),
      blockHash: json.valueAsBytes<List<int>?>(
        'block_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      blockTimestamp: json.valueAsBigInt<BigInt?>(
        'block_timestamp',
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      params: json.valueTo<cosmos_evm_vm_v1_evm.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => cosmos_evm_vm_v1_evm.Params.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateParamsResponse.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'preinstalls': preinstalls.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgRegisterPreinstalls.fromJson(Map<String, dynamic> json) {
    return MsgRegisterPreinstalls(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      preinstalls:
          (json.valueEnsureAsList<dynamic>(
                'preinstalls',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_evm_vm_v1_evm.Preinstall,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_evm_vm_v1_evm.Preinstall.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgRegisterPreinstallsResponse.fromJson(Map<String, dynamic> json) {
    return MsgRegisterPreinstallsResponse();
  }

  factory MsgRegisterPreinstallsResponse.deserialize(List<int> bytes) {
    return MsgRegisterPreinstallsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosEvmVmV1MsgRegisterPreinstallsResponse;
}
