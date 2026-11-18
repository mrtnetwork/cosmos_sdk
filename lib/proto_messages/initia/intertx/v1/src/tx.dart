import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/ibc/core/channel/v1/src/channel.dart"
    as ibc_core_channel_v1_channel;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;

/// MsgRegisterAccount defines the payload for Msg/RegisterAccount
class MsgRegisterAccount extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgRegisterAccountResponse>,
        ICosmosProtoAminoMessage {
  final String? owner;

  final String? connectionId;

  final String? version;

  final ibc_core_channel_v1_channel.Order? ordering;

  const MsgRegisterAccount({
    this.owner,
    this.connectionId,
    this.version,
    this.ordering,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner"),
        ProtoOptionString(
          name: "amino.name",
          value: "intertx/MsgRegisterAccount",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.enumType(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, connectionId, version, ordering];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'owner': owner,
      'connection_id': connectionId,
      'version': version,
      'ordering': config.encodeEnum(ordering),
    };
  }

  factory MsgRegisterAccount.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRegisterAccount(
      owner: json.valueAsString<String?>(
        'owner',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      version: json.valueAsString<String?>(
        'version',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ordering: json.valueTo<ibc_core_channel_v1_channel.Order?, Object?>(
        key: 'ordering',
        parse: (v) => ibc_core_channel_v1_channel.Order.from(v),
      ),
    );
  }

  factory MsgRegisterAccount.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRegisterAccount(
      owner: decode.getString<String?>(1),
      connectionId: decode.getString<String?>(2),
      version: decode.getString<String?>(3),
      ordering: decode.getEnum<ibc_core_channel_v1_channel.Order?>(
        4,
        ibc_core_channel_v1_channel.Order.values,
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIntertxV1MsgRegisterAccount;
  @override
  MsgRegisterAccountResponse onServiceResponse(List<int> bytes) {
    return MsgRegisterAccountResponse.deserialize(bytes);
  }

  @override
  MsgRegisterAccountResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgRegisterAccountResponse.fromJson(json);
  }
}

/// MsgRegisterAccountResponse defines the response for Msg/RegisterAccount
class MsgRegisterAccountResponse extends CosmosProtoMessage {
  const MsgRegisterAccountResponse();

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

  factory MsgRegisterAccountResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRegisterAccountResponse();
  }

  factory MsgRegisterAccountResponse.deserialize(List<int> bytes) {
    return MsgRegisterAccountResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIntertxV1MsgRegisterAccountResponse;
}

/// MsgSubmitTx defines the payload for Msg/SubmitTx
class MsgSubmitTx extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<MsgSubmitTxResponse>,
        ICosmosProtoAminoMessage {
  final String? owner;

  final String? connectionId;

  final google_protobuf_any.Any? msg;

  const MsgSubmitTx({this.owner, this.connectionId, this.msg});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "owner"),
        ProtoOptionString(name: "amino.name", value: "intertx/MsgSubmitTx"),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [owner, connectionId, msg];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'owner': owner,
      'connection_id': connectionId,
      'msg': config.encodeMessage(msg),
    };
  }

  factory MsgSubmitTx.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSubmitTx(
      owner: json.valueAsString<String?>(
        'owner',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      connectionId: json.valueAsString<String?>(
        'connection_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      msg: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'msg',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MsgSubmitTx.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgSubmitTx(
      owner: decode.getString<String?>(1),
      connectionId: decode.getString<String?>(2),
      msg: decode.messageTo<google_protobuf_any.Any?>(
        3,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIntertxV1MsgSubmitTx;
  @override
  MsgSubmitTxResponse onServiceResponse(List<int> bytes) {
    return MsgSubmitTxResponse.deserialize(bytes);
  }

  @override
  MsgSubmitTxResponse onServiceResponseJson(Map<String, dynamic> json) {
    return MsgSubmitTxResponse.fromJson(json);
  }
}

/// MsgSubmitTxResponse defines the response for Msg/SubmitTx
class MsgSubmitTxResponse extends CosmosProtoMessage {
  const MsgSubmitTxResponse();

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

  factory MsgSubmitTxResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgSubmitTxResponse();
  }

  factory MsgSubmitTxResponse.deserialize(List<int> bytes) {
    return MsgSubmitTxResponse();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaIntertxV1MsgSubmitTxResponse;
}
