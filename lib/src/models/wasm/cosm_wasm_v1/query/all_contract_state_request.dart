import 'package:cosmos_sdk/src/models/sdk_v1beta1/sdk_v1beta1.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'all_contract_state_response.dart';

/// QueryAllContractStateRequest is the request type for the
/// Query/AllContractState RPC method
class CosmWasmV1QueryAllContractState extends CosmosMessage
    with QueryMessage<CosmWasmV1QueryAllContractStateResponse> {
  /// address is the address of the contract
  final String address;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;
  CosmWasmV1QueryAllContractState({required this.address, this.pagination});

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address, "pagination": pagination?.toJson()};
  }

  @override
  List get values => [address, pagination];

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryAllContractState;

  @override
  CosmWasmV1QueryAllContractStateResponse onResponse(List<int> bytes) {
    return CosmWasmV1QueryAllContractStateResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QueryAllContractStateResponse onJsonResponse(
      Map<String, dynamic> json) {
    return CosmWasmV1QueryAllContractStateResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [address];

  @override
  Map<String, String?> get queryParameters => {
        ...pagination?.queryParameters ?? {},
      };
}
