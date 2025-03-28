import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_v1beta1/messages/coin.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/core/service.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';
import 'instantiate_contract_response.dart';

/// MsgInstantiateContract create a new smart contract instance for the given
/// code id.
class CosmWasmV1InstantiateContract
    extends CosmWasm1Beta1Service<CosmWasmV1MsgInstantiateContractResponse> {
  /// Sender is the that actor that signed the messages
  final String? sender;

  /// Admin is an optional address that can execute migrations
  final String? admin;

  /// CodeID is the reference to the stored WASM code
  final BigInt? codeId;

  /// Label is optional metadata to be stored with a contract instance.
  final String? label;

  /// Msg json encoded message to be passed to the contract on instantiation
  final List<int>? msg;

  /// Funds coins that are transferred to the contract on instantiation
  final List<Coin>? funds;

  CosmWasmV1InstantiateContract({
    required this.sender,
    required this.admin,
    required this.codeId,
    required this.label,
    required List<int>? msg,
    required List<Coin>? funds,
  })  : msg = msg?.asImmutableBytes,
        funds = funds?.immutable;
  factory CosmWasmV1InstantiateContract.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1InstantiateContract(
        sender: decode.getField(1),
        admin: decode.getField(2),
        codeId: decode.getField(3),
        label: decode.getField(4),
        msg: decode.getField(5),
        funds: decode
            .getFields<List<int>>(6)
            .map((e) => Coin.deserialize(e))
            .toList());
  }
  factory CosmWasmV1InstantiateContract.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1InstantiateContract(
        sender: json.as("sender"),
        admin: json.as("admin"),
        codeId: json.asBigInt("code_id"),
        label: json.as("label"),
        funds: json.asListOfMap("funds")?.map((e) => Coin.fromJson(e)).toList(),
        msg: json.asBytes("msg"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "admin": admin,
      "code_id": codeId?.toString(),
      "label": label,
      "msg": CosmosUtils.tryToBase64(msg),
      "funds": funds?.map((e) => e.toJson()).toList()
    };
  }

  @override
  List get values => [sender, admin, codeId, label, msg, funds];

  @override
  CosmWasmV1Types get typeUrl => CosmWasmV1Types.msgInstantiateContract;

  @override
  List<String?> get signers => [sender];

  @override
  CosmWasmV1MsgInstantiateContractResponse onResponse(List<int> bytes) {
    return CosmWasmV1MsgInstantiateContractResponse.deserialize(bytes);
  }
}
