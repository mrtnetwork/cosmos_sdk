import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventLimitOrder extends CosmosMessage {
  final ThorchainCoin source;
  final ThorchainCoin target;
  final String? txId;
  const ThorchainEventLimitOrder({
    required this.source,
    required this.target,
    this.txId,
  });
  factory ThorchainEventLimitOrder.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventLimitOrder(
      source: ThorchainCoin.deserialize(decode.getField(1)),
      target: ThorchainCoin.deserialize(decode.getField(2)),
      txId: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "source": source.toJson(),
      "target": target.toJson(),
      "tx_id": txId,
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventLimitOrder;

  @override
  List get values => [source, target, txId];
}
