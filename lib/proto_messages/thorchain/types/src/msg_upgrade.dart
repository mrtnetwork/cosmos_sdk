import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/thorchain/types/src/tx.dart"
    as types_tx;

class Upgrade extends CosmosProtoMessage {
  final BigInt? height;

  final String? info;

  const Upgrade({this.height, this.info});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.int64(1), ProtoFieldConfig.string(2)],
    );
  }

  @override
  List<Object?> get protoValues => [height, info];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'height': config.encodeBigint(height), 'info': info};
  }

  factory Upgrade.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Upgrade(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      info: json.valueAsString<String?>(
        'info',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Upgrade.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Upgrade(
      height: decode.getBigInt<BigInt?>(1),
      info: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesUpgrade;
}

class MsgProposeUpgrade extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final String? name;

  final Upgrade? upgrade;

  final BuBytes? signer;

  MsgProposeUpgrade({this.name, this.upgrade, List<int>? signer})
    : signer = signer?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "thorchain/MsgProposeUpgrade",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.bytes(
          3,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [name, upgrade, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'name': name,
      'upgrade': config.encodeMessage(upgrade),
      'signer': config.encodeBinary(signer),
    };
  }

  factory MsgProposeUpgrade.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgProposeUpgrade(
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      upgrade: json.valueTo<Upgrade?, Object>(
        key: 'upgrade',
        parse: (v) => Upgrade.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: config.decodeBinary<List<int>?>(
        json.valueAs('signer', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgProposeUpgrade.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgProposeUpgrade(
      name: decode.getString<String?>(1),
      upgrade: decode.messageTo<Upgrade?>(2, (b) => Upgrade.deserialize(b)),
      signer: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgProposeUpgrade;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}

class MsgApproveUpgrade extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final String? name;

  final BuBytes? signer;

  MsgApproveUpgrade({this.name, List<int>? signer})
    : signer = signer?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "thorchain/MsgApproveUpgrade",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bytes(
          2,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [name, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'name': name, 'signer': config.encodeBinary(signer)};
  }

  factory MsgApproveUpgrade.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgApproveUpgrade(
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: config.decodeBinary<List<int>?>(
        json.valueAs('signer', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgApproveUpgrade.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgApproveUpgrade(
      name: decode.getString<String?>(1),
      signer: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgApproveUpgrade;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}

class MsgRejectUpgrade extends CosmosProtoMessage
    with
        ICosmosProtoServiceMessage<types_tx.MsgEmpty>,
        ICosmosProtoAminoMessage {
  final String? name;

  final BuBytes? signer;

  MsgRejectUpgrade({this.name, List<int>? signer})
    : signer = signer?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "thorchain/MsgRejectUpgrade",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.bytes(
          2,
          options: [ProtoOptionString(name: "amino.encoding", value: "bech32")],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [name, signer];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'name': name, 'signer': config.encodeBinary(signer)};
  }

  factory MsgRejectUpgrade.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MsgRejectUpgrade(
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signer: config.decodeBinary<List<int>?>(
        json.valueAs('signer', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory MsgRejectUpgrade.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MsgRejectUpgrade(
      name: decode.getString<String?>(1),
      signer: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.typesMsgRejectUpgrade;
  @override
  types_tx.MsgEmpty onServiceResponse(List<int> bytes) {
    return types_tx.MsgEmpty.deserialize(bytes);
  }

  @override
  types_tx.MsgEmpty onServiceResponseJson(Map<String, dynamic> json) {
    return types_tx.MsgEmpty.fromJson(json);
  }
}
