import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// MsgUpdateAdmin defines msg to set permissioned relyer for
/// the specific ibc channel.
class MsgUpdateAdmin extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateAdminResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  final String? channelId;

  final String? portId;

  final String? admin;

  const MsgUpdateAdmin({
    this.authority,
    this.channelId,
    this.portId,
    this.admin,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "ibc-perm/MsgUpdateAdmin"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, channelId, portId, admin];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'channel_id': channelId,
      'port_id': portId,
      'admin': admin,
    };
  }

  factory MsgUpdateAdmin.fromJson(Map<String, dynamic> json) {
    return MsgUpdateAdmin(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      admin: json.valueAsString<String?>('admin', acceptCamelCase: true),
    );
  }

  factory MsgUpdateAdmin.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateAdmin(
      authority: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      portId: decode.getString<String?>(3),
      admin: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsPermV1MsgUpdateAdmin;
  @override
  MsgUpdateAdminResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateAdminResponse.deserialize(bytes);
  }

  @override
  MsgUpdateAdminResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateAdminResponse.fromJson(json);
  }
}

/// MsgUpdateAdminResponse defines the Msg/UpdateAdmin response type.
class MsgUpdateAdminResponse extends CosmosProtoMessage {
  const MsgUpdateAdminResponse();

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

  factory MsgUpdateAdminResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateAdminResponse();
  }

  factory MsgUpdateAdminResponse.deserialize(List<int> bytes) {
    return MsgUpdateAdminResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcApplicationsPermV1MsgUpdateAdminResponse;
}

/// MsgUpdatePermissionedRelayers defines msg to set permissioned relyer for
/// the specific ibc channel.
class MsgUpdatePermissionedRelayers extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdatePermissionedRelayersResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  final String? channelId;

  final String? portId;

  final List<String> relayers;

  const MsgUpdatePermissionedRelayers({
    this.authority,
    this.channelId,
    this.portId,
    this.relayers = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "ibc-perm/MsgUpdatePermissionedRelayers",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, channelId, portId, relayers];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'channel_id': channelId,
      'port_id': portId,
      'relayers': relayers.map((e) => e).toList(),
    };
  }

  factory MsgUpdatePermissionedRelayers.fromJson(Map<String, dynamic> json) {
    return MsgUpdatePermissionedRelayers(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      channelId: json.valueAsString<String?>(
        'channel_id',
        acceptCamelCase: true,
      ),
      portId: json.valueAsString<String?>('port_id', acceptCamelCase: true),
      relayers:
          (json.valueEnsureAsList<dynamic>(
            'relayers',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgUpdatePermissionedRelayers.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdatePermissionedRelayers(
      authority: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      portId: decode.getString<String?>(3),
      relayers: decode.getListOrEmpty<String>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsPermV1MsgUpdatePermissionedRelayers;
  @override
  MsgUpdatePermissionedRelayersResponse onServiceResponse(List<int> bytes) {
    return MsgUpdatePermissionedRelayersResponse.deserialize(bytes);
  }

  @override
  MsgUpdatePermissionedRelayersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdatePermissionedRelayersResponse.fromJson(json);
  }
}

/// MsgUpdatePermissionedRelayersResponse defines the Msg/UpdatePermissionedRelayers response type.
class MsgUpdatePermissionedRelayersResponse extends CosmosProtoMessage {
  const MsgUpdatePermissionedRelayersResponse();

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

  factory MsgUpdatePermissionedRelayersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdatePermissionedRelayersResponse();
  }

  factory MsgUpdatePermissionedRelayersResponse.deserialize(List<int> bytes) {
    return MsgUpdatePermissionedRelayersResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .ibcApplicationsPermV1MsgUpdatePermissionedRelayersResponse;
}
