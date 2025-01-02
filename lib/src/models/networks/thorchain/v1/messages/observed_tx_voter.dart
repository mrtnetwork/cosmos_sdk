import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainObservedTxVoter extends CosmosMessage {
  final String? txId;
  final ThorchainObservedTx tx;
  final BigInt? height;
  final List<ThorchainObservedTx> txs;
  final List<ThorchainTxOutItem> actions;
  final List<ThorchainTx> outTxs;
  final BigInt? finalisedHeight;
  final bool? updatedVault;
  final bool? reverted;
  final BigInt? outboundHeight;
  ThorchainObservedTxVoter(
      {this.txId,
      required this.tx,
      this.height,
      required List<ThorchainObservedTx> txs,
      required List<ThorchainTxOutItem> actions,
      required List<ThorchainTx> outTxs,
      this.finalisedHeight,
      this.updatedVault,
      this.reverted,
      this.outboundHeight})
      : txs = txs.immutable,
        actions = actions.immutable,
        outTxs = outTxs.immutable;
  factory ThorchainObservedTxVoter.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainObservedTxVoter(
        txId: decode.getField(1),
        tx: ThorchainObservedTx.deserialize(decode.getField(2)),
        height: decode.getField(3),
        txs: decode
            .getFields(4)
            .map((e) => ThorchainObservedTx.deserialize(e))
            .toList(),
        actions: decode
            .getFields(5)
            .map((e) => ThorchainTxOutItem.deserialize(e))
            .toList(),
        outTxs:
            decode.getFields(6).map((e) => ThorchainTx.deserialize(e)).toList(),
        finalisedHeight: decode.getField(7),
        updatedVault: decode.getField(8),
        reverted: decode.getField(9),
        outboundHeight: decode.getField(10));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx_id": txId,
      "tx": tx.toJson(),
      "height": height?.toString(),
      "txs": txs.map((e) => e.toJson()).toList(),
      "actions": actions.map((e) => e.toJson()).toList(),
      "out_txs": outTxs.map((e) => e.toJson()).toList(),
      "finalised_height": finalisedHeight?.toString(),
      "updated_vault": updatedVault,
      "reverted": reverted,
      "outbound_height": outboundHeight?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.observedTxVoter;

  @override
  List get values => [
        txId,
        tx,
        height,
        txs,
        actions,
        outTxs,
        finalisedHeight,
        updatedVault,
        reverted,
        outboundHeight
      ];
}
