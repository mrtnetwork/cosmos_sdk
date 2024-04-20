import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/query/query_vote_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryVoteRequest is the request type for the Query/Vote RPC method.
class GovQueryVoteRequest extends CosmosMessage
    with QueryMessage<GovQueryVoteResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt? proposalId;

  /// voter defines the voter address for the proposals.
  final CosmosBaseAddress? voter;

  const GovQueryVoteRequest({this.proposalId, this.voter});
  factory GovQueryVoteRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryVoteRequest(
        proposalId: decode.getField(1),
        voter: decode
            .getResult(2)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"proposal_id": proposalId?.toString(), "voter": voter?.address};
  }

  @override
  String get typeUrl => GovV1beta1types.govQueryVoteRequest.typeUrl;

  @override
  List get values => [proposalId, voter?.address];

  @override
  String get queryPath => GovV1beta1types.queryGovVote.typeUrl;

  @override
  GovQueryVoteResponse onResponse(List<int> bytes) {
    return GovQueryVoteResponse.deserialize(bytes);
  }
}
