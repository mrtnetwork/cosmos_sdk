import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';
import 'execute_contract_response.dart';

/// MsgExecuteContract submits the given message data to a smart contract
class CosmWasmV1ExecuteContract
    extends CosmWasm1Beta1Service<CosmWasmV1MsgExecuteContractResponse> {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// Contract is the address of the smart contract
  final String? contract;

  /// Msg json encoded message to be passed to the contract
  final List<int>? msg;

  /// Funds coins that are transferred to the contract on execution
  final List<Coin>? funds;

  CosmWasmV1ExecuteContract({
    required this.sender,
    required this.contract,
    required List<int>? msg,
    required List<Coin>? funds,
  }) : msg = msg?.asImmutableBytes,
       funds = funds?.immutable;
  factory CosmWasmV1ExecuteContract.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1ExecuteContract(
      sender: decode.getField(1),
      contract: decode.getField(2),
      msg: decode.getField(3),
      funds:
          decode
              .getFields<List<int>>(5)
              .map((e) => Coin.deserialize(e))
              .toList(),
    );
  }
  factory CosmWasmV1ExecuteContract.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1ExecuteContract(
      sender: json.as("sender"),
      contract: json.as("contract"),
      funds: json.asListOfMap("funds")?.map((e) => Coin.fromJson(e)).toList(),
      msg: json.asBytes("msg"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "contract": contract,
      "msg": CosmosUtils.tryToBase64(msg),
      "funds": funds?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List get values => [sender, contract, msg, funds];

  @override
  CosmWasmV1Types get typeUrl => CosmWasmV1Types.msgExecuteContract;

  @override
  List<String?> get signers => [sender];

  @override
  CosmWasmV1MsgExecuteContractResponse onResponse(List<int> bytes) {
    return CosmWasmV1MsgExecuteContractResponse.deserialize(bytes);
  }
}
