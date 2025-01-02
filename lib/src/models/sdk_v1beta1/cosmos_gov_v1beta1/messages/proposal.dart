import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/global_messages/unknown_message.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/proposal_status.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/tally_result.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Proposal defines the core field members of a governance proposal.
class GovProposal extends CosmosMessage {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// content is the proposal's content.
  final AnyMessage? content;

  /// status defines the proposal status.
  final ProposalStatus? status;

  /// final_tally_result is the final tally result of the proposal. When
  /// querying a proposal via gRPC, this field is not populated until the
  /// proposal's voting period has ended.
  final GovTallyResult finalTallyResult;

  /// submit_time is the time of proposal submission.
  final ProtobufTimestamp submitTime;

  /// deposit_end_time is the end time for deposition.
  final ProtobufTimestamp depositEndTime;

  /// total_deposit is the total deposit on the proposal.
  final List<Coin> totalDeposit;

  /// voting_start_time is the starting time to vote on a proposal.
  final ProtobufTimestamp votingStartTime;

  /// voting_end_time is the end time of voting on a proposal.
  final ProtobufTimestamp votingEndTime;
  factory GovProposal.fromRpc(Map<String, dynamic> json) {
    return GovProposal(
        depositEndTime: ProtobufTimestamp.fromString(json["deposit_end_time"]),
        finalTallyResult: GovTallyResult.fromRpc(json["final_tally_result"]),
        submitTime: ProtobufTimestamp.fromString(json["submit_time"]),
        totalDeposit: (json["total_deposit"] as List?)
                ?.map((e) => Coin.fromRpc(e))
                .toList() ??
            [],
        votingEndTime: ProtobufTimestamp.fromString(json["voting_end_time"]),
        votingStartTime:
            ProtobufTimestamp.fromString(json["voting_start_time"]),
        content: json["content"] == null
            ? null
            : AnyMessage.fromRpc(json["content"]),
        proposalId: BigintUtils.tryParse(json["proposal_id"]),
        status: json["status"] == null
            ? null
            : ProposalStatus.fromName(json["status"]));
  }
  GovProposal(
      {this.proposalId,
      this.content,
      this.status,
      required this.finalTallyResult,
      required this.submitTime,
      required this.depositEndTime,
      required this.totalDeposit,
      required this.votingEndTime,
      required this.votingStartTime});

  factory GovProposal.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovProposal(
        proposalId: decode.getField(1),
        content: decode
            .getResult(2)
            ?.to<AnyMessage, List<int>>((e) => AnyMessage.deserialize(e)),
        status: decode
            .getResult(3)
            ?.to<ProposalStatus, int>((e) => ProposalStatus.fromValue(e)),
        finalTallyResult: GovTallyResult.deserialize(decode.getField(4)),
        submitTime: ProtobufTimestamp.deserialize(decode.getField(5)),
        depositEndTime: ProtobufTimestamp.deserialize(decode.getField(6)),
        totalDeposit:
            decode.getFields(7).map((e) => Coin.deserialize(e)).toList(),
        votingEndTime: ProtobufTimestamp.deserialize(decode.getField(9)),
        votingStartTime: ProtobufTimestamp.deserialize(decode.getField(8)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Map<String, dynamic> toJson() {
    return {
      "proposal_id": proposalId?.toString(),
      "content": content?.toJson(),
      "status": status?.value,
      "final_tally_result": finalTallyResult.toJson(),
      "submit_time": submitTime.toJson(),
      "deposit_end_time": depositEndTime.toJson(),
      "total_deposit": totalDeposit.map((e) => e.toJson()).toList(),
      "voting_start_time": votingStartTime.toJson(),
      "voting_end_time": votingEndTime.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govProposal;

  @override
  List get values => [
        proposalId,
        content,
        status?.value,
        finalTallyResult,
        submitTime,
        depositEndTime,
        totalDeposit,
        votingStartTime,
        votingEndTime
      ];
}
