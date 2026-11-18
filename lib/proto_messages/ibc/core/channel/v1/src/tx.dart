import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/core/channel/v1/src/channel.dart"
    as ibc_core_channel_v1_channel;
import "package:cosmos_sdk/proto_messages/ibc/core/client/v1/src/client.dart"
    as ibc_core_client_v1_client;

/// ResponseResultType defines the possible outcomes of the execution of a message
enum ResponseResultType implements ProtoEnumVariant {
  /// Default zero value enumeration
  responseResultTypeUnspecified(0, 'RESPONSE_RESULT_TYPE_UNSPECIFIED'),

  /// The message did not call the IBC application callbacks (because, for example, the packet had already been relayed)
  responseResultTypeNoop(1, 'RESPONSE_RESULT_TYPE_NOOP'),

  /// The message was executed successfully
  responseResultTypeSuccess(2, 'RESPONSE_RESULT_TYPE_SUCCESS'),

  /// The message was executed unsuccessfully
  responseResultTypeFailure(3, 'RESPONSE_RESULT_TYPE_FAILURE');

  const ResponseResultType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ResponseResultType fromValue(int? value) {
    value ??= 0;
    return ResponseResultType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching ResponseResultType found for the given value. $value",
                details: {
                  "name": "ResponseResultType",
                  "value": value?.toString(),
                },
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ResponseResultType from(Object? value) {
    value ??= 0;
    return ResponseResultType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching ResponseResultType found for the given value. $value",
                details: {
                  "name": "ResponseResultType",
                  "value": value?.toString(),
                },
              ),
    );
  }
}

/// MsgChannelOpenInit defines an sdk.Msg to initialize a channel handshake. It
/// is called by a relayer on Chain A.
class MsgChannelOpenInit extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgChannelOpenInitResponse> {
  final String? portId;

  final ibc_core_channel_v1_channel.Channel? channel;

  final String? signer;

  const MsgChannelOpenInit({this.portId, this.channel, this.signer});

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
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channel, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'port_id': portId,
      'channel': config.encodeMessage(channel),
      'signer': signer,
    };
  }

  factory MsgChannelOpenInit.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChannelOpenInit(
      portId: json.valueAsString<String?>(
        'port_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      channel: json.valueTo<ibc_core_channel_v1_channel.Channel?, Object>(
        key: 'channel',
        parse:
            (v) => ibc_core_channel_v1_channel.Channel.fromJson(
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

  factory MsgChannelOpenInit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgChannelOpenInit(
      portId: decode.getString<String?>(1),
      channel: decode.messageTo<ibc_core_channel_v1_channel.Channel?>(
        2,
        (b) => ibc_core_channel_v1_channel.Channel.deserialize(b),
      ),
      signer: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgChannelOpenInit;
  @override
  MsgChannelOpenInitResponse onServiceResponse(List<int> bytes) {
    return MsgChannelOpenInitResponse.deserialize(bytes);
  }

  @override
  MsgChannelOpenInitResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgChannelOpenInitResponse.fromJson(json);
  }
}

/// MsgChannelOpenInitResponse defines the Msg/ChannelOpenInit response type.
class MsgChannelOpenInitResponse extends CosmosProtoMessage {
  final String? channelId;

  final String? version;

  const MsgChannelOpenInitResponse({this.channelId, this.version});

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
  List<Object?> get protoValues => [channelId, version];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'channel_id': channelId, 'version': version};
  }

  factory MsgChannelOpenInitResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChannelOpenInitResponse(
      channelId: json.valueAsString<String?>(
        'channel_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      version: json.valueAsString<String?>(
        'version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgChannelOpenInitResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgChannelOpenInitResponse(
      channelId: decode.getString<String?>(1),
      version: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgChannelOpenInitResponse;
}

/// MsgChannelOpenInit defines a msg sent by a Relayer to try to open a channel
/// on Chain B. The version field within the Channel field has been deprecated. Its
/// value will be ignored by core IBC.
class MsgChannelOpenTry extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgChannelOpenTryResponse> {
  final String? portId;

  /// Deprecated: this field is unused. Crossing hello's are no longer supported in core IBC.
  final String? previousChannelId;

  /// NOTE: the version field within the channel has been deprecated. Its value will be ignored by core IBC.
  final ibc_core_channel_v1_channel.Channel? channel;

  final String? counterpartyVersion;

  final BuBytes? proofInit;

  final ibc_core_client_v1_client.Height? proofHeight;

  final String? signer;

  MsgChannelOpenTry({
    this.portId,
    this.previousChannelId,
    this.channel,
    this.counterpartyVersion,
    List<int>? proofInit,
    this.proofHeight,
    this.signer,
  }) : proofInit = proofInit?.asImmutableBytes;

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
        ProtoFieldConfig.string(
          2,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.bytes(5),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.string(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    portId,
    previousChannelId,
    channel,
    counterpartyVersion,
    proofInit,
    proofHeight,
    signer,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'port_id': portId,
      'previous_channel_id': previousChannelId,
      'channel': config.encodeMessage(channel),
      'counterparty_version': counterpartyVersion,
      'proof_init': config.encodeBinary(proofInit),
      'proof_height': config.encodeMessage(proofHeight),
      'signer': signer,
    };
  }

  factory MsgChannelOpenTry.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChannelOpenTry(
      portId: json.valueAsString<String?>(
        'port_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      previousChannelId: json.valueAsString<String?>(
        'previous_channel_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      channel: json.valueTo<ibc_core_channel_v1_channel.Channel?, Object>(
        key: 'channel',
        parse:
            (v) => ibc_core_channel_v1_channel.Channel.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      counterpartyVersion: json.valueAsString<String?>(
        'counterparty_version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proofInit: config.decodeBinary<List<int>?>(
        json.valueAs('proof_init', normalizeKeyLookup: config.normalizeKeys),
      ),
      proofHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'proof_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
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

  factory MsgChannelOpenTry.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgChannelOpenTry(
      portId: decode.getString<String?>(1),
      previousChannelId: decode.getString<String?>(2),
      channel: decode.messageTo<ibc_core_channel_v1_channel.Channel?>(
        3,
        (b) => ibc_core_channel_v1_channel.Channel.deserialize(b),
      ),
      counterpartyVersion: decode.getString<String?>(4),
      proofInit: decode.getBytes<List<int>?>(5),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        6,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      signer: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgChannelOpenTry;
  @override
  MsgChannelOpenTryResponse onServiceResponse(List<int> bytes) {
    return MsgChannelOpenTryResponse.deserialize(bytes);
  }

  @override
  MsgChannelOpenTryResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgChannelOpenTryResponse.fromJson(json);
  }
}

/// MsgChannelOpenTryResponse defines the Msg/ChannelOpenTry response type.
class MsgChannelOpenTryResponse extends CosmosProtoMessage {
  final String? version;

  final String? channelId;

  const MsgChannelOpenTryResponse({this.version, this.channelId});

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
  List<Object?> get protoValues => [version, channelId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'version': version, 'channel_id': channelId};
  }

  factory MsgChannelOpenTryResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChannelOpenTryResponse(
      version: json.valueAsString<String?>(
        'version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      channelId: json.valueAsString<String?>(
        'channel_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgChannelOpenTryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgChannelOpenTryResponse(
      version: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgChannelOpenTryResponse;
}

/// MsgChannelOpenAck defines a msg sent by a Relayer to Chain A to acknowledge
/// the change of channel state to TRYOPEN on Chain B.
class MsgChannelOpenAck extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgChannelOpenAckResponse> {
  final String? portId;

  final String? channelId;

  final String? counterpartyChannelId;

  final String? counterpartyVersion;

  final BuBytes? proofTry;

  final ibc_core_client_v1_client.Height? proofHeight;

  final String? signer;

  MsgChannelOpenAck({
    this.portId,
    this.channelId,
    this.counterpartyChannelId,
    this.counterpartyVersion,
    List<int>? proofTry,
    this.proofHeight,
    this.signer,
  }) : proofTry = proofTry?.asImmutableBytes;

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
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.bytes(5),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.string(7),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    portId,
    channelId,
    counterpartyChannelId,
    counterpartyVersion,
    proofTry,
    proofHeight,
    signer,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'port_id': portId,
      'channel_id': channelId,
      'counterparty_channel_id': counterpartyChannelId,
      'counterparty_version': counterpartyVersion,
      'proof_try': config.encodeBinary(proofTry),
      'proof_height': config.encodeMessage(proofHeight),
      'signer': signer,
    };
  }

  factory MsgChannelOpenAck.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChannelOpenAck(
      portId: json.valueAsString<String?>(
        'port_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      channelId: json.valueAsString<String?>(
        'channel_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      counterpartyChannelId: json.valueAsString<String?>(
        'counterparty_channel_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      counterpartyVersion: json.valueAsString<String?>(
        'counterparty_version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proofTry: config.decodeBinary<List<int>?>(
        json.valueAs('proof_try', normalizeKeyLookup: config.normalizeKeys),
      ),
      proofHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'proof_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
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

  factory MsgChannelOpenAck.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgChannelOpenAck(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      counterpartyChannelId: decode.getString<String?>(3),
      counterpartyVersion: decode.getString<String?>(4),
      proofTry: decode.getBytes<List<int>?>(5),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        6,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      signer: decode.getString<String?>(7),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgChannelOpenAck;
  @override
  MsgChannelOpenAckResponse onServiceResponse(List<int> bytes) {
    return MsgChannelOpenAckResponse.deserialize(bytes);
  }

  @override
  MsgChannelOpenAckResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgChannelOpenAckResponse.fromJson(json);
  }
}

/// MsgChannelOpenAckResponse defines the Msg/ChannelOpenAck response type.
class MsgChannelOpenAckResponse extends CosmosProtoMessage {
  const MsgChannelOpenAckResponse();

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

  factory MsgChannelOpenAckResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChannelOpenAckResponse();
  }

  factory MsgChannelOpenAckResponse.deserialize(List<int> bytes) {
    return MsgChannelOpenAckResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgChannelOpenAckResponse;
}

/// MsgChannelOpenConfirm defines a msg sent by a Relayer to Chain B to
/// acknowledge the change of channel state to OPEN on Chain A.
class MsgChannelOpenConfirm extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgChannelOpenConfirmResponse> {
  final String? portId;

  final String? channelId;

  final BuBytes? proofAck;

  final ibc_core_client_v1_client.Height? proofHeight;

  final String? signer;

  MsgChannelOpenConfirm({
    this.portId,
    this.channelId,
    List<int>? proofAck,
    this.proofHeight,
    this.signer,
  }) : proofAck = proofAck?.asImmutableBytes;

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
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    portId,
    channelId,
    proofAck,
    proofHeight,
    signer,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'port_id': portId,
      'channel_id': channelId,
      'proof_ack': config.encodeBinary(proofAck),
      'proof_height': config.encodeMessage(proofHeight),
      'signer': signer,
    };
  }

  factory MsgChannelOpenConfirm.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChannelOpenConfirm(
      portId: json.valueAsString<String?>(
        'port_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      channelId: json.valueAsString<String?>(
        'channel_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proofAck: config.decodeBinary<List<int>?>(
        json.valueAs('proof_ack', normalizeKeyLookup: config.normalizeKeys),
      ),
      proofHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'proof_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
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

  factory MsgChannelOpenConfirm.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgChannelOpenConfirm(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      proofAck: decode.getBytes<List<int>?>(3),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        4,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      signer: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgChannelOpenConfirm;
  @override
  MsgChannelOpenConfirmResponse onServiceResponse(List<int> bytes) {
    return MsgChannelOpenConfirmResponse.deserialize(bytes);
  }

  @override
  MsgChannelOpenConfirmResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgChannelOpenConfirmResponse.fromJson(json);
  }
}

/// MsgChannelOpenConfirmResponse defines the Msg/ChannelOpenConfirm response
/// type.
class MsgChannelOpenConfirmResponse extends CosmosProtoMessage {
  const MsgChannelOpenConfirmResponse();

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

  factory MsgChannelOpenConfirmResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChannelOpenConfirmResponse();
  }

  factory MsgChannelOpenConfirmResponse.deserialize(List<int> bytes) {
    return MsgChannelOpenConfirmResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgChannelOpenConfirmResponse;
}

/// MsgChannelCloseInit defines a msg sent by a Relayer to Chain A
/// to close a channel with Chain B.
class MsgChannelCloseInit extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgChannelCloseInitResponse> {
  final String? portId;

  final String? channelId;

  final String? signer;

  const MsgChannelCloseInit({this.portId, this.channelId, this.signer});

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
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [portId, channelId, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'port_id': portId, 'channel_id': channelId, 'signer': signer};
  }

  factory MsgChannelCloseInit.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChannelCloseInit(
      portId: json.valueAsString<String?>(
        'port_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      channelId: json.valueAsString<String?>(
        'channel_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgChannelCloseInit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgChannelCloseInit(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      signer: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgChannelCloseInit;
  @override
  MsgChannelCloseInitResponse onServiceResponse(List<int> bytes) {
    return MsgChannelCloseInitResponse.deserialize(bytes);
  }

  @override
  MsgChannelCloseInitResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgChannelCloseInitResponse.fromJson(json);
  }
}

/// MsgChannelCloseInitResponse defines the Msg/ChannelCloseInit response type.
class MsgChannelCloseInitResponse extends CosmosProtoMessage {
  const MsgChannelCloseInitResponse();

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

  factory MsgChannelCloseInitResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChannelCloseInitResponse();
  }

  factory MsgChannelCloseInitResponse.deserialize(List<int> bytes) {
    return MsgChannelCloseInitResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgChannelCloseInitResponse;
}

/// MsgChannelCloseConfirm defines a msg sent by a Relayer to Chain B
/// to acknowledge the change of channel state to CLOSED on Chain A.
class MsgChannelCloseConfirm extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgChannelCloseConfirmResponse> {
  final String? portId;

  final String? channelId;

  final BuBytes? proofInit;

  final ibc_core_client_v1_client.Height? proofHeight;

  final String? signer;

  MsgChannelCloseConfirm({
    this.portId,
    this.channelId,
    List<int>? proofInit,
    this.proofHeight,
    this.signer,
  }) : proofInit = proofInit?.asImmutableBytes;

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
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    portId,
    channelId,
    proofInit,
    proofHeight,
    signer,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'port_id': portId,
      'channel_id': channelId,
      'proof_init': config.encodeBinary(proofInit),
      'proof_height': config.encodeMessage(proofHeight),
      'signer': signer,
    };
  }

  factory MsgChannelCloseConfirm.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChannelCloseConfirm(
      portId: json.valueAsString<String?>(
        'port_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      channelId: json.valueAsString<String?>(
        'channel_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proofInit: config.decodeBinary<List<int>?>(
        json.valueAs('proof_init', normalizeKeyLookup: config.normalizeKeys),
      ),
      proofHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'proof_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
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

  factory MsgChannelCloseConfirm.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgChannelCloseConfirm(
      portId: decode.getString<String?>(1),
      channelId: decode.getString<String?>(2),
      proofInit: decode.getBytes<List<int>?>(3),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        4,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      signer: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgChannelCloseConfirm;
  @override
  MsgChannelCloseConfirmResponse onServiceResponse(List<int> bytes) {
    return MsgChannelCloseConfirmResponse.deserialize(bytes);
  }

  @override
  MsgChannelCloseConfirmResponse onServiceResponseJson(
    Map<String, dynamic> json,
  ) {
    return MsgChannelCloseConfirmResponse.fromJson(json);
  }
}

/// MsgChannelCloseConfirmResponse defines the Msg/ChannelCloseConfirm response
/// type.
class MsgChannelCloseConfirmResponse extends CosmosProtoMessage {
  const MsgChannelCloseConfirmResponse();

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

  factory MsgChannelCloseConfirmResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgChannelCloseConfirmResponse();
  }

  factory MsgChannelCloseConfirmResponse.deserialize(List<int> bytes) {
    return MsgChannelCloseConfirmResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgChannelCloseConfirmResponse;
}

/// MsgRecvPacket receives incoming IBC packet
class MsgRecvPacket extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgRecvPacketResponse> {
  final ibc_core_channel_v1_channel.Packet? packet;

  final BuBytes? proofCommitment;

  final ibc_core_client_v1_client.Height? proofHeight;

  final String? signer;

  MsgRecvPacket({
    this.packet,
    List<int>? proofCommitment,
    this.proofHeight,
    this.signer,
  }) : proofCommitment = proofCommitment?.asImmutableBytes;

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
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.string(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    packet,
    proofCommitment,
    proofHeight,
    signer,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'packet': config.encodeMessage(packet),
      'proof_commitment': config.encodeBinary(proofCommitment),
      'proof_height': config.encodeMessage(proofHeight),
      'signer': signer,
    };
  }

  factory MsgRecvPacket.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRecvPacket(
      packet: json.valueTo<ibc_core_channel_v1_channel.Packet?, Object>(
        key: 'packet',
        parse:
            (v) => ibc_core_channel_v1_channel.Packet.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proofCommitment: config.decodeBinary<List<int>?>(
        json.valueAs(
          'proof_commitment',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      proofHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'proof_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
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

  factory MsgRecvPacket.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRecvPacket(
      packet: decode.messageTo<ibc_core_channel_v1_channel.Packet?>(
        1,
        (b) => ibc_core_channel_v1_channel.Packet.deserialize(b),
      ),
      proofCommitment: decode.getBytes<List<int>?>(2),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        3,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      signer: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgRecvPacket;
  @override
  MsgRecvPacketResponse onServiceResponse(List<int> bytes) {
    return MsgRecvPacketResponse.deserialize(bytes);
  }

  @override
  MsgRecvPacketResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRecvPacketResponse.fromJson(json);
  }
}

/// MsgRecvPacketResponse defines the Msg/RecvPacket response type.
class MsgRecvPacketResponse extends CosmosProtoMessage {
  final ResponseResultType? result;

  const MsgRecvPacketResponse({this.result});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.enumType(1)],
    );
  }

  @override
  List<Object?> get protoValues => [result];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'result': config.encodeEnum(result)};
  }

  factory MsgRecvPacketResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRecvPacketResponse(
      result: json.valueTo<ResponseResultType?, Object?>(
        key: 'result',
        parse: (v) => ResponseResultType.from(v),
      ),
    );
  }

  factory MsgRecvPacketResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRecvPacketResponse(
      result: decode.getEnum<ResponseResultType?>(1, ResponseResultType.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgRecvPacketResponse;
}

/// MsgTimeout receives timed-out packet
class MsgTimeout extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgTimeoutResponse> {
  final ibc_core_channel_v1_channel.Packet? packet;

  final BuBytes? proofUnreceived;

  final ibc_core_client_v1_client.Height? proofHeight;

  final BigInt? nextSequenceRecv;

  final String? signer;

  MsgTimeout({
    this.packet,
    List<int>? proofUnreceived,
    this.proofHeight,
    this.nextSequenceRecv,
    this.signer,
  }) : proofUnreceived = proofUnreceived?.asImmutableBytes;

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
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.uint64(4),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    packet,
    proofUnreceived,
    proofHeight,
    nextSequenceRecv,
    signer,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'packet': config.encodeMessage(packet),
      'proof_unreceived': config.encodeBinary(proofUnreceived),
      'proof_height': config.encodeMessage(proofHeight),
      'next_sequence_recv': config.encodeBigint(nextSequenceRecv),
      'signer': signer,
    };
  }

  factory MsgTimeout.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgTimeout(
      packet: json.valueTo<ibc_core_channel_v1_channel.Packet?, Object>(
        key: 'packet',
        parse:
            (v) => ibc_core_channel_v1_channel.Packet.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proofUnreceived: config.decodeBinary<List<int>?>(
        json.valueAs(
          'proof_unreceived',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      proofHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'proof_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      nextSequenceRecv: json.valueAsBigInt<BigInt?>(
        'next_sequence_recv',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgTimeout.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTimeout(
      packet: decode.messageTo<ibc_core_channel_v1_channel.Packet?>(
        1,
        (b) => ibc_core_channel_v1_channel.Packet.deserialize(b),
      ),
      proofUnreceived: decode.getBytes<List<int>?>(2),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        3,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      nextSequenceRecv: decode.getBigInt<BigInt?>(4),
      signer: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgTimeout;
  @override
  MsgTimeoutResponse onServiceResponse(List<int> bytes) {
    return MsgTimeoutResponse.deserialize(bytes);
  }

  @override
  MsgTimeoutResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgTimeoutResponse.fromJson(json);
  }
}

/// MsgTimeoutResponse defines the Msg/Timeout response type.
class MsgTimeoutResponse extends CosmosProtoMessage {
  final ResponseResultType? result;

  const MsgTimeoutResponse({this.result});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.enumType(1)],
    );
  }

  @override
  List<Object?> get protoValues => [result];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'result': config.encodeEnum(result)};
  }

  factory MsgTimeoutResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgTimeoutResponse(
      result: json.valueTo<ResponseResultType?, Object?>(
        key: 'result',
        parse: (v) => ResponseResultType.from(v),
      ),
    );
  }

  factory MsgTimeoutResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTimeoutResponse(
      result: decode.getEnum<ResponseResultType?>(1, ResponseResultType.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgTimeoutResponse;
}

/// MsgTimeoutOnClose timed-out packet upon counterparty channel closure.
class MsgTimeoutOnClose extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgTimeoutOnCloseResponse> {
  final ibc_core_channel_v1_channel.Packet? packet;

  final BuBytes? proofUnreceived;

  final BuBytes? proofClose;

  final ibc_core_client_v1_client.Height? proofHeight;

  final BigInt? nextSequenceRecv;

  final String? signer;

  MsgTimeoutOnClose({
    this.packet,
    List<int>? proofUnreceived,
    List<int>? proofClose,
    this.proofHeight,
    this.nextSequenceRecv,
    this.signer,
  }) : proofUnreceived = proofUnreceived?.asImmutableBytes,
       proofClose = proofClose?.asImmutableBytes;

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
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.uint64(5),
        ProtoFieldConfig.string(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    packet,
    proofUnreceived,
    proofClose,
    proofHeight,
    nextSequenceRecv,
    signer,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'packet': config.encodeMessage(packet),
      'proof_unreceived': config.encodeBinary(proofUnreceived),
      'proof_close': config.encodeBinary(proofClose),
      'proof_height': config.encodeMessage(proofHeight),
      'next_sequence_recv': config.encodeBigint(nextSequenceRecv),
      'signer': signer,
    };
  }

  factory MsgTimeoutOnClose.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgTimeoutOnClose(
      packet: json.valueTo<ibc_core_channel_v1_channel.Packet?, Object>(
        key: 'packet',
        parse:
            (v) => ibc_core_channel_v1_channel.Packet.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      proofUnreceived: config.decodeBinary<List<int>?>(
        json.valueAs(
          'proof_unreceived',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      proofClose: config.decodeBinary<List<int>?>(
        json.valueAs('proof_close', normalizeKeyLookup: config.normalizeKeys),
      ),
      proofHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'proof_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      nextSequenceRecv: json.valueAsBigInt<BigInt?>(
        'next_sequence_recv',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: json.valueAsString<String?>(
        'signer',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgTimeoutOnClose.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTimeoutOnClose(
      packet: decode.messageTo<ibc_core_channel_v1_channel.Packet?>(
        1,
        (b) => ibc_core_channel_v1_channel.Packet.deserialize(b),
      ),
      proofUnreceived: decode.getBytes<List<int>?>(2),
      proofClose: decode.getBytes<List<int>?>(3),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        4,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      nextSequenceRecv: decode.getBigInt<BigInt?>(5),
      signer: decode.getString<String?>(6),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgTimeoutOnClose;
  @override
  MsgTimeoutOnCloseResponse onServiceResponse(List<int> bytes) {
    return MsgTimeoutOnCloseResponse.deserialize(bytes);
  }

  @override
  MsgTimeoutOnCloseResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgTimeoutOnCloseResponse.fromJson(json);
  }
}

/// MsgTimeoutOnCloseResponse defines the Msg/TimeoutOnClose response type.
class MsgTimeoutOnCloseResponse extends CosmosProtoMessage {
  final ResponseResultType? result;

  const MsgTimeoutOnCloseResponse({this.result});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.enumType(1)],
    );
  }

  @override
  List<Object?> get protoValues => [result];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'result': config.encodeEnum(result)};
  }

  factory MsgTimeoutOnCloseResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgTimeoutOnCloseResponse(
      result: json.valueTo<ResponseResultType?, Object?>(
        key: 'result',
        parse: (v) => ResponseResultType.from(v),
      ),
    );
  }

  factory MsgTimeoutOnCloseResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgTimeoutOnCloseResponse(
      result: decode.getEnum<ResponseResultType?>(1, ResponseResultType.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgTimeoutOnCloseResponse;
}

/// MsgAcknowledgement receives incoming IBC acknowledgement
class MsgAcknowledgement extends CosmosProtoMessage
    with ICosmosProtoServiceMessage<MsgAcknowledgementResponse> {
  final ibc_core_channel_v1_channel.Packet? packet;

  final BuBytes? acknowledgement;

  final BuBytes? proofAcked;

  final ibc_core_client_v1_client.Height? proofHeight;

  final String? signer;

  MsgAcknowledgement({
    this.packet,
    List<int>? acknowledgement,
    List<int>? proofAcked,
    this.proofHeight,
    this.signer,
  }) : acknowledgement = acknowledgement?.asImmutableBytes,
       proofAcked = proofAcked?.asImmutableBytes;

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
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.bytes(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    packet,
    acknowledgement,
    proofAcked,
    proofHeight,
    signer,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'packet': config.encodeMessage(packet),
      'acknowledgement': config.encodeBinary(acknowledgement),
      'proof_acked': config.encodeBinary(proofAcked),
      'proof_height': config.encodeMessage(proofHeight),
      'signer': signer,
    };
  }

  factory MsgAcknowledgement.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgAcknowledgement(
      packet: json.valueTo<ibc_core_channel_v1_channel.Packet?, Object>(
        key: 'packet',
        parse:
            (v) => ibc_core_channel_v1_channel.Packet.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      acknowledgement: config.decodeBinary<List<int>?>(
        json.valueAs(
          'acknowledgement',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      proofAcked: config.decodeBinary<List<int>?>(
        json.valueAs('proof_acked', normalizeKeyLookup: config.normalizeKeys),
      ),
      proofHeight: json.valueTo<ibc_core_client_v1_client.Height?, Object>(
        key: 'proof_height',
        parse:
            (v) => ibc_core_client_v1_client.Height.fromJson(
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

  factory MsgAcknowledgement.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAcknowledgement(
      packet: decode.messageTo<ibc_core_channel_v1_channel.Packet?>(
        1,
        (b) => ibc_core_channel_v1_channel.Packet.deserialize(b),
      ),
      acknowledgement: decode.getBytes<List<int>?>(2),
      proofAcked: decode.getBytes<List<int>?>(3),
      proofHeight: decode.messageTo<ibc_core_client_v1_client.Height?>(
        4,
        (b) => ibc_core_client_v1_client.Height.deserialize(b),
      ),
      signer: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgAcknowledgement;
  @override
  MsgAcknowledgementResponse onServiceResponse(List<int> bytes) {
    return MsgAcknowledgementResponse.deserialize(bytes);
  }

  @override
  MsgAcknowledgementResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgAcknowledgementResponse.fromJson(json);
  }
}

/// MsgAcknowledgementResponse defines the Msg/Acknowledgement response type.
class MsgAcknowledgementResponse extends CosmosProtoMessage {
  final ResponseResultType? result;

  const MsgAcknowledgementResponse({this.result});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.enumType(1)],
    );
  }

  @override
  List<Object?> get protoValues => [result];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'result': config.encodeEnum(result)};
  }

  factory MsgAcknowledgementResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgAcknowledgementResponse(
      result: json.valueTo<ResponseResultType?, Object?>(
        key: 'result',
        parse: (v) => ResponseResultType.from(v),
      ),
    );
  }

  factory MsgAcknowledgementResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAcknowledgementResponse(
      result: decode.getEnum<ResponseResultType?>(1, ResponseResultType.values),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.ibcCoreChannelV1MsgAcknowledgementResponse;
}
