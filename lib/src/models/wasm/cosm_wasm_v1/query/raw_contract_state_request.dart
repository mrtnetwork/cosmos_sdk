import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';
import 'raw_contract_state_response.dart';

/// QueryRawContractStateRequest is the request type for the Query/RawContractState RPC method
class CosmWasmV1QueryRawContractStateRequest extends CosmosMessage
    with QueryMessage<CosmWasmV1QueryRawContractStateResponse> {
  /// address is the address of the contract
  final String address;

  final List<int> queryData;

  CosmWasmV1QueryRawContractStateRequest(
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
  TypeUrl get typeUrl => CosmWasmV1Types.queryRawContractState;

  @override
  CosmWasmV1QueryRawContractStateResponse onResponse(List<int> bytes) {
    return CosmWasmV1QueryRawContractStateResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QueryRawContractStateResponse onJsonResponse(
      Map<String, dynamic> json) {
    return CosmWasmV1QueryRawContractStateResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [address, CosmosUtils.toBase64(queryData)];
}
