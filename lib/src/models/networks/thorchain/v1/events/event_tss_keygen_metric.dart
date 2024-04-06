import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventTssKeygenMetric extends CosmosMessage {
  final String? pubKey;
  final BigInt? medianDurationMs;
  const ThorchainEventTssKeygenMetric({this.pubKey, this.medianDurationMs});
  factory ThorchainEventTssKeygenMetric.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventTssKeygenMetric(
        pubKey: decode.getField(1), medianDurationMs: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pub_key": pubKey,
      "median_duration_ms": medianDurationMs?.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.eventTssKeygenMetric.typeUrl;

  @override
  List get values => [pubKey, medianDurationMs];
}
