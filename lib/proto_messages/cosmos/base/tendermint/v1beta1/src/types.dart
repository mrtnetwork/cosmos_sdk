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
  Map<String, dynamic> toJson() {
    return {
      'header': header?.toJson(),
      'data': data?.toJson(),
      'evidence': evidence?.toJson(),
      'last_commit': lastCommit?.toJson(),
    };
  }

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      header: json.valueTo<Header?, Map<String, dynamic>>(
        key: 'header',
        parse: (v) => Header.fromJson(v),
        acceptCamelCase: true,
      ),
      data: json.valueTo<tendermint_types_types.Data?, Map<String, dynamic>>(
        key: 'data',
        parse: (v) => tendermint_types_types.Data.fromJson(v),
        acceptCamelCase: true,
      ),
      evidence: json.valueTo<
        tendermint_types_evidence.EvidenceList?,
        Map<String, dynamic>
      >(
        key: 'evidence',
        parse: (v) => tendermint_types_evidence.EvidenceList.fromJson(v),
        acceptCamelCase: true,
      ),
      lastCommit: json
          .valueTo<tendermint_types_types.Commit?, Map<String, dynamic>>(
            key: 'last_commit',
            parse: (v) => tendermint_types_types.Commit.fromJson(v),
            acceptCamelCase: true,
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
  /// proposer_address is the original block proposer address, formatted as a Bech32 string.
  /// In Tendermint, this type is `bytes`, but in the SDK, we convert it to a Bech32 string
  /// for better UX.
  final String? proposerAddress;

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
      'proposer_address': proposerAddress,
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
      lastBlockId: json
          .valueTo<tendermint_types_types.BlockID?, Map<String, dynamic>>(
            key: 'last_block_id',
            parse: (v) => tendermint_types_types.BlockID.fromJson(v),
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
      proposerAddress: json.valueAsString<String?>(
        'proposer_address',
        acceptCamelCase: true,
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
