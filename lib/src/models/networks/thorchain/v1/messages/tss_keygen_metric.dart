import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainTssKeygenMetric extends CosmosMessage {
  final String? pubKey;
  final List<ThorchainNodeTssTime> nodeTssTimes;
  ThorchainTssKeygenMetric(
      {this.pubKey, required List<ThorchainNodeTssTime> nodeTssTimes})
      : nodeTssTimes = nodeTssTimes.mutable;
  factory ThorchainTssKeygenMetric.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainTssKeygenMetric(
        pubKey: decode.getField(1),
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
      "pub_key": pubKey,
      "node_tss_times": nodeTssTimes.map((e) => e.toJson()).toList()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.tssKeygenMetric.typeUrl;

  @override
  List get values => [pubKey, nodeTssTimes];
}
