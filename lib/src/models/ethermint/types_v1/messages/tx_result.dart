import 'package:cosmos_sdk/src/models/ethermint/types_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TxResult is the value stored in eth tx indexer
class EthermintTypesV1TxResult extends CosmosMessage {
// height of the blockchain
  final BigInt height;
  // tx_index of the cosmos transaction
  final int txIndex;
  // msg_index in a batch transaction
  final int msgIndex;
  // eth_tx_index is the index in the list of valid eth tx in the block,
  // aka. the transaction list returned by eth_getBlock api.
  final int ethTxIndex;
  // failed is true if the eth transaction did not go succeed
  final bool failed;
  // gas_used by the transaction. If it exceeds the block gas limit,
  // it's set to gas limit, which is what's actually deducted by ante handler.
  final BigInt gasUsed;
  // cumulative_gas_used specifies the cumulated amount of gas used for all
  // processed messages within the current batch transaction.
  final BigInt cumulativeGasUsed;
  const EthermintTypesV1TxResult(
      {required this.height,
      required this.txIndex,
      required this.msgIndex,
      required this.ethTxIndex,
      required this.failed,
      required this.gasUsed,
      required this.cumulativeGasUsed});
  factory EthermintTypesV1TxResult.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EthermintTypesV1TxResult(
        height: decode.getField(1),
        txIndex: decode.getField(2),
        msgIndex: decode.getField(3),
        ethTxIndex: decode.getField(4),
        failed: decode.getField(5),
        gasUsed: decode.getField(6),
        cumulativeGasUsed: decode.getField(7));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "height": height.toString(),
      "tx_index": txIndex,
      "msg_index": msgIndex,
      "eth_tx_index": ethTxIndex,
      "failed": failed,
      "gas_used": gasUsed.toString(),
      "cumulative_gas_used": cumulativeGasUsed.toString()
    };
  }

  @override
  TypeUrl get typeUrl => EthermintTypesV1Types.txResult;

  @override
  List get values => [
        height,
        txIndex,
        msgIndex,
        ethTxIndex,
        failed,
        gasUsed,
        cumulativeGasUsed
      ];
}
