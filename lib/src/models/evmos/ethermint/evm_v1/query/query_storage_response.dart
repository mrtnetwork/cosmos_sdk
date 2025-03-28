import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryStorageResponse is the response type for the Query/Storage RPC method.
class EvmosEthermintEVMV1QueryStorageResponse extends CosmosMessage {
  // value defines the storage state value hash associated with the given key.
  final String value;
  const EvmosEthermintEVMV1QueryStorageResponse(this.value);
  factory EvmosEthermintEVMV1QueryStorageResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryStorageResponse(decode.getField(1));
  }
  factory EvmosEthermintEVMV1QueryStorageResponse.fromJson(
      Map<String, dynamic> json) {
    return EvmosEthermintEVMV1QueryStorageResponse(json["value"]);
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"value": value};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.storageResponse;

  @override
  List get values => [value];
}
