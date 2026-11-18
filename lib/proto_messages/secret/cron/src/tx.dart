import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/secret/cron/src/schedule.dart"
    as secret_cron_schedule;
import "package:cosmos_sdk/proto_messages/secret/cron/src/params.dart"
    as secret_cron_params;

/// this line is used by starport scaffolding # proto/tx/rpc
/// The MsgAddSchedule request type.
class MsgAddSchedule extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgAddScheduleResponse>,
        ICosmosProtoAminoMessage {
  /// The address of the governance account.
  final String? authority;

  /// Name of the schedule
  final String? name;

  /// Period in blocks
  final BigInt? period;

  /// Msgs that will be executed every certain number of blocks, specified in the `period` field
  final List<secret_cron_schedule.MsgExecuteContract> msgs;

  const MsgAddSchedule({
    this.authority,
    this.name,
    this.period,
    this.msgs = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "cron/MsgAddSchedule"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.uint64(3),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, name, period, msgs];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'authority': authority,
      'name': name,
      'period': config.encodeBigint(period),
      'msgs': msgs.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory MsgAddSchedule.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgAddSchedule(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      period: json.valueAsBigInt<BigInt?>(
        'period',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      msgs:
          (json.valueEnsureAsList<dynamic>(
                'msgs',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  secret_cron_schedule.MsgExecuteContract,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => secret_cron_schedule.MsgExecuteContract.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory MsgAddSchedule.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgAddSchedule(
      authority: decode.getString<String?>(1),
      name: decode.getString<String?>(2),
      period: decode.getBigInt<BigInt?>(3),
      msgs:
          decode
              .getListOfBytes(4)
              .map(
                (b) => secret_cron_schedule.MsgExecuteContract.deserialize(b),
              )
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretCronMsgAddSchedule;
  @override
  MsgAddScheduleResponse onServiceResponse(List<int> bytes) {
    return MsgAddScheduleResponse.deserialize(bytes);
  }

  @override
  MsgAddScheduleResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgAddScheduleResponse.fromJson(json);
  }
}

/// Defines the response structure for executing a MsgAddSchedule message.
class MsgAddScheduleResponse extends CosmosProtoMessage {
  const MsgAddScheduleResponse();

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

  factory MsgAddScheduleResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgAddScheduleResponse();
  }

  factory MsgAddScheduleResponse.deserialize(List<int> bytes) {
    return MsgAddScheduleResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretCronMsgAddScheduleResponse;
}

/// The MsgRemoveSchedule request type.
class MsgRemoveSchedule extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRemoveScheduleResponse>,
        ICosmosProtoAminoMessage {
  /// The address of the governance account.
  final String? authority;

  /// Name of the schedule
  final String? name;

  const MsgRemoveSchedule({this.authority, this.name});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "cron/MsgRemoveSchedule"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [authority, name];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'authority': authority, 'name': name};
  }

  factory MsgRemoveSchedule.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRemoveSchedule(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgRemoveSchedule.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRemoveSchedule(
      authority: decode.getString<String?>(1),
      name: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretCronMsgRemoveSchedule;
  @override
  MsgRemoveScheduleResponse onServiceResponse(List<int> bytes) {
    return MsgRemoveScheduleResponse.deserialize(bytes);
  }

  @override
  MsgRemoveScheduleResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRemoveScheduleResponse.fromJson(json);
  }
}

/// Defines the response structure for executing a MsgRemoveSchedule message.
class MsgRemoveScheduleResponse extends CosmosProtoMessage {
  const MsgRemoveScheduleResponse();

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

  factory MsgRemoveScheduleResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRemoveScheduleResponse();
  }

  factory MsgRemoveScheduleResponse.deserialize(List<int> bytes) {
    return MsgRemoveScheduleResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretCronMsgRemoveScheduleResponse;
}

/// this line is used by starport scaffolding # proto/tx/message
/// The MsgUpdateParams request type.
///
/// Since: 0.47
class MsgUpdateParams extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgUpdateParamsResponse>,
        ICosmosProtoAminoMessage {
  /// The address of the governance account.
  final String? authority;

  /// Defines the x/cron parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final secret_cron_params.Params? params;

  const MsgUpdateParams({this.authority, this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "amino.name", value: "cron/MsgUpdateParams"),
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "authority"),
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'authority': authority, 'params': config.encodeMessage(params)};
  }

  factory MsgUpdateParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      params: json.valueTo<secret_cron_params.Params?, Object>(
        key: 'params',
        parse:
            (v) => secret_cron_params.Params.fromJson(
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
      authority: decode.getString<String?>(1),
      params: decode.messageTo<secret_cron_params.Params?>(
        2,
        (b) => secret_cron_params.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.secretCronMsgUpdateParams;
  @override
  MsgUpdateParamsResponse onServiceResponse(List<int> bytes) {
    return MsgUpdateParamsResponse.deserialize(bytes);
  }

  @override
  MsgUpdateParamsResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgUpdateParamsResponse.fromJson(json);
  }
}

/// Defines the response structure for executing a MsgUpdateParams message.
///
/// Since: 0.47
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
      DefaultCosmosProtoTypeUrl.secretCronMsgUpdateParamsResponse;
}
