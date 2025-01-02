import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainTssKeysignMetric extends CosmosMessage {
  final String? txId;
  final List<ThorchainNodeTssTime> nodeTssTimes;
  ThorchainTssKeysignMetric(
      {this.txId, required List<ThorchainNodeTssTime> nodeTssTimes})
      : nodeTssTimes = nodeTssTimes.immutable;
  factory ThorchainTssKeysignMetric.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainTssKeysignMetric(
        txId: decode.getField(1),
        nodeTssTimes: decode
            .getFields(2)
            .map((e) => ThorchainNodeTssTime.deserialized(e))
            .toList());
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx_id": txId,
      "node_tss_times": nodeTssTimes.map((e) => e.toJson()).toList()
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.tssKeysignMetric;

  @override
  List get values => [txId, nodeTssTimes];
}
