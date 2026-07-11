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
  Map<String, dynamic> toJson() {
    return {
      'authority': authority,
      'name': name,
      'period': period?.toString(),
      'msgs': msgs.map((e) => e.toJson()).toList(),
    };
  }

  factory MsgAddSchedule.fromJson(Map<String, dynamic> json) {
    return MsgAddSchedule(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
      period: json.valueAsBigInt<BigInt?>('period', acceptCamelCase: true),
      msgs:
          (json.valueEnsureAsList<dynamic>('msgs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  secret_cron_schedule.MsgExecuteContract,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse:
                      (v) =>
                          secret_cron_schedule.MsgExecuteContract.fromJson(v),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgAddScheduleResponse.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'name': name};
  }

  factory MsgRemoveSchedule.fromJson(Map<String, dynamic> json) {
    return MsgRemoveSchedule(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      name: json.valueAsString<String?>('name', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {};
  }

  factory MsgRemoveScheduleResponse.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    return {'authority': authority, 'params': params?.toJson()};
  }

  factory MsgUpdateParams.fromJson(Map<String, dynamic> json) {
    return MsgUpdateParams(
      authority: json.valueAsString<String?>(
        'authority',
        acceptCamelCase: true,
      ),
      params: json.valueTo<secret_cron_params.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => secret_cron_params.Params.fromJson(v),
        acceptCamelCase: true,
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
      DefaultCosmosProtoTypeUrl.secretCronMsgUpdateParamsResponse;
}
