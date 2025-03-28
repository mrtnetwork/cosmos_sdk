import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/query/query_tally_result_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_gov_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryTallyResultRequest is the request type for the Query/Tally RPC method.
class GovQueryTallyResultRequest extends CosmosMessage
    with QueryMessage<GovQueryTallyResultResponse> {
  /// proposal_id defines the unique id of the proposal.
  final BigInt proposalId;
  const GovQueryTallyResultRequest(this.proposalId);

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"proposal_id": proposalId.toString()};
  }

  @override
  TypeUrl get typeUrl => GovV1beta1types.govQueryTallyResultRequest;

  @override
  List get values => [proposalId];

  @override
  GovQueryTallyResultResponse onResponse(List<int> bytes) {
    return GovQueryTallyResultResponse.deserialize(bytes);
  }

  @override
  GovQueryTallyResultResponse onJsonResponse(Map<String, dynamic> json) {
    return GovQueryTallyResultResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [proposalId.toString()];
}
