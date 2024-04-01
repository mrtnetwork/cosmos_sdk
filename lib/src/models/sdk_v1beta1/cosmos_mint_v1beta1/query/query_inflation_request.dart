import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/query/query_inflation_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_mint_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryInflationRequest is the request type for the Query/Inflation RPC method.
class QueryInflationRequest extends CosmosMessage
    with QueryMessage<QueryInflationResponse> {
  ///  This message has no fields.
  const QueryInflationRequest();
  factory QueryInflationRequest.deserialize(List<int> bytes) {
    return QueryInflationRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String get typeUrl => MintV1beta1Types.queryInflationRequest.typeUrl;

  @override
  List get values => [];

  @override
  String get queryPath => MintV1beta1Types.inflation.typeUrl;

  @override
  QueryInflationResponse onResponse(List<int> bytes) {
    return QueryInflationResponse.deserialize(bytes);
  }
}
