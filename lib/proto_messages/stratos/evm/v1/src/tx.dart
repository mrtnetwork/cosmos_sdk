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
  Map<String, dynamic> toJson() {
    return {'data': data?.toJson(), 'size': size, 'hash': hash, 'from': from};
  }

  factory MsgEthereumTx.fromJson(Map<String, dynamic> json) {
    return MsgEthereumTx(
      data: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'data',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
      size: json.valueAsDouble<double?>('size', acceptCamelCase: true),
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
      from: json.valueAsString<String?>('from', acceptCamelCase: true),
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
  final List<int>? ret;

  /// vm error is the error returned by vm execution
  final String? vmError;

  /// gas consumed by the transaction
  final BigInt? gasUsed;

  const MsgEthereumTxResponse({
    this.hash,
    this.logs = const [],
    this.ret,
    this.vmError,
    this.gasUsed,
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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [hash, logs, ret, vmError, gasUsed];

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
    };
  }

  factory MsgEthereumTxResponse.fromJson(Map<String, dynamic> json) {
    return MsgEthereumTxResponse(
      hash: json.valueAsString<String?>('hash', acceptCamelCase: true),
      logs:
          (json.valueEnsureAsList<dynamic>('logs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  stratos_evm_v1_evm.Log,
                  Map<String, dynamic>
                >(value: e, parse: (v) => stratos_evm_v1_evm.Log.fromJson(v)),
              )
              .toList(),
      ret: json.valueAsBytes<List<int>?>(
        'ret',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      vmError: json.valueAsString<String?>('vm_error', acceptCamelCase: true),
      gasUsed: json.valueAsBigInt<BigInt?>('gas_used', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      params: json.valueTo<stratos_evm_v1_evm.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => stratos_evm_v1_evm.Params.fromJson(v),
        acceptCamelCase: true,
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
  final List<int>? data;

  /// value for proxy func call
  final String? value;

  const MsgUpdateImplmentationProposal({
    this.authority,
    this.proxyAddress,
    this.implementationAddress,
    this.data,
    this.value,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'proxy_address': proxyAddress,
      'implementation_address': implementationAddress,
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'value': value,
    };
  }

  factory MsgUpdateImplmentationProposal.fromJson(Map<String, dynamic> json) {
    return MsgUpdateImplmentationProposal(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      proxyAddress: json.valueAsString<String?>(
        'proxy_address',
        acceptCamelCase: true,
      ),
      implementationAddress: json.valueAsString<String?>(
        'implementation_address',
        acceptCamelCase: true,
      ),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      value: json.valueAsString<String?>('value', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgUpdateImplmentationProposalResponse.fromJson(
    Map<String, dynamic> json,
  ) {
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
