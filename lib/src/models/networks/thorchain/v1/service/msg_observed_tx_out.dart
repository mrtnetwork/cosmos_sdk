import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainMsgObservedTxOut extends CosmosMessage {
  final List<ThorchainObservedTx> txs;
  final List<int>? signer;
  ThorchainMsgObservedTxOut(
      {required List<ThorchainObservedTx> txs, List<int>? signer})
      : txs = txs.immutable,
        signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgObservedTxOut.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgObservedTxOut(
        txs: decode
            .getFields(1)
            .map((e) => ThorchainObservedTx.deserialize(e))
            .toList(),
        signer: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "txs": txs.map((e) => e.toJson()).toList(),
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.msgObservedTxOut;

  @override
  List get values => [txs, signer];
}
