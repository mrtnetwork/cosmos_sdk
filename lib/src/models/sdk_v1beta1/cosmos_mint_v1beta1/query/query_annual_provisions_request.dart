import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/query/query_annual_provisions_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryAnnualProvisionsRequest is the request type for the Query/AnnualProvisions RPC method.
class QueryAnnualProvisionsRequest extends CosmosMessage
    with QueryMessage<QueryAnnualProvisionsResponse> {
  ///  This message has no fields.
  const QueryAnnualProvisionsRequest();
  factory QueryAnnualProvisionsRequest.deserialize(List<int> bytes) {
    return const QueryAnnualProvisionsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => MintV1beta1Types.queryAnnualProvisionsRequest;

  @override
  List get values => [];

  @override
  QueryAnnualProvisionsResponse onResponse(List<int> bytes) {
    return QueryAnnualProvisionsResponse.deserialize(bytes);
  }

  @override
  QueryAnnualProvisionsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryAnnualProvisionsResponse.fromRpc(json);
  }
}
