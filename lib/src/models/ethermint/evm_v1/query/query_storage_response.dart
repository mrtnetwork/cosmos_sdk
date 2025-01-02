import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryStorageResponse is the response type for the Query/Storage RPC method.
class EVMV1QueryStorageResponse extends CosmosMessage {
  // value defines the storage state value hash associated with the given key.
  final String value;
  const EVMV1QueryStorageResponse(this.value);
  factory EVMV1QueryStorageResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryStorageResponse(decode.getField(1));
  }
  factory EVMV1QueryStorageResponse.fromRpc(Map<String, dynamic> json) {
    return EVMV1QueryStorageResponse(json["value"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"value": value};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.storageResponse;

  @override
  List get values => [value];
}
