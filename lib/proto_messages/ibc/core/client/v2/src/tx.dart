import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/core/client/v2/src/config.dart"
    as ibc_core_client_v2_config;

/// MsgRegisterCounterparty defines a message to register a counterparty on a client
class MsgRegisterCounterparty extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgRegisterCounterpartyResponse> {
  /// client identifier
  final String? clientId;

  /// counterparty merkle prefix
  final List<List<int>> counterpartyMerklePrefix;

  /// counterparty client identifier
  final String? counterpartyClientId;

  /// signer address
  final String? signer;

  const MsgRegisterCounterparty({
    this.clientId,
    this.counterpartyMerklePrefix = const [],
    this.counterpartyClientId,
    this.signer,
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
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.bytes,
        ),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    clientId,
    counterpartyMerklePrefix,
    counterpartyClientId,
    signer,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'counterparty_merkle_prefix':
          counterpartyMerklePrefix
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
      'counterparty_client_id': counterpartyClientId,
      'signer': signer,
    };
  }

  factory MsgRegisterCounterparty.fromJson(Map<String, dynamic> json) {
    return MsgRegisterCounterparty(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
      counterpartyMerklePrefix:
          (json.valueEnsureAsList<dynamic>(
                'counterparty_merkle_prefix',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
      counterpartyClientId: json.valueAsString<String?>(
        'counterparty_client_id',
        acceptCamelCase: true,
      ),
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
    );
  }

  factory MsgRegisterCounterparty.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRegisterCounterparty(
      clientId: decode.getString<String?>(1),
      counterpartyMerklePrefix: decode.getListOfBytes(2),
      counterpartyClientId: decode.getString<String?>(3),
      signer: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV2MsgRegisterCounterparty;
  @override
  MsgRegisterCounterpartyResponse onServiceResponse(List<int> bytes) {
    return MsgRegisterCounterpartyResponse.deserialize(bytes);
  }

  @override
  MsgRegisterCounterpartyResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRegisterCounterpartyResponse.fromJson(json);
  }
}

/// MsgRegisterCounterpartyResponse defines the Msg/RegisterCounterparty response type.
class MsgRegisterCounterpartyResponse extends CosmosProtoMessage {
  const MsgRegisterCounterpartyResponse();

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

  factory MsgRegisterCounterpartyResponse.fromJson(Map<String, dynamic> json) {
    return MsgRegisterCounterpartyResponse();
  }

  factory MsgRegisterCounterpartyResponse.deserialize(List<int> bytes) {
    return MsgRegisterCounterpartyResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV2MsgRegisterCounterpartyResponse;
}

/// MsgUpdateClientConfig defines the sdk.Msg type to update the configuration for a given client
class MsgUpdateClientConfig extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateClientConfigResponse> {
  /// client identifier
  final String? clientId;

  /// allowed relayers
  ///
  /// NOTE: All fields in the config must be supplied.
  final ibc_core_client_v2_config.Config? config;

  /// signer address
  final String? signer;

  const MsgUpdateClientConfig({this.clientId, this.config, this.signer});

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
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, config, signer];

  @override
  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId,
      'config': config?.toJson(),
      'signer': signer,
    };
  }

  factory MsgUpdateClientConfig.fromJson(Map<String, dynamic> json) {
    return MsgUpdateClientConfig(
      clientId: json.valueAsString<String?>('client_id', acceptCamelCase: true),
      config: json
          .valueTo<ibc_core_client_v2_config.Config?, Map<String, dynamic>>(
            key: 'config',
            parse: (v) => ibc_core_client_v2_config.Config.fromJson(v),
            acceptCamelCase: true,
          ),
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
    );
  }

  factory MsgUpdateClientConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateClientConfig(
      clientId: decode.getString<String?>(1),
      config: decode.messageTo<ibc_core_client_v2_config.Config?>(
        2,
        (b) => ibc_core_client_v2_config.Config.deserialize(b),
      ),
      signer: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV2MsgUpdateClientConfig;
  @override
  MsgUpdateClientConfigResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateClientConfigResponse.deserialize(bytes);
  }

  @override
  MsgUpdateClientConfigResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateClientConfigResponse.fromJson(json);
  }
}

/// MsgUpdateClientConfigResponse defines the MsgUpdateClientConfig response type.
class MsgUpdateClientConfigResponse extends CosmosProtoMessage {
  const MsgUpdateClientConfigResponse();

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

  factory MsgUpdateClientConfigResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateClientConfigResponse();
  }

  factory MsgUpdateClientConfigResponse.deserialize(List<int> bytes) {
    return MsgUpdateClientConfigResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV2MsgUpdateClientConfigResponse;
}
