import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

// State represents a single Storage key value pair item.
class EVMV1State extends CosmosMessage {
  /// key is the stored key
  final String key;

  /// value is the stored value for the given key
  final String value;
  const EVMV1State({required this.key, required this.value});
  factory EVMV1State.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1State(
        key: decode.getField<String>(1), value: decode.getField<String>(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"key": key, "value": value};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.state;

  @override
  List get values => [key, value];
}
