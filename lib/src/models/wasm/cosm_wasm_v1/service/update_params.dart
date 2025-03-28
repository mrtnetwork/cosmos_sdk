import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/params.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateParams is the MsgUpdateParams request type.
class CosmWasmV1UpdateParams
    extends CosmWasm1Beta1Service<EmptyServiceRequestResponse> {
  final String? authority;

  /// params defines the x/wasm parameters to update.
  ///
  /// NOTE: All parameters must be supplied.
  final CosmWasmV1Params? params;

  const CosmWasmV1UpdateParams({required this.authority, required this.params});
  factory CosmWasmV1UpdateParams.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1UpdateParams(
        authority: decode.getField(1),
        params: decode.getResult(2)?.to<CosmWasmV1Params, List<int>>(
            (e) => CosmWasmV1Params.deserialize((e))));
  }
  factory CosmWasmV1UpdateParams.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1UpdateParams(
        authority: json.as("authority"),
        params: json.maybeAs<CosmWasmV1Params, Map<String, dynamic>>(
            key: "params", onValue: (e) => CosmWasmV1Params.fromJson(e)));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"authority": authority, "params": params?.toJson()};
  }

  @override
  List get values => [authority, params];

  @override
  CosmWasmV1Types get typeUrl => CosmWasmV1Types.msgUpdateParams;

  @override
  List<String?> get signers => [authority];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(CosmWasmV1Types.msgUpdateParamsResponse);
  }
}
