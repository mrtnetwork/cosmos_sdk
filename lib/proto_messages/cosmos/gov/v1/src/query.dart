import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/gov/v1/src/gov.dart"
    as cosmos_gov_v1_gov;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;

/// QueryConstitutionRequest is the request type for the Query/Constitution RPC method
class QueryConstitutionRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryConstitutionResponse> {
  const QueryConstitutionRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/gov/v1/constitution",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory QueryConstitutionRequest.fromJson(Map<String, dynamic> json) {
    return QueryConstitutionRequest();
  }

  factory QueryConstitutionRequest.deserialize(List<int> bytes) {
    return QueryConstitutionRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryConstitutionRequest;
  @override
  QueryConstitutionResponse onQueryResponse(List<int> bytes) {
    return QueryConstitutionResponse.deserialize(bytes);
  }

  @override
  QueryConstitutionResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryConstitutionResponse.fromJson(json);
  }
}

/// QueryConstitutionResponse is the response type for the Query/Constitution RPC method
class QueryConstitutionResponse extends CosmosProtoMessage {
  final String? constitution;

  const QueryConstitutionResponse({this.constitution});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [constitution];

  @override
  Map<String, dynamic> toJson() {
    return {'constitution': constitution};
  }

  factory QueryConstitutionResponse.fromJson(Map<String, dynamic> json) {
    return QueryConstitutionResponse(
      constitution: json.valueAsString<String?>(
        'constitution',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryConstitutionResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryConstitutionResponse(
      constitution: decode.getString<String?>(1),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryConstitutionResponse;
}

/// QueryProposalRequest is the request type for the Query/Proposal RPC method.
class QueryProposalRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryProposalResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  const QueryProposalRequest({this.proposalId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/gov/v1/proposals/{proposal_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId];

  @override
  Map<String, dynamic> toJson() {
    return {'proposal_id': proposalId?.toString()};
  }

  factory QueryProposalRequest.fromJson(Map<String, dynamic> json) {
    return QueryProposalRequest(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryProposalRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryProposalRequest(proposalId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryProposalRequest;
  @override
  QueryProposalResponse onQueryResponse(List<int> bytes) {
    return QueryProposalResponse.deserialize(bytes);
  }

  @override
  QueryProposalResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryProposalResponse.fromJson(json);
  }
}

/// QueryProposalResponse is the response type for the Query/Proposal RPC method.
class QueryProposalResponse extends CosmosProtoMessage {
  /// proposal is the requested governance proposal.
  final cosmos_gov_v1_gov.Proposal? proposal;

  const QueryProposalResponse({this.proposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [proposal];

  @override
  Map<String, dynamic> toJson() {
    return {'proposal': proposal?.toJson()};
  }

  factory QueryProposalResponse.fromJson(Map<String, dynamic> json) {
    return QueryProposalResponse(
      proposal: json.valueTo<cosmos_gov_v1_gov.Proposal?, Map<String, dynamic>>(
        key: 'proposal',
        parse: (v) => cosmos_gov_v1_gov.Proposal.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryProposalResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryProposalResponse(
      proposal: decode.messageTo<cosmos_gov_v1_gov.Proposal?>(
        1,
        (b) => cosmos_gov_v1_gov.Proposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryProposalResponse;
}

/// QueryProposalsRequest is the request type for the Query/Proposals RPC method.
class QueryProposalsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryProposalsResponse> {
  /// proposal_status defines the status of the proposals.
  final cosmos_gov_v1_gov.ProposalStatus? proposalStatus;

  /// voter defines the voter address for the proposals.
  final String? voter;

  /// depositor defines the deposit addresses from the proposals.
  final String? depositor;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryProposalsRequest({
    this.proposalStatus,
    this.voter,
    this.depositor,
    this.pagination,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/gov/v1/proposals",
        ),
      ],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.message(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    proposalStatus,
    voter,
    depositor,
    pagination,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposal_status': proposalStatus?.protoName,
      'voter': voter,
      'depositor': depositor,
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryProposalsRequest.fromJson(Map<String, dynamic> json) {
    return QueryProposalsRequest(
      proposalStatus: json.valueTo<cosmos_gov_v1_gov.ProposalStatus?, Object?>(
        key: 'proposal_status',
        parse: (v) => cosmos_gov_v1_gov.ProposalStatus.from(v),
      ),
      voter: json.valueAsString<String?>('voter', acceptCamelCase: true),
      depositor: json.valueAsString<String?>(
        'depositor',
        acceptCamelCase: true,
      ),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryProposalsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryProposalsRequest(
      proposalStatus: decode.getEnum<cosmos_gov_v1_gov.ProposalStatus?>(
        1,
        cosmos_gov_v1_gov.ProposalStatus.values,
      ),
      voter: decode.getString<String?>(2),
      depositor: decode.getString<String?>(3),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            4,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryProposalsRequest;
  @override
  QueryProposalsResponse onQueryResponse(List<int> bytes) {
    return QueryProposalsResponse.deserialize(bytes);
  }

  @override
  QueryProposalsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryProposalsResponse.fromJson(json);
  }
}

/// QueryProposalsResponse is the response type for the Query/Proposals RPC
/// method.
class QueryProposalsResponse extends CosmosProtoMessage {
  /// proposals defines all the requested governance proposals.
  final List<cosmos_gov_v1_gov.Proposal> proposals;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryProposalsResponse({this.proposals = const [], this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [proposals, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposals': proposals.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryProposalsResponse.fromJson(Map<String, dynamic> json) {
    return QueryProposalsResponse(
      proposals:
          (json.valueEnsureAsList<dynamic>('proposals', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_gov_v1_gov.Proposal,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_gov_v1_gov.Proposal.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryProposalsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryProposalsResponse(
      proposals:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_gov_v1_gov.Proposal.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryProposalsResponse;
}

/// QueryVoteRequest is the request type for the Query/Vote RPC method.
class QueryVoteRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVoteResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// voter defines the voter address for the proposals.
  final String? voter;

  const QueryVoteRequest({this.proposalId, this.voter});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/gov/v1/proposals/{proposal_id}/votes/{voter}",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId, voter];

  @override
  Map<String, dynamic> toJson() {
    return {'proposal_id': proposalId?.toString(), 'voter': voter};
  }

  factory QueryVoteRequest.fromJson(Map<String, dynamic> json) {
    return QueryVoteRequest(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      voter: json.valueAsString<String?>('voter', acceptCamelCase: true),
    );
  }

  factory QueryVoteRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVoteRequest(
      proposalId: decode.getBigInt<BigInt?>(1),
      voter: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryVoteRequest;
  @override
  QueryVoteResponse onQueryResponse(List<int> bytes) {
    return QueryVoteResponse.deserialize(bytes);
  }

  @override
  QueryVoteResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVoteResponse.fromJson(json);
  }
}

/// QueryVoteResponse is the response type for the Query/Vote RPC method.
class QueryVoteResponse extends CosmosProtoMessage {
  /// vote defines the queried vote.
  final cosmos_gov_v1_gov.Vote? vote;

  const QueryVoteResponse({this.vote});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [vote];

  @override
  Map<String, dynamic> toJson() {
    return {'vote': vote?.toJson()};
  }

  factory QueryVoteResponse.fromJson(Map<String, dynamic> json) {
    return QueryVoteResponse(
      vote: json.valueTo<cosmos_gov_v1_gov.Vote?, Map<String, dynamic>>(
        key: 'vote',
        parse: (v) => cosmos_gov_v1_gov.Vote.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryVoteResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVoteResponse(
      vote: decode.messageTo<cosmos_gov_v1_gov.Vote?>(
        1,
        (b) => cosmos_gov_v1_gov.Vote.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryVoteResponse;
}

/// QueryVotesRequest is the request type for the Query/Votes RPC method.
class QueryVotesRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryVotesResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryVotesRequest({this.proposalId, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/gov/v1/proposals/{proposal_id}/votes",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposal_id': proposalId?.toString(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryVotesRequest.fromJson(Map<String, dynamic> json) {
    return QueryVotesRequest(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryVotesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVotesRequest(
      proposalId: decode.getBigInt<BigInt?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryVotesRequest;
  @override
  QueryVotesResponse onQueryResponse(List<int> bytes) {
    return QueryVotesResponse.deserialize(bytes);
  }

  @override
  QueryVotesResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryVotesResponse.fromJson(json);
  }
}

/// QueryVotesResponse is the response type for the Query/Votes RPC method.
class QueryVotesResponse extends CosmosProtoMessage {
  /// votes defines the queried votes.
  final List<cosmos_gov_v1_gov.Vote> votes;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryVotesResponse({this.votes = const [], this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [votes, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'votes': votes.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryVotesResponse.fromJson(Map<String, dynamic> json) {
    return QueryVotesResponse(
      votes:
          (json.valueEnsureAsList<dynamic>('votes', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_gov_v1_gov.Vote,
                  Map<String, dynamic>
                >(value: e, parse: (v) => cosmos_gov_v1_gov.Vote.fromJson(v)),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryVotesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryVotesResponse(
      votes:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_gov_v1_gov.Vote.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryVotesResponse;
}

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class QueryParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryParamsResponse> {
  /// params_type defines which parameters to query for, can be one of "voting",
  /// "tallying" or "deposit".
  final String? paramsType;

  const QueryParamsRequest({this.paramsType});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/gov/v1/params/{params_type}",
        ),
      ],
      fields: [ProtoFieldConfig.string(1)],
    );
  }

  @override
  List<Object?> get protoValues => [paramsType];

  @override
  Map<String, dynamic> toJson() {
    return {'params_type': paramsType};
  }

  factory QueryParamsRequest.fromJson(Map<String, dynamic> json) {
    return QueryParamsRequest(
      paramsType: json.valueAsString<String?>(
        'params_type',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsRequest(paramsType: decode.getString<String?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryParamsRequest;
  @override
  QueryParamsResponse onQueryResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryParamsResponse.fromJson(json);
  }
}

/// QueryParamsResponse is the response type for the Query/Params RPC method.
class QueryParamsResponse extends CosmosProtoMessage {
  /// Deprecated: Prefer to use `params` instead.
  /// voting_params defines the parameters related to voting.
  final cosmos_gov_v1_gov.VotingParams? votingParams;

  /// Deprecated: Prefer to use `params` instead.
  /// deposit_params defines the parameters related to deposit.
  final cosmos_gov_v1_gov.DepositParams? depositParams;

  /// Deprecated: Prefer to use `params` instead.
  /// tally_params defines the parameters related to tally.
  final cosmos_gov_v1_gov.TallyParams? tallyParams;

  /// params defines all the parameters of x/gov module.
  final cosmos_gov_v1_gov.Params? params;

  const QueryParamsResponse({
    this.votingParams,
    this.depositParams,
    this.tallyParams,
    this.params,
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
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.message(
          4,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.47",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    votingParams,
    depositParams,
    tallyParams,
    params,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'voting_params': votingParams?.toJson(),
      'deposit_params': depositParams?.toJson(),
      'tally_params': tallyParams?.toJson(),
      'params': params?.toJson(),
    };
  }

  factory QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return QueryParamsResponse(
      votingParams: json
          .valueTo<cosmos_gov_v1_gov.VotingParams?, Map<String, dynamic>>(
            key: 'voting_params',
            parse: (v) => cosmos_gov_v1_gov.VotingParams.fromJson(v),
            acceptCamelCase: true,
          ),
      depositParams: json
          .valueTo<cosmos_gov_v1_gov.DepositParams?, Map<String, dynamic>>(
            key: 'deposit_params',
            parse: (v) => cosmos_gov_v1_gov.DepositParams.fromJson(v),
            acceptCamelCase: true,
          ),
      tallyParams: json
          .valueTo<cosmos_gov_v1_gov.TallyParams?, Map<String, dynamic>>(
            key: 'tally_params',
            parse: (v) => cosmos_gov_v1_gov.TallyParams.fromJson(v),
            acceptCamelCase: true,
          ),
      params: json.valueTo<cosmos_gov_v1_gov.Params?, Map<String, dynamic>>(
        key: 'params',
        parse: (v) => cosmos_gov_v1_gov.Params.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      votingParams: decode.messageTo<cosmos_gov_v1_gov.VotingParams?>(
        1,
        (b) => cosmos_gov_v1_gov.VotingParams.deserialize(b),
      ),
      depositParams: decode.messageTo<cosmos_gov_v1_gov.DepositParams?>(
        2,
        (b) => cosmos_gov_v1_gov.DepositParams.deserialize(b),
      ),
      tallyParams: decode.messageTo<cosmos_gov_v1_gov.TallyParams?>(
        3,
        (b) => cosmos_gov_v1_gov.TallyParams.deserialize(b),
      ),
      params: decode.messageTo<cosmos_gov_v1_gov.Params?>(
        4,
        (b) => cosmos_gov_v1_gov.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryParamsResponse;
}

/// QueryDepositRequest is the request type for the Query/Deposit RPC method.
class QueryDepositRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDepositResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// depositor defines the deposit addresses from the proposals.
  final String? depositor;

  const QueryDepositRequest({this.proposalId, this.depositor});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/gov/v1/proposals/{proposal_id}/deposits/{depositor}",
        ),
      ],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId, depositor];

  @override
  Map<String, dynamic> toJson() {
    return {'proposal_id': proposalId?.toString(), 'depositor': depositor};
  }

  factory QueryDepositRequest.fromJson(Map<String, dynamic> json) {
    return QueryDepositRequest(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      depositor: json.valueAsString<String?>(
        'depositor',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDepositRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDepositRequest(
      proposalId: decode.getBigInt<BigInt?>(1),
      depositor: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryDepositRequest;
  @override
  QueryDepositResponse onQueryResponse(List<int> bytes) {
    return QueryDepositResponse.deserialize(bytes);
  }

  @override
  QueryDepositResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDepositResponse.fromJson(json);
  }
}

/// QueryDepositResponse is the response type for the Query/Deposit RPC method.
class QueryDepositResponse extends CosmosProtoMessage {
  /// deposit defines the requested deposit.
  final cosmos_gov_v1_gov.Deposit? deposit;

  const QueryDepositResponse({this.deposit});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [deposit];

  @override
  Map<String, dynamic> toJson() {
    return {'deposit': deposit?.toJson()};
  }

  factory QueryDepositResponse.fromJson(Map<String, dynamic> json) {
    return QueryDepositResponse(
      deposit: json.valueTo<cosmos_gov_v1_gov.Deposit?, Map<String, dynamic>>(
        key: 'deposit',
        parse: (v) => cosmos_gov_v1_gov.Deposit.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDepositResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDepositResponse(
      deposit: decode.messageTo<cosmos_gov_v1_gov.Deposit?>(
        1,
        (b) => cosmos_gov_v1_gov.Deposit.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryDepositResponse;
}

/// QueryDepositsRequest is the request type for the Query/Deposits RPC method.
class QueryDepositsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryDepositsResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryDepositsRequest({this.proposalId, this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/gov/v1/proposals/{proposal_id}/deposits",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1), ProtoFieldConfig.message(2)],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposal_id': proposalId?.toString(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryDepositsRequest.fromJson(Map<String, dynamic> json) {
    return QueryDepositsRequest(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageRequest?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) => cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDepositsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDepositsRequest(
      proposalId: decode.getBigInt<BigInt?>(1),
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            2,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryDepositsRequest;
  @override
  QueryDepositsResponse onQueryResponse(List<int> bytes) {
    return QueryDepositsResponse.deserialize(bytes);
  }

  @override
  QueryDepositsResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryDepositsResponse.fromJson(json);
  }
}

/// QueryDepositsResponse is the response type for the Query/Deposits RPC method.
class QueryDepositsResponse extends CosmosProtoMessage {
  /// deposits defines the requested deposits.
  final List<cosmos_gov_v1_gov.Deposit> deposits;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryDepositsResponse({this.deposits = const [], this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [deposits, pagination];

  @override
  Map<String, dynamic> toJson() {
    return {
      'deposits': deposits.map((e) => e.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  factory QueryDepositsResponse.fromJson(Map<String, dynamic> json) {
    return QueryDepositsResponse(
      deposits:
          (json.valueEnsureAsList<dynamic>('deposits', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_gov_v1_gov.Deposit,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_gov_v1_gov.Deposit.fromJson(v),
                ),
              )
              .toList(),
      pagination: json.valueTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?,
        Map<String, dynamic>
      >(
        key: 'pagination',
        parse:
            (v) =>
                cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryDepositsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryDepositsResponse(
      deposits:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_gov_v1_gov.Deposit.deserialize(b))
              .toList(),
      pagination: decode.messageTo<
        cosmos_base_query_v1beta1_pagination.PageResponse?
      >(
        2,
        (b) => cosmos_base_query_v1beta1_pagination.PageResponse.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryDepositsResponse;
}

/// QueryTallyResultRequest is the request type for the Query/Tally RPC method.
class QueryTallyResultRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryTallyResultResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  const QueryTallyResultRequest({this.proposalId});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/cosmos/gov/v1/proposals/{proposal_id}/tally",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId];

  @override
  Map<String, dynamic> toJson() {
    return {'proposal_id': proposalId?.toString()};
  }

  factory QueryTallyResultRequest.fromJson(Map<String, dynamic> json) {
    return QueryTallyResultRequest(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryTallyResultRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTallyResultRequest(proposalId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryTallyResultRequest;
  @override
  QueryTallyResultResponse onQueryResponse(List<int> bytes) {
    return QueryTallyResultResponse.deserialize(bytes);
  }

  @override
  QueryTallyResultResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QueryTallyResultResponse.fromJson(json);
  }
}

/// QueryTallyResultResponse is the response type for the Query/Tally RPC method.
class QueryTallyResultResponse extends CosmosProtoMessage {
  /// tally defines the requested tally.
  final cosmos_gov_v1_gov.TallyResult? tally;

  const QueryTallyResultResponse({this.tally});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [tally];

  @override
  Map<String, dynamic> toJson() {
    return {'tally': tally?.toJson()};
  }

  factory QueryTallyResultResponse.fromJson(Map<String, dynamic> json) {
    return QueryTallyResultResponse(
      tally: json.valueTo<cosmos_gov_v1_gov.TallyResult?, Map<String, dynamic>>(
        key: 'tally',
        parse: (v) => cosmos_gov_v1_gov.TallyResult.fromJson(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory QueryTallyResultResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTallyResultResponse(
      tally: decode.messageTo<cosmos_gov_v1_gov.TallyResult?>(
        1,
        (b) => cosmos_gov_v1_gov.TallyResult.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1QueryTallyResultResponse;
}
