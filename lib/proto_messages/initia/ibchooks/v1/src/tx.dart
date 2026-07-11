import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/initia/ibchooks/v1/src/types.dart"
    as initia_ibchooks_v1_types;

/// //////////////////
/// / Gov Messages ///
/// //////////////////
/// MsgUpdateACL is the message to update ACL of an address.
class MsgUpdateACL extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateACLResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  /// Address is a contract address (wasm, evm) or a contract deployer address (move).
  final String? address;

  /// Allowed is the flag whether this address is allowed to use hook or not.
  final bool? allowed;

  const MsgUpdateACL({this.authority, this.address, this.allowed});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "ibchooks/MsgUpdateACL"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.bool(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, address, allowed];

  @override
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'address': address, 'allowed': allowed};
  }

  factory MsgUpdateACL.fromJson(Map<String, dynamic> json) {
    return MsgUpdateACL(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      address: json.valueAsString<String?>('address', acceptCamelCase: true),
      allowed: json.valueAsBool<bool?>('allowed', acceptCamelCase: true),
    );
  }

  factory MsgUpdateACL.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateACL(
      authority: decode.getString<String?>(1),
      address: decode.getString<String?>(2),
      allowed: decode.getBool<bool?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIbchooksV1MsgUpdateACL;
  @override
  MsgUpdateACLResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateACLResponse.deserialize(bytes);
  }

  @override
  MsgUpdateACLResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateACLResponse.fromJson(json);
  }
}

/// MsgUpdateACLResponse returns execution result data.
class MsgUpdateACLResponse extends CosmosProtoMessage {
  const MsgUpdateACLResponse();

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

  factory MsgUpdateACLResponse.fromJson(Map<String, dynamic> json) {
    return MsgUpdateACLResponse();
  }

  factory MsgUpdateACLResponse.deserialize(List<int> bytes) {
    return MsgUpdateACLResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIbchooksV1MsgUpdateACLResponse;
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module
  /// (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the x/hook parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final initia_ibchooks_v1_types.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "ibchooks/MsgUpdateParams",
        ),
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
      params: json
          .valueTo<initia_ibchooks_v1_types.Params?, Map<String, dynamic>>(
            key: 'params',
            parse: (v) => initia_ibchooks_v1_types.Params.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<initia_ibchooks_v1_types.Params?>(
        2,
        (b) => initia_ibchooks_v1_types.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIbchooksV1MsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl.initiaIbchooksV1MsgUpdateParamsResponse;
}
