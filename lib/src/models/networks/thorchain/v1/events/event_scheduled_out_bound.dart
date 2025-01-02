import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventScheduledOutbound extends CosmosMessage {
  final ThorchainTxOutItem outTx;
  const ThorchainEventScheduledOutbound(this.outTx);
  factory ThorchainEventScheduledOutbound.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventScheduledOutbound(
        ThorchainTxOutItem.deserialize(decode.getField(1)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"out_tx": outTx.toJson()};
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventScheduledOutbound;

  @override
  List get values => [outTx];
}
