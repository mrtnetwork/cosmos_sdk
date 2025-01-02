import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventEthereumTx defines the event for an Ethereum transaction
class EVMV1EventEthereumTx extends CosmosMessage {
  // amount
  final String amount;
  // eth_hash is the Ethereum hash of the transaction
  final String ethHash;
  // index of the transaction in the block
  final String index;
  // gas_used is the amount of gas used by the transaction
  final String gasUsed;
  // hash is the Tendermint hash of the transaction
  final String hash;
  // recipient of the transaction
  final String recipient;
  // eth_tx_failed contains a VM error should it occur
  final String? ethTxFailed;
  const EVMV1EventEthereumTx(
      {required this.amount,
      required this.ethHash,
      required this.index,
      required this.gasUsed,
      required this.hash,
      required this.recipient,
      required this.ethTxFailed});
  factory EVMV1EventEthereumTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1EventEthereumTx(
        amount: decode.getField(1),
        ethHash: decode.getField(2),
        index: decode.getField(3),
        gasUsed: decode.getField(4),
        hash: decode.getField(5),
        recipient: decode.getField(6),
        ethTxFailed: decode.getField(7));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "amount": amount,
      "eth_hash": ethHash,
      "index": index,
      "gas_used": gasUsed,
      "hash": hash,
      "recipient": recipient,
      "ethTxFailed": ethTxFailed
    };
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.eventEthereumTx;

  @override
  List get values =>
      [amount, ethHash, index, gasUsed, hash, recipient, ethTxFailed];
}
