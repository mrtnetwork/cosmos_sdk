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
    return SignedMsgType.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "SignedMsgType", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static SignedMsgType from(Object? value) {
    return SignedMsgType.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "SignedMsgType", value: value),
    );
  }
}

/// PartsetHeader
class PartSetHeader extends CosmosProtoMessage {
  final int? total;

  final List<int>? hash;

  const PartSetHeader({this.total, this.hash});

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
  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'hash': switch (hash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory PartSetHeader.fromJson(Map<String, dynamic> json) {
    return PartSetHeader(
      total: json.valueAsInt<int?>('total', acceptCamelCase: true),
      hash: json.valueAsBytes<List<int>?>(
        'hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  final List<int>? hash;

  final PartSetHeader? partSetHeader;

  const BlockID({this.hash, this.partSetHeader});

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
  Map<String, dynamic> toJson() {
    return {
      'hash': switch (hash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'part_set_header': partSetHeader?.toJson(),
    };
  }

  factory BlockID.fromJson(Map<String, dynamic> json) {
    return BlockID(
      hash: json.valueAsBytes<List<int>?>(
        'hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      partSetHeader: json.valueTo<PartSetHeader?, Map<String, dynamic>>(
        key: 'part_set_header',
        parse: (v) => PartSetHeader.fromJson(v),
        acceptCamelCase: true,
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
  final List<int>? lastCommitHash;

  /// commit from validators from the last block
  final List<int>? dataHash;

  /// transactions
  /// hashes from the app output from the prev block
  final List<int>? validatorsHash;

  /// validators for the current block
  final List<int>? nextValidatorsHash;

  /// validators for the next block
  final List<int>? consensusHash;

  /// consensus params for current block
  final List<int>? appHash;

  /// state after txs from the previous block
  final List<int>? lastResultsHash;

  /// root hash of all results from the txs from the previous block
  /// consensus info
  final List<int>? evidenceHash;

  /// evidence included in the block
  final List<int>? proposerAddress;

  const Header({
    this.version,
    this.chainId,
    this.height,
    this.time,
    this.lastBlockId,
    this.lastCommitHash,
    this.dataHash,
    this.validatorsHash,
    this.nextValidatorsHash,
    this.consensusHash,
    this.appHash,
    this.lastResultsHash,
    this.evidenceHash,
    this.proposerAddress,
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
  Map<String, dynamic> toJson() {
    return {
      'version': version?.toJson(),
      'chain_id': chainId,
      'height': height?.toString(),
      'time': time?.toRfc3339(),
      'last_block_id': lastBlockId?.toJson(),
      'last_commit_hash': switch (lastCommitHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'data_hash': switch (dataHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'validators_hash': switch (validatorsHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'next_validators_hash': switch (nextValidatorsHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'consensus_hash': switch (consensusHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'app_hash': switch (appHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'last_results_hash': switch (lastResultsHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'evidence_hash': switch (evidenceHash) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'proposer_address': switch (proposerAddress) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory Header.fromJson(Map<String, dynamic> json) {
    return Header(
      version: json
          .valueTo<tendermint_version_types.Consensus?, Map<String, dynamic>>(
            key: 'version',
            parse: (v) => tendermint_version_types.Consensus.fromJson(v),
            acceptCamelCase: true,
          ),
      chainId: json.valueAsString<String?>('chain_id', acceptCamelCase: true),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      time: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      lastBlockId: json.valueTo<BlockID?, Map<String, dynamic>>(
        key: 'last_block_id',
        parse: (v) => BlockID.fromJson(v),
        acceptCamelCase: true,
      ),
      lastCommitHash: json.valueAsBytes<List<int>?>(
        'last_commit_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      dataHash: json.valueAsBytes<List<int>?>(
        'data_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      validatorsHash: json.valueAsBytes<List<int>?>(
        'validators_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      nextValidatorsHash: json.valueAsBytes<List<int>?>(
        'next_validators_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      consensusHash: json.valueAsBytes<List<int>?>(
        'consensus_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      appHash: json.valueAsBytes<List<int>?>(
        'app_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      lastResultsHash: json.valueAsBytes<List<int>?>(
        'last_results_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      evidenceHash: json.valueAsBytes<List<int>?>(
        'evidence_hash',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      proposerAddress: json.valueAsBytes<List<int>?>(
        'proposer_address',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  final List<List<int>> txs;

  const Data({this.txs = const []});

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
  Map<String, dynamic> toJson() {
    return {
      'txs':
          txs
              .map(
                (e) => StringUtils.decode(e, encoding: StringEncoding.base64),
              )
              .toList(),
    };
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      txs:
          (json.valueEnsureAsList<dynamic>('txs', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueAsBytes<List<int>>(
                  e,
                  encoding: StringEncoding.base64,
                ),
              )
              .toList(),
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

  final List<int>? validatorAddress;

  final int? validatorIndex;

  /// Vote signature by the validator if they participated in consensus for the
  /// associated block.
  final List<int>? signature;

  /// Vote extension provided by the application. Only valid for precommit
  /// messages.
  final List<int>? extension_;

  /// Vote extension signature by the validator if they participated in
  /// consensus for the associated block.
  /// Only valid for precommit messages.
  final List<int>? extensionSignature;

  const Vote({
    this.type,
    this.height,
    this.round,
    this.blockId,
    this.timestamp,
    this.validatorAddress,
    this.validatorIndex,
    this.signature,
    this.extension_,
    this.extensionSignature,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'type': type?.protoName,
      'height': height?.toString(),
      'round': round,
      'block_id': blockId?.toJson(),
      'timestamp': timestamp?.toRfc3339(),
      'validator_address': switch (validatorAddress) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'validator_index': validatorIndex,
      'signature': switch (signature) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'extension': switch (extension_) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'extension_signature': switch (extensionSignature) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory Vote.fromJson(Map<String, dynamic> json) {
    return Vote(
      type: json.valueTo<SignedMsgType?, Object?>(
        key: 'type',
        parse: (v) => SignedMsgType.from(v),
      ),
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      round: json.valueAsInt<int?>('round', acceptCamelCase: true),
      blockId: json.valueTo<BlockID?, Map<String, dynamic>>(
        key: 'block_id',
        parse: (v) => BlockID.fromJson(v),
        acceptCamelCase: true,
      ),
      timestamp: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'timestamp',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      validatorAddress: json.valueAsBytes<List<int>?>(
        'validator_address',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      validatorIndex: json.valueAsInt<int?>(
        'validator_index',
        acceptCamelCase: true,
      ),
      signature: json.valueAsBytes<List<int>?>(
        'signature',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      extension_: json.valueAsBytes<List<int>?>(
        'extension',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      extensionSignature: json.valueAsBytes<List<int>?>(
        'extension_signature',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {
      'height': height?.toString(),
      'round': round,
      'block_id': blockId?.toJson(),
      'signatures': signatures.map((e) => e.toJson()).toList(),
    };
  }

  factory Commit.fromJson(Map<String, dynamic> json) {
    return Commit(
      height: json.valueAsBigInt<BigInt?>('height', acceptCamelCase: true),
      round: json.valueAsInt<int?>('round', acceptCamelCase: true),
      blockId: json.valueTo<BlockID?, Map<String, dynamic>>(
        key: 'block_id',
        parse: (v) => BlockID.fromJson(v),
        acceptCamelCase: true,
      ),
      signatures:
          (json.valueEnsureAsList<dynamic>('signatures', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<CommitSig, Map<String, dynamic>>(
                  value: e,
                  parse: (v) => CommitSig.fromJson(v),
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

  final List<int>? validatorAddress;

  final google_protobuf_timestamp.Timestamp? timestamp;

  final List<int>? signature;

  const CommitSig({
    this.blockIdFlag,
    this.validatorAddress,
    this.timestamp,
    this.signature,
  });

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
  Map<String, dynamic> toJson() {
    return {
      'block_id_flag': blockIdFlag?.protoName,
      'validator_address': switch (validatorAddress) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'timestamp': timestamp?.toRfc3339(),
      'signature': switch (signature) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory CommitSig.fromJson(Map<String, dynamic> json) {
    return CommitSig(
      blockIdFlag: json
          .valueTo<tendermint_types_validator.BlockIDFlag?, Object?>(
            key: 'block_id_flag',
            parse: (v) => tendermint_types_validator.BlockIDFlag.from(v),
          ),
      validatorAddress: json.valueAsBytes<List<int>?>(
        'validator_address',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      timestamp: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'timestamp',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      signature: json.valueAsBytes<List<int>?>(
        'signature',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
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
  Map<String, dynamic> toJson() {
    return {'header': header?.toJson(), 'commit': commit?.toJson()};
  }

  factory SignedHeader.fromJson(Map<String, dynamic> json) {
    return SignedHeader(
      header: json.valueTo<Header?, Map<String, dynamic>>(
        key: 'header',
        parse: (v) => Header.fromJson(v),
        acceptCamelCase: true,
      ),
      commit: json.valueTo<Commit?, Map<String, dynamic>>(
        key: 'commit',
        parse: (v) => Commit.fromJson(v),
        acceptCamelCase: true,
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
  Map<String, dynamic> toJson() {
    return {
      'signed_header': signedHeader?.toJson(),
      'validator_set': validatorSet?.toJson(),
    };
  }

  factory LightBlock.fromJson(Map<String, dynamic> json) {
    return LightBlock(
      signedHeader: json.valueTo<SignedHeader?, Map<String, dynamic>>(
        key: 'signed_header',
        parse: (v) => SignedHeader.fromJson(v),
        acceptCamelCase: true,
      ),
      validatorSet: json.valueTo<
        tendermint_types_validator.ValidatorSet?,
        Map<String, dynamic>
      >(
        key: 'validator_set',
        parse: (v) => tendermint_types_validator.ValidatorSet.fromJson(v),
        acceptCamelCase: true,
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
