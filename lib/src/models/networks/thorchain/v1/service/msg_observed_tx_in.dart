import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainMsgObservedTxIn extends CosmosMessage {
  final List<ThorchainObservedTx> txs;
  final List<int>? signer;
  ThorchainMsgObservedTxIn(
      {required List<ThorchainObservedTx> txs, List<int>? signer})
      : txs = txs.mutable,
        signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgObservedTxIn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgObservedTxIn(
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
  String get typeUrl => ThorchainV1Types.msgObservedTxIn.typeUrl;

  @override
  List get values => [txs, signer];
}
