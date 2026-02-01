import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/service/sudo_contract_response.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// MsgSudoContract is the MsgSudoContract request type.
class CosmWasmV1SudoContract
    extends CosmWasm1Beta1Service<CosmWasmV1MsgSudoContractResponse> {
  /// Authority is the address of the governance account.
  final String? authority;

  /// Contract is the address of the smart contract
  final String? contract;

  /// Msg json encoded message to be passed to the contract as sudo
  final List<int>? msg;

  CosmWasmV1SudoContract({
    required this.authority,
    required this.contract,
    required List<int>? msg,
  }) : msg = msg?.immutable;
  factory CosmWasmV1SudoContract.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1SudoContract(
      authority: decode.getField(1),
      contract: decode.getField(2),
      msg: decode.getField(3),
    );
  }
  factory CosmWasmV1SudoContract.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1SudoContract(
      authority: json.as("authority"),
      contract: json.as("contract"),
      msg: json.asBytes("msg"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "authority": authority,
      "contract": contract,
      "msg": CosmosUtils.tryToBase64(msg),
    };
  }

  @override
  List get values => [authority, contract, msg];

  @override
  CosmWasmV1Types get typeUrl => CosmWasmV1Types.msgSudoContract;

  @override
  List<String?> get signers => [authority];

  @override
  CosmWasmV1MsgSudoContractResponse onResponse(List<int> bytes) {
    return CosmWasmV1MsgSudoContractResponse.deserialize(bytes);
  }
}
