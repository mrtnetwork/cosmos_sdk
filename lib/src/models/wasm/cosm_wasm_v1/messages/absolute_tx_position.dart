import 'package:cosmos_sdk/src/models/wasm/cosm_wasm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// AbsoluteTxPosition is a unique transaction position that allows for global ordering of transactions.
class CosmWasmV1AbsoluteTxPosition extends CosmosMessage {
  /// BlockHeight is the block the contract was created at
  final BigInt? blockHeigt;

  /// TxIndex is a monotonic counter within the block (actual transaction index,
  /// or gas consumed)
  final BigInt? txIndex;
  CosmWasmV1AbsoluteTxPosition({
    required this.blockHeigt,
    required this.txIndex,
  });
  factory CosmWasmV1AbsoluteTxPosition.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return CosmWasmV1AbsoluteTxPosition(
        blockHeigt: decode.getField(1), txIndex: decode.getField(2));
  }
  factory CosmWasmV1AbsoluteTxPosition.fromJson(Map<String, dynamic> json) {
    return CosmWasmV1AbsoluteTxPosition(
        blockHeigt: json.asBigInt("block_height"),
        txIndex: json.asBigInt("tx_index"));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "block_height": blockHeigt?.toString(),
      "tx_index": txIndex?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => CosmWasmV1Types.absoluteTxPosition;

  @override
  List get values => [blockHeigt, txIndex];
}
