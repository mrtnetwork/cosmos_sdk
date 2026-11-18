import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// Params defines the parameters for the bank module.
class Params extends CosmosProtoMessage {
  /// Deprecated: Use of SendEnabled in params is deprecated.
  /// For genesis, use the newly added send_enabled field in the genesis object.
  /// Storage, lookup, and manipulation of this information is now in the keeper.
  ///
  /// As of cosmos-sdk 0.47, this only exists for backwards compatibility of genesis files.
  final List<SendEnabled> sendEnabled;

  final bool? defaultSendEnabled;

  const Params({this.sendEnabled = const [], this.defaultSendEnabled});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "cosmos-sdk/x/bank/Params",
        ),
      ],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.bool(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [sendEnabled, defaultSendEnabled];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'send_enabled': sendEnabled.map((e) => config.encodeMessage(e)).toList(),
      'default_send_enabled': defaultSendEnabled,
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      sendEnabled:
          (json.valueEnsureAsList<dynamic>(
                'send_enabled',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<SendEnabled, Object>(
                  value: e,
                  parse:
                      (v) => SendEnabled.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      defaultSendEnabled: json.valueAsBool<bool?>(
        'default_send_enabled',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      sendEnabled:
          decode
              .getListOfBytes(1)
              .map((b) => SendEnabled.deserialize(b))
              .toList(),
      defaultSendEnabled: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1Params;
}

/// SendEnabled maps coin denom to a send_enabled status (whether a denom is
/// sendable).
class SendEnabled extends CosmosProtoMessage {
  final String? denom;

  final bool? enabled;

  const SendEnabled({this.denom, this.enabled});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1), ProtoFieldConfig.bool(2)],
    );
  }

  @override
  List<Object?> get protoValues => [denom, enabled];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'denom': denom, 'enabled': enabled};
  }

  factory SendEnabled.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SendEnabled(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      enabled: json.valueAsBool<bool?>(
        'enabled',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SendEnabled.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SendEnabled(
      denom: decode.getString<String?>(1),
      enabled: decode.getBool<bool?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1SendEnabled;
}

/// Input models transaction input.
class Input extends CosmosProtoMessage {
  final String? address;

  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const Input({this.address, this.coins = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(name: "cosmos.msg.v1.signer", value: "address"),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, coins];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': address,
      'coins': coins.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory Input.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Input(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      coins:
          (json.valueEnsureAsList<dynamic>(
                'coins',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory Input.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Input(
      address: decode.getString<String?>(1),
      coins:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1Input;
}

/// Output models transaction outputs.
class Output extends CosmosProtoMessage {
  final String? address;

  final List<cosmos_base_v1beta1_coin.Coin> coins;

  const Output({this.address, this.coins = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(name: "amino.encoding", value: "legacy_coins"),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [address, coins];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'address': address,
      'coins': coins.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory Output.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Output(
      address: json.valueAsString<String?>(
        'address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      coins:
          (json.valueEnsureAsList<dynamic>(
                'coins',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) =>
                    JsonParser.valueTo<cosmos_base_v1beta1_coin.Coin, Object>(
                      value: e,
                      parse:
                          (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                            JsonParser.valueAs(v),
                            config: config,
                          ),
                    ),
              )
              .toList(),
    );
  }

  factory Output.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Output(
      address: decode.getString<String?>(1),
      coins:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1Output;
}

/// DenomUnit represents a struct that describes a given
/// denomination unit of the basic token.
class DenomUnit extends CosmosProtoMessage {
  /// denom represents the string name of the given denom unit (e.g uatom).
  final String? denom;

  /// exponent represents power of 10 exponent that one must
  /// raise the base_denom to in order to equal the given DenomUnit's denom
  /// 1 denom = 10^exponent base_denom
  /// (e.g. with a base_denom of uatom, one can create a DenomUnit of 'atom' with
  /// exponent = 6, thus: 1 atom = 10^6 uatom).
  final int? exponent;

  /// aliases is a list of string aliases for the given denom
  final List<String> aliases;

  const DenomUnit({this.denom, this.exponent, this.aliases = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.uint32(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [denom, exponent, aliases];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'denom': denom,
      'exponent': exponent,
      'aliases': aliases.map((e) => e).toList(),
    };
  }

  factory DenomUnit.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return DenomUnit(
      denom: json.valueAsString<String?>(
        'denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      exponent: json.valueAsInt<int?>(
        'exponent',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      aliases:
          (json.valueEnsureAsList<dynamic>(
            'aliases',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory DenomUnit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DenomUnit(
      denom: decode.getString<String?>(1),
      exponent: decode.getInt<int?>(2),
      aliases: decode.getListOrEmpty<String>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1DenomUnit;
}

/// Metadata represents a struct that describes
/// a basic token.
class Metadata extends CosmosProtoMessage {
  final String? description;

  /// denom_units represents the list of DenomUnit's for a given coin
  final List<DenomUnit> denomUnits;

  /// base represents the base denom (should be the DenomUnit with exponent = 0).
  final String? base;

  /// display indicates the suggested denom that should be
  /// displayed in clients.
  final String? display;

  /// name defines the name of the token (eg: Cosmos Atom)
  final String? name;

  /// symbol is the token symbol usually shown on exchanges (eg: ATOM). This can
  /// be the same as the display.
  final String? symbol;

  /// URI to a document (on or off-chain) that contains additional information. Optional.
  final String? uri;

  /// URIHash is a sha256 hash of a document pointed by URI. It's used to verify that
  /// the document didn't change. Optional.
  final String? uriHash;

  const Metadata({
    this.description,
    this.denomUnits = const [],
    this.base,
    this.display,
    this.name,
    this.symbol,
    this.uri,
    this.uriHash,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.string(3),
        ProtoFieldConfig.string(4),
        ProtoFieldConfig.string(
          5,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.43",
            ),
          ],
        ),
        ProtoFieldConfig.string(
          6,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.43",
            ),
          ],
        ),
        ProtoFieldConfig.string(
          7,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.46",
            ),
          ],
        ),
        ProtoFieldConfig.string(
          8,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.46",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    description,
    denomUnits,
    base,
    display,
    name,
    symbol,
    uri,
    uriHash,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'description': description,
      'denom_units': denomUnits.map((e) => config.encodeMessage(e)).toList(),
      'base': base,
      'display': display,
      'name': name,
      'symbol': symbol,
      'uri': uri,
      'uri_hash': uriHash,
    };
  }

  factory Metadata.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Metadata(
      description: json.valueAsString<String?>(
        'description',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      denomUnits:
          (json.valueEnsureAsList<dynamic>(
                'denom_units',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<DenomUnit, Object>(
                  value: e,
                  parse:
                      (v) => DenomUnit.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      base: json.valueAsString<String?>(
        'base',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      display: json.valueAsString<String?>(
        'display',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      symbol: json.valueAsString<String?>(
        'symbol',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      uri: json.valueAsString<String?>(
        'uri',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      uriHash: json.valueAsString<String?>(
        'uri_hash',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Metadata.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Metadata(
      description: decode.getString<String?>(1),
      denomUnits:
          decode
              .getListOfBytes(2)
              .map((b) => DenomUnit.deserialize(b))
              .toList(),
      base: decode.getString<String?>(3),
      display: decode.getString<String?>(4),
      name: decode.getString<String?>(5),
      symbol: decode.getString<String?>(6),
      uri: decode.getString<String?>(7),
      uriHash: decode.getString<String?>(8),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBankV1beta1Metadata;
}
