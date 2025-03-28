import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// QueryParamsResponse is the response type for the Query/Params RPC method
class CosmWasmV1QueryParamsResponse extends CosmosMessage {
  /// params defines the parameters of the module
  final CosmWasmV1Params? params;
  CosmWasmV1QueryParamsResponse({this.params});
  factory CosmWasmV1QueryParamsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1QueryParamsResponse(
        params: decode
            .getResult(1)
            ?.to<CosmWasmV1Params, List<int>>(CosmWasmV1Params.deserialize));
  }
  factory CosmWasmV1QueryParamsResponse.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1QueryParamsResponse(
        params: json.maybeAs<CosmWasmV1Params, Map<String, dynamic>>(
            key: "params", onValue: (e) => CosmWasmV1Params.fromJson(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"params": params?.toJson()};
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.queryParamsResponse;

  @override
  List get values => [params];
}
