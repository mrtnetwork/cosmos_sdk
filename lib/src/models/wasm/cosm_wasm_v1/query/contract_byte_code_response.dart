import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryContractsByCodeResponse is the response type for the
/// Query/ContractsByCode RPC method
class CosmWasmV1QueryContractsByCodeResponse extends CosmosMessage {
  /// contracts are a set of contract addresses
  final List<String>? contracts;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  CosmWasmV1QueryContractsByCodeResponse(
      {required List<String>? contracts, this.pagination})
      : contracts = contracts?.immutable;
  factory CosmWasmV1QueryContractsByCodeResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QueryContractsByCodeResponse(
        contracts: decode.getFields<String>(1),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }
  factory CosmWasmV1QueryContractsByCodeResponse.fromJson(
      Map<String, dynamic> json) {
    return CosmWasmV1QueryContractsByCodeResponse(
        contracts: json.asListOfString("contracts"),
        pagination: json.maybeAs<PageResponse, Map<String, dynamic>>(
            key: "pagination", onValue: (e) => PageResponse.fromJson(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"contracts": contracts, "pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryContractsByCodeResponse;

  @override
  List get values => [contracts, pagination];
}
