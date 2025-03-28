import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';
import 'smart_contract_state_response.dart';

/// QuerySmartContractStateRequest is the request type for the
/// Query/SmartContractState RPC method
class CosmWasmV1QuerySmartContractStateRequest extends CosmosMessage
    with QueryMessage<CosmWasmV1QuerySmartContractStateResponse> {
  /// address is the address of the contract
  final String address;

  /// QueryData contains the query data passed to the contract
  final List<int> queryData;

  CosmWasmV1QuerySmartContractStateRequest(
      {required this.address, required List<int> queryData})
      : queryData = queryData.asImmutableBytes;

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address, "query_data": CosmosUtils.toBase64(queryData)};
  }

  @override
  List get values => [address, queryData];

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.querySmartContractState;

  @override
  CosmWasmV1QuerySmartContractStateResponse onResponse(List<int> bytes) {
    return CosmWasmV1QuerySmartContractStateResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QuerySmartContractStateResponse onJsonResponse(
      Map<String, dynamic> json) {
    return CosmWasmV1QuerySmartContractStateResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [address, CosmosUtils.toBase64(queryData)];
}
