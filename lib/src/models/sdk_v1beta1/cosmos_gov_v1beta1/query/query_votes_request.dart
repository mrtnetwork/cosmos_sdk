import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/query/query_votes_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryVotesRequest is the request type for the Query/Votes RPC method.
class GovQueryVotesRequest extends CosmosMessage
    with QueryMessage<GovQueryVotesResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt proposalId;

  /// pagination defines an optional pagination for the request
  final PageRequest? pagination;
  const GovQueryVotesRequest({required this.proposalId, this.pagination});
  factory GovQueryVotesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryVotesRequest(
        proposalId: decode.getField(1),
        pagination: decode
            .getResult(2)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "proposal_id": proposalId.toString(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govQueryVotesRequest;

  @override
  List get values => [proposalId, pagination];
  @override
  GovQueryVotesResponse onResponse(List<int> bytes) {
    return GovQueryVotesResponse.deserialize(bytes);
  }

  @override
  GovQueryVotesResponse onJsonResponse(Map<String, dynamic> json) {
    return GovQueryVotesResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [proposalId.toString()];

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
