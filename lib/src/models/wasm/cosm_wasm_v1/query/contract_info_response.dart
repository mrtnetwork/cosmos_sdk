import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/contract_info.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryContractInfoResponse is the response type for the Query/ContractInfo RPC
/// method
class CosmWasmV1QueryContractInfoResponse extends CosmosMessage {
  /// address is the address of the contract
  final String? address;
  final CosmWasmV1ContractInfo? contractInfo;
  const CosmWasmV1QueryContractInfoResponse(
      {required this.address, required this.contractInfo});
  factory CosmWasmV1QueryContractInfoResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QueryContractInfoResponse(
        address: decode.getField(1),
        contractInfo: decode
            .getResult(2)
            ?.to<CosmWasmV1ContractInfo, List<int>>(
                (e) => CosmWasmV1ContractInfo.deserialize(e)));
  }
  factory CosmWasmV1QueryContractInfoResponse.fromJson(
      Map<String, dynamic> json) {
    return CosmWasmV1QueryContractInfoResponse(
        address: json.as("address"),
        contractInfo:
            json.maybeAs<CosmWasmV1ContractInfo, Map<String, dynamic>>(
                key: "contract_info",
                onValue: (e) => CosmWasmV1ContractInfo.fromJson(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"contract_info": contractInfo?.toJson(), "address": address};
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryContractInfoResponse;

  @override
  List get values => [address, contractInfo];
}
