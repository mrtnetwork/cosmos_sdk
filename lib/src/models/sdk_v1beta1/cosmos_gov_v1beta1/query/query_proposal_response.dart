import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/messages/proposal.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryProposalResponse is the response type for the Query/Proposal RPC method.
class GovQueryProposalResponse extends CosmosMessage {
  final GovProposal proposal;
  const GovQueryProposalResponse(this.proposal);
  factory GovQueryProposalResponse.fromJson(Map<String, dynamic> json) {
    return GovQueryProposalResponse(GovProposal.fromJson(json["proposal"]));
  }
  factory GovQueryProposalResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryProposalResponse(
        GovProposal.deserialize(decode.getField(1)));
  }
  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"proposal": proposal.toJson()};
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govQueryProposalResponse;

  @override
  List get values => [proposal];
}
