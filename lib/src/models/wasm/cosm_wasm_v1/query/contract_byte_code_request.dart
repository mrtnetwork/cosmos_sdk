import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'contract_byte_code_response.dart';

/// QueryContractsByCodeRequest is the request type for the Query/ContractsByCode
/// RPC method
class CosmWasmV1QueryContractsByCodeRequest extends CosmosMessage
    with QueryMessage<CosmWasmV1QueryContractsByCodeResponse> {
  final BigInt codeId;
  final PageRequest? pagination;
  CosmWasmV1QueryContractsByCodeRequest({
    required this.codeId,
    this.pagination,
  });

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"code_id": codeId, "pagination": pagination?.toJson()};
  }

  @override
  List get values => [codeId, pagination];

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryContractsByCodeRequest;

  @override
  CosmWasmV1QueryContractsByCodeResponse onResponse(List<int> bytes) {
    return CosmWasmV1QueryContractsByCodeResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QueryContractsByCodeResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return CosmWasmV1QueryContractsByCodeResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [codeId.toString()];

  @override
  Map<String, String?> get queryParameters => {
    ...pagination?.queryParameters ?? {},
  };
}
