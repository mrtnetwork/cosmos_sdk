import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/upgrade/v1beta1/src/upgrade.dart"
    as cosmos_upgrade_v1beta1_upgrade;

/// MsgSoftwareUpgrade is the Msg/SoftwareUpgrade request type.
class MsgSoftwareUpgrade extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSoftwareUpgradeResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  /// plan is the upgrade plan.
  final cosmos_upgrade_v1beta1_upgrade.Plan? plan;

  const MsgSoftwareUpgrade({this.authority, this.plan});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgSoftwareUpgrade",
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
  List<Object?> get protoValues => [authority, plan];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'authority': authority, 'plan': config.encodeMessage(plan)};
  }

  factory MsgSoftwareUpgrade.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSoftwareUpgrade(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      plan: json.valueTo<cosmos_upgrade_v1beta1_upgrade.Plan?, Object>(
        key: 'plan',
        parse:
            (v) => cosmos_upgrade_v1beta1_upgrade.Plan.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgSoftwareUpgrade.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSoftwareUpgrade(
      authority: decode.getString<String?>(1),
      plan: decode.messageTo<cosmos_upgrade_v1beta1_upgrade.Plan?>(
        2,
        (b) => cosmos_upgrade_v1beta1_upgrade.Plan.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1MsgSoftwareUpgrade;
  @override
  MsgSoftwareUpgradeResponse onServiceResponse(List<int> bytes) {
    return MsgSoftwareUpgradeResponse.deserialize(bytes);
  }

  @override
  MsgSoftwareUpgradeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSoftwareUpgradeResponse.fromJson(json);
  }
}

/// MsgSoftwareUpgradeResponse is the Msg/SoftwareUpgrade response type.
class MsgSoftwareUpgradeResponse extends CosmosProtoMessage {
  const MsgSoftwareUpgradeResponse();

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

  factory MsgSoftwareUpgradeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSoftwareUpgradeResponse();
  }

  factory MsgSoftwareUpgradeResponse.deserialize(List<int> bytes) {
    return MsgSoftwareUpgradeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1MsgSoftwareUpgradeResponse;
}

/// MsgCancelUpgrade is the Msg/CancelUpgrade request type.
class MsgCancelUpgrade extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgCancelUpgradeResponse>,
        ICosmosProtoAminoMessage {
  /// authority is the address that controls the module (defaults to x/gov unless overwritten).
  final String? authority;

  const MsgCancelUpgrade({this.authority});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgCancelUpgrade",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [authority];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'authority': authority};
  }

  factory MsgCancelUpgrade.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgCancelUpgrade(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgCancelUpgrade.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCancelUpgrade(authority: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1MsgCancelUpgrade;
  @override
  MsgCancelUpgradeResponse onServiceResponse(List<int> bytes) {
    return MsgCancelUpgradeResponse.deserialize(bytes);
  }

  @override
  MsgCancelUpgradeResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCancelUpgradeResponse.fromJson(json);
  }
}

/// MsgCancelUpgradeResponse is the Msg/CancelUpgrade response type.
class MsgCancelUpgradeResponse extends CosmosProtoMessage {
  const MsgCancelUpgradeResponse();

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

  factory MsgCancelUpgradeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgCancelUpgradeResponse();
  }

  factory MsgCancelUpgradeResponse.deserialize(List<int> bytes) {
    return MsgCancelUpgradeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosUpgradeV1beta1MsgCancelUpgradeResponse;
}
