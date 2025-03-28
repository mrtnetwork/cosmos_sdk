import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';
import 'execute_contract_response.dart';

/// MsgMigrateContract runs a code upgrade/ downgrade for a smart contract
class CosmWasmV1MigrateContract
    extends CosmWasm1Beta1Service<CosmWasmV1MsgExecuteContractResponse> {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// Contract is the address of the smart contract
  final String? contract;

  /// CodeID references the new WASM code
  final BigInt? codeId;

  /// Msg json encoded message to be passed to the contract on migration
  final List<int>? msg;

  CosmWasmV1MigrateContract({
    required this.sender,
    required this.contract,
    required List<int>? msg,
    required this.codeId,
  }) : msg = msg?.asImmutableBytes;
  factory CosmWasmV1MigrateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1MigrateContract(
      sender: decode.getField(1),
      contract: decode.getField(2),
      codeId: decode.getField(3),
      msg: decode.getField(4),
    );
  }
  factory CosmWasmV1MigrateContract.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1MigrateContract(
        sender: json.as("sender"),
        contract: json.as("contract"),
        codeId: json.asBigInt("code_id"),
        msg: json.asBytes("msg"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "contract": contract,
      "msg": CosmosUtils.tryToBase64(msg),
      "code_id": codeId?.toString()
    };
  }

  @override
  List get values => [sender, contract, codeId, msg];

  @override
  CosmWasmV1Types get typeUrl => CosmWasmV1Types.msgMigrateContract;

  @override
  List<String?> get signers => [sender];

  @override
  CosmWasmV1MsgExecuteContractResponse onResponse(List<int> bytes) {
    return CosmWasmV1MsgExecuteContractResponse.deserialize(bytes);
  }
}
