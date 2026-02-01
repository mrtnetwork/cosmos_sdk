import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';

class GovV1beta1types extends TypeUrl {
  const GovV1beta1types._(
    super.typeUrl, {
    super.query,
    super.rpc,
    super.aminoType,
  });
  static const String root = "/cosmos.gov.v1beta1";
  static const GovV1beta1types govMsgSubmitProposal = GovV1beta1types._(
    "/cosmos.gov.v1beta1.MsgSubmitProposal",
  );
  static const GovV1beta1types govMsgSubmitProposalResponse = GovV1beta1types._(
    "/cosmos.gov.v1beta1.MsgSubmitProposalResponse",
  );
  static const GovV1beta1types govMsgVote = GovV1beta1types._(
    "/cosmos.gov.v1beta1.MsgVote",
    aminoType: "cosmos-sdk/MsgVote",
  );
  static const GovV1beta1types govMsgVoteResponse = GovV1beta1types._(
    "/cosmos.gov.v1beta1.MsgVoteResponse",
  );
  static const GovV1beta1types goveWeightedVoteOption = GovV1beta1types._(
    "/cosmos.gov.v1beta1.WeightedVoteOption",
  );
  static const GovV1beta1types govVotingParams = GovV1beta1types._(
    "/cosmos.gov.v1beta1.VotingParams",
  );
  static const GovV1beta1types govVote = GovV1beta1types._(
    "/cosmos.gov.v1beta1.Vote",
  );
  static const GovV1beta1types govTextProposal = GovV1beta1types._(
    "/cosmos.gov.v1beta1.TextProposal",
  );
  static const GovV1beta1types govTallyResult = GovV1beta1types._(
    "/cosmos.gov.v1beta1.TallyResult",
  );
  static const GovV1beta1types govTallyParams = GovV1beta1types._(
    "/cosmos.gov.v1beta1.TallyParams",
  );
  static const GovV1beta1types govProposal = GovV1beta1types._(
    "/cosmos.gov.v1beta1.Proposal",
  );
  static const GovV1beta1types govQueryProposalRequest = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryProposalRequest",
    query: "/cosmos.gov.v1beta1.Query/Proposal",
    rpc: "/cosmos/gov/v1beta1/proposals/:proposal_id",
  );
  static const GovV1beta1types govQueryProposalResponse = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryProposalResponse",
  );
  static const GovV1beta1types govQueryProposalsRequest = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryProposalsRequest",
    query: "/cosmos.gov.v1beta1.Query/Proposals",
    rpc: "/cosmos/gov/v1beta1/proposals",
  );
  static const GovV1beta1types govQueryProposalsResponse = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryProposalsResponse",
  );
  static const GovV1beta1types govQueryVoteRequest = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryVoteRequest",
    query: "/cosmos.gov.v1beta1.Query/Vote",
    rpc: "/cosmos/gov/v1beta1/proposals/:proposal_id/votes/:voter",
  );
  static const GovV1beta1types govQueryVoteResponse = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryVoteResponse",
  );
  static const GovV1beta1types govQueryVotesRequest = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryVotesRequest",
    query: "/cosmos.gov.v1beta1.Query/Votes",
    rpc: "/cosmos/gov/v1beta1/proposals/:proposal_id/votes",
  );
  static const GovV1beta1types govQueryVotesResponse = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryVotesResponse",
  );
  static const GovV1beta1types govDepositParams = GovV1beta1types._(
    "/cosmos.gov.v1beta1.DepositParams",
  );
  static const GovV1beta1types govDeposit = GovV1beta1types._(
    "/cosmos.gov.v1beta1.Deposit",
  );
  static const GovV1beta1types govGenesisState = GovV1beta1types._(
    "/cosmos.gov.v1beta1.GenesisState",
  );
  static const GovV1beta1types govQueryParamsRequest = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryParamsRequest",
    query: "/cosmos.gov.v1beta1.Query/Params",
    rpc: "/cosmos/gov/v1beta1/params/:params_type",
  );
  static const GovV1beta1types govQueryParamsResponse = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryParamsResponse",
  );
  static const GovV1beta1types govQueryDepositRequest = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryDepositRequest",
    query: "/cosmos.gov.v1beta1.Query/Deposit",
    rpc: "/cosmos/gov/v1beta1/proposals/:proposal_id/deposits/:depositor",
  );
  static const GovV1beta1types govQueryDepositResponse = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryDepositResponse",
  );
  static const GovV1beta1types govQueryDepositsRequest = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryDepositsRequest",
    query: "/cosmos.gov.v1beta1.Query/Deposits",
    rpc: "/cosmos/gov/v1beta1/proposals/:proposal_id/deposits",
  );
  static const GovV1beta1types govQueryDepositsResponse = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryDepositsResponse",
  );
  static const GovV1beta1types govQueryTallyResultRequest = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryTallyResultRequest",
    query: "/cosmos.gov.v1beta1.Query/TallyResult",
    rpc: "/cosmos/gov/v1beta1/proposals/:proposal_id/tally",
  );
  static const GovV1beta1types govQueryTallyResultResponse = GovV1beta1types._(
    "/cosmos.gov.v1beta1.QueryTallyResultResponse",
  );
  static const GovV1beta1types govMsgVoteWeightedResponse = GovV1beta1types._(
    "/cosmos.gov.v1beta1.MsgVoteWeightedResponse",
  );
  static const GovV1beta1types govMsgVoteWeighted = GovV1beta1types._(
    "/cosmos.gov.v1beta1.MsgVoteWeighted",
  );

  static const GovV1beta1types govMsgDeposit = GovV1beta1types._(
    "/cosmos.gov.v1beta1.MsgDeposit",
    aminoType: "cosmos-sdk/MsgDeposit",
  );
  static const GovV1beta1types govMsgDepositResponse = GovV1beta1types._(
    "/cosmos.gov.v1beta1.MsgDepositResponse",
  );

  static const List<TypeUrl> services = [
    govMsgDeposit,
    govMsgSubmitProposal,
    govMsgVoteWeighted,
    govMsgVote,
  ];
  static TypeUrl? findService(String? typeUrl) {
    return services.firstWhereNullable((e) => e.typeUrl == typeUrl);
  }
}
