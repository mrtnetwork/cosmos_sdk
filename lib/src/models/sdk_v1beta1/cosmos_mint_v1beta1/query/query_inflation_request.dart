import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/query/query_inflation_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryInflationRequest is the request type for the Query/Inflation RPC method.
class QueryInflationRequest extends CosmosMessage
    with QueryMessage<QueryInflationResponse> {
  ///  This message has no fields.
  const QueryInflationRequest();
  factory QueryInflationRequest.deserialize(List<int> bytes) {
    return const QueryInflationRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => MintV1beta1Types.queryInflationRequest;

  @override
  List get values => [];

  @override
  QueryInflationResponse onResponse(List<int> bytes) {
    return QueryInflationResponse.deserialize(bytes);
  }

  @override
  QueryInflationResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryInflationResponse.fromJson(json);
  }
}
