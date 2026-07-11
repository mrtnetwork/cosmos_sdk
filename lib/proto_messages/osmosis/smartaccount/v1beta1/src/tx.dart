import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

/// MsgAddAuthenticatorRequest defines the Msg/AddAuthenticator request type.
class MsgAddAuthenticator extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAddAuthenticatorResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final String? authenticatorType;

  final List<int>? data;

  const MsgAddAuthenticator({this.sender, this.authenticatorType, this.data});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/smartaccount/add-authenticator",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.bytes(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, authenticatorType, data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'authenticator_type': authenticatorType,
      'data': switch (data) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory MsgAddAuthenticator.fromJson(Map<String, dynamic> json) {
    return MsgAddAuthenticator(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      authenticatorType: json.valueAsString<String?>(
        'authenticator_type',
        acceptCamelCase: true,
      ),
      data: json.valueAsBytes<List<int>?>(
        'data',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory MsgAddAuthenticator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddAuthenticator(
      sender: decode.getString<String?>(1),
      authenticatorType: decode.getString<String?>(2),
      data: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSmartaccountV1beta1MsgAddAuthenticator;
  @override
  MsgAddAuthenticatorResponse onServiceResponse(List<int> bytes) {
    return MsgAddAuthenticatorResponse.deserialize(bytes);
  }

  @override
  MsgAddAuthenticatorResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgAddAuthenticatorResponse.fromJson(json);
  }
}

/// MsgAddAuthenticatorResponse defines the Msg/AddAuthenticator response type.
class MsgAddAuthenticatorResponse extends CosmosProtoMessage {
  final bool? success;

  const MsgAddAuthenticatorResponse({this.success});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [success];

  @override
  Map<String, dynamic> toJson() {
    return {'success': success};
  }

  factory MsgAddAuthenticatorResponse.fromJson(Map<String, dynamic> json) {
    return MsgAddAuthenticatorResponse(
      success: json.valueAsBool<bool?>('success', acceptCamelCase: true),
    );
  }

  factory MsgAddAuthenticatorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddAuthenticatorResponse(success: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSmartaccountV1beta1MsgAddAuthenticatorResponse;
}

/// MsgRemoveAuthenticatorRequest defines the Msg/RemoveAuthenticator request
/// type.
class MsgRemoveAuthenticator extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRemoveAuthenticatorResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? id;

  const MsgRemoveAuthenticator({this.sender, this.id});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/smartaccount/remove-authenticator",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.uint64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, id];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'id': id?.toString()};
  }

  factory MsgRemoveAuthenticator.fromJson(Map<String, dynamic> json) {
    return MsgRemoveAuthenticator(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
    );
  }

  factory MsgRemoveAuthenticator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveAuthenticator(
      sender: decode.getString<String?>(1),
      id: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSmartaccountV1beta1MsgRemoveAuthenticator;
  @override
  MsgRemoveAuthenticatorResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveAuthenticatorResponse.deserialize(bytes);
  }

  @override
  MsgRemoveAuthenticatorResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRemoveAuthenticatorResponse.fromJson(json);
  }
}

/// MsgRemoveAuthenticatorResponse defines the Msg/RemoveAuthenticator response
/// type.
class MsgRemoveAuthenticatorResponse extends CosmosProtoMessage {
  final bool? success;

  const MsgRemoveAuthenticatorResponse({this.success});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.bool(1)],
    );
  }

  @override
  List<Object?> get protoValues => [success];

  @override
  Map<String, dynamic> toJson() {
    return {'success': success};
  }

  factory MsgRemoveAuthenticatorResponse.fromJson(Map<String, dynamic> json) {
    return MsgRemoveAuthenticatorResponse(
      success: json.valueAsBool<bool?>('success', acceptCamelCase: true),
    );
  }

  factory MsgRemoveAuthenticatorResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveAuthenticatorResponse(success: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSmartaccountV1beta1MsgRemoveAuthenticatorResponse;
}

class MsgSetActiveState extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetActiveStateResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final bool? active;

  const MsgSetActiveState({this.sender, this.active});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "osmosis/smartaccount/set-active-state",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bool(2)],
    );
  }

  @override
  List<Object?> get protoValues => [sender, active];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'active': active};
  }

  factory MsgSetActiveState.fromJson(Map<String, dynamic> json) {
    return MsgSetActiveState(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      active: json.valueAsBool<bool?>('active', acceptCamelCase: true),
    );
  }

  factory MsgSetActiveState.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetActiveState(
      sender: decode.getString<String?>(1),
      active: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.osmosisSmartaccountV1beta1MsgSetActiveState;
  @override
  MsgSetActiveStateResponse onServiceResponse(List<int> bytes) {
    return MsgSetActiveStateResponse.deserialize(bytes);
  }

  @override
  MsgSetActiveStateResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSetActiveStateResponse.fromJson(json);
  }
}

class MsgSetActiveStateResponse extends CosmosProtoMessage {
  const MsgSetActiveStateResponse();

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

  factory MsgSetActiveStateResponse.fromJson(Map<String, dynamic> json) {
    return MsgSetActiveStateResponse();
  }

  factory MsgSetActiveStateResponse.deserialize(List<int> bytes) {
    return MsgSetActiveStateResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .osmosisSmartaccountV1beta1MsgSetActiveStateResponse;
}
