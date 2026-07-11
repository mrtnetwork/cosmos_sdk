import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// MsgStoreCode defines the request type for the StoreCode rpc.
class MsgStoreCode extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgStoreCodeResponse> {
  /// signer address
  final String? signer;

  /// wasm byte code of light client contract. It can be raw or gzip compressed
  final List<int>? wasmByteCode;

  const MsgStoreCode({this.signer, this.wasmByteCode});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [signer, wasmByteCode];

  @override
  Map<String, dynamic> toJson() {
    return {
      'signer': signer,
      'wasm_byte_code': switch (wasmByteCode) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgStoreCode.fromJson(Map<String, dynamic> json) {
    return MsgStoreCode(
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
      wasmByteCode: json.valueAsBytes<List<int>?>(
        'wasm_byte_code',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgStoreCode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgStoreCode(
      signer: decode.getString<String?>(1),
      wasmByteCode: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcLightclientsWasmV1MsgStoreCode;
  @override
  MsgStoreCodeResponse onServiceResponse(List<int> bytes) {
    return MsgStoreCodeResponse.deserialize(bytes);
  }

  @override
  MsgStoreCodeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgStoreCodeResponse.fromJson(json);
  }
}

/// MsgStoreCodeResponse defines the response type for the StoreCode rpc
class MsgStoreCodeResponse extends CosmosProtoMessage {
  /// checksum is the sha256 hash of the stored code
  final List<int>? checksum;

  const MsgStoreCodeResponse({this.checksum});

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
  List<Object?> get protoValues => [checksum];

  @override
  Map<String, dynamic> toJson() {
    return {
      'checksum': switch (checksum) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgStoreCodeResponse.fromJson(Map<String, dynamic> json) {
    return MsgStoreCodeResponse(
      checksum: json.valueAsBytes<List<int>?>(
        'checksum',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgStoreCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgStoreCodeResponse(checksum: decode.getBytes<List<int>?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcLightclientsWasmV1MsgStoreCodeResponse;
}

/// MsgRemoveChecksum defines the request type for the MsgRemoveChecksum rpc.
class MsgRemoveChecksum extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgRemoveChecksumResponse> {
  /// signer address
  final String? signer;

  /// checksum is the sha256 hash to be removed from the store
  final List<int>? checksum;

  const MsgRemoveChecksum({this.signer, this.checksum});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [signer, checksum];

  @override
  Map<String, dynamic> toJson() {
    return {
      'signer': signer,
      'checksum': switch (checksum) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgRemoveChecksum.fromJson(Map<String, dynamic> json) {
    return MsgRemoveChecksum(
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
      checksum: json.valueAsBytes<List<int>?>(
        'checksum',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgRemoveChecksum.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveChecksum(
      signer: decode.getString<String?>(1),
      checksum: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcLightclientsWasmV1MsgRemoveChecksum;
  @override
  MsgRemoveChecksumResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveChecksumResponse.deserialize(bytes);
  }

  @override
  MsgRemoveChecksumResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRemoveChecksumResponse.fromJson(json);
  }
}

/// MsgStoreChecksumResponse defines the response type for the StoreCode rpc
class MsgRemoveChecksumResponse extends CosmosProtoMessage {
  const MsgRemoveChecksumResponse();

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

  factory MsgRemoveChecksumResponse.fromJson(Map<String, dynamic> json) {
    return MsgRemoveChecksumResponse();
  }

  factory MsgRemoveChecksumResponse.deserialize(List<int> bytes) {
    return MsgRemoveChecksumResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcLightclientsWasmV1MsgRemoveChecksumResponse;
}

/// MsgMigrateContract defines the request type for the MigrateContract rpc.
class MsgMigrateContract extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgMigrateContractResponse> {
  /// signer address
  final String? signer;

  /// the client id of the contract
  final String? clientId;

  /// checksum is the sha256 hash of the new wasm byte code for the contract
  final List<int>? checksum;

  /// the json encoded message to be passed to the contract on migration
  final List<int>? msg;

  const MsgMigrateContract({
    this.signer,
    this.clientId,
    this.checksum,
    this.msg,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.bytes(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signer, clientId, checksum, msg];

  @override
  Map<String, dynamic> toJson() {
    return {
      'signer': signer,
      'client_id': clientId,
      'checksum': switch (checksum) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'msg': switch (msg) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgMigrateContract.fromJson(Map<String, dynamic> json) {
    return MsgMigrateContract(
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
      checksum: json.valueAsBytes<List<int>?>(
        'checksum',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      msg: json.valueAsBytes<List<int>?>(
        'msg',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgMigrateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgMigrateContract(
      signer: decode.getString<String?>(1),
      clientId: decode.getString<String?>(2),
      checksum: decode.getBytes<List<int>?>(3),
      msg: decode.getBytes<List<int>?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcLightclientsWasmV1MsgMigrateContract;
  @override
  MsgMigrateContractResponse onServiceResponse(List<int> bytes) {
    return MsgMigrateContractResponse.deserialize(bytes);
  }

  @override
  MsgMigrateContractResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgMigrateContractResponse.fromJson(json);
  }
}

/// MsgMigrateContractResponse defines the response type for the MigrateContract rpc
class MsgMigrateContractResponse extends CosmosProtoMessage {
  const MsgMigrateContractResponse();

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

  factory MsgMigrateContractResponse.fromJson(Map<String, dynamic> json) {
    return MsgMigrateContractResponse();
  }

  factory MsgMigrateContractResponse.deserialize(List<int> bytes) {
    return MsgMigrateContractResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcLightclientsWasmV1MsgMigrateContractResponse;
}
