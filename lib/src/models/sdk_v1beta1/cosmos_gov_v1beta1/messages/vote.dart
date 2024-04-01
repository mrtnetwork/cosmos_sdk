import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/vote_option.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/weighted_vote_option.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

/// Vote defines a vote on a governance proposal. A Vote consists of a proposal ID, the voter, and the vote option.
class GovVote extends CosmosMessage {
  /// proposal_id defines the unique id of the proposal.
  final BigInt proposalId;

  /// voter is the voter address of the proposal.
  final BaseAddress? voter;

  /// Deprecated: Prefer to use `options` instead. This field is set in queries
  /// if and only if `len(options) == 1` and that option has weight 1. In all
  /// other cases, this field will default to VOTE_OPTION_UNSPECIFIED.
  final GovVoteOption? option;

  /// options is the weighted vote options.
  ///
  /// Since: cosmos-sdk 0.43
  final List<GovWeightedVoteOption> options;
  GovVote(
      {required this.proposalId,
      this.voter,
      this.option,
      required List<GovWeightedVoteOption> options})
      : options = options.mutable;

  factory GovVote.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovVote(
        proposalId: decode.getField(1),
        voter:
            decode.getResult(2)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        option: decode
            .getResult(3)
            ?.to<GovVoteOption, int>((e) => GovVoteOption.fromValue(e)),
        options: decode
            .getFileds<List<int>>(4)
            .map((e) => GovWeightedVoteOption.deserialize(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "proposal_id": proposalId.toString(),
      "voter": voter?.address,
      "option": option?.value,
      "options": options.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => GovV1beta1types.govVote.typeUrl;

  @override
  List get values => [proposalId, voter, option, options];
}
