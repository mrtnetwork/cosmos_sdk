import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_types/messages/vote.dart';

import 'evidence_base.dart';

/// DuplicateVoteEvidence contains evidence of a validator signed two conflicting votes.
class DuplicateVoteEvidence extends BaseEvidence {
  final Vote? voteA;
  final Vote? voteB;
  final BigInt? totalVotingPower;
  final BigInt? validatorPower;
  final ProtobufTimestamp timestamp;
  const DuplicateVoteEvidence(
      {this.voteA,
      this.voteB,
      this.totalVotingPower,
      this.validatorPower,
      required this.timestamp});
  factory DuplicateVoteEvidence.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DuplicateVoteEvidence(
      voteA:
          decode.getResult(1)?.to<Vote, List<int>>((e) => Vote.deserialize(e)),
      voteB:
          decode.getResult(2)?.to<Vote, List<int>>((e) => Vote.deserialize(e)),
      totalVotingPower: decode.getField(3),
      validatorPower: decode.getField(4),
      timestamp: ProtobufTimestamp.deserialize(decode.getField(5)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "vote_a": voteA?.toJson(),
      "vote_b": voteB?.toJson(),
      "total_voting_power": totalVotingPower?.toString(),
      "validator_power": validatorPower?.toString(),
      "timestamp": timestamp.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.duplicateVoteEvidence;

  @override
  List get values =>
      [voteA, voteB, totalVotingPower, validatorPower, timestamp];

  @override
  int get id => 1;
}
