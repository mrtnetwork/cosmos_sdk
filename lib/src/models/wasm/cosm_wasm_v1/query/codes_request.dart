import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/cosmos_base_query_v1beta1.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'codes_response.dart';

/// QueryCodesRequest is the request type for the Query/Codes RPC method
class CosmWasmV1QueryCodesRequest extends CosmosMessage
    with QueryMessage<CosmWasmV1QueryCodesResponse> {
  /// pagination defines an optional pagination for the request
  final PageRequest? pagination;

  CosmWasmV1QueryCodesRequest({required this.pagination});

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  List get values => [pagination];

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryCodes;

  @override
  CosmWasmV1QueryCodesResponse onResponse(List<int> bytes) {
    return CosmWasmV1QueryCodesResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QueryCodesResponse onJsonResponse(Map<String, dynamic> json) {
    return CosmWasmV1QueryCodesResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [];
  @override
  Map<String, String?> get queryParameters =>
      {...pagination?.queryParameters ?? {}};
}
