import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/cosmos/staking/v1beta1/src/staking.dart"
    as cosmos_staking_v1beta1_staking;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// Params defines the Register module parameters
class Params extends CosmosProtoMessage {
  final String? bondDenom;

  final google_protobuf_duration.Duration? unbondingThreasholdTime;

  final google_protobuf_duration.Duration? unbondingCompletionTime;

  final int? maxEntries;

  final bool? resourceNodeRegEnabled;

  final cosmos_base_v1beta1_coin.Coin? resourceNodeMinDeposit;

  final google_protobuf_duration.Duration? votingPeriod;

  const Params({
    this.bondDenom,
    this.unbondingThreasholdTime,
    this.unbondingCompletionTime,
    this.maxEntries,
    this.resourceNodeRegEnabled,
    this.resourceNodeMinDeposit,
    this.votingPeriod,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionString(
          name: "amino.name",
          value: "stratos/x/register/Params",
        ),
      ],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint32(4, options: const []),
        ProtoFieldConfig.bool(5, options: const []),
        ProtoFieldConfig.message(
          6,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          7,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    bondDenom,
    unbondingThreasholdTime,
    unbondingCompletionTime,
    maxEntries,
    resourceNodeRegEnabled,
    resourceNodeMinDeposit,
    votingPeriod,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'bond_denom': bondDenom,
      'unbonding_threashold_time': unbondingThreasholdTime?.encodeString(
        asNanos: true,
      ),
      'unbonding_completion_time': unbondingCompletionTime?.encodeString(
        asNanos: true,
      ),
      'max_entries': maxEntries,
      'resource_node_reg_enabled': resourceNodeRegEnabled,
      'resource_node_min_deposit': config.encodeMessage(resourceNodeMinDeposit),
      'voting_period': votingPeriod?.encodeString(asNanos: true),
    };
  }

  factory Params.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Params(
      bondDenom: json.valueAsString<String?>(
        'bond_denom',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      unbondingThreasholdTime: json
          .valueTo<google_protobuf_duration.Duration?, Object>(
            key: 'unbonding_threashold_time',
            parse:
                (v) => google_protobuf_duration.Duration.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      unbondingCompletionTime: json
          .valueTo<google_protobuf_duration.Duration?, Object>(
            key: 'unbonding_completion_time',
            parse:
                (v) => google_protobuf_duration.Duration.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      maxEntries: json.valueAsInt<int?>(
        'max_entries',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      resourceNodeRegEnabled: json.valueAsBool<bool?>(
        'resource_node_reg_enabled',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      resourceNodeMinDeposit: json
          .valueTo<cosmos_base_v1beta1_coin.Coin?, Object>(
            key: 'resource_node_min_deposit',
            parse:
                (v) => cosmos_base_v1beta1_coin.Coin.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
      votingPeriod: json.valueTo<google_protobuf_duration.Duration?, Object>(
        key: 'voting_period',
        parse:
            (v) => google_protobuf_duration.Duration.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      bondDenom: decode.getString<String?>(1),
      unbondingThreasholdTime: decode
          .messageTo<google_protobuf_duration.Duration?>(
            2,
            (b) => google_protobuf_duration.Duration.deserialize(b),
          ),
      unbondingCompletionTime: decode
          .messageTo<google_protobuf_duration.Duration?>(
            3,
            (b) => google_protobuf_duration.Duration.deserialize(b),
          ),
      maxEntries: decode.getInt<int?>(4),
      resourceNodeRegEnabled: decode.getBool<bool?>(5),
      resourceNodeMinDeposit: decode.messageTo<cosmos_base_v1beta1_coin.Coin?>(
        6,
        (b) => cosmos_base_v1beta1_coin.Coin.deserialize(b),
      ),
      votingPeriod: decode.messageTo<google_protobuf_duration.Duration?>(
        7,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1Params;
}

class ResourceNode extends CosmosProtoMessage {
  final String? networkAddress;

  final google_protobuf_any.Any? pubkey;

  final bool? suspend;

  final cosmos_staking_v1beta1_staking.BondStatus? status;

  final String? tokens;

  final String? ownerAddress;

  final Description? description;

  final google_protobuf_timestamp.Timestamp? creationTime;

  final int? nodeType;

  final String? effectiveTokens;

  final String? beneficiaryAddress;

  const ResourceNode({
    this.networkAddress,
    this.pubkey,
    this.suspend,
    this.status,
    this.tokens,
    this.ownerAddress,
    this.description,
    this.creationTime,
    this.nodeType,
    this.effectiveTokens,
    this.beneficiaryAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.bool(3, options: const []),
        ProtoFieldConfig.enumType(4, options: const []),
        ProtoFieldConfig.string(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.message(
          8,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.uint32(9, options: const []),
        ProtoFieldConfig.string(
          10,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(11, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    networkAddress,
    pubkey,
    suspend,
    status,
    tokens,
    ownerAddress,
    description,
    creationTime,
    nodeType,
    effectiveTokens,
    beneficiaryAddress,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'network_address': networkAddress,
      'pubkey': config.encodeMessage(pubkey),
      'suspend': suspend,
      'status': config.encodeEnum(status),
      'tokens': tokens,
      'owner_address': ownerAddress,
      'description': config.encodeMessage(description),
      'creation_time': creationTime?.toRfc3339(),
      'node_type': nodeType,
      'effective_tokens': effectiveTokens,
      'beneficiary_address': beneficiaryAddress,
    };
  }

  factory ResourceNode.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ResourceNode(
      networkAddress: json.valueAsString<String?>(
        'network_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pubkey: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'pubkey',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      suspend: json.valueAsBool<bool?>(
        'suspend',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      status: json.valueTo<cosmos_staking_v1beta1_staking.BondStatus?, Object?>(
        key: 'status',
        parse: (v) => cosmos_staking_v1beta1_staking.BondStatus.from(v),
      ),
      tokens: json.valueAsString<String?>(
        'tokens',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ownerAddress: json.valueAsString<String?>(
        'owner_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueTo<Description?, Object>(
        key: 'description',
        parse:
            (v) => Description.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      creationTime: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'creation_time',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      nodeType: json.valueAsInt<int?>(
        'node_type',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      effectiveTokens: json.valueAsString<String?>(
        'effective_tokens',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      beneficiaryAddress: json.valueAsString<String?>(
        'beneficiary_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ResourceNode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ResourceNode(
      networkAddress: decode.getString<String?>(1),
      pubkey: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      suspend: decode.getBool<bool?>(3),
      status: decode.getEnum<cosmos_staking_v1beta1_staking.BondStatus?>(
        4,
        cosmos_staking_v1beta1_staking.BondStatus.values,
      ),
      tokens: decode.getString<String?>(5),
      ownerAddress: decode.getString<String?>(6),
      description: decode.messageTo<Description?>(
        7,
        (b) => Description.deserialize(b),
      ),
      creationTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        8,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      nodeType: decode.getInt<int?>(9),
      effectiveTokens: decode.getString<String?>(10),
      beneficiaryAddress: decode.getString<String?>(11),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1ResourceNode;
}

class MetaNode extends CosmosProtoMessage {
  final String? networkAddress;

  final google_protobuf_any.Any? pubkey;

  final bool? suspend;

  final cosmos_staking_v1beta1_staking.BondStatus? status;

  final String? tokens;

  final String? ownerAddress;

  final Description? description;

  final google_protobuf_timestamp.Timestamp? creationTime;

  final String? beneficiaryAddress;

  const MetaNode({
    this.networkAddress,
    this.pubkey,
    this.suspend,
    this.status,
    this.tokens,
    this.ownerAddress,
    this.description,
    this.creationTime,
    this.beneficiaryAddress,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.bool(3, options: const []),
        ProtoFieldConfig.enumType(4, options: const []),
        ProtoFieldConfig.string(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.message(7, options: const []),
        ProtoFieldConfig.message(
          8,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(9, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    networkAddress,
    pubkey,
    suspend,
    status,
    tokens,
    ownerAddress,
    description,
    creationTime,
    beneficiaryAddress,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'network_address': networkAddress,
      'pubkey': config.encodeMessage(pubkey),
      'suspend': suspend,
      'status': config.encodeEnum(status),
      'tokens': tokens,
      'owner_address': ownerAddress,
      'description': config.encodeMessage(description),
      'creation_time': creationTime?.toRfc3339(),
      'beneficiary_address': beneficiaryAddress,
    };
  }

  factory MetaNode.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return MetaNode(
      networkAddress: json.valueAsString<String?>(
        'network_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pubkey: json.valueTo<google_protobuf_any.Any?, Object>(
        key: 'pubkey',
        parse:
            (v) => google_protobuf_any.Any.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      suspend: json.valueAsBool<bool?>(
        'suspend',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      status: json.valueTo<cosmos_staking_v1beta1_staking.BondStatus?, Object?>(
        key: 'status',
        parse: (v) => cosmos_staking_v1beta1_staking.BondStatus.from(v),
      ),
      tokens: json.valueAsString<String?>(
        'tokens',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      ownerAddress: json.valueAsString<String?>(
        'owner_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      description: json.valueTo<Description?, Object>(
        key: 'description',
        parse:
            (v) => Description.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      creationTime: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'creation_time',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      beneficiaryAddress: json.valueAsString<String?>(
        'beneficiary_address',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory MetaNode.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return MetaNode(
      networkAddress: decode.getString<String?>(1),
      pubkey: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
      suspend: decode.getBool<bool?>(3),
      status: decode.getEnum<cosmos_staking_v1beta1_staking.BondStatus?>(
        4,
        cosmos_staking_v1beta1_staking.BondStatus.values,
      ),
      tokens: decode.getString<String?>(5),
      ownerAddress: decode.getString<String?>(6),
      description: decode.messageTo<Description?>(
        7,
        (b) => Description.deserialize(b),
      ),
      creationTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        8,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      beneficiaryAddress: decode.getString<String?>(9),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1MetaNode;
}

class Description extends CosmosProtoMessage {
  final String? moniker;

  final String? identity;

  final String? website;

  final String? securityContact;

  final String? details;

  const Description({
    this.moniker,
    this.identity,
    this.website,
    this.securityContact,
    this.details,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    moniker,
    identity,
    website,
    securityContact,
    details,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'moniker': moniker,
      'identity': identity,
      'website': website,
      'security_contact': securityContact,
      'details': details,
    };
  }

  factory Description.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Description(
      moniker: json.valueAsString<String?>(
        'moniker',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      identity: json.valueAsString<String?>(
        'identity',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      website: json.valueAsString<String?>(
        'website',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      securityContact: json.valueAsString<String?>(
        'security_contact',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      details: json.valueAsString<String?>(
        'details',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Description.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Description(
      moniker: decode.getString<String?>(1),
      identity: decode.getString<String?>(2),
      website: decode.getString<String?>(3),
      securityContact: decode.getString<String?>(4),
      details: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.stratosRegisterV1Description;
}
