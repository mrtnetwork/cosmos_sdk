import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;

/// this line is used by starport scaffolding # genesis/proto/import
class State extends CosmosProtoMessage {
  final Account? account;

  final bool? burn;

  final List<cosmos_base_v1beta1_coin.DecCoin> remains;

  const State({this.account, this.burn, this.remains = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.bool(2),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [account, burn, remains];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'account': config.encodeMessage(account),
      'burn': burn,
      'remains': remains.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory State.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return State(
      account: json.valueTo<Account?, Object>(
        key: 'account',
        parse: (v) => Account.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      burn: json.valueAsBool<bool?>(
        'burn',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      remains:
          (json.valueEnsureAsList<dynamic>(
                'remains',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.DecCoin,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => cosmos_base_v1beta1_coin.DecCoin.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory State.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return State(
      account: decode.messageTo<Account?>(1, (b) => Account.deserialize(b)),
      burn: decode.getBool<bool?>(2),
      remains:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.DecCoin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfedistributorState;
}

class SubDistributor extends CosmosProtoMessage {
  final String? name;

  final List<Account> sources;

  final Destinations? destinations;

  const SubDistributor({this.name, this.sources = const [], this.destinations});

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
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [name, sources, destinations];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'name': name,
      'sources': sources.map((e) => config.encodeMessage(e)).toList(),
      'destinations': config.encodeMessage(destinations),
    };
  }

  factory SubDistributor.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SubDistributor(
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      sources:
          (json.valueEnsureAsList<dynamic>(
                'sources',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<Account, Object>(
                  value: e,
                  parse:
                      (v) => Account.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      destinations: json.valueTo<Destinations?, Object>(
        key: 'destinations',
        parse:
            (v) => Destinations.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SubDistributor.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SubDistributor(
      name: decode.getString<String?>(1),
      sources:
          decode.getListOfBytes(2).map((b) => Account.deserialize(b)).toList(),
      destinations: decode.messageTo<Destinations?>(
        3,
        (b) => Destinations.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorSubDistributor;
}

class Destinations extends CosmosProtoMessage {
  final Account? primaryShare;

  final String? burnShare;

  final List<DestinationShare> shares;

  const Destinations({
    this.primaryShare,
    this.burnShare,
    this.shares = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [primaryShare, burnShare, shares];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'primary_share': config.encodeMessage(primaryShare),
      'burn_share': burnShare,
      'shares': shares.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory Destinations.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Destinations(
      primaryShare: json.valueTo<Account?, Object>(
        key: 'primary_share',
        parse: (v) => Account.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      burnShare: json.valueAsString<String?>(
        'burn_share',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      shares:
          (json.valueEnsureAsList<dynamic>(
                'shares',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<DestinationShare, Object>(
                  value: e,
                  parse:
                      (v) => DestinationShare.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory Destinations.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Destinations(
      primaryShare: decode.messageTo<Account?>(
        1,
        (b) => Account.deserialize(b),
      ),
      burnShare: decode.getString<String?>(2),
      shares:
          decode
              .getListOfBytes(3)
              .map((b) => DestinationShare.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfedistributorDestinations;
}

class DestinationShare extends CosmosProtoMessage {
  final String? name;

  final String? share;

  final Account? destination;

  const DestinationShare({this.name, this.share, this.destination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [name, share, destination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'name': name,
      'share': share,
      'destination': config.encodeMessage(destination),
    };
  }

  factory DestinationShare.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return DestinationShare(
      name: json.valueAsString<String?>(
        'name',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      share: json.valueAsString<String?>(
        'share',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      destination: json.valueTo<Account?, Object>(
        key: 'destination',
        parse: (v) => Account.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory DestinationShare.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DestinationShare(
      name: decode.getString<String?>(1),
      share: decode.getString<String?>(2),
      destination: decode.messageTo<Account?>(3, (b) => Account.deserialize(b)),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl
          .chain4energyC4echainCfedistributorDestinationShare;
}

class Account extends CosmosProtoMessage {
  final String? id;

  final String? type;

  const Account({this.id, this.type});

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
  List<Object?> get protoValues => [id, type];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'id': id, 'type': type};
  }

  factory Account.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Account(
      id: json.valueAsString<String?>(
        'id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      type: json.valueAsString<String?>(
        'type',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Account.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Account(
      id: decode.getString<String?>(1),
      type: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.chain4energyC4echainCfedistributorAccount;
}
