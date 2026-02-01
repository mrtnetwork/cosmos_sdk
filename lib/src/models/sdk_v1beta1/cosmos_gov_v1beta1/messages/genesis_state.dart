import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/deposit.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/deposit_params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/proposal.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/tally_params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/vote.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/voting_params.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

/// GenesisState defines the gov module's genesis state.
class GovGenesisState extends CosmosMessage {
  /// starting_proposal_id is the ID of the starting proposal.
  final BigInt? startingProposalId;

  /// deposits defines all the deposits present at genesis.
  final List<GovDeposit> deposits;

  /// votes defines all the votes present at genesis.
  final List<GovVote> votes;

  /// proposals defines all the proposals present at genesis.
  final List<GovProposal> proposals;

  /// deposit_params defines all the parameters related to deposit.
  final List<GovDepositParams> depositParams;

  /// voting_params defines all the parameters related to voting.
  final List<GovVotingParams> votingParams;

  /// tally_params defines all the parameters related to tally.
  final List<GovTallyParams> tallyParams;
  GovGenesisState({
    this.startingProposalId,
    required List<GovDeposit> deposits,
    required List<GovVote> votes,
    required List<GovProposal> proposals,
    required List<GovDepositParams> depositParams,
    required List<GovVotingParams> votingParams,
    required List<GovTallyParams> tallyParams,
  }) : deposits = deposits.immutable,
       votes = votes.immutable,
       proposals = proposals.immutable,
       depositParams = depositParams.immutable,
       votingParams = votingParams.immutable,
       tallyParams = tallyParams.immutable;
  factory GovGenesisState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovGenesisState(
      startingProposalId: decode.getField(1),
      deposits:
          decode
              .getFields<List<int>>(2)
              .map((e) => GovDeposit.deserialize(e))
              .toList(),
      votes:
          decode
              .getFields<List<int>>(3)
              .map((e) => GovVote.deserialize(e))
              .toList(),
      proposals:
          decode
              .getFields<List<int>>(4)
              .map((e) => GovProposal.deserialize(e))
              .toList(),
      depositParams:
          decode
              .getFields<List<int>>(5)
              .map((e) => GovDepositParams.deserialize(e))
              .toList(),
      votingParams:
          decode
              .getFields<List<int>>(6)
              .map((e) => GovVotingParams.deserialize(e))
              .toList(),
      tallyParams:
          decode
              .getFields<List<int>>(7)
              .map((e) => GovTallyParams.deserialize(e))
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "starting_proposal_id": startingProposalId?.toString(),
      "deposits": deposits.map((e) => e.toJson()).toList(),
      "votes": votes.map((e) => e.toJson()).toList(),
      "proposals": proposals.map((e) => e.toJson()).toList(),
      "deposit_params": depositParams.map((e) => e.toJson()).toList(),
      "voting_params": votingParams.map((e) => e.toJson()).toList(),
      "tally_params": tallyParams.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govGenesisState;

  @override
  List get values => [
    startingProposalId,
    deposits,
    votes,
    proposals,
    depositParams,
    votingParams,
    tallyParams,
  ];
}
