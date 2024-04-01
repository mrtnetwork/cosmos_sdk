import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_commitment_v1/messages/merkle_root.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ConsensusState defines the consensus state from Tendermint.
class IbcTendermintConsensusState extends CosmosMessage {
  /// timestamp that corresponds to the block height in which the ConsensusState
  /// was stored.
  final ProtobufTimestamp timestamp;

  /// commitment root (i.e app hash)
  final IbcCommitmentMerkleMerkleRoot root;
  final List<int>? nextValidatorsHash;
  IbcTendermintConsensusState(
      {required this.timestamp,
      required this.root,
      List<int>? nextValidatorsHash})
      : nextValidatorsHash =
            BytesUtils.tryToBytes(nextValidatorsHash, unmodifiable: true);

  factory IbcTendermintConsensusState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTendermintConsensusState(
        timestamp: ProtobufTimestamp.deserialize(decode.getField(1)),
        root: IbcCommitmentMerkleMerkleRoot.deserialize(decode.getField(2)),
        nextValidatorsHash: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "timestamp": timestamp.toJson(),
      "root": root.toJson(),
      "next_validators_hash": BytesUtils.tryToHexString(nextValidatorsHash)
    };
  }

  @override
  String get typeUrl => IbcTypes.ibcTendermintV1ConsensusState.typeUrl;

  @override
  List get values => [1, 2, 3];
}
