import 'package:cosmos_sdk/src/exception/exception.dart';
import 'package:cosmos_sdk/src/protobuf/types/cosmos_enum.dart';

/// VoteOption enumerates the valid vote options for a given governance proposal.
class GovVoteOption implements CosmosEnum {
  /// VOTE_OPTION_UNSPECIFIED defines a no-op vote option.
  static const GovVoteOption unspecified = GovVoteOption._(0, "unspecified");

  /// VOTE_OPTION_YES defines a yes vote option.
  static const GovVoteOption yes = GovVoteOption._(1, "yes");

  /// VOTE_OPTION_ABSTAIN defines an abstain vote option.
  static const GovVoteOption abstain = GovVoteOption._(2, "abstain");

  /// VOTE_OPTION_NO defines a no vote option.
  static const GovVoteOption no = GovVoteOption._(3, "no");

  /// VOTE_OPTION_NO_WITH_VETO defines a no with veto vote option.
  static const GovVoteOption noWithVeto = GovVoteOption._(4, "noWithVeto");

  @override
  final int value;
  @override
  final String name;
  const GovVoteOption._(this.value, this.name);
  static const List<GovVoteOption> values = [
    unspecified,
    yes,
    abstain,
    no,
    noWithVeto,
  ];

  static GovVoteOption fromValue(int? value) {
    return values.firstWhere(
      (e) => e.value == value,
      orElse:
          () =>
              throw DartCosmosSdkPluginException(
                "No GovVoteOption element found for the given value.",
                details: {"value": value},
              ),
    );
  }

  static GovVoteOption fromName(String? name) {
    return values.firstWhere(
      (e) => e.name == name,
      orElse:
          () =>
              throw DartCosmosSdkPluginException(
                "No GovVoteOption element found for the given value.",
                details: {"name": name},
              ),
    );
  }
}
