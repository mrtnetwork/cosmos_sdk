import 'package:cosmos_sdk/src/models/evmos/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'query_storage_response.dart';

/// QueryStorageRequest is the request type for the Query/Storage RPC method.
class EvmosEthermintEVMV1QueryStorageRequest extends CosmosMessage
    with QueryMessage<EvmosEthermintEVMV1QueryStorageResponse> {
  /// address is the ethereum hex address to query the storage state for.
  final String address;

  /// key defines the key of the storage state
  final String key;
  const EvmosEthermintEVMV1QueryStorageRequest({
    required this.address,
    required this.key,
  });
  factory EvmosEthermintEVMV1QueryStorageRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EvmosEthermintEVMV1QueryStorageRequest(
      address: decode.getField(1),
      key: decode.getField(2),
    );
  }
  factory EvmosEthermintEVMV1QueryStorageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintEVMV1QueryStorageRequest(
      address: json["address"],
      key: json["key"],
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"address": address, "key": key};
  }

  @override
  TypeUrl get typeUrl => EvmosErc20V1Types.storageRequest;

  @override
  List get values => [address, key];

  @override
  EvmosEthermintEVMV1QueryStorageResponse onResponse(List<int> bytes) {
    return EvmosEthermintEVMV1QueryStorageResponse.deserialize(bytes);
  }

  @override
  EvmosEthermintEVMV1QueryStorageResponse onJsonResponse(
    Map<String, dynamic> json,
  ) {
    return EvmosEthermintEVMV1QueryStorageResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [address, key];
}
