import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;

/// VoteOption enumerates the valid vote options for a given governance proposal.
enum VoteOption implements ProtoEnumVariant {
  /// VOTE_OPTION_UNSPECIFIED defines a no-op vote option.
  voteOptionUnspecified(0, 'VOTE_OPTION_UNSPECIFIED'),

  /// VOTE_OPTION_YES defines a yes vote option.
  voteOptionYes(1, 'VOTE_OPTION_YES'),

  /// VOTE_OPTION_ABSTAIN defines an abstain vote option.
  voteOptionAbstain(2, 'VOTE_OPTION_ABSTAIN'),

  /// VOTE_OPTION_NO defines a no vote option.
  voteOptionNo(3, 'VOTE_OPTION_NO'),

  /// VOTE_OPTION_NO_WITH_VETO defines a no with veto vote option.
  voteOptionNoWithVeto(4, 'VOTE_OPTION_NO_WITH_VETO');

  const VoteOption(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static VoteOption fromValue(int? value) {
    return VoteOption.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () => throw ItemNotFoundException(name: "VoteOption", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static VoteOption from(Object? value) {
    return VoteOption.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () => throw ItemNotFoundException(name: "VoteOption", value: value),
    );
  }
}

/// ProposalStatus enumerates the valid statuses of a proposal.
enum ProposalStatus implements ProtoEnumVariant {
  /// PROPOSAL_STATUS_UNSPECIFIED defines the default proposal status.
  proposalStatusUnspecified(0, 'PROPOSAL_STATUS_UNSPECIFIED'),

  /// PROPOSAL_STATUS_DEPOSIT_PERIOD defines a proposal status during the deposit
  /// period.
  proposalStatusDepositPeriod(1, 'PROPOSAL_STATUS_DEPOSIT_PERIOD'),

  /// PROPOSAL_STATUS_VOTING_PERIOD defines a proposal status during the voting
  /// period.
  proposalStatusVotingPeriod(2, 'PROPOSAL_STATUS_VOTING_PERIOD'),

  /// PROPOSAL_STATUS_PASSED defines a proposal status of a proposal that has
  /// passed.
  proposalStatusPassed(3, 'PROPOSAL_STATUS_PASSED'),

  /// PROPOSAL_STATUS_REJECTED defines a proposal status of a proposal that has
  /// been rejected.
  proposalStatusRejected(4, 'PROPOSAL_STATUS_REJECTED'),

  /// PROPOSAL_STATUS_FAILED defines a proposal status of a proposal that has
  /// failed.
  proposalStatusFailed(5, 'PROPOSAL_STATUS_FAILED');

  const ProposalStatus(this.value, this.protoName);

  /// The original proto wire value for this enum constant.
  @override
  final int value;

  /// The original proto identifier, e.g. "VOTE_OPTION_UNSPECIFIED".
  @override
  final String protoName;

  /// Looks up a value by its proto wire int. Throws if not found.
  static ProposalStatus fromValue(int? value) {
    return ProposalStatus.values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "ProposalStatus", value: value),
    );
  }

  /// Looks up a value by wire int, Dart enum name, or original proto
  /// name (whichever [value] happens to be). Throws if not found.
  static ProposalStatus from(Object? value) {
    return ProposalStatus.values.firstWhere(
      (e) => e.value == value || e.name == value || e.protoName == value,
      orElse:
          () =>
              throw ItemNotFoundException(name: "ProposalStatus", value: value),
    );
  }
}

/// WeightedVoteOption defines a unit of vote for vote split.
class WeightedVoteOption extends CosmosProtoMessage {
  /// option defines the valid vote options, it must not contain duplicate vote options.
  final VoteOption? option;

  /// weight is the vote weight associated with the vote option.
  final String? weight;

  const WeightedVoteOption({this.option, this.weight});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.enumType(1),
        ProtoFieldConfig.string(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [option, weight];

  @override
  Map<String, dynamic> toJson() {
    return {'option': option?.protoName, 'weight': weight};
  }

  factory WeightedVoteOption.fromJson(Map<String, dynamic> json) {
    return WeightedVoteOption(
      option: json.valueTo<VoteOption?, Object?>(
        key: 'option',
        parse: (v) => VoteOption.from(v),
      ),
      weight: json.valueAsString<String?>('weight', acceptCamelCase: true),
    );
  }

  factory WeightedVoteOption.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return WeightedVoteOption(
      option: decode.getEnum<VoteOption?>(1, VoteOption.values),
      weight: decode.getString<String?>(2),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1WeightedVoteOption;
}

/// Deposit defines an amount deposited by an account address to an active
/// proposal.
class Deposit extends CosmosProtoMessage {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// depositor defines the deposit addresses from the proposals.
  final String? depositor;

  /// amount to be deposited by depositor.
  final List<cosmos_base_v1beta1_coin.Coin> amount;

  const Deposit({this.proposalId, this.depositor, this.amount = const []});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 3,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId, depositor, amount];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposal_id': proposalId?.toString(),
      'depositor': depositor,
      'amount': amount.map((e) => e.toJson()).toList(),
    };
  }

  factory Deposit.fromJson(Map<String, dynamic> json) {
    return Deposit(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      depositor: json.valueAsString<String?>(
        'depositor',
        acceptCamelCase: true,
      ),
      amount:
          (json.valueEnsureAsList<dynamic>('amount', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
    );
  }

  factory Deposit.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Deposit(
      proposalId: decode.getBigInt<BigInt?>(1),
      depositor: decode.getString<String?>(2),
      amount:
          decode
              .getListOfBytes(3)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1Deposit;
}

/// Proposal defines the core field members of a governance proposal.
class Proposal extends CosmosProtoMessage {
  /// id defines the unique id of the proposal.
  final BigInt? id;

  /// messages are the arbitrary messages to be executed if the proposal passes.
  final List<google_protobuf_any.Any> messages;

  /// status defines the proposal status.
  final ProposalStatus? status;

  /// final_tally_result is the final tally result of the proposal. When
  /// querying a proposal via gRPC, this field is not populated until the
  /// proposal's voting period has ended.
  final TallyResult? finalTallyResult;

  /// submit_time is the time of proposal submission.
  final google_protobuf_timestamp.Timestamp? submitTime;

  /// deposit_end_time is the end time for deposition.
  final google_protobuf_timestamp.Timestamp? depositEndTime;

  /// total_deposit is the total deposit on the proposal.
  final List<cosmos_base_v1beta1_coin.Coin> totalDeposit;

  /// voting_start_time is the starting time to vote on a proposal.
  final google_protobuf_timestamp.Timestamp? votingStartTime;

  /// voting_end_time is the end time of voting on a proposal.
  final google_protobuf_timestamp.Timestamp? votingEndTime;

  /// metadata is any arbitrary metadata attached to the proposal.
  /// the recommended format of the metadata is to be found here:
  /// https://docs.cosmos.network/v0.47/modules/gov#proposal-3
  final String? metadata;

  /// title is the title of the proposal
  final String? title;

  /// summary is a short summary of the proposal
  final String? summary;

  /// proposer is the address of the proposal submitter
  final String? proposer;

  /// expedited defines if the proposal is expedited
  final bool? expedited;

  /// failed_reason defines the reason why the proposal failed
  final String? failedReason;

  const Proposal({
    this.id,
    this.messages = const [],
    this.status,
    this.finalTallyResult,
    this.submitTime,
    this.depositEndTime,
    this.totalDeposit = const [],
    this.votingStartTime,
    this.votingEndTime,
    this.metadata,
    this.title,
    this.summary,
    this.proposer,
    this.expedited,
    this.failedReason,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.repeated(
          fieldNumber: 2,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.enumType(3),
        ProtoFieldConfig.message(4),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(8, options: const []),
        ProtoFieldConfig.message(9, options: const []),
        ProtoFieldConfig.string(10),
        ProtoFieldConfig.string(
          11,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.47",
            ),
          ],
        ),
        ProtoFieldConfig.string(
          12,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.47",
            ),
          ],
        ),
        ProtoFieldConfig.string(
          13,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.47",
            ),
          ],
        ),
        ProtoFieldConfig.bool(
          14,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.50",
            ),
          ],
        ),
        ProtoFieldConfig.string(
          15,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.50",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    id,
    messages,
    status,
    finalTallyResult,
    submitTime,
    depositEndTime,
    totalDeposit,
    votingStartTime,
    votingEndTime,
    metadata,
    title,
    summary,
    proposer,
    expedited,
    failedReason,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id?.toString(),
      'messages': messages.map((e) => e.toJson()).toList(),
      'status': status?.protoName,
      'final_tally_result': finalTallyResult?.toJson(),
      'submit_time': submitTime?.toRfc3339(),
      'deposit_end_time': depositEndTime?.toRfc3339(),
      'total_deposit': totalDeposit.map((e) => e.toJson()).toList(),
      'voting_start_time': votingStartTime?.toRfc3339(),
      'voting_end_time': votingEndTime?.toRfc3339(),
      'metadata': metadata,
      'title': title,
      'summary': summary,
      'proposer': proposer,
      'expedited': expedited,
      'failed_reason': failedReason,
    };
  }

  factory Proposal.fromJson(Map<String, dynamic> json) {
    return Proposal(
      id: json.valueAsBigInt<BigInt?>('id', acceptCamelCase: true),
      messages:
          (json.valueEnsureAsList<dynamic>('messages', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  google_protobuf_any.Any,
                  Map<String, dynamic>
                >(value: e, parse: (v) => google_protobuf_any.Any.fromJson(v)),
              )
              .toList(),
      status: json.valueTo<ProposalStatus?, Object?>(
        key: 'status',
        parse: (v) => ProposalStatus.from(v),
      ),
      finalTallyResult: json.valueTo<TallyResult?, Map<String, dynamic>>(
        key: 'final_tally_result',
        parse: (v) => TallyResult.fromJson(v),
        acceptCamelCase: true,
      ),
      submitTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'submit_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      depositEndTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'deposit_end_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      totalDeposit:
          (json.valueEnsureAsList<dynamic>(
                'total_deposit',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      votingStartTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'voting_start_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      votingEndTime: json.valueTo<google_protobuf_timestamp.Timestamp?, String>(
        key: 'voting_end_time',
        parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
        acceptCamelCase: true,
      ),
      metadata: json.valueAsString<String?>('metadata', acceptCamelCase: true),
      title: json.valueAsString<String?>('title', acceptCamelCase: true),
      summary: json.valueAsString<String?>('summary', acceptCamelCase: true),
      proposer: json.valueAsString<String?>('proposer', acceptCamelCase: true),
      expedited: json.valueAsBool<bool?>('expedited', acceptCamelCase: true),
      failedReason: json.valueAsString<String?>(
        'failed_reason',
        acceptCamelCase: true,
      ),
    );
  }

  factory Proposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Proposal(
      id: decode.getBigInt<BigInt?>(1),
      messages:
          decode
              .getListOfBytes(2)
              .map((b) => google_protobuf_any.Any.deserialize(b))
              .toList(),
      status: decode.getEnum<ProposalStatus?>(3, ProposalStatus.values),
      finalTallyResult: decode.messageTo<TallyResult?>(
        4,
        (b) => TallyResult.deserialize(b),
      ),
      submitTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        5,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      depositEndTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        6,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      totalDeposit:
          decode
              .getListOfBytes(7)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      votingStartTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        8,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      votingEndTime: decode.messageTo<google_protobuf_timestamp.Timestamp?>(
        9,
        (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
      ),
      metadata: decode.getString<String?>(10),
      title: decode.getString<String?>(11),
      summary: decode.getString<String?>(12),
      proposer: decode.getString<String?>(13),
      expedited: decode.getBool<bool?>(14),
      failedReason: decode.getString<String?>(15),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1Proposal;
}

/// TallyResult defines a standard tally for a governance proposal.
class TallyResult extends CosmosProtoMessage {
  /// yes_count is the number of yes votes on a proposal.
  final String? yesCount;

  /// abstain_count is the number of abstain votes on a proposal.
  final String? abstainCount;

  /// no_count is the number of no votes on a proposal.
  final String? noCount;

  /// no_with_veto_count is the number of no with veto votes on a proposal.
  final String? noWithVetoCount;

  const TallyResult({
    this.yesCount,
    this.abstainCount,
    this.noCount,
    this.noWithVetoCount,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    yesCount,
    abstainCount,
    noCount,
    noWithVetoCount,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'yes_count': yesCount,
      'abstain_count': abstainCount,
      'no_count': noCount,
      'no_with_veto_count': noWithVetoCount,
    };
  }

  factory TallyResult.fromJson(Map<String, dynamic> json) {
    return TallyResult(
      yesCount: json.valueAsString<String?>('yes_count', acceptCamelCase: true),
      abstainCount: json.valueAsString<String?>(
        'abstain_count',
        acceptCamelCase: true,
      ),
      noCount: json.valueAsString<String?>('no_count', acceptCamelCase: true),
      noWithVetoCount: json.valueAsString<String?>(
        'no_with_veto_count',
        acceptCamelCase: true,
      ),
    );
  }

  factory TallyResult.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TallyResult(
      yesCount: decode.getString<String?>(1),
      abstainCount: decode.getString<String?>(2),
      noCount: decode.getString<String?>(3),
      noWithVetoCount: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1TallyResult;
}

/// Vote defines a vote on a governance proposal.
/// A Vote consists of a proposal ID, the voter, and the vote option.
class Vote extends CosmosProtoMessage {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// voter is the voter address of the proposal.
  final String? voter;

  /// options is the weighted vote options.
  final List<WeightedVoteOption> options;

  /// metadata is any arbitrary metadata attached to the vote.
  /// the recommended format of the metadata is to be found here: https://docs.cosmos.network/v0.47/modules/gov#vote-5
  final String? metadata;

  const Vote({
    this.proposalId,
    this.voter,
    this.options = const [],
    this.metadata,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
        ),
        ProtoFieldConfig.string(5),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId, voter, options, metadata];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposal_id': proposalId?.toString(),
      'voter': voter,
      'options': options.map((e) => e.toJson()).toList(),
      'metadata': metadata,
    };
  }

  factory Vote.fromJson(Map<String, dynamic> json) {
    return Vote(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      voter: json.valueAsString<String?>('voter', acceptCamelCase: true),
      options:
          (json.valueEnsureAsList<dynamic>('options', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  WeightedVoteOption,
                  Map<String, dynamic>
                >(value: e, parse: (v) => WeightedVoteOption.fromJson(v)),
              )
              .toList(),
      metadata: json.valueAsString<String?>('metadata', acceptCamelCase: true),
    );
  }

  factory Vote.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Vote(
      proposalId: decode.getBigInt<BigInt?>(1),
      voter: decode.getString<String?>(2),
      options:
          decode
              .getListOfBytes(4)
              .map((b) => WeightedVoteOption.deserialize(b))
              .toList(),
      metadata: decode.getString<String?>(5),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1Vote;
}

/// DepositParams defines the params for deposits on governance proposals.
class DepositParams extends CosmosProtoMessage {
  /// Minimum deposit for a proposal to enter voting period.
  final List<cosmos_base_v1beta1_coin.Coin> minDeposit;

  /// Maximum period for Atom holders to deposit on a proposal. Initial value: 2
  /// months.
  final google_protobuf_duration.Duration? maxDepositPeriod;

  const DepositParams({this.minDeposit = const [], this.maxDepositPeriod});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: const [],
        ),
        ProtoFieldConfig.message(2, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [minDeposit, maxDepositPeriod];

  @override
  Map<String, dynamic> toJson() {
    return {
      'min_deposit': minDeposit.map((e) => e.toJson()).toList(),
      'max_deposit_period': maxDepositPeriod?.encodeString(asNanos: true),
    };
  }

  factory DepositParams.fromJson(Map<String, dynamic> json) {
    return DepositParams(
      minDeposit:
          (json.valueEnsureAsList<dynamic>(
                'min_deposit',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      maxDepositPeriod: json
          .valueTo<google_protobuf_duration.Duration?, String>(
            key: 'max_deposit_period',
            parse: (v) => google_protobuf_duration.Duration.fromString(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory DepositParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return DepositParams(
      minDeposit:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      maxDepositPeriod: decode.messageTo<google_protobuf_duration.Duration?>(
        2,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1DepositParams;
}

/// VotingParams defines the params for voting on governance proposals.
class VotingParams extends CosmosProtoMessage {
  /// Duration of the voting period.
  final google_protobuf_duration.Duration? votingPeriod;

  const VotingParams({this.votingPeriod});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [ProtoFieldConfig.message(1, options: const [])],
    );
  }

  @override
  List<Object?> get protoValues => [votingPeriod];

  @override
  Map<String, dynamic> toJson() {
    return {'voting_period': votingPeriod?.encodeString(asNanos: true)};
  }

  factory VotingParams.fromJson(Map<String, dynamic> json) {
    return VotingParams(
      votingPeriod: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'voting_period',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
    );
  }

  factory VotingParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return VotingParams(
      votingPeriod: decode.messageTo<google_protobuf_duration.Duration?>(
        1,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1VotingParams;
}

/// TallyParams defines the params for tallying votes on governance proposals.
class TallyParams extends CosmosProtoMessage {
  /// Minimum percentage of total stake needed to vote for a result to be
  /// considered valid.
  final String? quorum;

  /// Minimum proportion of Yes votes for proposal to pass. Default value: 0.5.
  final String? threshold;

  /// Minimum value of Veto votes to Total votes ratio for proposal to be
  /// vetoed. Default value: 1/3.
  final String? vetoThreshold;

  const TallyParams({this.quorum, this.threshold, this.vetoThreshold});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionBool(name: "deprecated", value: true)],
      fields: [
        ProtoFieldConfig.string(1, options: const []),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.string(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [quorum, threshold, vetoThreshold];

  @override
  Map<String, dynamic> toJson() {
    return {
      'quorum': quorum,
      'threshold': threshold,
      'veto_threshold': vetoThreshold,
    };
  }

  factory TallyParams.fromJson(Map<String, dynamic> json) {
    return TallyParams(
      quorum: json.valueAsString<String?>('quorum', acceptCamelCase: true),
      threshold: json.valueAsString<String?>(
        'threshold',
        acceptCamelCase: true,
      ),
      vetoThreshold: json.valueAsString<String?>(
        'veto_threshold',
        acceptCamelCase: true,
      ),
    );
  }

  factory TallyParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TallyParams(
      quorum: decode.getString<String?>(1),
      threshold: decode.getString<String?>(2),
      vetoThreshold: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1TallyParams;
}

/// Params defines the parameters for the x/gov module.
class Params extends CosmosProtoMessage {
  /// Minimum deposit for a proposal to enter voting period.
  final List<cosmos_base_v1beta1_coin.Coin> minDeposit;

  /// Maximum period for Atom holders to deposit on a proposal. Initial value: 2
  /// months.
  final google_protobuf_duration.Duration? maxDepositPeriod;

  /// Duration of the voting period.
  final google_protobuf_duration.Duration? votingPeriod;

  /// Minimum percentage of total stake needed to vote for a result to be
  /// considered valid.
  final String? quorum;

  /// Minimum proportion of Yes votes for proposal to pass. Default value: 0.5.
  final String? threshold;

  /// Minimum value of Veto votes to Total votes ratio for proposal to be
  /// vetoed. Default value: 1/3.
  final String? vetoThreshold;

  /// The ratio representing the proportion of the deposit value that must be paid at proposal submission.
  final String? minInitialDepositRatio;

  /// The cancel ratio which will not be returned back to the depositors when a proposal is cancelled.
  final String? proposalCancelRatio;

  /// The address which will receive (proposal_cancel_ratio * deposit) proposal deposits.
  /// If empty, the (proposal_cancel_ratio * deposit) proposal deposits will be burned.
  final String? proposalCancelDest;

  /// Duration of the voting period of an expedited proposal.
  final google_protobuf_duration.Duration? expeditedVotingPeriod;

  /// Minimum proportion of Yes votes for proposal to pass. Default value: 0.67.
  final String? expeditedThreshold;

  /// Minimum expedited deposit for a proposal to enter voting period.
  final List<cosmos_base_v1beta1_coin.Coin> expeditedMinDeposit;

  /// burn deposits if a proposal does not meet quorum
  final bool? burnVoteQuorum;

  /// burn deposits if the proposal does not enter voting period
  final bool? burnProposalDepositPrevote;

  /// burn deposits if quorum with vote type no_veto is met
  final bool? burnVoteVeto;

  /// The ratio representing the proportion of the deposit value minimum that must be met when making a deposit.
  /// Default value: 0.01. Meaning that for a chain with a min_deposit of 100stake, a deposit of 1stake would be
  /// required.
  final String? minDepositRatio;

  const Params({
    this.minDeposit = const [],
    this.maxDepositPeriod,
    this.votingPeriod,
    this.quorum,
    this.threshold,
    this.vetoThreshold,
    this.minInitialDepositRatio,
    this.proposalCancelRatio,
    this.proposalCancelDest,
    this.expeditedVotingPeriod,
    this.expeditedThreshold,
    this.expeditedMinDeposit = const [],
    this.burnVoteQuorum,
    this.burnProposalDepositPrevote,
    this.burnVoteVeto,
    this.minDepositRatio,
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
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.message(3, options: const []),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(
          8,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.50",
            ),
          ],
        ),
        ProtoFieldConfig.string(
          9,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.50",
            ),
          ],
        ),
        ProtoFieldConfig.message(
          10,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.50",
            ),
          ],
        ),
        ProtoFieldConfig.string(
          11,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.50",
            ),
          ],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 12,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bool(13),
        ProtoFieldConfig.bool(14),
        ProtoFieldConfig.bool(15),
        ProtoFieldConfig.string(
          16,
          options: [
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.50",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    minDeposit,
    maxDepositPeriod,
    votingPeriod,
    quorum,
    threshold,
    vetoThreshold,
    minInitialDepositRatio,
    proposalCancelRatio,
    proposalCancelDest,
    expeditedVotingPeriod,
    expeditedThreshold,
    expeditedMinDeposit,
    burnVoteQuorum,
    burnProposalDepositPrevote,
    burnVoteVeto,
    minDepositRatio,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'min_deposit': minDeposit.map((e) => e.toJson()).toList(),
      'max_deposit_period': maxDepositPeriod?.encodeString(asNanos: true),
      'voting_period': votingPeriod?.encodeString(asNanos: true),
      'quorum': quorum,
      'threshold': threshold,
      'veto_threshold': vetoThreshold,
      'min_initial_deposit_ratio': minInitialDepositRatio,
      'proposal_cancel_ratio': proposalCancelRatio,
      'proposal_cancel_dest': proposalCancelDest,
      'expedited_voting_period': expeditedVotingPeriod?.encodeString(
        asNanos: true,
      ),
      'expedited_threshold': expeditedThreshold,
      'expedited_min_deposit':
          expeditedMinDeposit.map((e) => e.toJson()).toList(),
      'burn_vote_quorum': burnVoteQuorum,
      'burn_proposal_deposit_prevote': burnProposalDepositPrevote,
      'burn_vote_veto': burnVoteVeto,
      'min_deposit_ratio': minDepositRatio,
    };
  }

  factory Params.fromJson(Map<String, dynamic> json) {
    return Params(
      minDeposit:
          (json.valueEnsureAsList<dynamic>(
                'min_deposit',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      maxDepositPeriod: json
          .valueTo<google_protobuf_duration.Duration?, String>(
            key: 'max_deposit_period',
            parse: (v) => google_protobuf_duration.Duration.fromString(v),
            acceptCamelCase: true,
          ),
      votingPeriod: json.valueTo<google_protobuf_duration.Duration?, String>(
        key: 'voting_period',
        parse: (v) => google_protobuf_duration.Duration.fromString(v),
        acceptCamelCase: true,
      ),
      quorum: json.valueAsString<String?>('quorum', acceptCamelCase: true),
      threshold: json.valueAsString<String?>(
        'threshold',
        acceptCamelCase: true,
      ),
      vetoThreshold: json.valueAsString<String?>(
        'veto_threshold',
        acceptCamelCase: true,
      ),
      minInitialDepositRatio: json.valueAsString<String?>(
        'min_initial_deposit_ratio',
        acceptCamelCase: true,
      ),
      proposalCancelRatio: json.valueAsString<String?>(
        'proposal_cancel_ratio',
        acceptCamelCase: true,
      ),
      proposalCancelDest: json.valueAsString<String?>(
        'proposal_cancel_dest',
        acceptCamelCase: true,
      ),
      expeditedVotingPeriod: json
          .valueTo<google_protobuf_duration.Duration?, String>(
            key: 'expedited_voting_period',
            parse: (v) => google_protobuf_duration.Duration.fromString(v),
            acceptCamelCase: true,
          ),
      expeditedThreshold: json.valueAsString<String?>(
        'expedited_threshold',
        acceptCamelCase: true,
      ),
      expeditedMinDeposit:
          (json.valueEnsureAsList<dynamic>(
                'expedited_min_deposit',
                acceptCamelCase: true,
              ))
              .map(
                (e) => JsonParser.valueTo<
                  cosmos_base_v1beta1_coin.Coin,
                  Map<String, dynamic>
                >(
                  value: e,
                  parse: (v) => cosmos_base_v1beta1_coin.Coin.fromJson(v),
                ),
              )
              .toList(),
      burnVoteQuorum: json.valueAsBool<bool?>(
        'burn_vote_quorum',
        acceptCamelCase: true,
      ),
      burnProposalDepositPrevote: json.valueAsBool<bool?>(
        'burn_proposal_deposit_prevote',
        acceptCamelCase: true,
      ),
      burnVoteVeto: json.valueAsBool<bool?>(
        'burn_vote_veto',
        acceptCamelCase: true,
      ),
      minDepositRatio: json.valueAsString<String?>(
        'min_deposit_ratio',
        acceptCamelCase: true,
      ),
    );
  }

  factory Params.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Params(
      minDeposit:
          decode
              .getListOfBytes(1)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      maxDepositPeriod: decode.messageTo<google_protobuf_duration.Duration?>(
        2,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      votingPeriod: decode.messageTo<google_protobuf_duration.Duration?>(
        3,
        (b) => google_protobuf_duration.Duration.deserialize(b),
      ),
      quorum: decode.getString<String?>(4),
      threshold: decode.getString<String?>(5),
      vetoThreshold: decode.getString<String?>(6),
      minInitialDepositRatio: decode.getString<String?>(7),
      proposalCancelRatio: decode.getString<String?>(8),
      proposalCancelDest: decode.getString<String?>(9),
      expeditedVotingPeriod: decode
          .messageTo<google_protobuf_duration.Duration?>(
            10,
            (b) => google_protobuf_duration.Duration.deserialize(b),
          ),
      expeditedThreshold: decode.getString<String?>(11),
      expeditedMinDeposit:
          decode
              .getListOfBytes(12)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      burnVoteQuorum: decode.getBool<bool?>(13),
      burnProposalDepositPrevote: decode.getBool<bool?>(14),
      burnVoteVeto: decode.getBool<bool?>(15),
      minDepositRatio: decode.getString<String?>(16),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1Params;
}
