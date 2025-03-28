import 'package:blockchain_utils/helper/extensions/extensions.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/contract_code_history_entry.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryContractHistoryResponse is the response type for the
/// Query/ContractHistory RPC method
class CosmWasmV1QueryContractHistoryResponse extends CosmosMessage {
  final List<CosmWasmV1ContractCodeHistoryEntry>? entries;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  CosmWasmV1QueryContractHistoryResponse(
      {required List<CosmWasmV1ContractCodeHistoryEntry>? entries,
      this.pagination})
      : entries = entries?.immutable;
  factory CosmWasmV1QueryContractHistoryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QueryContractHistoryResponse(
        entries: decode
            .getFields<List<int>>(1)
            .map((e) => CosmWasmV1ContractCodeHistoryEntry.deserialize(e))
            .toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }
  factory CosmWasmV1QueryContractHistoryResponse.fromJson(
      Map<String, dynamic> json) {
    return CosmWasmV1QueryContractHistoryResponse(
        entries: json
            .asListOfMap("entries")
            ?.map((e) => CosmWasmV1ContractCodeHistoryEntry.fromJson(e))
            .toList(),
        pagination: json.maybeAs<PageResponse, Map<String, dynamic>>(
            key: "pagination", onValue: (e) => PageResponse.fromJson(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "entries": entries?.map((e) => e.toJson()).toList(),
      "pagination": pagination?.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryContractHistoryResponse;

  @override
  List get values => [entries, pagination];
}
