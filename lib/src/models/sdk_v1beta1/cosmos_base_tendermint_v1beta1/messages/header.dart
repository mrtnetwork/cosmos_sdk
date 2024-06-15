import 'package:blockchain_utils/utils/utils.dart';

import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_tendermint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/block_id.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_version/messages/consensus.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Header defines the structure of a block header.
class CosmosHeader extends CosmosMessage {
  /// basic block info
  final Consensus version;
  final String? chainId;
  final BigInt? height;
  final ProtobufTimestamp time;

  /// prev block info
  final BlockID lastBlockId;

  /// hashes of block data
  final List<int>? lastCommitHash;
  final List<int>? dataHash;

  /// hashes from the app output from the prev block
  final List<int>? validatorsHash;
  final List<int>? nextValidatorsHash;
  final List<int>? consensusHash;
  final List<int>? appHash;
  final List<int>? lastResultsHash;

  /// consensus info
  final List<int>? evidenceHash;
  final List<int>? proposerAddress;

  CosmosHeader({
    required this.version,
    this.chainId,
    this.height,
    required this.time,
    required this.lastBlockId,
    List<int>? lastCommitHash,
    List<int>? dataHash,
    List<int>? validatorsHash,
    List<int>? nextValidatorsHash,
    List<int>? consensusHash,
    List<int>? appHash,
    List<int>? lastResultsHash,
    List<int>? evidenceHash,
    List<int>? proposerAddress,
  })  : lastCommitHash =
            BytesUtils.tryToBytes(lastCommitHash, unmodifiable: true),
        dataHash = BytesUtils.tryToBytes(dataHash, unmodifiable: true),
        validatorsHash =
            BytesUtils.tryToBytes(validatorsHash, unmodifiable: true),
        nextValidatorsHash =
            BytesUtils.tryToBytes(nextValidatorsHash, unmodifiable: true),
        consensusHash =
            BytesUtils.tryToBytes(consensusHash, unmodifiable: true),
        appHash = BytesUtils.tryToBytes(appHash, unmodifiable: true),
        lastResultsHash =
            BytesUtils.tryToBytes(lastResultsHash, unmodifiable: true),
        evidenceHash = BytesUtils.tryToBytes(evidenceHash, unmodifiable: true),
        proposerAddress =
            BytesUtils.tryToBytes(proposerAddress, unmodifiable: true);
  factory CosmosHeader.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmosHeader(
        version: Consensus.deserialize(decode.getField(1)),
        chainId: decode.getField(2),
        height: decode.getField(3),
        time: ProtobufTimestamp.deserialize(decode.getField(4)),
        lastBlockId: BlockID.deserialize(decode.getField(5)),
        lastCommitHash: decode.getField(6),
        dataHash: decode.getField(7),
        validatorsHash: decode.getField(8),
        nextValidatorsHash: decode.getField(9),
        consensusHash: decode.getField(10),
        appHash: decode.getField(11),
        lastResultsHash: decode.getField(12),
        evidenceHash: decode.getField(13),
        proposerAddress: decode.getField(14));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'version': version.toJson(),
      'chain_id': chainId,
      'height': height?.toString(),
      'time': time.toJson(),
      'last_block_id': lastBlockId.toJson(),
      'last_commit_hash': BytesUtils.tryToHexString(lastCommitHash),
      'data_hash': BytesUtils.tryToHexString(dataHash),
      'validators_hash': BytesUtils.tryToHexString(validatorsHash),
      'next_validators_hash': BytesUtils.tryToHexString(nextValidatorsHash),
      'consensus_hash': BytesUtils.tryToHexString(consensusHash),
      'app_hash': BytesUtils.tryToHexString(appHash),
      'last_results_hash': BytesUtils.tryToHexString(lastResultsHash),
      'evidence_hash': BytesUtils.tryToHexString(evidenceHash),
      'proposer_address': BytesUtils.tryToHexString(proposerAddress),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

  @override
  String get typeUrl => BaseTendermintV1beta1Types.cosmosHeader.typeUrl;

  @override
  List get values => [
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
        proposerAddress
      ];
}
