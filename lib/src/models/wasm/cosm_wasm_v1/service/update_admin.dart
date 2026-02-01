import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgUpdateAdmin sets a new admin for a smart contract
class CosmWasmV1UpdateAdmin
    extends CosmWasm1Beta1Service<EmptyServiceRequestResponse> {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// NewAdmin address to be set
  final String? newAdmin;

  /// Contract is the address of the smart contract
  final String? contract;
  CosmWasmV1UpdateAdmin({
    required this.sender,
    required this.newAdmin,
    required this.contract,
  });
  factory CosmWasmV1UpdateAdmin.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1UpdateAdmin(
      sender: decode.getField(1),
      newAdmin: decode.getField(2),
      contract: decode.getField(3),
    );
  }
  factory CosmWasmV1UpdateAdmin.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1UpdateAdmin(
      sender: json.as("sender"),
      contract: json.as("contract"),
      newAdmin: json.as("new_admin"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"sender": sender, "contract": contract, "new_admin": newAdmin};
  }

  @override
  List get values => [sender, newAdmin, contract];

  @override
  CosmWasmV1Types get typeUrl => CosmWasmV1Types.msgUpdateAdmin;

  @override
  List<String?> get signers => [sender];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(CosmWasmV1Types.msgUpdateAdminResponse);
  }
}
