import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/initia/gov/v1/src/gov.dart"
    as initia_gov_v1_gov;
import "package:cosmos_sdk/proto_messages/cosmos/base/query/v1beta1/src/pagination.dart"
    as cosmos_base_query_v1beta1_pagination;
import "package:cosmos_sdk/proto_messages/cosmos/gov/v1/src/gov.dart"
    as cosmos_gov_v1_gov;
import "package:cosmos_sdk/proto_messages/cosmos/gov/v1/src/tx.dart"
    as cosmos_gov_v1_tx;
import "package:cosmos_sdk/proto_messages/cosmos/base/abci/v1beta1/src/abci.dart"
    as cosmos_base_abci_v1beta1_abci;

/// QueryParamsRequest is the request type for the Query/Params RPC method.
class QueryParamsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryParamsResponse> {
  const QueryParamsRequest();

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/gov/v1/params",
        ),
      ],
      fields: [],
    );
  }

  @override
  List<Object?> get protoValues => [];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {};
  }

  factory QueryParamsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryParamsRequest();
  }

  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return QueryParamsRequest();
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1QueryParamsRequest;
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
  /// params defines the parameters of the module.
  final initia_gov_v1_gov.Params? params;

  const QueryParamsResponse({this.params});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [params];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'params': config.encodeMessage(params)};
  }

  factory QueryParamsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryParamsResponse(
      params: json.valueTo<initia_gov_v1_gov.Params?, Object>(
        key: 'params',
        parse:
            (v) => initia_gov_v1_gov.Params.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryParamsResponse(
      params: decode.messageTo<initia_gov_v1_gov.Params?>(
        1,
        (b) => initia_gov_v1_gov.Params.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1QueryParamsResponse;
}

/// QueryEmergencyProposalsRequest is the request type for the
/// Query/EmergencyProposals RPC method
class QueryEmergencyProposalsRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QueryEmergencyProposalsResponse> {
  /// pagination defines an optional pagination for the request.
  final cosmos_base_query_v1beta1_pagination.PageRequest? pagination;

  const QueryEmergencyProposalsRequest({this.pagination});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http.get",
          method: RequestMethod.get,
          path: "/initia/gov/v1/emergency_proposals",
        ),
      ],
      fields: [ProtoFieldConfig.message(1)],
    );
  }

  @override
  List<Object?> get protoValues => [pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'pagination': config.encodeMessage(pagination)};
  }

  factory QueryEmergencyProposalsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEmergencyProposalsRequest(
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryEmergencyProposalsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEmergencyProposalsRequest(
      pagination: decode
          .messageTo<cosmos_base_query_v1beta1_pagination.PageRequest?>(
            1,
            (b) =>
                cosmos_base_query_v1beta1_pagination.PageRequest.deserialize(b),
          ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1QueryEmergencyProposalsRequest;
  @override
  QueryEmergencyProposalsResponse onQueryResponse(List<int> bytes) {
    return QueryEmergencyProposalsResponse.deserialize(bytes);
  }

  @override
  QueryEmergencyProposalsResponse onQueryResponseJson(
    Map<String, dynamic> json,
  ) {
    return QueryEmergencyProposalsResponse.fromJson(json);
  }
}

/// QueryEmergencyProposalsResponse is the response type for the
/// Query/EmergencyProposals RPC method.
class QueryEmergencyProposalsResponse extends CosmosProtoMessage {
  final List<initia_gov_v1_gov.Proposal> proposals;

  /// pagination defines the pagination in the response.
  final cosmos_base_query_v1beta1_pagination.PageResponse? pagination;

  const QueryEmergencyProposalsResponse({
    this.proposals = const [],
    this.pagination,
  });

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
          options: const [],
        ),
        ProtoFieldConfig.message(2),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [proposals, pagination];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'proposals': proposals.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryEmergencyProposalsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryEmergencyProposalsResponse(
      proposals:
          (json.valueEnsureAsList<dynamic>(
                'proposals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<initia_gov_v1_gov.Proposal, Object>(
                  value: e,
                  parse:
                      (v) => initia_gov_v1_gov.Proposal.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryEmergencyProposalsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryEmergencyProposalsResponse(
      proposals:
          decode
              .getListOfBytes(1)
              .map((b) => initia_gov_v1_gov.Proposal.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.initiaGovV1QueryEmergencyProposalsResponse;
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
          path: "/initia/gov/v1/proposals/{proposal_id}",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'proposal_id': config.encodeBigint(proposalId)};
  }

  factory QueryProposalRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryProposalRequest(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryProposalRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryProposalRequest(proposalId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1QueryProposalRequest;
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
  final initia_gov_v1_gov.Proposal? proposal;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'proposal': config.encodeMessage(proposal)};
  }

  factory QueryProposalResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryProposalResponse(
      proposal: json.valueTo<initia_gov_v1_gov.Proposal?, Object>(
        key: 'proposal',
        parse:
            (v) => initia_gov_v1_gov.Proposal.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryProposalResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryProposalResponse(
      proposal: decode.messageTo<initia_gov_v1_gov.Proposal?>(
        1,
        (b) => initia_gov_v1_gov.Proposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1QueryProposalResponse;
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
          path: "/initia/gov/v1/proposals",
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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'proposal_status': config.encodeEnum(proposalStatus),
      'voter': voter,
      'depositor': depositor,
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryProposalsRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryProposalsRequest(
      proposalStatus: json.valueTo<cosmos_gov_v1_gov.ProposalStatus?, Object?>(
        key: 'proposal_status',
        parse: (v) => cosmos_gov_v1_gov.ProposalStatus.from(v),
      ),
      voter: json.valueAsString<String?>(
        'voter',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      depositor: json.valueAsString<String?>(
        'depositor',
        normalizeKeyLookup: config.normalizeKeys,
      ),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageRequest?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageRequest.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
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
      DefaultCosmosProtoTypeUrl.initiaGovV1QueryProposalsRequest;
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
  final List<initia_gov_v1_gov.Proposal> proposals;

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
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'proposals': proposals.map((e) => config.encodeMessage(e)).toList(),
      'pagination': config.encodeMessage(pagination),
    };
  }

  factory QueryProposalsResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryProposalsResponse(
      proposals:
          (json.valueEnsureAsList<dynamic>(
                'proposals',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<initia_gov_v1_gov.Proposal, Object>(
                  value: e,
                  parse:
                      (v) => initia_gov_v1_gov.Proposal.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
      pagination: json
          .valueTo<cosmos_base_query_v1beta1_pagination.PageResponse?, Object>(
            key: 'pagination',
            parse:
                (v) =>
                    cosmos_base_query_v1beta1_pagination.PageResponse.fromJson(
                      JsonParser.valueAs(v),
                      config: config,
                    ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QueryProposalsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryProposalsResponse(
      proposals:
          decode
              .getListOfBytes(1)
              .map((b) => initia_gov_v1_gov.Proposal.deserialize(b))
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
      DefaultCosmosProtoTypeUrl.initiaGovV1QueryProposalsResponse;
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
          path: "/initia/gov/v1/proposals/{proposal_id}/tally",
        ),
      ],
      fields: [ProtoFieldConfig.uint64(1)],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'proposal_id': config.encodeBigint(proposalId)};
  }

  factory QueryTallyResultRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTallyResultRequest(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTallyResultRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTallyResultRequest(proposalId: decode.getBigInt<BigInt?>(1));
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1QueryTallyResultRequest;
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
  final initia_gov_v1_gov.TallyResult? tallyResult;

  const QueryTallyResultResponse({this.tallyResult});

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
      ],
    );
  }

  @override
  List<Object?> get protoValues => [tallyResult];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'tally_result': config.encodeMessage(tallyResult)};
  }

  factory QueryTallyResultResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QueryTallyResultResponse(
      tallyResult: json.valueTo<initia_gov_v1_gov.TallyResult?, Object>(
        key: 'tally_result',
        parse:
            (v) => initia_gov_v1_gov.TallyResult.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
    );
  }

  factory QueryTallyResultResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QueryTallyResultResponse(
      tallyResult: decode.messageTo<initia_gov_v1_gov.TallyResult?>(
        1,
        (b) => initia_gov_v1_gov.TallyResult.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1QueryTallyResultResponse;
}

/// QuerySimulateProposalRequest is the request type for the Query/SimulateProposal RPC method.
class QuerySimulateProposalRequest extends CosmosProtoMessage
    with ICosmosProtoQueryMessage<QuerySimulateProposalResponse> {
  final cosmos_gov_v1_tx.MsgSubmitProposal? msgSubmitProposal;

  const QuerySimulateProposalRequest({this.msgSubmitProposal});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [
        ProtoOptionHttp(
          name: "google.api.http",
          method: RequestMethod.post,
          path: "/initia/gov/v1/simulate_proposal",
        ),
      ],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [msgSubmitProposal];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {'msg_submit_proposal': config.encodeMessage(msgSubmitProposal)};
  }

  factory QuerySimulateProposalRequest.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySimulateProposalRequest(
      msgSubmitProposal: json
          .valueTo<cosmos_gov_v1_tx.MsgSubmitProposal?, Object>(
            key: 'msg_submit_proposal',
            parse:
                (v) => cosmos_gov_v1_tx.MsgSubmitProposal.fromJson(
                  JsonParser.valueAs(v),
                  config: config,
                ),
            normalizeKeyLookup: config.normalizeKeys,
          ),
    );
  }

  factory QuerySimulateProposalRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySimulateProposalRequest(
      msgSubmitProposal: decode.messageTo<cosmos_gov_v1_tx.MsgSubmitProposal?>(
        1,
        (b) => cosmos_gov_v1_tx.MsgSubmitProposal.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1QuerySimulateProposalRequest;
  @override
  QuerySimulateProposalResponse onQueryResponse(List<int> bytes) {
    return QuerySimulateProposalResponse.deserialize(bytes);
  }

  @override
  QuerySimulateProposalResponse onQueryResponseJson(Map<String, dynamic> json) {
    return QuerySimulateProposalResponse.fromJson(json);
  }
}

/// QuerySimulateProposalResponse is the response type for the Query/SimulateProposal RPC method.
class QuerySimulateProposalResponse extends CosmosProtoMessage {
  /// gas_info is the information about gas used in the simulation.
  final cosmos_base_abci_v1beta1_abci.GasInfo? gasInfo;

  /// result is the result of the simulation.
  final List<cosmos_base_abci_v1beta1_abci.Result> results;

  const QuerySimulateProposalResponse({this.gasInfo, this.results = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.message(1, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [gasInfo, results];

  @override
  Map<String, dynamic> toJson({
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return {
      'gas_info': config.encodeMessage(gasInfo),
      'results': results.map((e) => config.encodeMessage(e)).toList(),
    };
  }

  factory QuerySimulateProposalResponse.fromJson(
    Map<String, dynamic> json, {
    CosmosProtoJsonConfing config = CosmosProtoJsonConfing.defaultConfig,
  }) {
    return QuerySimulateProposalResponse(
      gasInfo: json.valueTo<cosmos_base_abci_v1beta1_abci.GasInfo?, Object>(
        key: 'gas_info',
        parse:
            (v) => cosmos_base_abci_v1beta1_abci.GasInfo.fromJson(
              JsonParser.valueAs(v),
              config: config,
            ),
        normalizeKeyLookup: config.normalizeKeys,
      ),
      results:
          (json.valueEnsureAsList<dynamic>(
                'results',
                normalizeKeyLookup: config.normalizeKeys,
                onMissing: () => [],
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_abci_v1beta1_abci.Result,
                  Object
                >(
                  value: e,
                  parse:
                      (v) => cosmos_base_abci_v1beta1_abci.Result.fromJson(
                        JsonParser.valueAs(v),
                        config: config,
                      ),
                ),
              )
              .toList(),
    );
  }

  factory QuerySimulateProposalResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return QuerySimulateProposalResponse(
      gasInfo: decode.messageTo<cosmos_base_abci_v1beta1_abci.GasInfo?>(
        1,
        (b) => cosmos_base_abci_v1beta1_abci.GasInfo.deserialize(b),
      ),
      results:
          decode
              .getListOfBytes(2)
              .map((b) => cosmos_base_abci_v1beta1_abci.Result.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1QuerySimulateProposalResponse;
}
