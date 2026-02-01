import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgRefundTx extends CosmosMessage {
  final ThorchainObservedTx tx;
  final String? inTxId;
  final CosmosBaseAddress? signer;
  ThorchainMsgRefundTx({required this.tx, this.inTxId, this.signer});
  factory ThorchainMsgRefundTx.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgRefundTx(
      tx: ThorchainObservedTx.deserialize(decode.getField(1)),
      inTxId: decode.getField(2),
      signer: decode
          .getResult(3)
          ?.to<CosmosBaseAddress, List<int>>(
            (e) => CosmosBaseAddress.fromBytes(e),
          ),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"tx": tx.toJson(), "in_tx_id": inTxId, "signer": signer?.address};
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.msgRefundTx;

  @override
  List get values => [tx, inTxId, signer?.toBytes()];
}
