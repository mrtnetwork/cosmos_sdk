import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgOutboundTx extends CosmosMessage {
  final ThorchainObservedTx tx;
  final String? inTxId;
  final List<int>? signer;
  ThorchainMsgOutboundTx({required this.tx, this.inTxId, List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgOutboundTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgOutboundTx(
        tx: ThorchainObservedTx.deserialize(decode.getField(1)),
        inTxId: decode.getField(2),
        signer: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx": tx.toJson(),
      "in_tx_id": inTxId,
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgOutboundTx.typeUrl;

  @override
  List get values => [tx, inTxId, signer];
}
