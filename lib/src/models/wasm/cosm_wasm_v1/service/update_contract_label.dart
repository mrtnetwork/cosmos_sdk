import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateContractLabel sets a new label for a smart contract
class CosmWasmV1UpdateContractLabel
    extends CosmWasm1Beta1Service<EmptyServiceRequestResponse> {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// NewLabel string to be set
  final String? newLabel;

  /// Contract is the address of the smart contract
  final String? contract;
  CosmWasmV1UpdateContractLabel(
      {required this.sender, required this.newLabel, required this.contract});
  factory CosmWasmV1UpdateContractLabel.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1UpdateContractLabel(
        sender: decode.getField(1),
        newLabel: decode.getField(2),
        contract: decode.getField(3));
  }
  factory CosmWasmV1UpdateContractLabel.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1UpdateContractLabel(
        sender: json.as("sender"),
        contract: json.as("contract"),
        newLabel: json.as("new_label"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "contract": contract, "new_label": newLabel};
  }

  @override
  List get values => [sender, newLabel, contract];

  @override
  CosmWasmV1Types get typeUrl => CosmWasmV1Types.msgUpdateContractLabel;

  @override
  List<String?> get signers => [sender];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(
        CosmWasmV1Types.msgUpdateContractLabelResponse);
  }
}
