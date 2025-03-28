import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_params_response.dart';

/// QueryParamsRequest is the request type for the Query/Params RPC method
class CosmWasmV1QueryParamsRequest extends CosmosMessage
    with QueryMessage<CosmWasmV1QueryParamsResponse> {
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List get values => [];

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryParams;

  @override
  CosmWasmV1QueryParamsResponse onResponse(List<int> bytes) {
    return CosmWasmV1QueryParamsResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QueryParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return CosmWasmV1QueryParamsResponse.fromJson(json);
  }
}
