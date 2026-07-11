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
        ProtoFieldConfig.string(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
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
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1WeightedVoteOption;
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
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1Deposit;
}

/// Proposal defines the core field members of a governance proposal.
class Proposal extends CosmosProtoMessage {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// content is the proposal's content.
  final google_protobuf_any.Any? content;

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

  const Proposal({
    this.proposalId,
    this.content,
    this.status,
    this.finalTallyResult,
    this.submitTime,
    this.depositEndTime,
    this.totalDeposit = const [],
    this.votingStartTime,
    this.votingEndTime,
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(1),
        ProtoFieldConfig.message(2, options: const []),
        ProtoFieldConfig.enumType(3),
        ProtoFieldConfig.message(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          5,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          6,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          8,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          9,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    proposalId,
    content,
    status,
    finalTallyResult,
    submitTime,
    depositEndTime,
    totalDeposit,
    votingStartTime,
    votingEndTime,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposal_id': proposalId?.toString(),
      'content': content?.toJson(),
      'status': status?.protoName,
      'final_tally_result': finalTallyResult?.toJson(),
      'submit_time': submitTime?.toRfc3339(),
      'deposit_end_time': depositEndTime?.toRfc3339(),
      'total_deposit': totalDeposit.map((e) => e.toJson()).toList(),
      'voting_start_time': votingStartTime?.toRfc3339(),
      'voting_end_time': votingEndTime?.toRfc3339(),
    };
  }

  factory Proposal.fromJson(Map<String, dynamic> json) {
    return Proposal(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      content: json.valueTo<google_protobuf_any.Any?, Map<String, dynamic>>(
        key: 'content',
        parse: (v) => google_protobuf_any.Any.fromJson(v),
        acceptCamelCase: true,
      ),
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
    );
  }

  factory Proposal.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Proposal(
      proposalId: decode.getBigInt<BigInt?>(1),
      content: decode.messageTo<google_protobuf_any.Any?>(
        2,
        (b) => google_protobuf_any.Any.deserialize(b),
      ),
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
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1Proposal;
}

/// TallyResult defines a standard tally for a governance proposal.
class TallyResult extends CosmosProtoMessage {
  /// yes is the number of yes votes on a proposal.
  final String? yes;

  /// abstain is the number of abstain votes on a proposal.
  final String? abstain;

  /// no is the number of no votes on a proposal.
  final String? no;

  /// no_with_veto is the number of no with veto votes on a proposal.
  final String? noWithVeto;

  const TallyResult({this.yes, this.abstain, this.no, this.noWithVeto});

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
  List<Object?> get protoValues => [yes, abstain, no, noWithVeto];

  @override
  Map<String, dynamic> toJson() {
    return {
      'yes': yes,
      'abstain': abstain,
      'no': no,
      'no_with_veto': noWithVeto,
    };
  }

  factory TallyResult.fromJson(Map<String, dynamic> json) {
    return TallyResult(
      yes: json.valueAsString<String?>('yes', acceptCamelCase: true),
      abstain: json.valueAsString<String?>('abstain', acceptCamelCase: true),
      no: json.valueAsString<String?>('no', acceptCamelCase: true),
      noWithVeto: json.valueAsString<String?>(
        'no_with_veto',
        acceptCamelCase: true,
      ),
    );
  }

  factory TallyResult.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TallyResult(
      yes: decode.getString<String?>(1),
      abstain: decode.getString<String?>(2),
      no: decode.getString<String?>(3),
      noWithVeto: decode.getString<String?>(4),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1TallyResult;
}

/// Vote defines a vote on a governance proposal.
/// A Vote consists of a proposal ID, the voter, and the vote option.
class Vote extends CosmosProtoMessage {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// voter is the voter address of the proposal.
  final String? voter;

  /// Deprecated: Prefer to use `options` instead. This field is set in queries
  /// if and only if `len(options) == 1` and that option has weight 1. In all
  /// other cases, this field will default to VOTE_OPTION_UNSPECIFIED.
  final VoteOption? option;

  /// options is the weighted vote options.
  final List<WeightedVoteOption> options;

  const Vote({
    this.proposalId,
    this.voter,
    this.option,
    this.options = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.uint64(
          1,
          options: [
            ProtoOptionString(name: "amino.field_name", value: "id"),
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
          ],
        ),
        ProtoFieldConfig.string(2, options: const []),
        ProtoFieldConfig.enumType(
          3,
          options: [ProtoOptionBool(name: "deprecated", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 4,
          elementType: ProtoFieldType.message,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: true),
            ProtoOptionString(
              name: "cosmos_proto.field_added_in",
              value: "cosmos-sdk 0.43",
            ),
          ],
        ),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [proposalId, voter, option, options];

  @override
  Map<String, dynamic> toJson() {
    return {
      'proposal_id': proposalId?.toString(),
      'voter': voter,
      'option': option?.protoName,
      'options': options.map((e) => e.toJson()).toList(),
    };
  }

  factory Vote.fromJson(Map<String, dynamic> json) {
    return Vote(
      proposalId: json.valueAsBigInt<BigInt?>(
        'proposal_id',
        acceptCamelCase: true,
      ),
      voter: json.valueAsString<String?>('voter', acceptCamelCase: true),
      option: json.valueTo<VoteOption?, Object?>(
        key: 'option',
        parse: (v) => VoteOption.from(v),
      ),
      options:
          (json.valueEnsureAsList<dynamic>('options', acceptCamelCase: true))
              .map(
                (e) => JsonParser.valueTo<
                  WeightedVoteOption,
                  Map<String, dynamic>
                >(value: e, parse: (v) => WeightedVoteOption.fromJson(v)),
              )
              .toList(),
    );
  }

  factory Vote.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Vote(
      proposalId: decode.getBigInt<BigInt?>(1),
      voter: decode.getString<String?>(2),
      option: decode.getEnum<VoteOption?>(3, VoteOption.values),
      options:
          decode
              .getListOfBytes(4)
              .map((b) => WeightedVoteOption.deserialize(b))
              .toList(),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1Vote;
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
      options: const [],
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
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1DepositParams;
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
      options: const [],
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
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1VotingParams;
}

/// TallyParams defines the params for tallying votes on governance proposals.
class TallyParams extends CosmosProtoMessage {
  /// Minimum percentage of total stake needed to vote for a result to be
  /// considered valid.
  final List<int>? quorum;

  /// Minimum proportion of Yes votes for proposal to pass. Default value: 0.5.
  final List<int>? threshold;

  /// Minimum value of Veto votes to Total votes ratio for proposal to be
  /// vetoed. Default value: 1/3.
  final List<int>? vetoThreshold;

  const TallyParams({this.quorum, this.threshold, this.vetoThreshold});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.bytes(1, options: const []),
        ProtoFieldConfig.bytes(2, options: const []),
        ProtoFieldConfig.bytes(3, options: const []),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [quorum, threshold, vetoThreshold];

  @override
  Map<String, dynamic> toJson() {
    return {
      'quorum': switch (quorum) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'threshold': switch (threshold) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
      'veto_threshold': switch (vetoThreshold) {
        List<int> bytes => StringUtils.decode(
          bytes,
          encoding: StringEncoding.base64,
        ),
        _ => null,
      },
    };
  }

  factory TallyParams.fromJson(Map<String, dynamic> json) {
    return TallyParams(
      quorum: json.valueAsBytes<List<int>?>(
        'quorum',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      threshold: json.valueAsBytes<List<int>?>(
        'threshold',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
      vetoThreshold: json.valueAsBytes<List<int>?>(
        'veto_threshold',
        acceptCamelCase: true,
        encoding: StringEncoding.base64,
      ),
    );
  }

  factory TallyParams.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TallyParams(
      quorum: decode.getBytes<List<int>?>(1),
      threshold: decode.getBytes<List<int>?>(2),
      vetoThreshold: decode.getBytes<List<int>?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.cosmosGovV1beta1TallyParams;
}
