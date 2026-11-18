import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/stratos/evm/v1/src/evm.dart"
    as stratos_evm_v1_evm;

/// MsgEthereumTx encapsulates an Ethereum transaction as an SDK message.
class MsgEthereumTx extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgEthereumTxResponse> {
  /// inner transaction data
  final google_protobuf_any.Any? data;

  /// caches
  /// encoded storage size of the transaction
  final double? size;

  /// transaction hash in hex format
  final String? hash;

  /// ethereum signer address in hex format. This address value is checked
  /// against the address derived from the signature (V, R, S) using the
  /// secp256k1 elliptic curve
  final String? from;

  const MsgEthereumTx({this.data, this.size, this.hash, this.from});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.double(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [data, size, hash, from];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'data': config.encodeMessage(data),
      'size': size,
      'hash': hash,
      'from': from,
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
      hash: json.valueAsString<String?>(
        'hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
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
      hash: decode.getString<String?>(3),
      from: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1MsgEthereumTx;
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
  /// ethereum transaction hash in hex format. This hash differs from the
  /// Tendermint sha256 hash of the transaction bytes. See
  /// https://github.com/tendermint/tendermint/issues/6539 for reference
  final String? hash;

  /// logs contains the transaction hash and the proto-compatible ethereum
  /// logs.
  final List<stratos_evm_v1_evm.Log> logs;

  /// returned data from evm function (result or data supplied with revert
  /// opcode)
  final BuBytes? ret;

  /// vm error is the error returned by vm execution
  final String? vmError;

  /// gas consumed by the transaction
  final BigInt? gasUsed;

  MsgEthereumTxResponse({
    this.hash,
    this.logs = const [],
    List<int>? ret,
    this.vmError,
    this.gasUsed,
  }) : ret = ret?.asImmutableBytes;

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [hash, logs, ret, vmError, gasUsed];

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
                (e) => JsonParser.valueTo<stratos_evm_v1_evm.Log, Object>(
                  value: e,
                  parse:
                      (v) => stratos_evm_v1_evm.Log.fromJson(
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
    );
  }

  factory MsgEthereumTxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgEthereumTxResponse(
      hash: decode.getString<String?>(1),
      logs:
          decode
              .getListOfBytes(2)
              .map((b) => stratos_evm_v1_evm.Log.deserialize(b))
              .toList(),
      ret: decode.getBytes<List<int>?>(3),
      vmError: decode.getString<String?>(4),
      gasUsed: decode.getBigInt<BigInt?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1MsgEthereumTxResponse;
}

/// MsgUpdateParams defines a Msg for updating the x/evm module parameters.
class MsgUpdateParams extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateParamsResponse> {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the x/evm parameters to update.
  /// NOTE: All parameters must be supplied.
  final stratos_evm_v1_evm.Params? params;

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

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<stratos_evm_v1_evm.Params?>(
        2,
        (b) => stratos_evm_v1_evm.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1MsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl.stratosEvmV1MsgUpdateParamsResponse;
}

/// MsgUpdateImplmentationProposal used to update implemntation for genesis proxies
class MsgUpdateImplmentationProposal extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateImplmentationProposalResponse> {
  /// authority is the address of the governance account.
  final String? authority;

  /// proxy address where data will be executed
  final String? proxyAddress;

  /// implmentation address as API for a storage
  final String? implementationAddress;

  /// data for execution
  final BuBytes? data;

  /// value for proxy func call
  final String? value;

  MsgUpdateImplmentationProposal({
    this.authority,
    this.proxyAddress,
    this.implementationAddress,
    List<int>? data,
    this.value,
  }) : data = data?.asImmutableBytes;

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
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    authority,
    proxyAddress,
    implementationAddress,
    data,
    value,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'authority': authority,
      'proxy_address': proxyAddress,
      'implementation_address': implementationAddress,
      'data': config.encodeBinary(data),
      'value': value,
    };
  }

  factory MsgUpdateImplmentationProposal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateImplmentationProposal(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proxyAddress: json.valueAsString<String?>(
        'proxy_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      implementationAddress: json.valueAsString<String?>(
        'implementation_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      data: config.decodeBinary<List<int>?>(
        json.valueAs('data', normalizeKeyLookup: config.normalizeKeys),
      ),
      value: json.valueAsString<String?>(
        'value',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateImplmentationProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateImplmentationProposal(
      authority: decode.getString<String?>(1),
      proxyAddress: decode.getString<String?>(2),
      implementationAddress: decode.getString<String?>(3),
      data: decode.getBytes<List<int>?>(4),
      value: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosEvmV1MsgUpdateImplmentationProposal;
  @override
  MsgUpdateImplmentationProposalResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateImplmentationProposalResponse.deserialize(bytes);
  }

  @override
  MsgUpdateImplmentationProposalResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateImplmentationProposalResponse.fromJson(json);
  }
}

/// MsgUpdateImplmentationProposalResponse defines the response structure for executing a
/// MsgUpdateImplmentationProposal message.
class MsgUpdateImplmentationProposalResponse extends CosmosProtoMessage {
  const MsgUpdateImplmentationProposalResponse();

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

  factory MsgUpdateImplmentationProposalResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateImplmentationProposalResponse();
  }

  factory MsgUpdateImplmentationProposalResponse.deserialize(List<int> bytes) {
    return MsgUpdateImplmentationProposalResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .stratosEvmV1MsgUpdateImplmentationProposalResponse;
}
