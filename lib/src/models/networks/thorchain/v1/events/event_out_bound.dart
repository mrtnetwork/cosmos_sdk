import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventOutbound extends CosmosMessage {
  final String? inTxId;
  final ThorchainTx tx;
  const ThorchainEventOutbound({this.inTxId, required this.tx});
  factory ThorchainEventOutbound.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventOutbound(
      inTxId: decode.getField(1),
      tx: ThorchainTx.deserialize(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"in_tx_id": inTxId, "tx": tx.toJson()};
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventOutbound;

  @override
  List get values => [inTxId, tx];
}
