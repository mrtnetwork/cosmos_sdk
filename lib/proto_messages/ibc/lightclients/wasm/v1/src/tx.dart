import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// MsgStoreCode defines the request type for the StoreCode rpc.
class MsgStoreCode extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgStoreCodeResponse> {
  /// signer address
  final String? signer;

  /// wasm byte code of light client contract. It can be raw or gzip compressed
  final BuBytes? wasmByteCode;

  MsgStoreCode({this.signer, List<int>? wasmByteCode})
    : wasmByteCode = wasmByteCode?.asImmutableBytes;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'signer': signer,
      'wasm_byte_code': config.encodeBinary(wasmByteCode),
    };
  }

  factory MsgStoreCode.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgStoreCode(
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      wasmByteCode: config.decodeBinary<List<int>?>(
        json.valueAs(
          'wasm_byte_code',
          normalizeKeyLookup: config.normalizeKeys,
        ),
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
  final BuBytes? checksum;

  MsgStoreCodeResponse({List<int>? checksum})
    : checksum = checksum?.asImmutableBytes;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'checksum': config.encodeBinary(checksum)};
  }

  factory MsgStoreCodeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgStoreCodeResponse(
      checksum: config.decodeBinary<List<int>?>(
        json.valueAs('checksum', normalizeKeyLookup: config.normalizeKeys),
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
  final BuBytes? checksum;

  MsgRemoveChecksum({this.signer, List<int>? checksum})
    : checksum = checksum?.asImmutableBytes;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'signer': signer, 'checksum': config.encodeBinary(checksum)};
  }

  factory MsgRemoveChecksum.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRemoveChecksum(
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      checksum: config.decodeBinary<List<int>?>(
        json.valueAs('checksum', normalizeKeyLookup: config.normalizeKeys),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgRemoveChecksumResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
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
  final BuBytes? checksum;

  /// the json encoded message to be passed to the contract on migration
  final BuBytes? msg;

  MsgMigrateContract({
    this.signer,
    this.clientId,
    List<int>? checksum,
    List<int>? msg,
  }) : checksum = checksum?.asImmutableBytes,
       msg = msg?.asImmutableBytes;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'signer': signer,
      'client_id': clientId,
      'checksum': config.encodeBinary(checksum),
      'msg': config.encodeBinary(msg),
    };
  }

  factory MsgMigrateContract.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgMigrateContract(
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      checksum: config.decodeBinary<List<int>?>(
        json.valueAs('checksum', normalizeKeyLookup: config.normalizeKeys),
      ),
      msg: config.decodeBinary<List<int>?>(
        json.valueAs('msg', normalizeKeyLookup: config.normalizeKeys),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgMigrateContractResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgMigrateContractResponse();
  }

  factory MsgMigrateContractResponse.deserialize(List<int> bytes) {
    return MsgMigrateContractResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcLightclientsWasmV1MsgMigrateContractResponse;
}
