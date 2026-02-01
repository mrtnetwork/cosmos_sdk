import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/vote_option.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgVote defines a message to cast a vote.
class GovMsgVote extends GovV1Beta1Service<EmptyServiceRequestResponse>
    with AminoMessage<EmptyServiceRequestResponse> {
  /// proposal_id defines the unique id of the proposal
  final BigInt? proposalId;

  /// voter is the voter address for the proposal.
  final CosmosBaseAddress? voter;

  /// option defines the vote option.
  final GovVoteOption? option;
  const GovMsgVote({this.proposalId, this.voter, this.option});
  factory GovMsgVote.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovMsgVote(
      proposalId: decode.getField(1),
      voter: decode
          .getResult(2)
          ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
      option: decode
          .getResult(3)
          ?.to<GovVoteOption, int>((e) => GovVoteOption.fromValue(e)),
    );
  }
  factory GovMsgVote.fromJson(Map<String, dynamic> json) {
    return GovMsgVote(
      proposalId: json.asBigInt("proposalId"),
      voter: json.asAddress("voter"),
      option: json.maybeAs<GovVoteOption, String>(
        key: "option",
        onValue: (e) => GovVoteOption.fromName(e),
      ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "proposal_id": proposalId?.toString(),
      "voter": voter?.address,
      "option": option?.value,
    };
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govMsgVote;

  @override
  List get values => [proposalId, voter?.address, option?.value];
  @override
  List<String?> get signers => [voter?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(GovV1beta1types.govMsgVoteResponse);
  }
}
