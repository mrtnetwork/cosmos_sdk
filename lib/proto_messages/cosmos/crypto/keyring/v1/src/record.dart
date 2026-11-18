import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/crypto/hd/v1/src/hd.dart"
    as cosmos_crypto_hd_v1_hd;

/// Record is used for representing a key in the keyring.
class Record extends CosmosProtoMessage {
  /// name represents a name of Record
  final String? name;

  /// pub_key represents a public key in any format
  final google_protobuf_any.Any? pubKey;

  /// Record contains one of the following items
  /// local stores the private key locally.
  final RecordLocal? local;

  /// ledger stores the information about a Ledger key.
  final RecordLedger? ledger;

  /// Multi does not store any other information.
  final RecordMulti? multi;

  /// Offline does not store any other information.
  final RecordOffline? offline;

  const Record({
    this.name,
    this.pubKey,
    this.local,
    this.ledger,
    this.multi,
    this.offline,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.message(4),
        ProtoFieldConfig.message(5),
        ProtoFieldConfig.message(6),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    name,
    pubKey,
    local,
    ledger,
    multi,
    offline,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'name': name,
      'pub_key': config.encodeMessage(pubKey),
      'local': config.encodeMessage(local),
      'ledger': config.encodeMessage(ledger),
      'multi': config.encodeMessage(multi),
      'offline': config.encodeMessage(offline),
    };
  }

  factory Record.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Record(
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pubKey: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'pub_key',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      local: json.valueTo<RecordLocal?, Object>(
        key: 'local',
        parse:
            (v) => RecordLocal.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ledger: json.valueTo<RecordLedger?, Object>(
        key: 'ledger',
        parse:
            (v) => RecordLedger.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      multi: json.valueTo<RecordMulti?, Object>(
        key: 'multi',
        parse:
            (v) => RecordMulti.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      offline: json.valueTo<RecordOffline?, Object>(
        key: 'offline',
        parse:
            (v) =>
                RecordOffline.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Record.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Record(
      name: decode.getString<String?>(1),
      pubKey: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      local: decode.messageTo<RecordLocal?>(
        3,
        (b) => RecordLocal.deserialize(b),
      ),
      ledger: decode.messageTo<RecordLedger?>(
        4,
        (b) => RecordLedger.deserialize(b),
      ),
      multi: decode.messageTo<RecordMulti?>(
        5,
        (b) => RecordMulti.deserialize(b),
      ),
      offline: decode.messageTo<RecordOffline?>(
        6,
        (b) => RecordOffline.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoKeyringV1Record;
}

/// Item is a keyring item stored in a keyring backend.
/// Local item
class RecordLocal extends CosmosProtoMessage {
  final google_protobuf_any.Any? privKey;

  const RecordLocal({this.privKey});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [privKey];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'priv_key': config.encodeMessage(privKey)};
  }

  factory RecordLocal.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return RecordLocal(
      privKey: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'priv_key',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory RecordLocal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RecordLocal(
      privKey: decode.messageTo<google_protobuf_any.Any?>(
        1,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoKeyringV1RecordLocal;
}

/// Ledger item
class RecordLedger extends CosmosProtoMessage {
  final cosmos_crypto_hd_v1_hd.BIP44Params? path;

  const RecordLedger({this.path});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [path];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'path': config.encodeMessage(path)};
  }

  factory RecordLedger.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return RecordLedger(
      path: json.valueTo<cosmos_crypto_hd_v1_hd.BIP44Params?, Object>(
        key: 'path',
        parse:
            (v) => cosmos_crypto_hd_v1_hd.BIP44Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory RecordLedger.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return RecordLedger(
      path: decode.messageTo<cosmos_crypto_hd_v1_hd.BIP44Params?>(
        1,
        (b) => cosmos_crypto_hd_v1_hd.BIP44Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoKeyringV1RecordLedger;
}

/// Multi item
class RecordMulti extends CosmosProtoMessage {
  const RecordMulti();

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

  factory RecordMulti.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return RecordMulti();
  }

  factory RecordMulti.deserialize(List<int> bytes) {
    return RecordMulti();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoKeyringV1RecordMulti;
}

/// Offline item
class RecordOffline extends CosmosProtoMessage {
  const RecordOffline();

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

  factory RecordOffline.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return RecordOffline();
  }

  factory RecordOffline.deserialize(List<int> bytes) {
    return RecordOffline();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosCryptoKeyringV1RecordOffline;
}
