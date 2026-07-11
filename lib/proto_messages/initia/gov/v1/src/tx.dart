import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/initia/gov/v1/src/gov.dart"
    as initia_gov_v1_gov;

/// MsgUpdateParams is the Msg/UpdateParams request type.
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// params defines the x/gov parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final initia_gov_v1_gov.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(name: "amino.name", value: "gov/MsgUpdateParams"),
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
      params: json.valueTo<initia_gov_v1_gov.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => initia_gov_v1_gov.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      authority: decode.getString<String?>(1),
      params: decode.messageTo<initia_gov_v1_gov.Params?>(
        2,
        (b) => initia_gov_v1_gov.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1MsgUpdateParams;
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
      DefaultCosmosProtoTypeUrl.initiaGovV1MsgUpdateParamsResponse;
}

/// MsgAddEmergencySubmitters is the Msg/AddEmergencySubmitters request type.
class MsgAddEmergencySubmitters extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAddEmergencySubmittersResponse>,
        ICosmosProtoAminoMessage {
  final String? authority;

  final List<String> emergencySubmitters;

  const MsgAddEmergencySubmitters({
    this.authority,
    this.emergencySubmitters = const [],
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
          value: "gov/MsgAddEmergencySubmitters",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, emergencySubmitters];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'emergency_submitters': emergencySubmitters.map((e) => e).toList(),
    };
  }

  factory MsgAddEmergencySubmitters.fromJson(Map<String, dynamic> json) {
    return MsgAddEmergencySubmitters(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      emergencySubmitters:
          (json.valueEnsureAsList<dynamic>(
            'emergency_submitters',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgAddEmergencySubmitters.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddEmergencySubmitters(
      authority: decode.getString<String?>(1),
      emergencySubmitters: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1MsgAddEmergencySubmitters;
  @override
  MsgAddEmergencySubmittersResponse onServiceResponse(List<int> bytes) {
    return MsgAddEmergencySubmittersResponse.deserialize(bytes);
  }

  @override
  MsgAddEmergencySubmittersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgAddEmergencySubmittersResponse.fromJson(json);
  }
}

/// MsgAddEmergencySubmittersResponse defines the response structure for executing a
/// MsgAddEmergencySubmitters message.
class MsgAddEmergencySubmittersResponse extends CosmosProtoMessage {
  const MsgAddEmergencySubmittersResponse();

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

  factory MsgAddEmergencySubmittersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgAddEmergencySubmittersResponse();
  }

  factory MsgAddEmergencySubmittersResponse.deserialize(List<int> bytes) {
    return MsgAddEmergencySubmittersResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1MsgAddEmergencySubmittersResponse;
}

/// MsgRemoveEmergencySubmitters is the Msg/RemoveEmergencySubmitters request type.
class MsgRemoveEmergencySubmitters extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRemoveEmergencySubmittersResponse>,
        ICosmosProtoAminoMessage {
  final String? authority;

  final List<String> emergencySubmitters;

  const MsgRemoveEmergencySubmitters({
    this.authority,
    this.emergencySubmitters = const [],
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
          value: "gov/MsgRemoveEmergencySubmitters",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.string,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, emergencySubmitters];

  @override
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'emergency_submitters': emergencySubmitters.map((e) => e).toList(),
    };
  }

  factory MsgRemoveEmergencySubmitters.fromJson(Map<String, dynamic> json) {
    return MsgRemoveEmergencySubmitters(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      emergencySubmitters:
          (json.valueEnsureAsList<dynamic>(
            'emergency_submitters',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory MsgRemoveEmergencySubmitters.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveEmergencySubmitters(
      authority: decode.getString<String?>(1),
      emergencySubmitters: decode.getListOrEmpty<String>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1MsgRemoveEmergencySubmitters;
  @override
  MsgRemoveEmergencySubmittersResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveEmergencySubmittersResponse.deserialize(bytes);
  }

  @override
  MsgRemoveEmergencySubmittersResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRemoveEmergencySubmittersResponse.fromJson(json);
  }
}

/// MsgRemoveEmergencySubmittersResponse defines the response structure for executing a
/// MsgRemoveEmergencySubmitters message.
class MsgRemoveEmergencySubmittersResponse extends CosmosProtoMessage {
  const MsgRemoveEmergencySubmittersResponse();

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

  factory MsgRemoveEmergencySubmittersResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgRemoveEmergencySubmittersResponse();
  }

  factory MsgRemoveEmergencySubmittersResponse.deserialize(List<int> bytes) {
    return MsgRemoveEmergencySubmittersResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1MsgRemoveEmergencySubmittersResponse;
}

/// MsgActivateEmergencyProposal is the Msg/ActivateEmergencyProposal request type.
class MsgActivateEmergencyProposal extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgActivateEmergencyProposalResponse>,
        ICosmosProtoAminoMessage {
  final String? sender;

  final BigInt? proposalId;

  const MsgActivateEmergencyProposal({this.sender, this.proposalId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "sender"),
        ProtoOptionString(
          name: "amino.name",
          value: "gov/MsgActivateEmergencyProposal",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sender, proposalId];

  @override
  Map<String, dynamic> toJson() {
    return {'sender': sender, 'proposal_id': proposalId?.toString()};
  }

  factory MsgActivateEmergencyProposal.fromJson(Map<String, dynamic> json) {
    return MsgActivateEmergencyProposal(
      sender: json.valueAsString<String?>('sender', acceptCamelCase: true),
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory MsgActivateEmergencyProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgActivateEmergencyProposal(
      sender: decode.getString<String?>(1),
      proposalId: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1MsgActivateEmergencyProposal;
  @override
  MsgActivateEmergencyProposalResponse onServiceResponse(List<int> bytes) {
    return MsgActivateEmergencyProposalResponse.deserialize(bytes);
  }

  @override
  MsgActivateEmergencyProposalResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgActivateEmergencyProposalResponse.fromJson(json);
  }
}

/// MsgActivateEmergencyProposalResponse defines the response structure for executing a
/// MsgActivateEmergencyProposal message.
class MsgActivateEmergencyProposalResponse extends CosmosProtoMessage {
  const MsgActivateEmergencyProposalResponse();

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

  factory MsgActivateEmergencyProposalResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MsgActivateEmergencyProposalResponse();
  }

  factory MsgActivateEmergencyProposalResponse.deserialize(List<int> bytes) {
    return MsgActivateEmergencyProposalResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1MsgActivateEmergencyProposalResponse;
}
