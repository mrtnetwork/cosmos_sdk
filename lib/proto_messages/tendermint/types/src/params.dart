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
  Map<String, dynamic> toJson() {
    return {
      'block': block?.toJson(),
      'evidence': evidence?.toJson(),
      'validator': validator?.toJson(),
      'version': version?.toJson(),
      'abci': abci?.toJson(),
    };
  }

  factory ConsensusParams.fromJson(Map<String, dynamic> json) {
    return ConsensusParams(
      block: json.valueTo<BlockParams?, Map<String, dynamic>>(
        key: 'block',
        parse: (v) => BlockParams.fromJson(v),
        acceptCamelCase: true,
      ),
      evidence: json.valueTo<EvidenceParams?, Map<String, dynamic>>(
        key: 'evidence',
        parse: (v) => EvidenceParams.fromJson(v),
        acceptCamelCase: true,
      ),
      validator: json.valueTo<ValidatorParams?, Map<String, dynamic>>(
        key: 'validator',
        parse: (v) => ValidatorParams.fromJson(v),
        acceptCamelCase: true,
      ),
      version: json.valueTo<VersionParams?, Map<String, dynamic>>(
        key: 'version',
        parse: (v) => VersionParams.fromJson(v),
        acceptCamelCase: true,
      ),
      abci: json.valueTo<ABCIParams?, Map<String, dynamic>>(
        key: 'abci',
        parse: (v) => ABCIParams.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'max_bytes': maxBytes?.toString(), 'max_gas': maxGas?.toString()};
  }

  factory BlockParams.fromJson(Map<String, dynamic> json) {
    return BlockParams(
      maxBytes: json.valueAsBigInt<BigInt?>('max_bytes', acceptCamelCase: true),
      maxGas: json.valueAsBigInt<BigInt?>('max_gas', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'max_age_num_blocks': maxAgeNumBlocks?.toString(),
      'max_age_duration': maxAgeDuration?.encodeString(asNanos: true),
      'max_bytes': maxBytes?.toString(),
    };
  }

  factory EvidenceParams.fromJson(Map<String, dynamic> json) {
    return EvidenceParams(
      maxAgeNumBlocks: json.valueAsBigInt<BigInt?>(
        'max_age_num_blocks',
        acceptCamelCase: true,
      ),
      maxAgeDuration: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'max_age_duration',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      maxBytes: json.valueAsBigInt<BigInt?>('max_bytes', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {'pub_key_types': pubKeyTypes.map((e) => e).toList()};
  }

  factory ValidatorParams.fromJson(Map<String, dynamic> json) {
    return ValidatorParams(
      pubKeyTypes:
          (json.valueEnsureAsList<dynamic>(
            'pub_key_types',
            acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {'app': app?.toString()};
  }

  factory VersionParams.fromJson(Map<String, dynamic> json) {
    return VersionParams(
      app: json.valueAsBigInt<BigInt?>('app', acceptCamelCase: true),
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
  Map<String, dynamic> toJson() {
    return {
      'vote_extensions_enable_height': voteExtensionsEnableHeight?.toString(),
    };
  }

  factory ABCIParams.fromJson(Map<String, dynamic> json) {
    return ABCIParams(
      voteExtensionsEnableHeight: json.valueAsBigInt<BigInt?>(
        'vote_extensions_enable_height',
        acceptCamelCase: true,
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
