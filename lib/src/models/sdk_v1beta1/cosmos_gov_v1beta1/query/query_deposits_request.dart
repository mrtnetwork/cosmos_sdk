import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_deposits_response.dart';

/// QueryDepositsRequest is the request type for the Query/Deposits RPC method.
class GovQueryDepositsRequest extends CosmosMessage
    with QueryMessage<GovQueryDepositsResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt proposalId;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  const GovQueryDepositsRequest({required this.proposalId, this.pagination});
  factory GovQueryDepositsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return GovQueryDepositsRequest(
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
  TypeUrl get typeUrl => GovV1beta1types.govQueryDepositsRequest;

  @override
  List get values => [proposalId, pagination];

  @override
  GovQueryDepositsResponse onResponse(List<int> bytes) {
    return GovQueryDepositsResponse.deserialize(bytes);
  }

  @override
  GovQueryDepositsResponse onJsonResponse(Map<String, dynamic> json) {
    return GovQueryDepositsResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [proposalId.toString()];

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
