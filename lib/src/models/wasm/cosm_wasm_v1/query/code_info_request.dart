import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'code_info_response.dart';

/// QueryCodeRequest is the request type for the Query/Code RPC method
class CosmWasmV1QueryCodeInfoRequest extends CosmosMessage
    with QueryMessage<CosmWasmV1QueryCodeInfoResponse> {
  final BigInt codeId;

  CosmWasmV1QueryCodeInfoRequest({required this.codeId});

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"codeId": codeId.toString()};
  }

  @override
  List get values => [codeId];

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryCodeInfo;

  @override
  CosmWasmV1QueryCodeInfoResponse onResponse(List<int> bytes) {
    return CosmWasmV1QueryCodeInfoResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QueryCodeInfoResponse onJsonResponse(Map<String, dynamic> json) {
    return CosmWasmV1QueryCodeInfoResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [codeId.toString()];
}
