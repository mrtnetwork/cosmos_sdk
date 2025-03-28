import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'contract_info_response.dart';

/// QueryContractInfoRequest is the request type for the Query/ContractInfo RPC method
class CosmWasmV1QueryContractInfoRequest extends CosmosMessage
    with QueryMessage<CosmWasmV1QueryContractInfoResponse> {
  /// address is the address of the contract to query
  final String address;
  CosmWasmV1QueryContractInfoRequest(this.address);

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address};
  }

  @override
  List get values => [address];

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryContractInfoRequest;

  @override
  CosmWasmV1QueryContractInfoResponse onResponse(List<int> bytes) {
    return CosmWasmV1QueryContractInfoResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QueryContractInfoResponse onJsonResponse(
      Map<String, dynamic> json) {
    return CosmWasmV1QueryContractInfoResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [address];
}
