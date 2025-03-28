import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'contract_history_response.dart';

/// QueryContractInfoRequest is the request type for the Query/ContractInfo RPC method
class CosmWasmV1QueryContractHistoryRequest extends CosmosMessage
    with QueryMessage<CosmWasmV1QueryContractHistoryResponse> {
  /// address is the address of the contract to query
  final String address;
  final PageRequest? pagination;
  CosmWasmV1QueryContractHistoryRequest(
      {required this.address, this.pagination});

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address, "pagination": pagination?.toJson()};
  }

  @override
  List get values => [address, pagination];

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryContractHistoryRequest;

  @override
  CosmWasmV1QueryContractHistoryResponse onResponse(List<int> bytes) {
    return CosmWasmV1QueryContractHistoryResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QueryContractHistoryResponse onJsonResponse(
      Map<String, dynamic> json) {
    return CosmWasmV1QueryContractHistoryResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [address];

  @override
  Map<String, String?> get queryParameters => {
        ...pagination?.queryParameters ?? {},
      };
}
