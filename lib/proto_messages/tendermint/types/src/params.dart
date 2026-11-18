import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

/// ConsensusParams contains consensus critical parameters that determine the
/// validity of blocks.
class ConsensusParams extends CosmosProtoMessage {
  final BlockParams? block;

  final EvidenceParams? evidence;

  final ValidatorParams? validator;

  final VersionParams? version;

  final ABCIParams? abci;

  const ConsensusParams({
    this.block,
    this.evidence,
    this.validator,
    this.version,
    this.abci,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1),
        ProtoFieldConfig.message(2),
        ProtoFieldConfig.message(3),
        ProtoFieldConfig.message(4),
        ProtoFieldConfig.message(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [block, evidence, validator, version, abci];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'block': config.encodeMessage(block),
      'evidence': config.encodeMessage(evidence),
      'validator': config.encodeMessage(validator),
      'version': config.encodeMessage(version),
      'abci': config.encodeMessage(abci),
    };
  }

  factory ConsensusParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ConsensusParams(
      block: json.valueTo<BlockParams?, Object>(
        key: 'block',
        parse:
            (v) => BlockParams.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      evidence: json.valueTo<EvidenceParams?, Object>(
        key: 'evidence',
        parse:
            (v) =>
                EvidenceParams.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      validator: json.valueTo<ValidatorParams?, Object>(
        key: 'validator',
        parse:
            (v) =>
                ValidatorParams.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      version: json.valueTo<VersionParams?, Object>(
        key: 'version',
        parse:
            (v) =>
                VersionParams.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      abci: json.valueTo<ABCIParams?, Object>(
        key: 'abci',
        parse:
            (v) => ABCIParams.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ConsensusParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ConsensusParams(
      block: decode.messageTo<BlockParams?>(
        1,
        (b) => BlockParams.deserialize(b),
      ),
      evidence: decode.messageTo<EvidenceParams?>(
        2,
        (b) => EvidenceParams.deserialize(b),
      ),
      validator: decode.messageTo<ValidatorParams?>(
        3,
        (b) => ValidatorParams.deserialize(b),
      ),
      version: decode.messageTo<VersionParams?>(
        4,
        (b) => VersionParams.deserialize(b),
      ),
      abci: decode.messageTo<ABCIParams?>(5, (b) => ABCIParams.deserialize(b)),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesConsensusParams;
}

/// BlockParams contains limits on the block size.
class BlockParams extends CosmosProtoMessage {
  /// Max block size, in bytes.
  /// Note: must be greater than 0
  final BigInt? maxBytes;

  /// Max gas per block.
  /// Note: must be greater or equal to -1
  final BigInt? maxGas;

  const BlockParams({this.maxBytes, this.maxGas});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.int64(1), ProtoFieldConfig.int64(2)],
    );
  }

  @override
  List<Object?> get protoValues => [maxBytes, maxGas];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'max_bytes': config.encodeBigint(maxBytes),
      'max_gas': config.encodeBigint(maxGas),
    };
  }

  factory BlockParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BlockParams(
      maxBytes: json.valueAsBigInt<BigInt?>(
        'max_bytes',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maxGas: json.valueAsBigInt<BigInt?>(
        'max_gas',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BlockParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BlockParams(
      maxBytes: decode.getBigInt<BigInt?>(1),
      maxGas: decode.getBigInt<BigInt?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesBlockParams;
}

/// was TimeIotaMs see https://github.com/tendermint/tendermint/pull/5792
/// EvidenceParams determine how we handle evidence of malfeasance.
class EvidenceParams extends CosmosProtoMessage {
  /// Max age of evidence, in blocks.
  ///
  /// The basic formula for calculating this is: MaxAgeDuration / {average block
  /// time}.
  final BigInt? maxAgeNumBlocks;

  /// Max age of evidence, in time.
  ///
  /// It should correspond with an app's "unbonding period" or other similar
  /// mechanism for handling [Nothing-At-Stake
  /// attacks](https://github.com/ethereum/wiki/wiki/Proof-of-Stake-FAQ#what-is-the-nothing-at-stake-problem-and-how-can-it-be-fixed).
  final google_protobuf_duration.Duration? maxAgeDuration;

  /// This sets the maximum size of total evidence in bytes that can be committed in a single block.
  /// and should fall comfortably under the max block bytes.
  /// Default is 1048576 or 1MB
  final BigInt? maxBytes;

  const EvidenceParams({
    this.maxAgeNumBlocks,
    this.maxAgeDuration,
    this.maxBytes,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.int64(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [maxAgeNumBlocks, maxAgeDuration, maxBytes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'max_age_num_blocks': config.encodeBigint(maxAgeNumBlocks),
      'max_age_duration': maxAgeDuration?.encodeString(asNanos: true),
      'max_bytes': config.encodeBigint(maxBytes),
    };
  }

  factory EvidenceParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return EvidenceParams(
      maxAgeNumBlocks: json.valueAsBigInt<BigInt?>(
        'max_age_num_blocks',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maxAgeDuration: json.valueTo<google_protobuf_duration.Duration?, Object>(
        key: 'max_age_duration',
        parse:
            (v) => google_protobuf_duration.Duration.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      maxBytes: json.valueAsBigInt<BigInt?>(
        'max_bytes',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory EvidenceParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return EvidenceParams(
      maxAgeNumBlocks: decode.getBigInt<BigInt?>(1),
      maxAgeDuration: decode.messageTo<google_protobuf_duration.Duration?>(
        2,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      maxBytes: decode.getBigInt<BigInt?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesEvidenceParams;
}

/// ValidatorParams restrict the public key types validators can use.
/// NOTE: uses ABCI pubkey naming, not Amino names.
class ValidatorParams extends CosmosProtoMessage {
  final List<String> pubKeyTypes;

  const ValidatorParams({this.pubKeyTypes = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.string,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [pubKeyTypes];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pub_key_types': pubKeyTypes.map((e) => e).toList()};
  }

  factory ValidatorParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ValidatorParams(
      pubKeyTypes:
          (json.valueEnsureAsList<dynamic>(
            'pub_key_types',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
    );
  }

  factory ValidatorParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ValidatorParams(pubKeyTypes: decode.getListOrEmpty<String>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesValidatorParams;
}

/// VersionParams contains the ABCI application version.
class VersionParams extends CosmosProtoMessage {
  final BigInt? app;

  const VersionParams({this.app});

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
  List<Object?> get protoValues => [app];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'app': config.encodeBigint(app)};
  }

  factory VersionParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return VersionParams(
      app: json.valueAsBigInt<BigInt?>(
        'app',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory VersionParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return VersionParams(app: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesVersionParams;
}

/// ABCIParams configure functionality specific to the Application Blockchain Interface.
class ABCIParams extends CosmosProtoMessage {
  /// vote_extensions_enable_height configures the first height during which
  /// vote extensions will be enabled. During this specified height, and for all
  /// subsequent heights, precommit messages that do not contain valid extension data
  /// will be considered invalid. Prior to this height, vote extensions will not
  /// be used or accepted by validators on the network.
  ///
  /// Once enabled, vote extensions will be created by the application in ExtendVote,
  /// passed to the application for validation in VerifyVoteExtension and given
  /// to the application to use when proposing a block during PrepareProposal.
  final BigInt? voteExtensionsEnableHeight;

  const ABCIParams({this.voteExtensionsEnableHeight});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.int64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [voteExtensionsEnableHeight];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'vote_extensions_enable_height': config.encodeBigint(
        voteExtensionsEnableHeight,
      ),
    };
  }

  factory ABCIParams.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return ABCIParams(
      voteExtensionsEnableHeight: json.valueAsBigInt<BigInt?>(
        'vote_extensions_enable_height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory ABCIParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return ABCIParams(voteExtensionsEnableHeight: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesABCIParams;
}
