import 'package:cosmos_sdk/src/models/ethermint/evm_v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_storage_response.dart';

/// QueryStorageRequest is the request type for the Query/Storage RPC method.
class EVMV1QueryStorageRequest extends CosmosMessage
    with QueryMessage<EVMV1QueryStorageResponse> {
  /// address is the ethereum hex address to query the storage state for.
  final String address;

  /// key defines the key of the storage state
  final String key;
  const EVMV1QueryStorageRequest({required this.address, required this.key});
  factory EVMV1QueryStorageRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EVMV1QueryStorageRequest(
        address: decode.getField(1), key: decode.getField(2));
  }
  factory EVMV1QueryStorageRequest.fromRpc(Map<String, dynamic> json) {
    return EVMV1QueryStorageRequest(address: json["address"], key: json["key"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address, "key": key};
  }

  @override
  TypeUrl get typeUrl => EvmV1Types.storageRequest;

  @override
  List get values => [address, key];

  @override
  EVMV1QueryStorageResponse onResponse(List<int> bytes) {
    return EVMV1QueryStorageResponse.deserialize(bytes);
  }

  @override
  EVMV1QueryStorageResponse onJsonResponse(Map<String, dynamic> json) {
    return EVMV1QueryStorageResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [address, key];
}
