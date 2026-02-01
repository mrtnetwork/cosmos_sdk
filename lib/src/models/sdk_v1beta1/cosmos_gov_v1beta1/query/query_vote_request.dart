import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/query/query_vote_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryVoteRequest is the request type for the Query/Vote RPC method.
class GovQueryVoteRequest extends CosmosMessage
    with QueryMessage<GovQueryVoteResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt proposalId;

  /// voter defines the voter address for the proposals.
  final CosmosBaseAddress voter;

  const GovQueryVoteRequest({required this.proposalId, required this.voter});
  factory GovQueryVoteRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryVoteRequest(
      proposalId: decode.getField(1),
      voter: CosmosBaseAddress(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"proposal_id": proposalId.toString(), "voter": voter.address};
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govQueryVoteRequest;

  @override
  List get values => [proposalId, voter.address];

  @override
  GovQueryVoteResponse onResponse(List<int> bytes) {
    return GovQueryVoteResponse.deserialize(bytes);
  }

  @override
  GovQueryVoteResponse onJsonResponse(Map<String, dynamic> json) {
    return GovQueryVoteResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [proposalId.toString(), voter.address];
}
