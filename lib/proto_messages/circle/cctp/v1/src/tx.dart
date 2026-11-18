import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';

class MsgUpdateOwner extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateOwnerResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final String? newOwner;

  const MsgUpdateOwner({this.from, this.newOwner});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(name: "amino.name", value: "cctp/UpdateOwner"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [from, newOwner];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from, 'new_owner': newOwner};
  }

  factory MsgUpdateOwner.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateOwner(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      newOwner: json.valueAsString<String?>(
        'new_owner',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateOwner.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateOwner(
      from: decode.getString<String?>(1),
      newOwner: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUpdateOwner;
  @override
  MsgUpdateOwnerResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateOwnerResponse.deserialize(bytes);
  }

  @override
  MsgUpdateOwnerResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateOwnerResponse.fromJson(json);
  }
}

class MsgUpdateOwnerResponse extends CosmosProtoMessage {
  const MsgUpdateOwnerResponse();

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

  factory MsgUpdateOwnerResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateOwnerResponse();
  }

  factory MsgUpdateOwnerResponse.deserialize(List<int> bytes) {
    return MsgUpdateOwnerResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUpdateOwnerResponse;
}

class MsgUpdateAttesterManager extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateAttesterManagerResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final String? newAttesterManager;

  const MsgUpdateAttesterManager({this.from, this.newAttesterManager});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/UpdateAttesterManager",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [from, newAttesterManager];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from, 'new_attester_manager': newAttesterManager};
  }

  factory MsgUpdateAttesterManager.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateAttesterManager(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      newAttesterManager: json.valueAsString<String?>(
        'new_attester_manager',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateAttesterManager.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateAttesterManager(
      from: decode.getString<String?>(1),
      newAttesterManager: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUpdateAttesterManager;
  @override
  MsgUpdateAttesterManagerResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateAttesterManagerResponse.deserialize(bytes);
  }

  @override
  MsgUpdateAttesterManagerResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateAttesterManagerResponse.fromJson(json);
  }
}

class MsgUpdateAttesterManagerResponse extends CosmosProtoMessage {
  const MsgUpdateAttesterManagerResponse();

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

  factory MsgUpdateAttesterManagerResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateAttesterManagerResponse();
  }

  factory MsgUpdateAttesterManagerResponse.deserialize(List<int> bytes) {
    return MsgUpdateAttesterManagerResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUpdateAttesterManagerResponse;
}

class MsgUpdateTokenController extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateTokenControllerResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final String? newTokenController;

  const MsgUpdateTokenController({this.from, this.newTokenController});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/UpdateTokenController",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [from, newTokenController];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from, 'new_token_controller': newTokenController};
  }

  factory MsgUpdateTokenController.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateTokenController(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      newTokenController: json.valueAsString<String?>(
        'new_token_controller',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateTokenController.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateTokenController(
      from: decode.getString<String?>(1),
      newTokenController: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUpdateTokenController;
  @override
  MsgUpdateTokenControllerResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateTokenControllerResponse.deserialize(bytes);
  }

  @override
  MsgUpdateTokenControllerResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateTokenControllerResponse.fromJson(json);
  }
}

class MsgUpdateTokenControllerResponse extends CosmosProtoMessage {
  const MsgUpdateTokenControllerResponse();

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

  factory MsgUpdateTokenControllerResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateTokenControllerResponse();
  }

  factory MsgUpdateTokenControllerResponse.deserialize(List<int> bytes) {
    return MsgUpdateTokenControllerResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUpdateTokenControllerResponse;
}

class MsgUpdatePauser extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdatePauserResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final String? newPauser;

  const MsgUpdatePauser({this.from, this.newPauser});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(name: "amino.name", value: "cctp/UpdatePauser"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [from, newPauser];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from, 'new_pauser': newPauser};
  }

  factory MsgUpdatePauser.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdatePauser(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      newPauser: json.valueAsString<String?>(
        'new_pauser',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdatePauser.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdatePauser(
      from: decode.getString<String?>(1),
      newPauser: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUpdatePauser;
  @override
  MsgUpdatePauserResponse onServiceResponse(List<int> bytes) {
    return MsgUpdatePauserResponse.deserialize(bytes);
  }

  @override
  MsgUpdatePauserResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdatePauserResponse.fromJson(json);
  }
}

class MsgUpdatePauserResponse extends CosmosProtoMessage {
  const MsgUpdatePauserResponse();

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

  factory MsgUpdatePauserResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdatePauserResponse();
  }

  factory MsgUpdatePauserResponse.deserialize(List<int> bytes) {
    return MsgUpdatePauserResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUpdatePauserResponse;
}

class MsgAcceptOwner extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAcceptOwnerResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  const MsgAcceptOwner({this.from});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(name: "amino.name", value: "cctp/AcceptOwner"),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [from];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from};
  }

  factory MsgAcceptOwner.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgAcceptOwner(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgAcceptOwner.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAcceptOwner(from: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgAcceptOwner;
  @override
  MsgAcceptOwnerResponse onServiceResponse(List<int> bytes) {
    return MsgAcceptOwnerResponse.deserialize(bytes);
  }

  @override
  MsgAcceptOwnerResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgAcceptOwnerResponse.fromJson(json);
  }
}

class MsgAcceptOwnerResponse extends CosmosProtoMessage {
  const MsgAcceptOwnerResponse();

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

  factory MsgAcceptOwnerResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgAcceptOwnerResponse();
  }

  factory MsgAcceptOwnerResponse.deserialize(List<int> bytes) {
    return MsgAcceptOwnerResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgAcceptOwnerResponse;
}

class MsgEnableAttester extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgEnableAttesterResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final String? attester;

  const MsgEnableAttester({this.from, this.attester});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(name: "amino.name", value: "cctp/EnableAttester"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [from, attester];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from, 'attester': attester};
  }

  factory MsgEnableAttester.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgEnableAttester(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      attester: json.valueAsString<String?>(
        'attester',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgEnableAttester.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgEnableAttester(
      from: decode.getString<String?>(1),
      attester: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgEnableAttester;
  @override
  MsgEnableAttesterResponse onServiceResponse(List<int> bytes) {
    return MsgEnableAttesterResponse.deserialize(bytes);
  }

  @override
  MsgEnableAttesterResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgEnableAttesterResponse.fromJson(json);
  }
}

class MsgEnableAttesterResponse extends CosmosProtoMessage {
  const MsgEnableAttesterResponse();

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

  factory MsgEnableAttesterResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgEnableAttesterResponse();
  }

  factory MsgEnableAttesterResponse.deserialize(List<int> bytes) {
    return MsgEnableAttesterResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgEnableAttesterResponse;
}

class MsgDisableAttester extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDisableAttesterResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final String? attester;

  const MsgDisableAttester({this.from, this.attester});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(name: "amino.name", value: "cctp/DisableAttester"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [from, attester];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from, 'attester': attester};
  }

  factory MsgDisableAttester.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgDisableAttester(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      attester: json.valueAsString<String?>(
        'attester',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgDisableAttester.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDisableAttester(
      from: decode.getString<String?>(1),
      attester: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgDisableAttester;
  @override
  MsgDisableAttesterResponse onServiceResponse(List<int> bytes) {
    return MsgDisableAttesterResponse.deserialize(bytes);
  }

  @override
  MsgDisableAttesterResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDisableAttesterResponse.fromJson(json);
  }
}

class MsgDisableAttesterResponse extends CosmosProtoMessage {
  const MsgDisableAttesterResponse();

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

  factory MsgDisableAttesterResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgDisableAttesterResponse();
  }

  factory MsgDisableAttesterResponse.deserialize(List<int> bytes) {
    return MsgDisableAttesterResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgDisableAttesterResponse;
}

class MsgPauseBurningAndMinting extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgPauseBurningAndMintingResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  const MsgPauseBurningAndMinting({this.from});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/PauseBurningAndMinting",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [from];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from};
  }

  factory MsgPauseBurningAndMinting.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgPauseBurningAndMinting(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgPauseBurningAndMinting.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgPauseBurningAndMinting(from: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgPauseBurningAndMinting;
  @override
  MsgPauseBurningAndMintingResponse onServiceResponse(List<int> bytes) {
    return MsgPauseBurningAndMintingResponse.deserialize(bytes);
  }

  @override
  MsgPauseBurningAndMintingResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgPauseBurningAndMintingResponse.fromJson(json);
  }
}

class MsgPauseBurningAndMintingResponse extends CosmosProtoMessage {
  const MsgPauseBurningAndMintingResponse();

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

  factory MsgPauseBurningAndMintingResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgPauseBurningAndMintingResponse();
  }

  factory MsgPauseBurningAndMintingResponse.deserialize(List<int> bytes) {
    return MsgPauseBurningAndMintingResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgPauseBurningAndMintingResponse;
}

class MsgUnpauseBurningAndMinting extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUnpauseBurningAndMintingResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  const MsgUnpauseBurningAndMinting({this.from});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/UnpauseBurningAndMinting",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [from];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from};
  }

  factory MsgUnpauseBurningAndMinting.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUnpauseBurningAndMinting(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUnpauseBurningAndMinting.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUnpauseBurningAndMinting(from: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUnpauseBurningAndMinting;
  @override
  MsgUnpauseBurningAndMintingResponse onServiceResponse(List<int> bytes) {
    return MsgUnpauseBurningAndMintingResponse.deserialize(bytes);
  }

  @override
  MsgUnpauseBurningAndMintingResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUnpauseBurningAndMintingResponse.fromJson(json);
  }
}

class MsgUnpauseBurningAndMintingResponse extends CosmosProtoMessage {
  const MsgUnpauseBurningAndMintingResponse();

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

  factory MsgUnpauseBurningAndMintingResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUnpauseBurningAndMintingResponse();
  }

  factory MsgUnpauseBurningAndMintingResponse.deserialize(List<int> bytes) {
    return MsgUnpauseBurningAndMintingResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUnpauseBurningAndMintingResponse;
}

class MsgPauseSendingAndReceivingMessages extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgPauseSendingAndReceivingMessagesResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  const MsgPauseSendingAndReceivingMessages({this.from});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/PauseSendingAndReceivingMessages",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [from];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from};
  }

  factory MsgPauseSendingAndReceivingMessages.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgPauseSendingAndReceivingMessages(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgPauseSendingAndReceivingMessages.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgPauseSendingAndReceivingMessages(
      from: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgPauseSendingAndReceivingMessages;
  @override
  MsgPauseSendingAndReceivingMessagesResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgPauseSendingAndReceivingMessagesResponse.deserialize(bytes);
  }

  @override
  MsgPauseSendingAndReceivingMessagesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgPauseSendingAndReceivingMessagesResponse.fromJson(json);
  }
}

class MsgPauseSendingAndReceivingMessagesResponse extends CosmosProtoMessage {
  const MsgPauseSendingAndReceivingMessagesResponse();

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

  factory MsgPauseSendingAndReceivingMessagesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgPauseSendingAndReceivingMessagesResponse();
  }

  factory MsgPauseSendingAndReceivingMessagesResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgPauseSendingAndReceivingMessagesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .circleCctpV1MsgPauseSendingAndReceivingMessagesResponse;
}

class MsgUnpauseSendingAndReceivingMessages extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<
          MsgUnpauseSendingAndReceivingMessagesResponse
        >,
        ICosmosProtoAminoMessage {
  final String? from;

  const MsgUnpauseSendingAndReceivingMessages({this.from});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/UnpauseSendingAndReceivingMessages",
        ),
      ],
      fields: [ProtoFieldConfig.string(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [from];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from};
  }

  factory MsgUnpauseSendingAndReceivingMessages.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUnpauseSendingAndReceivingMessages(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUnpauseSendingAndReceivingMessages.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUnpauseSendingAndReceivingMessages(
      from: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .circleCctpV1MsgUnpauseSendingAndReceivingMessages;
  @override
  MsgUnpauseSendingAndReceivingMessagesResponse onServiceResponse(
    List<int> bytes,
  ) {
    return MsgUnpauseSendingAndReceivingMessagesResponse.deserialize(bytes);
  }

  @override
  MsgUnpauseSendingAndReceivingMessagesResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUnpauseSendingAndReceivingMessagesResponse.fromJson(json);
  }
}

class MsgUnpauseSendingAndReceivingMessagesResponse extends CosmosProtoMessage {
  const MsgUnpauseSendingAndReceivingMessagesResponse();

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

  factory MsgUnpauseSendingAndReceivingMessagesResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUnpauseSendingAndReceivingMessagesResponse();
  }

  factory MsgUnpauseSendingAndReceivingMessagesResponse.deserialize(
    List<int> bytes,
  ) {
    return MsgUnpauseSendingAndReceivingMessagesResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .circleCctpV1MsgUnpauseSendingAndReceivingMessagesResponse;
}

class MsgUpdateMaxMessageBodySize extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateMaxMessageBodySizeResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final BigInt? messageSize;

  const MsgUpdateMaxMessageBodySize({this.from, this.messageSize});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/UpdateMaxMessageBodySize",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint64(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [from, messageSize];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from, 'message_size': config.encodeBigint(messageSize)};
  }

  factory MsgUpdateMaxMessageBodySize.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateMaxMessageBodySize(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      messageSize: json.valueAsBigInt<BigInt?>(
        'message_size',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateMaxMessageBodySize.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateMaxMessageBodySize(
      from: decode.getString<String?>(1),
      messageSize: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUpdateMaxMessageBodySize;
  @override
  MsgUpdateMaxMessageBodySizeResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateMaxMessageBodySizeResponse.deserialize(bytes);
  }

  @override
  MsgUpdateMaxMessageBodySizeResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateMaxMessageBodySizeResponse.fromJson(json);
  }
}

class MsgUpdateMaxMessageBodySizeResponse extends CosmosProtoMessage {
  const MsgUpdateMaxMessageBodySizeResponse();

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

  factory MsgUpdateMaxMessageBodySizeResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateMaxMessageBodySizeResponse();
  }

  factory MsgUpdateMaxMessageBodySizeResponse.deserialize(List<int> bytes) {
    return MsgUpdateMaxMessageBodySizeResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUpdateMaxMessageBodySizeResponse;
}

class MsgSetMaxBurnAmountPerMessage extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSetMaxBurnAmountPerMessageResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final String? localToken;

  final String? amount;

  const MsgSetMaxBurnAmountPerMessage({
    this.from,
    this.localToken,
    this.amount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/SetMaxBurnAmountPerMessage",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [from, localToken, amount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from, 'local_token': localToken, 'amount': amount};
  }

  factory MsgSetMaxBurnAmountPerMessage.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetMaxBurnAmountPerMessage(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      localToken: json.valueAsString<String?>(
        'local_token',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount: json.valueAsString<String?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgSetMaxBurnAmountPerMessage.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSetMaxBurnAmountPerMessage(
      from: decode.getString<String?>(1),
      localToken: decode.getString<String?>(2),
      amount: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgSetMaxBurnAmountPerMessage;
  @override
  MsgSetMaxBurnAmountPerMessageResponse onServiceResponse(List<int> bytes) {
    return MsgSetMaxBurnAmountPerMessageResponse.deserialize(bytes);
  }

  @override
  MsgSetMaxBurnAmountPerMessageResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSetMaxBurnAmountPerMessageResponse.fromJson(json);
  }
}

class MsgSetMaxBurnAmountPerMessageResponse extends CosmosProtoMessage {
  const MsgSetMaxBurnAmountPerMessageResponse();

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

  factory MsgSetMaxBurnAmountPerMessageResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSetMaxBurnAmountPerMessageResponse();
  }

  factory MsgSetMaxBurnAmountPerMessageResponse.deserialize(List<int> bytes) {
    return MsgSetMaxBurnAmountPerMessageResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .circleCctpV1MsgSetMaxBurnAmountPerMessageResponse;
}

class MsgDepositForBurn extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDepositForBurnResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final String? amount;

  final int? destinationDomain;

  final BuBytes? mintRecipient;

  final String? burnToken;

  MsgDepositForBurn({
    this.from,
    this.amount,
    this.destinationDomain,
    List<int>? mintRecipient,
    this.burnToken,
  }) : mintRecipient = mintRecipient?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(name: "amino.name", value: "cctp/DepositForBurn"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.uint32(3),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    from,
    amount,
    destinationDomain,
    mintRecipient,
    burnToken,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'from': from,
      'amount': amount,
      'destination_domain': destinationDomain,
      'mint_recipient': config.encodeBinary(mintRecipient),
      'burn_token': burnToken,
    };
  }

  factory MsgDepositForBurn.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgDepositForBurn(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount: json.valueAsString<String?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      destinationDomain: json.valueAsInt<int?>(
        'destination_domain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      mintRecipient: config.decodeBinary<List<int>?>(
        json.valueAs(
          'mint_recipient',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      burnToken: json.valueAsString<String?>(
        'burn_token',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgDepositForBurn.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDepositForBurn(
      from: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
      destinationDomain: decode.getInt<int?>(3),
      mintRecipient: decode.getBytes<List<int>?>(4),
      burnToken: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgDepositForBurn;
  @override
  MsgDepositForBurnResponse onServiceResponse(List<int> bytes) {
    return MsgDepositForBurnResponse.deserialize(bytes);
  }

  @override
  MsgDepositForBurnResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgDepositForBurnResponse.fromJson(json);
  }
}

class MsgDepositForBurnResponse extends CosmosProtoMessage {
  final BigInt? nonce;

  const MsgDepositForBurnResponse({this.nonce});

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
  List<Object?> get protoValues => [nonce];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'nonce': config.encodeBigint(nonce)};
  }

  factory MsgDepositForBurnResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgDepositForBurnResponse(
      nonce: json.valueAsBigInt<BigInt?>(
        'nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgDepositForBurnResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDepositForBurnResponse(nonce: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgDepositForBurnResponse;
}

class MsgDepositForBurnWithCaller extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgDepositForBurnWithCallerResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final String? amount;

  final int? destinationDomain;

  final BuBytes? mintRecipient;

  final String? burnToken;

  final BuBytes? destinationCaller;

  MsgDepositForBurnWithCaller({
    this.from,
    this.amount,
    this.destinationDomain,
    List<int>? mintRecipient,
    this.burnToken,
    List<int>? destinationCaller,
  }) : mintRecipient = mintRecipient?.asImmutableBytes,
       destinationCaller = destinationCaller?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/DepositForBurnWithCaller",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.uint32(3),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.string(5),
        ProtoFieldConfig.bytes(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    from,
    amount,
    destinationDomain,
    mintRecipient,
    burnToken,
    destinationCaller,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'from': from,
      'amount': amount,
      'destination_domain': destinationDomain,
      'mint_recipient': config.encodeBinary(mintRecipient),
      'burn_token': burnToken,
      'destination_caller': config.encodeBinary(destinationCaller),
    };
  }

  factory MsgDepositForBurnWithCaller.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgDepositForBurnWithCaller(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount: json.valueAsString<String?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      destinationDomain: json.valueAsInt<int?>(
        'destination_domain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      mintRecipient: config.decodeBinary<List<int>?>(
        json.valueAs(
          'mint_recipient',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      burnToken: json.valueAsString<String?>(
        'burn_token',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      destinationCaller: config.decodeBinary<List<int>?>(
        json.valueAs(
          'destination_caller',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory MsgDepositForBurnWithCaller.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDepositForBurnWithCaller(
      from: decode.getString<String?>(1),
      amount: decode.getString<String?>(2),
      destinationDomain: decode.getInt<int?>(3),
      mintRecipient: decode.getBytes<List<int>?>(4),
      burnToken: decode.getString<String?>(5),
      destinationCaller: decode.getBytes<List<int>?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgDepositForBurnWithCaller;
  @override
  MsgDepositForBurnWithCallerResponse onServiceResponse(List<int> bytes) {
    return MsgDepositForBurnWithCallerResponse.deserialize(bytes);
  }

  @override
  MsgDepositForBurnWithCallerResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgDepositForBurnWithCallerResponse.fromJson(json);
  }
}

class MsgDepositForBurnWithCallerResponse extends CosmosProtoMessage {
  final BigInt? nonce;

  const MsgDepositForBurnWithCallerResponse({this.nonce});

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
  List<Object?> get protoValues => [nonce];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'nonce': config.encodeBigint(nonce)};
  }

  factory MsgDepositForBurnWithCallerResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgDepositForBurnWithCallerResponse(
      nonce: json.valueAsBigInt<BigInt?>(
        'nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgDepositForBurnWithCallerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgDepositForBurnWithCallerResponse(
      nonce: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgDepositForBurnWithCallerResponse;
}

class MsgReplaceDepositForBurn extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgReplaceDepositForBurnResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final BuBytes? originalMessage;

  final BuBytes? originalAttestation;

  final BuBytes? newDestinationCaller;

  final BuBytes? newMintRecipient;

  MsgReplaceDepositForBurn({
    this.from,
    List<int>? originalMessage,
    List<int>? originalAttestation,
    List<int>? newDestinationCaller,
    List<int>? newMintRecipient,
  }) : originalMessage = originalMessage?.asImmutableBytes,
       originalAttestation = originalAttestation?.asImmutableBytes,
       newDestinationCaller = newDestinationCaller?.asImmutableBytes,
       newMintRecipient = newMintRecipient?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/ReplaceDepositForBurn",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.bytes(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    from,
    originalMessage,
    originalAttestation,
    newDestinationCaller,
    newMintRecipient,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'from': from,
      'original_message': config.encodeBinary(originalMessage),
      'original_attestation': config.encodeBinary(originalAttestation),
      'new_destination_caller': config.encodeBinary(newDestinationCaller),
      'new_mint_recipient': config.encodeBinary(newMintRecipient),
    };
  }

  factory MsgReplaceDepositForBurn.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgReplaceDepositForBurn(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      originalMessage: config.decodeBinary<List<int>?>(
        json.valueAs(
          'original_message',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      originalAttestation: config.decodeBinary<List<int>?>(
        json.valueAs(
          'original_attestation',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      newDestinationCaller: config.decodeBinary<List<int>?>(
        json.valueAs(
          'new_destination_caller',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      newMintRecipient: config.decodeBinary<List<int>?>(
        json.valueAs(
          'new_mint_recipient',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory MsgReplaceDepositForBurn.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgReplaceDepositForBurn(
      from: decode.getString<String?>(1),
      originalMessage: decode.getBytes<List<int>?>(2),
      originalAttestation: decode.getBytes<List<int>?>(3),
      newDestinationCaller: decode.getBytes<List<int>?>(4),
      newMintRecipient: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgReplaceDepositForBurn;
  @override
  MsgReplaceDepositForBurnResponse onServiceResponse(List<int> bytes) {
    return MsgReplaceDepositForBurnResponse.deserialize(bytes);
  }

  @override
  MsgReplaceDepositForBurnResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgReplaceDepositForBurnResponse.fromJson(json);
  }
}

class MsgReplaceDepositForBurnResponse extends CosmosProtoMessage {
  const MsgReplaceDepositForBurnResponse();

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

  factory MsgReplaceDepositForBurnResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgReplaceDepositForBurnResponse();
  }

  factory MsgReplaceDepositForBurnResponse.deserialize(List<int> bytes) {
    return MsgReplaceDepositForBurnResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgReplaceDepositForBurnResponse;
}

class MsgReceiveMessage extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgReceiveMessageResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final BuBytes? message;

  final BuBytes? attestation;

  MsgReceiveMessage({this.from, List<int>? message, List<int>? attestation})
    : message = message?.asImmutableBytes,
      attestation = attestation?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(name: "amino.name", value: "cctp/ReceiveMessage"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bytes(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [from, message, attestation];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'from': from,
      'message': config.encodeBinary(message),
      'attestation': config.encodeBinary(attestation),
    };
  }

  factory MsgReceiveMessage.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgReceiveMessage(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      message: config.decodeBinary<List<int>?>(
        json.valueAs('message', normalizeKeyLookup: config.normalizeKeys),
      ),
      attestation: config.decodeBinary<List<int>?>(
        json.valueAs('attestation', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgReceiveMessage.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgReceiveMessage(
      from: decode.getString<String?>(1),
      message: decode.getBytes<List<int>?>(2),
      attestation: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgReceiveMessage;
  @override
  MsgReceiveMessageResponse onServiceResponse(List<int> bytes) {
    return MsgReceiveMessageResponse.deserialize(bytes);
  }

  @override
  MsgReceiveMessageResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgReceiveMessageResponse.fromJson(json);
  }
}

class MsgReceiveMessageResponse extends CosmosProtoMessage {
  final bool? success;

  const MsgReceiveMessageResponse({this.success});

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'success': success};
  }

  factory MsgReceiveMessageResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgReceiveMessageResponse(
      success: json.valueAsBool<bool?>(
        'success',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgReceiveMessageResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgReceiveMessageResponse(success: decode.getBool<bool?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgReceiveMessageResponse;
}

class MsgSendMessage extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSendMessageResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final int? destinationDomain;

  final BuBytes? recipient;

  final BuBytes? messageBody;

  MsgSendMessage({
    this.from,
    this.destinationDomain,
    List<int>? recipient,
    List<int>? messageBody,
  }) : recipient = recipient?.asImmutableBytes,
       messageBody = messageBody?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(name: "amino.name", value: "cctp/SendMessage"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.bytes(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    from,
    destinationDomain,
    recipient,
    messageBody,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'from': from,
      'destination_domain': destinationDomain,
      'recipient': config.encodeBinary(recipient),
      'message_body': config.encodeBinary(messageBody),
    };
  }

  factory MsgSendMessage.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSendMessage(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      destinationDomain: json.valueAsInt<int?>(
        'destination_domain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      recipient: config.decodeBinary<List<int>?>(
        json.valueAs('recipient', normalizeKeyLookup: config.normalizeKeys),
      ),
      messageBody: config.decodeBinary<List<int>?>(
        json.valueAs('message_body', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgSendMessage.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSendMessage(
      from: decode.getString<String?>(1),
      destinationDomain: decode.getInt<int?>(2),
      recipient: decode.getBytes<List<int>?>(3),
      messageBody: decode.getBytes<List<int>?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgSendMessage;
  @override
  MsgSendMessageResponse onServiceResponse(List<int> bytes) {
    return MsgSendMessageResponse.deserialize(bytes);
  }

  @override
  MsgSendMessageResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSendMessageResponse.fromJson(json);
  }
}

class MsgSendMessageResponse extends CosmosProtoMessage {
  final BigInt? nonce;

  const MsgSendMessageResponse({this.nonce});

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
  List<Object?> get protoValues => [nonce];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'nonce': config.encodeBigint(nonce)};
  }

  factory MsgSendMessageResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSendMessageResponse(
      nonce: json.valueAsBigInt<BigInt?>(
        'nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgSendMessageResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSendMessageResponse(nonce: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgSendMessageResponse;
}

class MsgSendMessageWithCaller extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSendMessageWithCallerResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final int? destinationDomain;

  final BuBytes? recipient;

  final BuBytes? messageBody;

  final BuBytes? destinationCaller;

  MsgSendMessageWithCaller({
    this.from,
    this.destinationDomain,
    List<int>? recipient,
    List<int>? messageBody,
    List<int>? destinationCaller,
  }) : recipient = recipient?.asImmutableBytes,
       messageBody = messageBody?.asImmutableBytes,
       destinationCaller = destinationCaller?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/SendMessageWithCaller",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.bytes(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    from,
    destinationDomain,
    recipient,
    messageBody,
    destinationCaller,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'from': from,
      'destination_domain': destinationDomain,
      'recipient': config.encodeBinary(recipient),
      'message_body': config.encodeBinary(messageBody),
      'destination_caller': config.encodeBinary(destinationCaller),
    };
  }

  factory MsgSendMessageWithCaller.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSendMessageWithCaller(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      destinationDomain: json.valueAsInt<int?>(
        'destination_domain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      recipient: config.decodeBinary<List<int>?>(
        json.valueAs('recipient', normalizeKeyLookup: config.normalizeKeys),
      ),
      messageBody: config.decodeBinary<List<int>?>(
        json.valueAs('message_body', normalizeKeyLookup: config.normalizeKeys),
      ),
      destinationCaller: config.decodeBinary<List<int>?>(
        json.valueAs(
          'destination_caller',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory MsgSendMessageWithCaller.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSendMessageWithCaller(
      from: decode.getString<String?>(1),
      destinationDomain: decode.getInt<int?>(2),
      recipient: decode.getBytes<List<int>?>(3),
      messageBody: decode.getBytes<List<int>?>(4),
      destinationCaller: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgSendMessageWithCaller;
  @override
  MsgSendMessageWithCallerResponse onServiceResponse(List<int> bytes) {
    return MsgSendMessageWithCallerResponse.deserialize(bytes);
  }

  @override
  MsgSendMessageWithCallerResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgSendMessageWithCallerResponse.fromJson(json);
  }
}

class MsgSendMessageWithCallerResponse extends CosmosProtoMessage {
  final BigInt? nonce;

  const MsgSendMessageWithCallerResponse({this.nonce});

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
  List<Object?> get protoValues => [nonce];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'nonce': config.encodeBigint(nonce)};
  }

  factory MsgSendMessageWithCallerResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSendMessageWithCallerResponse(
      nonce: json.valueAsBigInt<BigInt?>(
        'nonce',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgSendMessageWithCallerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSendMessageWithCallerResponse(
      nonce: decode.getBigInt<BigInt?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgSendMessageWithCallerResponse;
}

class MsgReplaceMessage extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgReplaceMessageResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final BuBytes? originalMessage;

  final BuBytes? originalAttestation;

  final BuBytes? newMessageBody;

  final BuBytes? newDestinationCaller;

  MsgReplaceMessage({
    this.from,
    List<int>? originalMessage,
    List<int>? originalAttestation,
    List<int>? newMessageBody,
    List<int>? newDestinationCaller,
  }) : originalMessage = originalMessage?.asImmutableBytes,
       originalAttestation = originalAttestation?.asImmutableBytes,
       newMessageBody = newMessageBody?.asImmutableBytes,
       newDestinationCaller = newDestinationCaller?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(name: "amino.name", value: "cctp/ReplaceMessage"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.bytes(4),
        ProtoFieldConfig.bytes(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    from,
    originalMessage,
    originalAttestation,
    newMessageBody,
    newDestinationCaller,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'from': from,
      'original_message': config.encodeBinary(originalMessage),
      'original_attestation': config.encodeBinary(originalAttestation),
      'new_message_body': config.encodeBinary(newMessageBody),
      'new_destination_caller': config.encodeBinary(newDestinationCaller),
    };
  }

  factory MsgReplaceMessage.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgReplaceMessage(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      originalMessage: config.decodeBinary<List<int>?>(
        json.valueAs(
          'original_message',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      originalAttestation: config.decodeBinary<List<int>?>(
        json.valueAs(
          'original_attestation',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      newMessageBody: config.decodeBinary<List<int>?>(
        json.valueAs(
          'new_message_body',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      newDestinationCaller: config.decodeBinary<List<int>?>(
        json.valueAs(
          'new_destination_caller',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory MsgReplaceMessage.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgReplaceMessage(
      from: decode.getString<String?>(1),
      originalMessage: decode.getBytes<List<int>?>(2),
      originalAttestation: decode.getBytes<List<int>?>(3),
      newMessageBody: decode.getBytes<List<int>?>(4),
      newDestinationCaller: decode.getBytes<List<int>?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgReplaceMessage;
  @override
  MsgReplaceMessageResponse onServiceResponse(List<int> bytes) {
    return MsgReplaceMessageResponse.deserialize(bytes);
  }

  @override
  MsgReplaceMessageResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgReplaceMessageResponse.fromJson(json);
  }
}

class MsgReplaceMessageResponse extends CosmosProtoMessage {
  const MsgReplaceMessageResponse();

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

  factory MsgReplaceMessageResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgReplaceMessageResponse();
  }

  factory MsgReplaceMessageResponse.deserialize(List<int> bytes) {
    return MsgReplaceMessageResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgReplaceMessageResponse;
}

class MsgUpdateSignatureThreshold extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateSignatureThresholdResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final int? amount;

  const MsgUpdateSignatureThreshold({this.from, this.amount});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/UpdateSignatureThreshold",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint32(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [from, amount];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from, 'amount': amount};
  }

  factory MsgUpdateSignatureThreshold.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateSignatureThreshold(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      amount: json.valueAsInt<int?>(
        'amount',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUpdateSignatureThreshold.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUpdateSignatureThreshold(
      from: decode.getString<String?>(1),
      amount: decode.getInt<int?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUpdateSignatureThreshold;
  @override
  MsgUpdateSignatureThresholdResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateSignatureThresholdResponse.deserialize(bytes);
  }

  @override
  MsgUpdateSignatureThresholdResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgUpdateSignatureThresholdResponse.fromJson(json);
  }
}

class MsgUpdateSignatureThresholdResponse extends CosmosProtoMessage {
  const MsgUpdateSignatureThresholdResponse();

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

  factory MsgUpdateSignatureThresholdResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateSignatureThresholdResponse();
  }

  factory MsgUpdateSignatureThresholdResponse.deserialize(List<int> bytes) {
    return MsgUpdateSignatureThresholdResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUpdateSignatureThresholdResponse;
}

class MsgLinkTokenPair extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgLinkTokenPairResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final int? remoteDomain;

  final BuBytes? remoteToken;

  final String? localToken;

  MsgLinkTokenPair({
    this.from,
    this.remoteDomain,
    List<int>? remoteToken,
    this.localToken,
  }) : remoteToken = remoteToken?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(name: "amino.name", value: "cctp/LinkTokenPair"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    from,
    remoteDomain,
    remoteToken,
    localToken,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'from': from,
      'remote_domain': remoteDomain,
      'remote_token': config.encodeBinary(remoteToken),
      'local_token': localToken,
    };
  }

  factory MsgLinkTokenPair.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgLinkTokenPair(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      remoteDomain: json.valueAsInt<int?>(
        'remote_domain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      remoteToken: config.decodeBinary<List<int>?>(
        json.valueAs('remote_token', normalizeKeyLookup: config.normalizeKeys),
      ),
      localToken: json.valueAsString<String?>(
        'local_token',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgLinkTokenPair.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgLinkTokenPair(
      from: decode.getString<String?>(1),
      remoteDomain: decode.getInt<int?>(2),
      remoteToken: decode.getBytes<List<int>?>(3),
      localToken: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgLinkTokenPair;
  @override
  MsgLinkTokenPairResponse onServiceResponse(List<int> bytes) {
    return MsgLinkTokenPairResponse.deserialize(bytes);
  }

  @override
  MsgLinkTokenPairResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgLinkTokenPairResponse.fromJson(json);
  }
}

class MsgLinkTokenPairResponse extends CosmosProtoMessage {
  const MsgLinkTokenPairResponse();

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

  factory MsgLinkTokenPairResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgLinkTokenPairResponse();
  }

  factory MsgLinkTokenPairResponse.deserialize(List<int> bytes) {
    return MsgLinkTokenPairResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgLinkTokenPairResponse;
}

class MsgUnlinkTokenPair extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUnlinkTokenPairResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final int? remoteDomain;

  final BuBytes? remoteToken;

  final String? localToken;

  MsgUnlinkTokenPair({
    this.from,
    this.remoteDomain,
    List<int>? remoteToken,
    this.localToken,
  }) : remoteToken = remoteToken?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(name: "amino.name", value: "cctp/UnlinkTokenPair"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    from,
    remoteDomain,
    remoteToken,
    localToken,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'from': from,
      'remote_domain': remoteDomain,
      'remote_token': config.encodeBinary(remoteToken),
      'local_token': localToken,
    };
  }

  factory MsgUnlinkTokenPair.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUnlinkTokenPair(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      remoteDomain: json.valueAsInt<int?>(
        'remote_domain',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      remoteToken: config.decodeBinary<List<int>?>(
        json.valueAs('remote_token', normalizeKeyLookup: config.normalizeKeys),
      ),
      localToken: json.valueAsString<String?>(
        'local_token',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgUnlinkTokenPair.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgUnlinkTokenPair(
      from: decode.getString<String?>(1),
      remoteDomain: decode.getInt<int?>(2),
      remoteToken: decode.getBytes<List<int>?>(3),
      localToken: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUnlinkTokenPair;
  @override
  MsgUnlinkTokenPairResponse onServiceResponse(List<int> bytes) {
    return MsgUnlinkTokenPairResponse.deserialize(bytes);
  }

  @override
  MsgUnlinkTokenPairResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUnlinkTokenPairResponse.fromJson(json);
  }
}

class MsgUnlinkTokenPairResponse extends CosmosProtoMessage {
  const MsgUnlinkTokenPairResponse();

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

  factory MsgUnlinkTokenPairResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUnlinkTokenPairResponse();
  }

  factory MsgUnlinkTokenPairResponse.deserialize(List<int> bytes) {
    return MsgUnlinkTokenPairResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgUnlinkTokenPairResponse;
}

class MsgAddRemoteTokenMessenger extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAddRemoteTokenMessengerResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final int? domainId;

  final BuBytes? address;

  MsgAddRemoteTokenMessenger({this.from, this.domainId, List<int>? address})
    : address = address?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/AddRemoteTokenMessenger",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.bytes(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [from, domainId, address];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'from': from,
      'domain_id': domainId,
      'address': config.encodeBinary(address),
    };
  }

  factory MsgAddRemoteTokenMessenger.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgAddRemoteTokenMessenger(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      domainId: json.valueAsInt<int?>(
        'domain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      address: config.decodeBinary<List<int>?>(
        json.valueAs('address', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgAddRemoteTokenMessenger.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddRemoteTokenMessenger(
      from: decode.getString<String?>(1),
      domainId: decode.getInt<int?>(2),
      address: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgAddRemoteTokenMessenger;
  @override
  MsgAddRemoteTokenMessengerResponse onServiceResponse(List<int> bytes) {
    return MsgAddRemoteTokenMessengerResponse.deserialize(bytes);
  }

  @override
  MsgAddRemoteTokenMessengerResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgAddRemoteTokenMessengerResponse.fromJson(json);
  }
}

class MsgAddRemoteTokenMessengerResponse extends CosmosProtoMessage {
  const MsgAddRemoteTokenMessengerResponse();

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

  factory MsgAddRemoteTokenMessengerResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgAddRemoteTokenMessengerResponse();
  }

  factory MsgAddRemoteTokenMessengerResponse.deserialize(List<int> bytes) {
    return MsgAddRemoteTokenMessengerResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgAddRemoteTokenMessengerResponse;
}

class MsgRemoveRemoteTokenMessenger extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRemoveRemoteTokenMessengerResponse>,
        ICosmosProtoAminoMessage {
  final String? from;

  final int? domainId;

  const MsgRemoveRemoteTokenMessenger({this.from, this.domainId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "from"),
        ProtoOptionString(
          name: "amino.name",
          value: "cctp/RemoveRemoteTokenMessenger",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.uint32(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [from, domainId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'from': from, 'domain_id': domainId};
  }

  factory MsgRemoveRemoteTokenMessenger.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRemoveRemoteTokenMessenger(
      from: json.valueAsString<String?>(
        'from',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      domainId: json.valueAsInt<int?>(
        'domain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgRemoveRemoteTokenMessenger.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveRemoteTokenMessenger(
      from: decode.getString<String?>(1),
      domainId: decode.getInt<int?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.circleCctpV1MsgRemoveRemoteTokenMessenger;
  @override
  MsgRemoveRemoteTokenMessengerResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveRemoteTokenMessengerResponse.deserialize(bytes);
  }

  @override
  MsgRemoveRemoteTokenMessengerResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgRemoveRemoteTokenMessengerResponse.fromJson(json);
  }
}

class MsgRemoveRemoteTokenMessengerResponse extends CosmosProtoMessage {
  const MsgRemoveRemoteTokenMessengerResponse();

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

  factory MsgRemoveRemoteTokenMessengerResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRemoveRemoteTokenMessengerResponse();
  }

  factory MsgRemoveRemoteTokenMessengerResponse.deserialize(List<int> bytes) {
    return MsgRemoveRemoteTokenMessengerResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .circleCctpV1MsgRemoveRemoteTokenMessengerResponse;
}
