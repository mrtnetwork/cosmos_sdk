import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/upgrade/v1beta1/src/upgrade.dart"
    as cosmos_upgrade_v1beta1_upgrade;
import "package:cosmos_sdk/proto_messages/ibc/core/client/v1/src/client.dart"
    as ibc_core_client_v1_client;

/// MsgCreateClient defines a message to create an IBC client
class MsgCreateClient extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgCreateClientResponse> {
  /// light client state
  final google_protobuf_any.Any? clientState;

  /// consensus state associated with the client that corresponds to a given
  /// height.
  final google_protobuf_any.Any? consensusState;

  /// signer address
  final String? signer;

  const MsgCreateClient({this.clientState, this.consensusState, this.signer});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [clientState, consensusState, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'client_state': config.encodeMessage(clientState),
      'consensus_state': config.encodeMessage(consensusState),
      'signer': signer,
    };
  }

  factory MsgCreateClient.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgCreateClient(
      clientState: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'client_state',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      consensusState: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'consensus_state',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgCreateClient.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateClient(
      clientState: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      consensusState: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      signer: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgCreateClient;
  @override
  MsgCreateClientResponse onServiceResponse(List<int> bytes) {
    return MsgCreateClientResponse.deserialize(bytes);
  }

  @override
  MsgCreateClientResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgCreateClientResponse.fromJson(json);
  }
}

/// MsgCreateClientResponse defines the Msg/CreateClient response type.
class MsgCreateClientResponse extends CosmosProtoMessage {
  final String? clientId;

  const MsgCreateClientResponse({this.clientId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [clientId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'client_id': clientId};
  }

  factory MsgCreateClientResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgCreateClientResponse(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgCreateClientResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgCreateClientResponse(clientId: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgCreateClientResponse;
}

/// MsgUpdateClient defines an sdk.Msg to update a IBC client state using
/// the given client message.
class MsgUpdateClient extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateClientResponse> {
  /// client unique identifier
  final String? clientId;

  /// client message to update the light client
  final google_protobuf_any.Any? clientMessage;

  /// signer address
  final String? signer;

  const MsgUpdateClient({this.clientId, this.clientMessage, this.signer});

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
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, clientMessage, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'client_id': clientId,
      'client_message': config.encodeMessage(clientMessage),
      'signer': signer,
    };
  }

  factory MsgUpdateClient.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateClient(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      clientMessage: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'client_message',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateClient.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateClient(
      clientId: decode.getString<String?>(1),
      clientMessage: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      signer: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgUpdateClient;
  @override
  MsgUpdateClientResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateClientResponse.deserialize(bytes);
  }

  @override
  MsgUpdateClientResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateClientResponse.fromJson(json);
  }
}

/// MsgUpdateClientResponse defines the Msg/UpdateClient response type.
class MsgUpdateClientResponse extends CosmosProtoMessage {
  const MsgUpdateClientResponse();

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

  factory MsgUpdateClientResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateClientResponse();
  }

  factory MsgUpdateClientResponse.deserialize(List<int> bytes) {
    return MsgUpdateClientResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgUpdateClientResponse;
}

/// MsgUpgradeClient defines an sdk.Msg to upgrade an IBC client to a new client
/// state
class MsgUpgradeClient extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpgradeClientResponse> {
  /// client unique identifier
  final String? clientId;

  /// upgraded client state
  final google_protobuf_any.Any? clientState;

  /// upgraded consensus state, only contains enough information to serve as a
  /// basis of trust in update logic
  final google_protobuf_any.Any? consensusState;

  /// proof that old chain committed to new client
  final BuBytes? proofUpgradeClient;

  /// proof that old chain committed to new consensus state
  final BuBytes? proofUpgradeConsensusState;

  /// signer address
  final String? signer;

  MsgUpgradeClient({
    this.clientId,
    this.clientState,
    this.consensusState,
    List<int>? proofUpgradeClient,
    List<int>? proofUpgradeConsensusState,
    this.signer,
  }) : proofUpgradeClient = proofUpgradeClient?.asImmutableBytes,
       proofUpgradeConsensusState =
           proofUpgradeConsensusState?.asImmutableBytes;

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
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.bytes(5),
        ProtoFieldConfig.string(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    clientId,
    clientState,
    consensusState,
    proofUpgradeClient,
    proofUpgradeConsensusState,
    signer,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'client_id': clientId,
      'client_state': config.encodeMessage(clientState),
      'consensus_state': config.encodeMessage(consensusState),
      'proof_upgrade_client': config.encodeBinary(proofUpgradeClient),
      'proof_upgrade_consensus_state': config.encodeBinary(
        proofUpgradeConsensusState,
      ),
      'signer': signer,
    };
  }

  factory MsgUpgradeClient.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpgradeClient(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      clientState: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'client_state',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      consensusState: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'consensus_state',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proofUpgradeClient: config.decodeBinary<List<int>?>(
        json.valueAs(
          'proof_upgrade_client',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      proofUpgradeConsensusState: config.decodeBinary<List<int>?>(
        json.valueAs(
          'proof_upgrade_consensus_state',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpgradeClient.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpgradeClient(
      clientId: decode.getString<String?>(1),
      clientState: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      consensusState: decode.messageTo<google_protobuf_any.Any?>(
        3,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      proofUpgradeClient: decode.getBytes<List<int>?>(4),
      proofUpgradeConsensusState: decode.getBytes<List<int>?>(5),
      signer: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgUpgradeClient;
  @override
  MsgUpgradeClientResponse onServiceResponse(List<int> bytes) {
    return MsgUpgradeClientResponse.deserialize(bytes);
  }

  @override
  MsgUpgradeClientResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpgradeClientResponse.fromJson(json);
  }
}

/// MsgUpgradeClientResponse defines the Msg/UpgradeClient response type.
class MsgUpgradeClientResponse extends CosmosProtoMessage {
  const MsgUpgradeClientResponse();

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

  factory MsgUpgradeClientResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpgradeClientResponse();
  }

  factory MsgUpgradeClientResponse.deserialize(List<int> bytes) {
    return MsgUpgradeClientResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgUpgradeClientResponse;
}

/// MsgSubmitMisbehaviour defines an sdk.Msg type that submits Evidence for
/// light client misbehaviour.
/// This message has been deprecated. Use MsgUpdateClient instead.
class MsgSubmitMisbehaviour extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgSubmitMisbehaviourResponse> {
  /// client unique identifier
  final String? clientId;

  /// misbehaviour used for freezing the light client
  final google_protobuf_any.Any? misbehaviour;

  /// signer address
  final String? signer;

  const MsgSubmitMisbehaviour({this.clientId, this.misbehaviour, this.signer});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionBool(name: "deprecated", value: true),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, misbehaviour, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'client_id': clientId,
      'misbehaviour': config.encodeMessage(misbehaviour),
      'signer': signer,
    };
  }

  factory MsgSubmitMisbehaviour.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSubmitMisbehaviour(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      misbehaviour: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'misbehaviour',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgSubmitMisbehaviour.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSubmitMisbehaviour(
      clientId: decode.getString<String?>(1),
      misbehaviour: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      signer: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgSubmitMisbehaviour;
  @override
  MsgSubmitMisbehaviourResponse onServiceResponse(List<int> bytes) {
    return MsgSubmitMisbehaviourResponse.deserialize(bytes);
  }

  @override
  MsgSubmitMisbehaviourResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSubmitMisbehaviourResponse.fromJson(json);
  }
}

/// MsgSubmitMisbehaviourResponse defines the Msg/SubmitMisbehaviour response
/// type.
class MsgSubmitMisbehaviourResponse extends CosmosProtoMessage {
  const MsgSubmitMisbehaviourResponse();

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

  factory MsgSubmitMisbehaviourResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSubmitMisbehaviourResponse();
  }

  factory MsgSubmitMisbehaviourResponse.deserialize(List<int> bytes) {
    return MsgSubmitMisbehaviourResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgSubmitMisbehaviourResponse;
}

/// MsgRecoverClient defines the message used to recover a frozen or expired client.
class MsgRecoverClient extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRecoverClientResponse>,
        ICosmosProtoAminoMessage {
  /// the client identifier for the client to be updated if the proposal passes
  final String? subjectClientId;

  /// the substitute client identifier for the client which will replace the subject
  /// client
  final String? substituteClientId;

  /// signer address
  final String? signer;

  const MsgRecoverClient({
    this.subjectClientId,
    this.substituteClientId,
    this.signer,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/MsgRecoverClient",
        ),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    subjectClientId,
    substituteClientId,
    signer,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'subject_client_id': subjectClientId,
      'substitute_client_id': substituteClientId,
      'signer': signer,
    };
  }

  factory MsgRecoverClient.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRecoverClient(
      subjectClientId: json.valueAsString<String?>(
        'subject_client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      substituteClientId: json.valueAsString<String?>(
        'substitute_client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgRecoverClient.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRecoverClient(
      subjectClientId: decode.getString<String?>(1),
      substituteClientId: decode.getString<String?>(2),
      signer: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgRecoverClient;
  @override
  MsgRecoverClientResponse onServiceResponse(List<int> bytes) {
    return MsgRecoverClientResponse.deserialize(bytes);
  }

  @override
  MsgRecoverClientResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRecoverClientResponse.fromJson(json);
  }
}

/// MsgRecoverClientResponse defines the Msg/RecoverClient response type.
class MsgRecoverClientResponse extends CosmosProtoMessage {
  const MsgRecoverClientResponse();

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

  factory MsgRecoverClientResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRecoverClientResponse();
  }

  factory MsgRecoverClientResponse.deserialize(List<int> bytes) {
    return MsgRecoverClientResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgRecoverClientResponse;
}

/// MsgIBCSoftwareUpgrade defines the message used to schedule an upgrade of an IBC client using a v1 governance proposal
class MsgIBCSoftwareUpgrade extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgIBCSoftwareUpgradeResponse> {
  final cosmos_upgrade_v1beta1_upgrade.Plan? plan;

  /// An UpgradedClientState must be provided to perform an IBC breaking upgrade.
  /// This will make the chain commit to the correct upgraded (self) client state
  /// before the upgrade occurs, so that connecting chains can verify that the
  /// new upgraded client is valid by verifying a proof on the previous version
  /// of the chain. This will allow IBC connections to persist smoothly across
  /// planned chain upgrades. Correspondingly, the UpgradedClientState field has been
  /// deprecated in the Cosmos SDK to allow for this logic to exist solely in
  /// the 02-client module.
  final google_protobuf_any.Any? upgradedClientState;

  /// signer address
  final String? signer;

  const MsgIBCSoftwareUpgrade({
    this.plan,
    this.upgradedClientState,
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
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [plan, upgradedClientState, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'plan': config.encodeMessage(plan),
      'upgraded_client_state': config.encodeMessage(upgradedClientState),
      'signer': signer,
    };
  }

  factory MsgIBCSoftwareUpgrade.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgIBCSoftwareUpgrade(
      plan: json.valueTo<cosmos_upgrade_v1beta1_upgrade.Plan?, Object>(
        key: 'plan',
        parse:
            (v) => cosmos_upgrade_v1beta1_upgrade.Plan.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      upgradedClientState: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'upgraded_client_state',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgIBCSoftwareUpgrade.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgIBCSoftwareUpgrade(
      plan: decode.messageTo<cosmos_upgrade_v1beta1_upgrade.Plan?>(
        1,
        (b) => cosmos_upgrade_v1beta1_upgrade.Plan.deserialize(b),
      ),
      upgradedClientState: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      signer: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgIBCSoftwareUpgrade;
  @override
  MsgIBCSoftwareUpgradeResponse onServiceResponse(List<int> bytes) {
    return MsgIBCSoftwareUpgradeResponse.deserialize(bytes);
  }

  @override
  MsgIBCSoftwareUpgradeResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgIBCSoftwareUpgradeResponse.fromJson(json);
  }
}

/// MsgIBCSoftwareUpgradeResponse defines the Msg/IBCSoftwareUpgrade response type.
class MsgIBCSoftwareUpgradeResponse extends CosmosProtoMessage {
  const MsgIBCSoftwareUpgradeResponse();

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

  factory MsgIBCSoftwareUpgradeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgIBCSoftwareUpgradeResponse();
  }

  factory MsgIBCSoftwareUpgradeResponse.deserialize(List<int> bytes) {
    return MsgIBCSoftwareUpgradeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgIBCSoftwareUpgradeResponse;
}

/// MsgUpdateParams defines the sdk.Msg type to update the client parameters.
class MsgUpdateParams extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgUpdateParamsResponse> {
  /// signer address
  final String? signer;

  /// params defines the client parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final ibc_core_client_v1_client.Params? params;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'signer': signer, 'params': config.encodeMessage(params)};
  }

  factory MsgUpdateParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParams(
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      params: json.valueTo<ibc_core_client_v1_client.Params?, Object>(
        key: 'params',
        parse:
            (v) => ibc_core_client_v1_client.Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateParams(
      signer: decode.getString<String?>(1),
      params: decode.messageTo<ibc_core_client_v1_client.Params?>(
        2,
        (b) => ibc_core_client_v1_client.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// MsgUpdateParamsResponse defines the MsgUpdateParams response type.
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory MsgUpdateParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParamsResponse();
  }

  factory MsgUpdateParamsResponse.deserialize(List<int> bytes) {
    return MsgUpdateParamsResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgUpdateParamsResponse;
}

/// MsgDeleteClientCreator defines a message to delete the client creator of a client
class MsgDeleteClientCreator extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgDeleteClientCreatorResponse> {
  /// client identifier
  final String? clientId;

  /// signer address
  final String? signer;

  const MsgDeleteClientCreator({this.clientId, this.signer});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "signer"),
      ],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [clientId, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'client_id': clientId, 'signer': signer};
  }

  factory MsgDeleteClientCreator.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgDeleteClientCreator(
      clientId: json.valueAsString<String?>(
        'client_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgDeleteClientCreator.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDeleteClientCreator(
      clientId: decode.getString<String?>(1),
      signer: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgDeleteClientCreator;
  @override
  MsgDeleteClientCreatorResponse onServiceResponse(List<int> bytes) {
    return MsgDeleteClientCreatorResponse.deserialize(bytes);
  }

  @override
  MsgDeleteClientCreatorResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgDeleteClientCreatorResponse.fromJson(json);
  }
}

/// MsgDeleteClientCreatorResponse defines the Msg/DeleteClientCreator response type.
class MsgDeleteClientCreatorResponse extends CosmosProtoMessage {
  const MsgDeleteClientCreatorResponse();

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

  factory MsgDeleteClientCreatorResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgDeleteClientCreatorResponse();
  }

  factory MsgDeleteClientCreatorResponse.deserialize(List<int> bytes) {
    return MsgDeleteClientCreatorResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreClientV1MsgDeleteClientCreatorResponse;
}
