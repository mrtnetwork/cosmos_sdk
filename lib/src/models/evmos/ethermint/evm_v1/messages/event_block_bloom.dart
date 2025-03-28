import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventBlockBloom defines an Ethereum block bloom filter event
class EvmosEthermintEVMV1EventBlockBloom extends CosmosMessage {
  /// bloom is the bloom filter of the block
  final String bloom;
  const EvmosEthermintEVMV1EventBlockBloom(this.bloom);
  factory EvmosEthermintEVMV1EventBlockBloom.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1EventBlockBloom(decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"bloom": bloom.toString()};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.eventBlockBloom;

  @override
  List get values => [bloom];
}
