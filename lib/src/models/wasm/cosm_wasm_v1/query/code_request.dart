import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'code_response.dart';

/// QueryCodeRequest is the request type for the Query/Code RPC method
class CosmWasmV1QueryCodeRequest extends CosmosMessage
    with QueryMessage<CosmWasmV1QueryCodeResponse> {
  final BigInt codeId;

  CosmWasmV1QueryCodeRequest({required this.codeId});

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"codeId": codeId.toString()};
  }

  @override
  List get values => [codeId];

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryCode;

  @override
  CosmWasmV1QueryCodeResponse onResponse(List<int> bytes) {
    return CosmWasmV1QueryCodeResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QueryCodeResponse onJsonResponse(Map<String, dynamic> json) {
    return CosmWasmV1QueryCodeResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [codeId.toString()];
}
