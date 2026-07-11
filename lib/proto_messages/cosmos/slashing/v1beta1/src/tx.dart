import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/slashing/v1beta1/src/slashing.dart"
    as cosmos_slashing_v1beta1_slashing;

/// MsgUnjail defines the Msg/Unjail request type
class MsgUnjail extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUnjailResponse>,
        ICosmosProtoAminoMessage {
  final String? validatorAddr;

  const MsgUnjail({this.validatorAddr});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "cosmos.msg.v1.signer",
          value: "validator_addr",
        ),
        ProtoOptionString(name: "amino.name", value: "cosmos-sdk/MsgUnjail"),
      ],
      fields: [
        ProtoFieldConfig.string(
          1,
          options: [
            ProtoOptionString(name: "amino.field_name", value: "address"),
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [validatorAddr];

  @override
  Map<String, dynamic> toJson() {
    return {'validator_addr': validatorAddr};
  }

  factory MsgUnjail.fromJson(Map<String, dynamic> json) {
    return MsgUnjail(
      validatorAddr: json.valueAsString<String?>(
        'validator_addr',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUnjail.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUnjail(validatorAddr: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosSlashingV1beta1MsgUnjail;
  @override
  MsgUnjailResponse onServiceResponse(List<int> bytes) {
    return MsgUnjailResponse.deserialize(bytes);
  }

  @override
  MsgUnjailResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUnjailResponse.fromJson(json);
  }
}

/// MsgUnjailResponse defines the Msg/Unjail response type
class MsgUnjailResponse extends CosmosProtoMessage {
  const MsgUnjailResponse();

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

  factory MsgUnjailResponse.fromJson(Map<String, dynamic> json) {
    return MsgUnjailResponse();
  }

  factory MsgUnjailResponse.deserialize(List<int> bytes) {
    return MsgUnjailResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosSlashingV1beta1MsgUnjailResponse;
}

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the x/slashing parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final cosmos_slashing_v1beta1_slashing.Params? params;

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
          value: "cosmos-sdk/x/slashing/MsgUpdateParams",
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
      params: json.valueTo<
        cosmos_slashing_v1beta1_slashing.Params?,
        Map<String, dynamic>
      >(
        key: 'params',
        parse: (v) => cosmos_slashing_v1beta1_slashing.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<cosmos_slashing_v1beta1_slashing.Params?>(
        2,
        (b) => cosmos_slashing_v1beta1_slashing.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosSlashingV1beta1MsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl.cosmosSlashingV1beta1MsgUpdateParamsResponse;
}
