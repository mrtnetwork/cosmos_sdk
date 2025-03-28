import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryWasmLimitsConfigResponse is the response type for the
/// Query/WasmLimitsConfig RPC method. It contains the JSON encoded limits for
/// static validation of Wasm files.
class CosmWasmV1QueryWasmLimitsConfigResponse extends CosmosMessage {
  final String? config;
  CosmWasmV1QueryWasmLimitsConfigResponse({required this.config});
  factory CosmWasmV1QueryWasmLimitsConfigResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QueryWasmLimitsConfigResponse(config: decode.getField(1));
  }
  factory CosmWasmV1QueryWasmLimitsConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return CosmWasmV1QueryWasmLimitsConfigResponse(config: json.as("config"));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"config": config};
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryWasmLimitsConfigResponse;

  @override
  List get values => [config];
}
