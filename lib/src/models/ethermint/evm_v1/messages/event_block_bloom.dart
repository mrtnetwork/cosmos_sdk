import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventBlockBloom defines an Ethereum block bloom filter event
class EVMV1EventBlockBloom extends CosmosMessage {
  /// bloom is the bloom filter of the block
  final String bloom;
  const EVMV1EventBlockBloom(this.bloom);
  factory EVMV1EventBlockBloom.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1EventBlockBloom(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"bloom": bloom.toString()};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.eventBlockBloom;

  @override
  List get values => [bloom];
}
