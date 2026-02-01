import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgClearAdmin removes any admin stored for a smart contract
class CosmWasmV1ClearAdmin
    extends CosmWasm1Beta1Service<EmptyServiceRequestResponse> {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// Contract is the address of the smart contract
  final String? contract;
  CosmWasmV1ClearAdmin({required this.sender, required this.contract});
  factory CosmWasmV1ClearAdmin.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1ClearAdmin(
      sender: decode.getField(1),
      contract: decode.getField(3),
    );
  }
  factory CosmWasmV1ClearAdmin.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1ClearAdmin(
      sender: json.as("sender"),
      contract: json.as("contract"),
    );
  }

  @override
  List<int> get fieldIds => [1, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "contract": contract};
  }

  @override
  List get values => [sender, contract];

  @override
  CosmWasmV1Types get typeUrl => CosmWasmV1Types.msgClearAdmin;

  @override
  List<String?> get signers => [sender];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(CosmWasmV1Types.msgClearAdminResponse);
  }
}
