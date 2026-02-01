import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventDonate extends CosmosMessage {
  final ThorchainAsset pool;
  final ThorchainTx tx;
  const ThorchainEventDonate({required this.pool, required this.tx});
  factory ThorchainEventDonate.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventDonate(
      pool: ThorchainAsset.deserialize(decode.getField(1)),
      tx: ThorchainTx.deserialize(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"pool": pool.toJson(), "tx": tx.toJson()};
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventDonate;

  @override
  List get values => [pool, tx];
}
