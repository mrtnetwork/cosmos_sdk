import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventTssKeysignMetric extends CosmosMessage {
  final String? txId;
  final BigInt? medianDurationMs;
  const ThorchainEventTssKeysignMetric({this.txId, this.medianDurationMs});
  factory ThorchainEventTssKeysignMetric.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventTssKeysignMetric(
        txId: decode.getField(1), medianDurationMs: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"tx_id": txId, "median_duration_ms": medianDurationMs?.toString()};
  }

  @override
  String get typeUrl => ThorchainV1Types.eventTssKeysignMetric.typeUrl;

  @override
  List get values => [txId, medianDurationMs];
}
