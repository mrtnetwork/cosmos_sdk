import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/proto_messages/types.dart';
import 'package:cosmos_sdk/sdk/serialization/serialization.dart';
import "package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart"
    as cosmos_base_v1beta1_coin;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/duration.dart"
    as google_protobuf_duration;
import "package:cosmos_sdk/proto_messages/cosmos/gov/v1/src/gov.dart"
    as cosmos_gov_v1_gov;
import "package:cosmos_sdk/sdk/serialization/buffer/any.dart"
    as google_protobuf_any;
import "package:cosmos_sdk/proto_messages/google/protobuf/src/timestamp.dart"
    as google_protobuf_timestamp;

/// option (gogoproto.equal_all) = true;
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
  ///
  /// Since: cosmos-sdk 0.50
  final String? proposalCancelRatio;

  /// The address which will receive (proposal_cancel_ratio * deposit) proposal deposits.
  /// If empty, the (proposal_cancel_ratio * deposit) proposal deposits will be burned.
  ///
  /// Since: cosmos-sdk 0.50
  final String? proposalCancelDest;

  /// Duration of the voting period of an expedited proposal.
  ///
  /// Since: cosmos-sdk 0.50
  final google_protobuf_duration.Duration? expeditedVotingPeriod;

  /// Minimum proportion of Yes votes for proposal to pass. Default value: 0.67.
  ///
  /// Since: cosmos-sdk 0.50
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
  ///
  /// Since: cosmos-sdk 0.50
  final String? minDepositRatio;

  /// Minimum deposit for a emergency proposal to enter voting period.
  final List<cosmos_base_v1beta1_coin.Coin> emergencyMinDeposit;

  /// Tally interval for emergency proposal.
  final google_protobuf_duration.Duration? emergencyTallyInterval;

  /// Low threshold functions for emergency and expedited proposal.
  /// These are Move function identifiers and can only be applied
  /// for Move execute messages.
  final List<String> lowThresholdFunctions;

  /// Vesting is the vesting contract info for tally.
  final Vesting? vesting;

  /// Whitelist addresses that can submit emergency proposals.
  final List<String> emergencySubmitters;

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
    this.emergencyMinDeposit = const [],
    this.emergencyTallyInterval,
    this.lowThresholdFunctions = const [],
    this.vesting,
    this.emergencySubmitters = const [],
  });

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: [ProtoOptionString(name: "amino.name", value: "gov/Params")],
      fields: [
        ProtoFieldConfig.repeated(
          fieldNumber: 1,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          2,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          3,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(4, options: const []),
        ProtoFieldConfig.string(5, options: const []),
        ProtoFieldConfig.string(6, options: const []),
        ProtoFieldConfig.string(7, options: const []),
        ProtoFieldConfig.string(8, options: const []),
        ProtoFieldConfig.string(9, options: const []),
        ProtoFieldConfig.message(
          10,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.string(11, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 12,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.bool(13),
        ProtoFieldConfig.bool(14),
        ProtoFieldConfig.bool(15),
        ProtoFieldConfig.string(16, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 91,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(
          92,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 93,
          elementType: ProtoFieldType.string,
        ),
        ProtoFieldConfig.message(
          94,
          options: [
            ProtoOptionBool(name: "amino.dont_omitempty", value: false),
          ],
        ),
        ProtoFieldConfig.repeated(
          fieldNumber: 95,
          elementType: ProtoFieldType.string,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
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
    emergencyMinDeposit,
    emergencyTallyInterval,
    lowThresholdFunctions,
    vesting,
    emergencySubmitters,
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
      'emergency_min_deposit':
          emergencyMinDeposit.map((e) => e.toJson()).toList(),
      'emergency_tally_interval': emergencyTallyInterval?.encodeString(
        asNanos: true,
      ),
      'low_threshold_functions': lowThresholdFunctions.map((e) => e).toList(),
      'vesting': vesting?.toJson(),
      'emergency_submitters': emergencySubmitters.map((e) => e).toList(),
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
      emergencyMinDeposit:
          (json.valueEnsureAsList<dynamic>(
                'emergency_min_deposit',
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
      emergencyTallyInterval: json
          .valueTo<google_protobuf_duration.Duration?, String>(
            key: 'emergency_tally_interval',
            parse: (v) => google_protobuf_duration.Duration.fromString(v),
            acceptCamelCase: true,
          ),
      lowThresholdFunctions:
          (json.valueEnsureAsList<dynamic>(
            'low_threshold_functions',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
      vesting: json.valueTo<Vesting?, Map<String, dynamic>>(
        key: 'vesting',
        parse: (v) => Vesting.fromJson(v),
        acceptCamelCase: true,
      ),
      emergencySubmitters:
          (json.valueEnsureAsList<dynamic>(
            'emergency_submitters',
            acceptCamelCase: true,
          )).map((e) => JsonParser.valueAsString<String>(e)).toList(),
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
      emergencyMinDeposit:
          decode
              .getListOfBytes(91)
              .map((b) => cosmos_base_v1beta1_coin.Coin.deserialize(b))
              .toList(),
      emergencyTallyInterval: decode
          .messageTo<google_protobuf_duration.Duration?>(
            92,
            (b) => google_protobuf_duration.Duration.deserialize(b),
          ),
      lowThresholdFunctions: decode.getListOrEmpty<String>(93),
      vesting: decode.messageTo<Vesting?>(94, (b) => Vesting.deserialize(b)),
      emergencySubmitters: decode.getListOrEmpty<String>(95),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1Params;
}

/// Vesting defines the vesting contract info for MsgVestingVote.
/// At tally time, gov module would check vesting token amount.
class Vesting extends CosmosProtoMessage {
  /// module_addr is the address of the vesting module.
  final String? moduleAddr;

  /// module_name is the name of the vesting module.
  final String? moduleName;

  /// creator_addr is the address of the creator of the vesting contract.
  final String? creatorAddr;

  const Vesting({this.moduleAddr, this.moduleName, this.creatorAddr});

  @override
  ProtoMessageConfig protoConfig() => protoConfigStatic();

  static ProtoMessageConfig protoConfigStatic() {
    return ProtoMessageConfig(
      syntax: ProtoSyntax.v3,
      options: const [],
      fields: [
        ProtoFieldConfig.string(1),
        ProtoFieldConfig.string(2),
        ProtoFieldConfig.string(3),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [moduleAddr, moduleName, creatorAddr];

  @override
  Map<String, dynamic> toJson() {
    return {
      'module_addr': moduleAddr,
      'module_name': moduleName,
      'creator_addr': creatorAddr,
    };
  }

  factory Vesting.fromJson(Map<String, dynamic> json) {
    return Vesting(
      moduleAddr: json.valueAsString<String?>(
        'module_addr',
        acceptCamelCase: true,
      ),
      moduleName: json.valueAsString<String?>(
        'module_name',
        acceptCamelCase: true,
      ),
      creatorAddr: json.valueAsString<String?>(
        'creator_addr',
        acceptCamelCase: true,
      ),
    );
  }

  factory Vesting.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return Vesting(
      moduleAddr: decode.getString<String?>(1),
      moduleName: decode.getString<String?>(2),
      creatorAddr: decode.getString<String?>(3),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1Vesting;
}

/// TallyResult defines the result of a tally.
class TallyResult extends CosmosProtoMessage {
  final BigInt? tallyHeight;

  final String? totalStakingPower;

  final String? totalVestingPower;

  /// v1_tally_result is the original TallyResult from cosmos-sdk,
  /// which contains both staking and vesting power.
  final cosmos_gov_v1_gov.TallyResult? v1TallyResult;

  const TallyResult({
    this.tallyHeight,
    this.totalStakingPower,
    this.totalVestingPower,
    this.v1TallyResult,
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
        ProtoFieldConfig.string(3, options: const []),
        ProtoFieldConfig.message(4),
      ],
    );
  }

  @override
  List<Object?> get protoValues => [
    tallyHeight,
    totalStakingPower,
    totalVestingPower,
    v1TallyResult,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'tally_height': tallyHeight?.toString(),
      'total_staking_power': totalStakingPower,
      'total_vesting_power': totalVestingPower,
      'v1_tally_result': v1TallyResult?.toJson(),
    };
  }

  factory TallyResult.fromJson(Map<String, dynamic> json) {
    return TallyResult(
      tallyHeight: json.valueAsBigInt<BigInt?>(
        'tally_height',
        acceptCamelCase: true,
      ),
      totalStakingPower: json.valueAsString<String?>(
        'total_staking_power',
        acceptCamelCase: true,
      ),
      totalVestingPower: json.valueAsString<String?>(
        'total_vesting_power',
        acceptCamelCase: true,
      ),
      v1TallyResult: json
          .valueTo<cosmos_gov_v1_gov.TallyResult?, Map<String, dynamic>>(
            key: 'v1_tally_result',
            parse: (v) => cosmos_gov_v1_gov.TallyResult.fromJson(v),
            acceptCamelCase: true,
          ),
    );
  }

  factory TallyResult.deserialize(List<int> bytes) {
    final decode = CosmosProtoMessage.decode(bytes, protoConfigStatic());
    return TallyResult(
      tallyHeight: decode.getBigInt<BigInt?>(1),
      totalStakingPower: decode.getString<String?>(2),
      totalVestingPower: decode.getString<String?>(3),
      v1TallyResult: decode.messageTo<cosmos_gov_v1_gov.TallyResult?>(
        4,
        (b) => cosmos_gov_v1_gov.TallyResult.deserialize(b),
      ),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1TallyResult;
}

/// Proposal defines the core field members of a governance proposal.
class Proposal extends CosmosProtoMessage {
  /// id defines the unique id of the proposal.
  final BigInt? id;

  /// messages are the arbitrary messages to be executed if the proposal passes.
  final List<google_protobuf_any.Any> messages;

  /// status defines the proposal status.
  final cosmos_gov_v1_gov.ProposalStatus? status;

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

  final google_protobuf_timestamp.Timestamp? emergencyStartTime;

  final google_protobuf_timestamp.Timestamp? emergencyNextTallyTime;

  /// metadata is any arbitrary metadata attached to the proposal.
  /// the recommended format of the metadata is to be found here:
  /// https://docs.cosmos.network/v0.47/modules/gov#proposal-3
  final String? metadata;

  /// title is the title of the proposal
  ///
  /// Since: cosmos-sdk 0.47
  final String? title;

  /// summary is a short summary of the proposal
  ///
  /// Since: cosmos-sdk 0.47
  final String? summary;

  /// proposer is the address of the proposal sumbitter
  ///
  /// Since: cosmos-sdk 0.47
  final String? proposer;

  /// expedited defines if the proposal is expedited
  ///
  /// Since: cosmos-sdk 0.50
  final bool? expedited;

  final bool? emergency;

  /// failed_reason defines the reason why the proposal failed
  ///
  /// Since: cosmos-sdk 0.50
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
    this.emergencyStartTime,
    this.emergencyNextTallyTime,
    this.metadata,
    this.title,
    this.summary,
    this.proposer,
    this.expedited,
    this.emergency,
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
        ProtoFieldConfig.message(
          4,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(5, options: const []),
        ProtoFieldConfig.message(6, options: const []),
        ProtoFieldConfig.repeated(
          fieldNumber: 7,
          elementType: ProtoFieldType.message,
          options: [ProtoOptionBool(name: "amino.dont_omitempty", value: true)],
        ),
        ProtoFieldConfig.message(8, options: const []),
        ProtoFieldConfig.message(9, options: const []),
        ProtoFieldConfig.message(10, options: const []),
        ProtoFieldConfig.message(11, options: const []),
        ProtoFieldConfig.string(12),
        ProtoFieldConfig.string(13),
        ProtoFieldConfig.string(14),
        ProtoFieldConfig.string(15, options: const []),
        ProtoFieldConfig.bool(16),
        ProtoFieldConfig.bool(17),
        ProtoFieldConfig.string(18),
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
    emergencyStartTime,
    emergencyNextTallyTime,
    metadata,
    title,
    summary,
    proposer,
    expedited,
    emergency,
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
      'emergency_start_time': emergencyStartTime?.toRfc3339(),
      'emergency_next_tally_time': emergencyNextTallyTime?.toRfc3339(),
      'metadata': metadata,
      'title': title,
      'summary': summary,
      'proposer': proposer,
      'expedited': expedited,
      'emergency': emergency,
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
      status: json.valueTo<cosmos_gov_v1_gov.ProposalStatus?, Object?>(
        key: 'status',
        parse: (v) => cosmos_gov_v1_gov.ProposalStatus.from(v),
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
      emergencyStartTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'emergency_start_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      emergencyNextTallyTime: json
          .valueTo<google_protobuf_timestamp.Timestamp?, String>(
            key: 'emergency_next_tally_time',
            parse: (v) => google_protobuf_timestamp.Timestamp.fromRfc3339(v),
            acceptCamelCase: true,
          ),
      metadata: json.valueAsString<String?>('metadata', acceptCamelCase: true),
      title: json.valueAsString<String?>('title', acceptCamelCase: true),
      summary: json.valueAsString<String?>('summary', acceptCamelCase: true),
      proposer: json.valueAsString<String?>('proposer', acceptCamelCase: true),
      expedited: json.valueAsBool<bool?>('expedited', acceptCamelCase: true),
      emergency: json.valueAsBool<bool?>('emergency', acceptCamelCase: true),
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
      status: decode.getEnum<cosmos_gov_v1_gov.ProposalStatus?>(
        3,
        cosmos_gov_v1_gov.ProposalStatus.values,
      ),
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
      emergencyStartTime: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            10,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
      emergencyNextTallyTime: decode
          .messageTo<google_protobuf_timestamp.Timestamp?>(
            11,
            (b) => google_protobuf_timestamp.Timestamp.deserialize(b),
          ),
      metadata: decode.getString<String?>(12),
      title: decode.getString<String?>(13),
      summary: decode.getString<String?>(14),
      proposer: decode.getString<String?>(15),
      expedited: decode.getBool<bool?>(16),
      emergency: decode.getBool<bool?>(17),
      failedReason: decode.getString<String?>(18),
    );
  }

  @override
  DefaultCosmosProtoTypeUrl get declarationId =>
      DefaultCosmosProtoTypeUrl.initiaGovV1Proposal;
}
