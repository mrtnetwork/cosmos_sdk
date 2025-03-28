import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/absolute_tx_position.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/messages/contract_code_history_operation_type.dart';
import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// ContractCodeHistoryEntry metadata to a contract.
class CosmWasmV1ContractCodeHistoryEntry extends CosmosMessage {
  final CosmWasmV1ContractCodeHistoryOperationType? operation;

  /// CodeID is the reference to the stored Wasm code
  final BigInt? codeId;

  /// Updated Tx position when the operation was executed.
  final CosmWasmV1AbsoluteTxPosition? updated;
  final List<int>? msg;

  CosmWasmV1ContractCodeHistoryEntry({
    required this.codeId,
    required this.operation,
    required this.updated,
    required List<int>? msg,
  }) : msg = msg?.asImmutableBytes;
  factory CosmWasmV1ContractCodeHistoryEntry.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1ContractCodeHistoryEntry(
        codeId: decode.getField(2),
        operation: decode
            .getResult(1)
            ?.to<CosmWasmV1ContractCodeHistoryOperationType, int>(
                (e) => CosmWasmV1ContractCodeHistoryOperationType.fromValue(e)),
        updated: decode
            .getResult(3)
            ?.to<CosmWasmV1AbsoluteTxPosition, List<int>>(
                (e) => CosmWasmV1AbsoluteTxPosition.deserialize(e)),
        msg: decode.getField(4));
  }
  factory CosmWasmV1ContractCodeHistoryEntry.fromJson(
      Map<String, dynamic> json) {
    return CosmWasmV1ContractCodeHistoryEntry(
        codeId: json.asBigInt("code_id"),
        operation:
            json.maybeAs<CosmWasmV1ContractCodeHistoryOperationType, String>(
                key: "operation",
                onValue: (e) =>
                    CosmWasmV1ContractCodeHistoryOperationType.fromName(e)),
        updated:
            json.maybeAs<CosmWasmV1AbsoluteTxPosition, Map<String, dynamic>>(
                key: "updated",
                onValue: (e) => CosmWasmV1AbsoluteTxPosition.fromJson(e)),
        msg: json.asBytes("msg"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "code_id": codeId?.toString(),
      "operation": operation?.name,
      "updated": updated?.toJson(),
      "msg": CosmosUtils.tryToBase64(msg)
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.contractCodeHistoryEntry;

  @override
  List get values => [operation, codeId, updated, msg];
}
