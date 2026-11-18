import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/tendermint/version/src/types.dart"
    as tendermint_version_types;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/tendermint/types/src/validator.dart"
    as tendermint_types_validator;

/// SignedMsgType is a type of signed message in the consensus.
enum SignedMsgType implements ProtoEnumVariant {
  signedMsgTypeUnknown(0, 'SIGNED_MSG_TYPE_UNKNOWN'),

  /// Votes
  signedMsgTypePrevote(1, 'SIGNED_MSG_TYPE_PREVOTE'),
  signedMsgTypePrecommit(2, 'SIGNED_MSG_TYPE_PRECOMMIT'),

  /// Proposals
  signedMsgTypeProposal(32, 'SIGNED_MSG_TYPE_PROPOSAL');

  const SignedMsgType(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static SignedMsgType fromValue(int? value) {
    value ??= 0;
    return SignedMsgType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching SignedMsgType found for the given value. $value",
                details: {"name": "SignedMsgType", "value": value?.toString()},
              ),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static SignedMsgType from(Object? value) {
    value ??= 0;
    return SignedMsgType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw BuError(
                DefaultErrorType.notFound,
                "No matching SignedMsgType found for the given value. $value",
                details: {"name": "SignedMsgType", "value": value?.toString()},
              ),
    );
  }
}

/// PartsetHeader
class PartSetHeader extends CosmosProtoMessage {
  final int? total;

  final BuBytes? hash;

  PartSetHeader({this.total, List<int>? hash}) : hash = hash?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.uint32(1), ProtoFieldConfig.bytes(2)],
    );
  }

  @override
  List<Object?> get protoValues => [total, hash];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'total': total, 'hash': config.encodeBinary(hash)};
  }

  factory PartSetHeader.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return PartSetHeader(
      total: json.valueAsInt<int?>(
        'total',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      hash: config.decodeBinary<List<int>?>(
        json.valueAs('hash', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory PartSetHeader.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return PartSetHeader(
      total: decode.getInt<int?>(1),
      hash: decode.getBytes<List<int>?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesPartSetHeader;
}

/// BlockID
class BlockID extends CosmosProtoMessage {
  final BuBytes? hash;

  final PartSetHeader? partSetHeader;

  BlockID({List<int>? hash, this.partSetHeader})
    : hash = hash?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [hash, partSetHeader];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'hash': config.encodeBinary(hash),
      'part_set_header': config.encodeMessage(partSetHeader),
    };
  }

  factory BlockID.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return BlockID(
      hash: config.decodeBinary<List<int>?>(
        json.valueAs('hash', normalizeKeyLookup: config.normalizeKeys),
      ),
      partSetHeader: json.valueTo<PartSetHeader?, Object>(
        key: 'part_set_header',
        parse:
            (v) =>
                PartSetHeader.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory BlockID.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return BlockID(
      hash: decode.getBytes<List<int>?>(1),
      partSetHeader: decode.messageTo<PartSetHeader?>(
        2,
        (b) => PartSetHeader.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesBlockID;
}

/// --------------------------------
/// Header defines the structure of a block header.
class Header extends CosmosProtoMessage {
  /// basic block info
  final tendermint_version_types.Consensus? version;

  final String? chainId;

  final BigInt? height;

  final google_protobuf_timestamp.Timestamp? time;

  /// prev block info
  final BlockID? lastBlockId;

  /// hashes of block data
  final BuBytes? lastCommitHash;

  /// commit from validators from the last block
  final BuBytes? dataHash;

  /// transactions
  /// hashes from the app output from the prev block
  final BuBytes? validatorsHash;

  /// validators for the current block
  final BuBytes? nextValidatorsHash;

  /// validators for the next block
  final BuBytes? consensusHash;

  /// consensus params for current block
  final BuBytes? appHash;

  /// state after txs from the previous block
  final BuBytes? lastResultsHash;

  /// root hash of all results from the txs from the previous block
  /// consensus info
  final BuBytes? evidenceHash;

  /// evidence included in the block
  final BuBytes? proposerAddress;

  Header({
    this.version,
    this.chainId,
    this.height,
    this.time,
    this.lastBlockId,
    List<int>? lastCommitHash,
    List<int>? dataHash,
    List<int>? validatorsHash,
    List<int>? nextValidatorsHash,
    List<int>? consensusHash,
    List<int>? appHash,
    List<int>? lastResultsHash,
    List<int>? evidenceHash,
    List<int>? proposerAddress,
  }) : lastCommitHash = lastCommitHash?.asImmutableBytes,
       dataHash = dataHash?.asImmutableBytes,
       validatorsHash = validatorsHash?.asImmutableBytes,
       nextValidatorsHash = nextValidatorsHash?.asImmutableBytes,
       consensusHash = consensusHash?.asImmutableBytes,
       appHash = appHash?.asImmutableBytes,
       lastResultsHash = lastResultsHash?.asImmutableBytes,
       evidenceHash = evidenceHash?.asImmutableBytes,
       proposerAddress = proposerAddress?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.bytes(6),
        ProtoFieldConfig.bytes(7),
        ProtoFieldConfig.bytes(8),
        ProtoFieldConfig.bytes(9),
        ProtoFieldConfig.bytes(10),
        ProtoFieldConfig.bytes(11),
        ProtoFieldConfig.bytes(12),
        ProtoFieldConfig.bytes(13),
        ProtoFieldConfig.bytes(14),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    version,
    chainId,
    height,
    time,
    lastBlockId,
    lastCommitHash,
    dataHash,
    validatorsHash,
    nextValidatorsHash,
    consensusHash,
    appHash,
    lastResultsHash,
    evidenceHash,
    proposerAddress,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'version': config.encodeMessage(version),
      'chain_id': chainId,
      'height': config.encodeBigint(height),
      'time': time?.toRfc3339(),
      'last_block_id': config.encodeMessage(lastBlockId),
      'last_commit_hash': config.encodeBinary(lastCommitHash),
      'data_hash': config.encodeBinary(dataHash),
      'validators_hash': config.encodeBinary(validatorsHash),
      'next_validators_hash': config.encodeBinary(nextValidatorsHash),
      'consensus_hash': config.encodeBinary(consensusHash),
      'app_hash': config.encodeBinary(appHash),
      'last_results_hash': config.encodeBinary(lastResultsHash),
      'evidence_hash': config.encodeBinary(evidenceHash),
      'proposer_address': config.encodeBinary(proposerAddress),
    };
  }

  factory Header.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Header(
      version: json.valueTo<tendermint_version_types.Consensus?, Object>(
        key: 'version',
        parse:
            (v) => tendermint_version_types.Consensus.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      chainId: json.valueAsString<String?>(
        'chain_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      time: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'time',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastBlockId: json.valueTo<BlockID?, Object>(
        key: 'last_block_id',
        parse: (v) => BlockID.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastCommitHash: config.decodeBinary<List<int>?>(
        json.valueAs(
          'last_commit_hash',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      dataHash: config.decodeBinary<List<int>?>(
        json.valueAs('data_hash', normalizeKeyLookup: config.normalizeKeys),
      ),
      validatorsHash: config.decodeBinary<List<int>?>(
        json.valueAs(
          'validators_hash',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      nextValidatorsHash: config.decodeBinary<List<int>?>(
        json.valueAs(
          'next_validators_hash',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      consensusHash: config.decodeBinary<List<int>?>(
        json.valueAs(
          'consensus_hash',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      appHash: config.decodeBinary<List<int>?>(
        json.valueAs('app_hash', normalizeKeyLookup: config.normalizeKeys),
      ),
      lastResultsHash: config.decodeBinary<List<int>?>(
        json.valueAs(
          'last_results_hash',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      evidenceHash: config.decodeBinary<List<int>?>(
        json.valueAs('evidence_hash', normalizeKeyLookup: config.normalizeKeys),
      ),
      proposerAddress: config.decodeBinary<List<int>?>(
        json.valueAs(
          'proposer_address',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory Header.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Header(
      version: decode.messageTo<tendermint_version_types.Consensus?>(
        1,
        (b) => tendermint_version_types.Consensus.deserialize(b),
      ),
      chainId: decode.getString<String?>(2),
      height: decode.getBigInt<BigInt?>(3),
      time: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        4,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      lastBlockId: decode.messageTo<BlockID?>(5, (b) => BlockID.deserialize(b)),
      lastCommitHash: decode.getBytes<List<int>?>(6),
      dataHash: decode.getBytes<List<int>?>(7),
      validatorsHash: decode.getBytes<List<int>?>(8),
      nextValidatorsHash: decode.getBytes<List<int>?>(9),
      consensusHash: decode.getBytes<List<int>?>(10),
      appHash: decode.getBytes<List<int>?>(11),
      lastResultsHash: decode.getBytes<List<int>?>(12),
      evidenceHash: decode.getBytes<List<int>?>(13),
      proposerAddress: decode.getBytes<List<int>?>(14),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesHeader;
}

/// original proposer of the block
/// Data contains the set of transactions included in the block
class Data extends CosmosProtoMessage {
  /// Txs that will be applied by state @ block.Height+1.
  /// NOTE: not all txs here are valid.  We're just agreeing on the order first.
  /// This means that block.AppHash does not include these txs.
  final List<BuBytes> txs;

  Data({List<List<int>> txs = const []})
    : txs = txs.map((e) => e.asImmutableBytes).toImutableList;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.bytes,
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [txs];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'txs': txs.map((e) => config.encodeBinary(e)).toList()};
  }

  factory Data.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Data(
      txs:
          (json.valueEnsureAsList<dynamic>(
            'txs',
            normalizeKeyLookup: config.normalizeKeys,
            onMissing: () => [],
          )).map((e) => config.decodeBinary<List<int>>(e)).toList(),
    );
  }

  factory Data.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Data(txs: decode.getListOfBytes(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesData;
}

/// Vote represents a prevote or precommit vote from validators for
/// consensus.
class Vote extends CosmosProtoMessage {
  final SignedMsgType? type;

  final BigInt? height;

  final int? round;

  final BlockID? blockId;

  /// zero if vote is nil.
  final google_protobuf_timestamp.Timestamp? timestamp;

  final BuBytes? validatorAddress;

  final int? validatorIndex;

  /// Vote signature by the validator if they participated in consensus for the
  /// associated block.
  final BuBytes? signature;

  /// Vote extension provided by the application. Only valid for precommit
  /// messages.
  final BuBytes? extension_;

  /// Vote extension signature by the validator if they participated in
  /// consensus for the associated block.
  /// Only valid for precommit messages.
  final BuBytes? extensionSignature;

  Vote({
    this.type,
    this.height,
    this.round,
    this.blockId,
    this.timestamp,
    List<int>? validatorAddress,
    this.validatorIndex,
    List<int>? signature,
    List<int>? extension_,
    List<int>? extensionSignature,
  }) : validatorAddress = validatorAddress?.asImmutableBytes,
       signature = signature?.asImmutableBytes,
       extension_ = extension_?.asImmutableBytes,
       extensionSignature = extensionSignature?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.int64(2),
        ProtoFieldConfig.int32(3),
        ProtoFieldConfig.message(4, options: const []),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.bytes(6),
        ProtoFieldConfig.int32(7),
        ProtoFieldConfig.bytes(8),
        ProtoFieldConfig.bytes(9),
        ProtoFieldConfig.bytes(10),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    type,
    height,
    round,
    blockId,
    timestamp,
    validatorAddress,
    validatorIndex,
    signature,
    extension_,
    extensionSignature,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'type': config.encodeEnum(type),
      'height': config.encodeBigint(height),
      'round': round,
      'block_id': config.encodeMessage(blockId),
      'timestamp': timestamp?.toRfc3339(),
      'validator_address': config.encodeBinary(validatorAddress),
      'validator_index': validatorIndex,
      'signature': config.encodeBinary(signature),
      'extension': config.encodeBinary(extension_),
      'extension_signature': config.encodeBinary(extensionSignature),
    };
  }

  factory Vote.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Vote(
      type: json.valueTo<SignedMsgType?, Object?>(
        key: 'type',
        parse: (v) => SignedMsgType.from(v),
      ),
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      round: json.valueAsInt<int?>(
        'round',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockId: json.valueTo<BlockID?, Object>(
        key: 'block_id',
        parse: (v) => BlockID.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      timestamp: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'timestamp',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      validatorAddress: config.decodeBinary<List<int>?>(
        json.valueAs(
          'validator_address',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      validatorIndex: json.valueAsInt<int?>(
        'validator_index',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signature: config.decodeBinary<List<int>?>(
        json.valueAs('signature', normalizeKeyLookup: config.normalizeKeys),
      ),
      extension_: config.decodeBinary<List<int>?>(
        json.valueAs('extension', normalizeKeyLookup: config.normalizeKeys),
      ),
      extensionSignature: config.decodeBinary<List<int>?>(
        json.valueAs(
          'extension_signature',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
    );
  }

  factory Vote.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Vote(
      type: decode.getEnum<SignedMsgType?>(1, SignedMsgType.values),
      height: decode.getBigInt<BigInt?>(2),
      round: decode.getInt<int?>(3),
      blockId: decode.messageTo<BlockID?>(4, (b) => BlockID.deserialize(b)),
      timestamp: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        5,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      validatorAddress: decode.getBytes<List<int>?>(6),
      validatorIndex: decode.getInt<int?>(7),
      signature: decode.getBytes<List<int>?>(8),
      extension_: decode.getBytes<List<int>?>(9),
      extensionSignature: decode.getBytes<List<int>?>(10),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesVote;
}

/// Commit contains the evidence that a block was committed by a set of validators.
class Commit extends CosmosProtoMessage {
  final BigInt? height;

  final int? round;

  final BlockID? blockId;

  final List<CommitSig> signatures;

  const Commit({
    this.height,
    this.round,
    this.blockId,
    this.signatures = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.int64(1),
        ProtoFieldConfig.int32(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [height, round, blockId, signatures];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'height': config.encodeBigint(height),
      'round': round,
      'block_id': config.encodeMessage(blockId),
      'signatures': signatures.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory Commit.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Commit(
      height: json.valueAsBigInt<BigInt?>(
        'height',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      round: json.valueAsInt<int?>(
        'round',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      blockId: json.valueTo<BlockID?, Object>(
        key: 'block_id',
        parse: (v) => BlockID.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signatures:
          (json.valueEnsureAsList<dynamic>(
                'signatures',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<CommitSig, Object>(
                  value: e,
                  parse:
                      (v) => CommitSig.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory Commit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Commit(
      height: decode.getBigInt<BigInt?>(1),
      round: decode.getInt<int?>(2),
      blockId: decode.messageTo<BlockID?>(3, (b) => BlockID.deserialize(b)),
      signatures:
          decode
              .getListOfBytes(4)
              .map((b) => CommitSig.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesCommit;
}

/// CommitSig is a part of the Vote included in a Commit.
class CommitSig extends CosmosProtoMessage {
  final tendermint_types_validator.BlockIDFlag? blockIdFlag;

  final BuBytes? validatorAddress;

  final google_protobuf_timestamp.Timestamp? timestamp;

  final BuBytes? signature;

  CommitSig({
    this.blockIdFlag,
    List<int>? validatorAddress,
    this.timestamp,
    List<int>? signature,
  }) : validatorAddress = validatorAddress?.asImmutableBytes,
       signature = signature?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.bytes(2),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.bytes(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    blockIdFlag,
    validatorAddress,
    timestamp,
    signature,
  ];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'block_id_flag': config.encodeEnum(blockIdFlag),
      'validator_address': config.encodeBinary(validatorAddress),
      'timestamp': timestamp?.toRfc3339(),
      'signature': config.encodeBinary(signature),
    };
  }

  factory CommitSig.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return CommitSig(
      blockIdFlag: json
          .valueTo<tendermint_types_validator.BlockIDFlag?, Object?>(
            key: 'block_id_flag',
            parse: (v) => tendermint_types_validator.BlockIDFlag.from(v),
          ),
      validatorAddress: config.decodeBinary<List<int>?>(
        json.valueAs(
          'validator_address',
          normalizeKeyLookup: config.normalizeKeys,
        ),
      ),
      timestamp: json.valueTo<google_protobuf_timestamp.Timestamp?, Object>(
        key: 'timestamp',
        parse:
            (v) => google_protobuf_timestamp.Timestamp.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      signature: config.decodeBinary<List<int>?>(
        json.valueAs('signature', normalizeKeyLookup: config.normalizeKeys),
      ),
    );
  }

  factory CommitSig.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return CommitSig(
      blockIdFlag: decode.getEnum<tendermint_types_validator.BlockIDFlag?>(
        1,
        tendermint_types_validator.BlockIDFlag.values,
      ),
      validatorAddress: decode.getBytes<List<int>?>(2),
      timestamp: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        3,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      signature: decode.getBytes<List<int>?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesCommitSig;
}

class SignedHeader extends CosmosProtoMessage {
  final Header? header;

  final Commit? commit;

  const SignedHeader({this.header, this.commit});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [header, commit];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'header': config.encodeMessage(header),
      'commit': config.encodeMessage(commit),
    };
  }

  factory SignedHeader.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return SignedHeader(
      header: json.valueTo<Header?, Object>(
        key: 'header',
        parse: (v) => Header.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      commit: json.valueTo<Commit?, Object>(
        key: 'commit',
        parse: (v) => Commit.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory SignedHeader.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return SignedHeader(
      header: decode.messageTo<Header?>(1, (b) => Header.deserialize(b)),
      commit: decode.messageTo<Commit?>(2, (b) => Commit.deserialize(b)),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesSignedHeader;
}

class LightBlock extends CosmosProtoMessage {
  final SignedHeader? signedHeader;

  final tendermint_types_validator.ValidatorSet? validatorSet;

  const LightBlock({this.signedHeader, this.validatorSet});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [signedHeader, validatorSet];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'signed_header': config.encodeMessage(signedHeader),
      'validator_set': config.encodeMessage(validatorSet),
    };
  }

  factory LightBlock.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return LightBlock(
      signedHeader: json.valueTo<SignedHeader?, Object>(
        key: 'signed_header',
        parse:
            (v) => SignedHeader.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      validatorSet: json
          .valueTo<tendermint_types_validator.ValidatorSet?, Object>(
            key: 'validator_set',
            parse:
                (v) => tendermint_types_validator.ValidatorSet.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory LightBlock.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return LightBlock(
      signedHeader: decode.messageTo<SignedHeader?>(
        1,
        (b) => SignedHeader.deserialize(b),
      ),
      validatorSet: decode.messageTo<tendermint_types_validator.ValidatorSet?>(
        2,
        (b) => tendermint_types_validator.ValidatorSet.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.tendermintTypesLightBlock;
}
