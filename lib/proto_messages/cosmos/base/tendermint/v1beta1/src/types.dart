import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/tendermint/types/src/types.dart"
    as tendermint_types_types;
import "package:cosmos_sdk/proto_messages/tendermint/types/src/evidence.dart"
    as tendermint_types_evidence;
import "package:cosmos_sdk/proto_messages/tendermint/version/src/types.dart"
    as tendermint_version_types;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// Block is tendermint type Block, with the Header proposer address
/// field converted to bech32 string.
class Block extends CosmosProtoMessage {
  final Header? header;

  final tendermint_types_types.Data? data;

  final tendermint_types_evidence.EvidenceList? evidence;

  final tendermint_types_types.Commit? lastCommit;

  const Block({this.header, this.data, this.evidence, this.lastCommit});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [header, data, evidence, lastCommit];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'header': config.encodeMessage(header),
      'data': config.encodeMessage(data),
      'evidence': config.encodeMessage(evidence),
      'last_commit': config.encodeMessage(lastCommit),
    };
  }

  factory Block.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return Block(
      header: json.valueTo<Header?, Object>(
        key: 'header',
        parse: (v) => Header.fromJson(JsonParser.valueAs(v), config: config),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      data: json.valueTo<tendermint_types_types.Data?, Object>(
        key: 'data',
        parse:
            (v) => tendermint_types_types.Data.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      evidence: json.valueTo<tendermint_types_evidence.EvidenceList?, Object>(
        key: 'evidence',
        parse:
            (v) => tendermint_types_evidence.EvidenceList.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      lastCommit: json.valueTo<tendermint_types_types.Commit?, Object>(
        key: 'last_commit',
        parse:
            (v) => tendermint_types_types.Commit.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory Block.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Block(
      header: decode.messageTo<Header?>(1, (b) => Header.deserialize(b)),
      data: decode.messageTo<tendermint_types_types.Data?>(
        2,
        (b) => tendermint_types_types.Data.deserialize(b),
      ),
      evidence: decode.messageTo<tendermint_types_evidence.EvidenceList?>(
        3,
        (b) => tendermint_types_evidence.EvidenceList.deserialize(b),
      ),
      lastCommit: decode.messageTo<tendermint_types_types.Commit?>(
        4,
        (b) => tendermint_types_types.Commit.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseTendermintV1beta1Block;
}

/// Header defines the structure of a Tendermint block header.
class Header extends CosmosProtoMessage {
  /// basic block info
  final tendermint_version_types.Consensus? version;

  final String? chainId;

  final BigInt? height;

  final google_protobuf_timestamp.Timestamp? time;

  /// prev block info
  final tendermint_types_types.BlockID? lastBlockId;

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
  /// proposer_address is the original block proposer address, formatted as a Bech32 string.
  /// In Tendermint, this type is `bytes`, but in the SDK, we convert it to a Bech32 string
  /// for better UX.
  final String? proposerAddress;

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
    this.proposerAddress,
  }) : lastCommitHash = lastCommitHash?.asImmutableBytes,
       dataHash = dataHash?.asImmutableBytes,
       validatorsHash = validatorsHash?.asImmutableBytes,
       nextValidatorsHash = nextValidatorsHash?.asImmutableBytes,
       consensusHash = consensusHash?.asImmutableBytes,
       appHash = appHash?.asImmutableBytes,
       lastResultsHash = lastResultsHash?.asImmutableBytes,
       evidenceHash = evidenceHash?.asImmutableBytes;

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(
          1,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.int64(3),
        ProtoFieldConfig.message(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bytes(6),
        ProtoFieldConfig.bytes(7),
        ProtoFieldConfig.bytes(8),
        ProtoFieldConfig.bytes(9),
        ProtoFieldConfig.bytes(10),
        ProtoFieldConfig.bytes(11),
        ProtoFieldConfig.bytes(12),
        ProtoFieldConfig.bytes(13),
        ProtoFieldConfig.string(14),
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
      'proposer_address': proposerAddress,
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
      lastBlockId: json.valueTo<tendermint_types_types.BlockID?, Object>(
        key: 'last_block_id',
        parse:
            (v) => tendermint_types_types.BlockID.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
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
      proposerAddress: json.valueAsString<String?>(
        'proposer_address',
        normalizeKeyLookup: config.normalizeKeys,
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
      lastBlockId: decode.messageTo<tendermint_types_types.BlockID?>(
        5,
        (b) => tendermint_types_types.BlockID.deserialize(b),
      ),
      lastCommitHash: decode.getBytes<List<int>?>(6),
      dataHash: decode.getBytes<List<int>?>(7),
      validatorsHash: decode.getBytes<List<int>?>(8),
      nextValidatorsHash: decode.getBytes<List<int>?>(9),
      consensusHash: decode.getBytes<List<int>?>(10),
      appHash: decode.getBytes<List<int>?>(11),
      lastResultsHash: decode.getBytes<List<int>?>(12),
      evidenceHash: decode.getBytes<List<int>?>(13),
      proposerAddress: decode.getString<String?>(14),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosBaseTendermintV1beta1Header;
}
