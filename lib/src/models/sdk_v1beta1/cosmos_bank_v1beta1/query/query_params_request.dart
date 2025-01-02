import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/query/query_params_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_bank_v1beta1/types/types.dart';

/// QueryParamsRequest defines the request type for querying x/bank parameters.
/// This message has no fields.
class QueryParamsRequest extends CosmosMessage
    with QueryMessage<QueryParamsResponse> {
  const QueryParamsRequest();
  factory QueryParamsRequest.deserialize(List<int> bytes) {
    return const QueryParamsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => BankV1beta1Types.paramsRequest;

  @override
  List get values => [];

  @override
  QueryParamsResponse onResponse(List<int> bytes) {
    return QueryParamsResponse.deserialize(bytes);
  }

  @override
  QueryParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryParamsResponse.fromRpc(json);
  }
}
