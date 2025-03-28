import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/query/query_proposal_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryProposalRequest is the request type for the Query/Proposal RPC method.
class GovQueryProposalRequest extends CosmosMessage
    with QueryMessage<GovQueryProposalResponse> {
  /// proposal_id defines the unique id of the proposal
  final BigInt proposalId;
  const GovQueryProposalRequest(this.proposalId);
  factory GovQueryProposalRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryProposalRequest(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"proposal_id": proposalId.toString()};
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govQueryProposalRequest;

  @override
  List get values => [proposalId];

  @override
  GovQueryProposalResponse onResponse(List<int> bytes) {
    return GovQueryProposalResponse.deserialize(bytes);
  }

  @override
  GovQueryProposalResponse onJsonResponse(Map<String, dynamic> json) {
    return GovQueryProposalResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [proposalId.toString()];
}
