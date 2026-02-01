import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'pinned_codes_response.dart';

/// QueryPinnedCodesRequest is the request type for the Query/PinnedCodes
/// RPC method
class CosmWasmV1QueryPinnedCodesRequest extends CosmosMessage
    with QueryMessage<CosmWasmV1QueryPinnedCodesResponse> {
  /// pagination defines an optional pagination for the request
  final PageRequest? pagination;

  CosmWasmV1QueryPinnedCodesRequest({required this.pagination});

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  List get values => [pagination];

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryPinnedCodes;

  @override
  CosmWasmV1QueryPinnedCodesResponse onResponse(List<int> bytes) {
    return CosmWasmV1QueryPinnedCodesResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QueryPinnedCodesResponse onJsonResponse(Map<String, dynamic> json) {
    return CosmWasmV1QueryPinnedCodesResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {
    ...pagination?.queryParameters ?? {},
  };
}
