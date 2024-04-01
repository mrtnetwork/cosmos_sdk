import 'package:blockchain_utils/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

/// ProposalStatus enumerates the valid statuses of a proposal.
class ProposalStatus implements CosmosEnum {
  /// PROPOSAL_STATUS_UNSPECIFIED defines the default proposal status.
  static const ProposalStatus unspecified = ProposalStatus._(0, "unspecified");

  /// PROPOSAL_STATUS_DEPOSIT_PERIOD defines a proposal status during the deposit
  /// period.
  static const ProposalStatus depositPeriod =
      ProposalStatus._(1, "depositPeriod");

  /// PROPOSAL_STATUS_VOTING_PERIOD defines a proposal status during the voting
  /// period..
  static const ProposalStatus votingPeriod =
      ProposalStatus._(2, "votingPeriod");

  /// PROPOSAL_STATUS_PASSED defines a proposal status of a proposal that has
  /// passed.
  static const ProposalStatus passed = ProposalStatus._(3, "passed");

  /// PROPOSAL_STATUS_REJECTED defines a proposal status of a proposal that has
  /// been rejected.
  static const ProposalStatus rejected = ProposalStatus._(4, "rejected");

  /// PROPOSAL_STATUS_FAILED defines a proposal status of a proposal that has
  /// failed.
  static const ProposalStatus failed = ProposalStatus._(5, "failed");

  @override
  final int value;
  @override
  final String name;
  const ProposalStatus._(this.value, this.name);
  static const List<ProposalStatus> values = [
    unspecified,
    depositPeriod,
    votingPeriod,
    passed,
    rejected,
    failed
  ];

  static ProposalStatus fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw MessageException(
          "No ProposalStatus element found for the given value.",
          details: {"value": value}),
    );
  }
}
