import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/secret/emergencybutton/v1beta1/src/params.dart"
    as secret_emergencybutton_v1beta1_params;

/// MsgToggleIbcSwitch represents a message to toggle the emergencybutton status
/// by the defined pauser.
class MsgToggleIbcSwitch extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgToggleIbcSwitchResponse> {
  final String? sender;

  const MsgToggleIbcSwitch({this.sender});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [sender];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender};
  }

  factory MsgToggleIbcSwitch.fromJson(Map<String, dynamic> json) {
    return MsgToggleIbcSwitch(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
    );
  }

  factory MsgToggleIbcSwitch.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgToggleIbcSwitch(sender: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretEmergencybuttonV1beta1MsgToggleIbcSwitch;
  @override
  MsgToggleIbcSwitchResponse onServiceResponse(List<int> bytes) {
    return MsgToggleIbcSwitchResponse.deserialize(bytes);
  }

  @override
  MsgToggleIbcSwitchResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgToggleIbcSwitchResponse.fromJson(json);
  }
}

/// MsgToggleIbcSwitchResponse defines the response type for the toggle.
class MsgToggleIbcSwitchResponse extends CosmosProtoMessage {
  const MsgToggleIbcSwitchResponse();

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

  factory MsgToggleIbcSwitchResponse.fromJson(Map<String, dynamic> json) {
    return MsgToggleIbcSwitchResponse();
  }

  factory MsgToggleIbcSwitchResponse.deserialize(List<int> bytes) {
    return MsgToggleIbcSwitchResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .secretEmergencybuttonV1beta1MsgToggleIbcSwitchResponse;
}

class MsgUpdateParams extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateParamsResponse> {
  /// authority is the address of the governance account.
  final String? authority;

  /// params defines the x/emergencybutton parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final secret_emergencybutton_v1beta1_params.Params? params;

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
      params: json.valueTo<
        secret_emergencybutton_v1beta1_params.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => secret_emergencybutton_v1beta1_params.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<secret_emergencybutton_v1beta1_params.Params?>(
        2,
        (b) => secret_emergencybutton_v1beta1_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretEmergencybuttonV1beta1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

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
          .secretEmergencybuttonV1beta1MsgUpdateParamsResponse;
}
