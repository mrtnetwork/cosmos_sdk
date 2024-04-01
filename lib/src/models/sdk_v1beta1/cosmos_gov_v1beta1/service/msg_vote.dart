import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/vote_option.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgVote defines a message to cast a vote.
class GovMsgVote extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// proposal_id defines the unique id of the proposal
  final BigInt? proposalId;

  /// voter is the voter address for the proposal.
  final BaseAddress? voter;

  /// option defines the vote option.
  final GovVoteOption? option;
  const GovMsgVote({this.proposalId, this.voter, this.option});
  factory GovMsgVote.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovMsgVote(
        proposalId: decode.getField(1),
        voter:
            decode.getResult(2)?.to<BaseAddress, String>((e) => BaseAddress(e)),
        option: decode
            .getResult(3)
            ?.to<GovVoteOption, int>((e) => GovVoteOption.fromValue(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get service => GovV1beta1types.serviceGovVote.typeUrl;

  @override
  Map<String, dynamic> toJson() {
    return {
      "proposal_id": proposalId?.toString(),
      "voter": voter?.address,
      "option": option?.value
    };
  }

  @override
  String get typeUrl => GovV1beta1types.govMsgVote.typeUrl;

  @override
  List get values => [proposalId, voter?.address, option?.value];
  @override
  List<String?> get signers => [voter?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        GovV1beta1types.govMsgVoteResponse.typeUrl);
  }
}
