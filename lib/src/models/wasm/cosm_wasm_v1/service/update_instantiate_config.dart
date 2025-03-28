import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/access_config.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateInstantiateConfig updates instantiate config for a smart contract
class CosmWasmV1UpdateInstantiateConfig
    extends CosmWasm1Beta1Service<EmptyServiceRequestResponse> {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// CodeID references the stored WASM code
  final BigInt? codeId;

  /// NewInstantiatePermission is the new access control
  final CosmWasmV1AccessConfig? newInstantiatePermission;
  CosmWasmV1UpdateInstantiateConfig(
      {required this.sender,
      required this.codeId,
      required this.newInstantiatePermission});
  factory CosmWasmV1UpdateInstantiateConfig.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1UpdateInstantiateConfig(
        sender: decode.getField(1),
        codeId: decode.getField(2),
        newInstantiatePermission: decode
            .getResult(3)
            ?.to<CosmWasmV1AccessConfig, List<int>>(
                (e) => CosmWasmV1AccessConfig.deserialize((e))));
  }
  factory CosmWasmV1UpdateInstantiateConfig.fromJson(
      Map<String, dynamic> json) {
    return CosmWasmV1UpdateInstantiateConfig(
        sender: json.as("sender"),
        codeId: json.asBigInt("code_id"),
        newInstantiatePermission:
            json.maybeAs<CosmWasmV1AccessConfig, Map<String, dynamic>>(
                key: "new_instantiate_permission",
                onValue: (e) => CosmWasmV1AccessConfig.fromJson(e)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "code_id": codeId?.toString(),
      "new_instantiate_permission": newInstantiatePermission?.toJson()
    };
  }

  @override
  List get values => [sender, codeId, newInstantiatePermission];

  @override
  CosmWasmV1Types get typeUrl => CosmWasmV1Types.msgUpdateInstantiateConfig;

  @override
  List<String?> get signers => [sender];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        CosmWasmV1Types.msgUpdateInstantiateConfigResponse);
  }
}
