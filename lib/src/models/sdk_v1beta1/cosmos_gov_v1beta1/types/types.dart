class GovV1beta1types {
  final String typeUrl;
  const GovV1beta1types._(this.typeUrl);
  static const GovV1beta1types govMsgSubmitProposal =
      GovV1beta1types._("/cosmos.gov.v1beta1.MsgSubmitProposal");
  static const GovV1beta1types govMsgSubmitProposalResponse =
      GovV1beta1types._("/cosmos.gov.v1beta1.MsgSubmitProposalResponse");
  static const GovV1beta1types govMsgVote =
      GovV1beta1types._("/cosmos.gov.v1beta1.MsgVote");
  static const GovV1beta1types govMsgVoteResponse =
      GovV1beta1types._("/cosmos.gov.v1beta1.MsgVoteResponse");
  static const GovV1beta1types goveWeightedVoteOption =
      GovV1beta1types._("/cosmos.gov.v1beta1.WeightedVoteOption");
  static const GovV1beta1types govVotingParams =
      GovV1beta1types._("/cosmos.gov.v1beta1.VotingParams");
  static const GovV1beta1types govVote =
      GovV1beta1types._("/cosmos.gov.v1beta1.Vote");
  static const GovV1beta1types govTextProposal =
      GovV1beta1types._("/cosmos.gov.v1beta1.TextProposal");
  static const GovV1beta1types govTallyResult =
      GovV1beta1types._("/cosmos.gov.v1beta1.TallyResult");
  static const GovV1beta1types govTallyParams =
      GovV1beta1types._("/cosmos.gov.v1beta1.TallyParams");
  static const GovV1beta1types govProposal =
      GovV1beta1types._("/cosmos.gov.v1beta1.Proposal");
  static const GovV1beta1types govQueryProposalRequest =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryProposalRequest");
  static const GovV1beta1types govQueryProposalResponse =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryProposalResponse");
  static const GovV1beta1types govQueryProposalsRequest =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryProposalsRequest");
  static const GovV1beta1types govQueryProposalsResponse =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryProposalsResponse");
  static const GovV1beta1types govQueryVoteRequest =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryVoteRequest");
  static const GovV1beta1types govQueryVoteResponse =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryVoteResponse");
  static const GovV1beta1types govQueryVotesRequest =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryVotesRequest");
  static const GovV1beta1types govQueryVotesResponse =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryVotesResponse");
  static const GovV1beta1types govDepositParams =
      GovV1beta1types._("/cosmos.gov.v1beta1.DepositParams");
  static const GovV1beta1types govDeposit =
      GovV1beta1types._("/cosmos.gov.v1beta1.Deposit");
  static const GovV1beta1types govGenesisState =
      GovV1beta1types._("/cosmos.gov.v1beta1.GenesisState");
  static const GovV1beta1types govQueryParamsRequest =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryParamsRequest");
  static const GovV1beta1types govQueryParamsResponse =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryParamsResponse");
  static const GovV1beta1types govQueryDepositRequest =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryDepositRequest");
  static const GovV1beta1types govQueryDepositResponse =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryDepositResponse");
  static const GovV1beta1types govQueryDepositsRequest =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryDepositsRequest");
  static const GovV1beta1types govQueryDepositsResponse =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryDepositsResponse");
  static const GovV1beta1types govQueryTallyResultRequest =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryTallyResultRequest");
  static const GovV1beta1types govQueryTallyResultResponse =
      GovV1beta1types._("/cosmos.gov.v1beta1.QueryTallyResultResponse");
  static const GovV1beta1types govMsgVoteWeightedResponse =
      GovV1beta1types._("/cosmos.gov.v1beta1.MsgVoteWeightedResponse");
  static const GovV1beta1types govMsgVoteWeighted =
      GovV1beta1types._("/cosmos.gov.v1beta1.MsgVoteWeighted");

  static const GovV1beta1types govMsgDeposit =
      GovV1beta1types._("/cosmos.gov.v1beta1.MsgDeposit");
  static const GovV1beta1types govMsgDepositResponse =
      GovV1beta1types._("/cosmos.gov.v1beta1.MsgDepositResponse");

  /// queries
  static const GovV1beta1types queryGovProposal =
      GovV1beta1types._("/cosmos.gov.v1beta1.Query/Proposal");
  static const GovV1beta1types queryGovProposals =
      GovV1beta1types._("/cosmos.gov.v1beta1.Query/Proposals");
  static const GovV1beta1types queryGovVote =
      GovV1beta1types._("/cosmos.gov.v1beta1.Query/Vote");
  static const GovV1beta1types queryGovVotes =
      GovV1beta1types._("/cosmos.gov.v1beta1.Query/Votes");
  static const GovV1beta1types queryGovParams =
      GovV1beta1types._("/cosmos.gov.v1beta1.Query/Params");
  static const GovV1beta1types queryGovDeposit =
      GovV1beta1types._("/cosmos.gov.v1beta1.Query/Deposit");
  static const GovV1beta1types queryGovDeposits =
      GovV1beta1types._("/cosmos.gov.v1beta1.Query/Deposits");
  static const GovV1beta1types queryGovTallyResult =
      GovV1beta1types._("/cosmos.gov.v1beta1.Query/TallyResult");

  /// service
  static const GovV1beta1types serviceGovSubmitProposal =
      GovV1beta1types._("/cosmos.gov.v1beta1.Msg/SubmitProposal");
  static const GovV1beta1types serviceGovVote =
      GovV1beta1types._("/cosmos.gov.v1beta1.Msg/Vote");
  static const GovV1beta1types serviceGovVoteWeighted =
      GovV1beta1types._("/cosmos.gov.v1beta1.Msg/VoteWeighted");
  static const GovV1beta1types serviceGovDeposit =
      GovV1beta1types._("/cosmos.gov.v1beta1.Msg/Deposit");
}
