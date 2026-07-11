import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/core/channel/v1/src/channel.dart"
    as ibc_core_channel_v1_channel;
import "package:cosmos_sdk/proto_messages/ibc/applications/interchain_accounts/v1/src/packet.dart"
    as ibc_applications_interchain_accounts_v1_packet;
import "package:cosmos_sdk/proto_messages/ibc/applications/interchain_accounts/controller/v1/src/controller.dart"
    as ibc_applications_interchain_accounts_controller_v1_controller;

/// MsgRegisterInterchainAccount defines the payload for Msg/RegisterAccount
class MsgRegisterInterchainAccount extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgRegisterInterchainAccountResponse> {
  final String? owner;

  final String? connectionId;

  final String? version;

  final ibc_core_channel_v1_channel.Order? ordering;

  const MsgRegisterInterchainAccount({
    this.owner,
    this.connectionId,
    this.version,
    this.ordering,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.enumType(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, connectionId, version, ordering];

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'connection_id': connectionId,
      'version': version,
      'ordering': ordering?.protoName,
    };
  }

  factory MsgRegisterInterchainAccount.fromJson(Map<String, dynamic> json) {
    return MsgRegisterInterchainAccount(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
      version: json.valueAsString<String?>('version', acceptCamelCase: true),
      ordering: json.valueTo<ibc_core_channel_v1_channel.Order?, Object?>(
        key: 'ordering',
        parse: (v) => ibc_core_channel_v1_channel.Order.from(v),
      ),
    );
  }

  factory MsgRegisterInterchainAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRegisterInterchainAccount(
      owner: decode.getString<String?>(1),
      connectionId: decode.getString<String?>(2),
      version: decode.getString<String?>(3),
      ordering: decode.getEnum<ibc_core_channel_v1_channel.Order?>(
        4,
        ibc_core_channel_v1_channel.Order.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsControllerV1MsgRegisterInterchainAccount;
  @override
  MsgRegisterInterchainAccountResponse onServiceResponse(List<int> bytes) {
    return MsgRegisterInterchainAccountResponse.deserialize(bytes);
  }

  @override
  MsgRegisterInterchainAccountResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRegisterInterchainAccountResponse.fromJson(json);
  }
}

/// MsgRegisterInterchainAccountResponse defines the response for Msg/RegisterAccount
class MsgRegisterInterchainAccountResponse extends CosmosProtoMessage {
  final String? channelId;

  final String? portId;

  const MsgRegisterInterchainAccountResponse({this.channelId, this.portId});

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
  List<Object?> get protoValues => [channelId, portId];

  @override
  Map<String, dynamic> toJson() {
    return {'channel_id': channelId, 'port_id': portId};
  }

  factory MsgRegisterInterchainAccountResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgRegisterInterchainAccountResponse(
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
    );
  }

  factory MsgRegisterInterchainAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRegisterInterchainAccountResponse(
      channelId: decode.getString<String?>(1),
      portId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsControllerV1MsgRegisterInterchainAccountResponse;
}

/// MsgSendTx defines the payload for Msg/SendTx
class MsgSendTx extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgSendTxResponse> {
  final String? owner;

  final String? connectionId;

  final ibc_applications_interchain_accounts_v1_packet.InterchainAccountPacketData?
  packetData;

  /// Relative timeout timestamp provided will be added to the current block time during transaction execution.
  /// The timeout timestamp must be non-zero.
  final BigInt? relativeTimeout;

  const MsgSendTx({
    this.owner,
    this.connectionId,
    this.packetData,
    this.relativeTimeout,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.uint64(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    owner,
    connectionId,
    packetData,
    relativeTimeout,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'owner': owner,
      'connection_id': connectionId,
      'packet_data': packetData?.toJson(),
      'relative_timeout': relativeTimeout?.toString(),
    };
  }

  factory MsgSendTx.fromJson(Map<String, dynamic> json) {
    return MsgSendTx(
      owner: json.valueAsString<String?>('owner', acceptCamelCase: true),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        acceptCamelCase: true,
      ),
      packetData: json.valueTo<
        ibc_applications_interchain_accounts_v1_packet.InterchainAccountPacketData?,
        Map<String, dynamic>
      >(
        key: 'packet_data',
        parse:
            (v) => ibc_applications_interchain_accounts_v1_packet
                .InterchainAccountPacketData.fromJson(v),
        acceptCamelCase: true,
      ),
      relativeTimeout: json.valueAsBigInt<BigInt?>(
        'relative_timeout',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgSendTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSendTx(
      owner: decode.getString<String?>(1),
      connectionId: decode.getString<String?>(2),
      packetData: decode.messageTo<
        ibc_applications_interchain_accounts_v1_packet.InterchainAccountPacketData?
      >(
        3,
        (b) => ibc_applications_interchain_accounts_v1_packet
            .InterchainAccountPacketData.deserialize(b),
      ),
      relativeTimeout: decode.getBigInt<BigInt?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsControllerV1MsgSendTx;
  @override
  MsgSendTxResponse onServiceResponse(List<int> bytes) {
    return MsgSendTxResponse.deserialize(bytes);
  }

  @override
  MsgSendTxResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSendTxResponse.fromJson(json);
  }
}

/// MsgSendTxResponse defines the response for MsgSendTx
class MsgSendTxResponse extends CosmosProtoMessage {
  final BigInt? sequence;

  const MsgSendTxResponse({this.sequence});

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
  List<Object?> get protoValues => [sequence];

  @override
  Map<String, dynamic> toJson() {
    return {'sequence': sequence?.toString()};
  }

  factory MsgSendTxResponse.fromJson(Map<String, dynamic> json) {
    return MsgSendTxResponse(
      sequence: json.valueAsBigInt<BigInt?>('sequence', acceptCamelCase: true),
    );
  }

  factory MsgSendTxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSendTxResponse(sequence: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsControllerV1MsgSendTxResponse;
}

/// MsgUpdateParams defines the payload for Msg/UpdateParams
class MsgUpdateParams extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateParamsResponse> {
  /// signer address
  final String? signer;

  /// params defines the 27-interchain-accounts/controller parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final ibc_applications_interchain_accounts_controller_v1_controller.Params?
  params;

  const MsgUpdateParams({this.signer, this.params});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [signer, params];

  @override
  Map<String, dynamic> toJson() {
    return {'signer': signer, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      signer: json.valueAsString<String?>('signer', acceptCamelCase: true),
      params: json.valueTo<
        ibc_applications_interchain_accounts_controller_v1_controller.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse:
            (v) => ibc_applications_interchain_accounts_controller_v1_controller
                .Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      signer: decode.getString<String?>(1),
      params: decode.messageTo<
        ibc_applications_interchain_accounts_controller_v1_controller.Params?
      >(
        2,
        (b) => ibc_applications_interchain_accounts_controller_v1_controller
            .Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsControllerV1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse defines the response for Msg/UpdateParams
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
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsInterchainAccountsControllerV1MsgUpdateParamsResponse;
}
