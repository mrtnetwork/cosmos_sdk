import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_params_response.dart';

/// QueryAccountRequest is the request type for the Query/Account RPC method.
class EVMV1QueryParamsRequest extends CosmosMessage
    with QueryMessage<EVMV1QueryParamsResponse> {
  const EVMV1QueryParamsRequest();
  factory EVMV1QueryParamsRequest.deserialize(List<int> bytes) {
    return EVMV1QueryParamsRequest();
  }

  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.paramsRequest;

  @override
  List get values => [];

  @override
  EVMV1QueryParamsResponse onResponse(List<int> bytes) {
    return EVMV1QueryParamsResponse.deserialize(bytes);
  }

  @override
  EVMV1QueryParamsResponse onJsonResponse(Map<String, dynamic> json) {
    return EVMV1QueryParamsResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {};
}
