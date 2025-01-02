import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_node_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// StateResponse defines the response structure for the status of a node.
class NodeStatusResponse extends CosmosMessage {
  final BigInt? earliestStoreHeight;
  final BigInt? height;
  final ProtobufTimestamp? timestamp;
  final List<int>? appHash;
  final List<int>? validatorHash;
  factory NodeStatusResponse.fromRpc(Map<String, dynamic> json) {
    return NodeStatusResponse(
      timestamp: json["timestamp"] == null
          ? null
          : ProtobufTimestamp.fromString(json["timestamp"]),
      validatorHash: StringUtils.tryEncode(json["validator_hash"],
          type: StringEncoding.base64),
      appHash:
          StringUtils.tryEncode(json["app_hash"], type: StringEncoding.base64),
      height: BigintUtils.tryParse(json["height"]),
      earliestStoreHeight: BigintUtils.tryParse(json["earliest_store_height"]),
    );
  }
  NodeStatusResponse(
      {this.earliestStoreHeight,
      this.height,
      this.timestamp,
      List<int>? appHash,
      List<int>? validatorHash})
      : appHash = BytesUtils.tryToBytes(appHash, unmodifiable: true),
        validatorHash =
            BytesUtils.tryToBytes(validatorHash, unmodifiable: true);
  factory NodeStatusResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return NodeStatusResponse(
        earliestStoreHeight: decode.getField(1),
        height: decode.getField(2),
        timestamp: decode.getResult(3)?.to<ProtobufTimestamp, List<int>>(
            (e) => ProtobufTimestamp.deserialize(e)),
        appHash: decode.getField(4),
        validatorHash: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "earliest_store_height": earliestStoreHeight?.toString(),
      "height": height?.toString(),
      "timestamp": timestamp?.toJson(),
      "app_hash": StringUtils.tryDecode(appHash, type: StringEncoding.base64),
      "validator_hash":
          StringUtils.tryDecode(validatorHash, type: StringEncoding.base64),
    };
  }

  @override
  TypeUrl get typeUrl => BaseNodeV1beta1Types.nodeStatusResponse;

  @override
  List get values =>
      [earliestStoreHeight, height, timestamp, appHash, validatorHash];
}
