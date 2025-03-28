import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/serialization/cosmos_serialization.dart';
import 'wasm_limits_config_response.dart';

/// QueryWasmLimitsConfigRequest is the request type for the
/// Query/WasmLimitsConfig RPC method.
class CosmWasmV1QueryWasmLimitsConfigRequest extends CosmosMessage
    with QueryMessage<CosmWasmV1QueryWasmLimitsConfigResponse> {
  @override
  List<int> get fieldIds => [];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List get values => [];

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryWasmLimitsConfig;

  @override
  CosmWasmV1QueryWasmLimitsConfigResponse onResponse(List<int> bytes) {
    return CosmWasmV1QueryWasmLimitsConfigResponse.deserialize(bytes);
  }

  @override
  CosmWasmV1QueryWasmLimitsConfigResponse onJsonResponse(
      Map<String, dynamic> json) {
    return CosmWasmV1QueryWasmLimitsConfigResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [];

  @override
  Map<String, String?> get queryParameters => {};
}
