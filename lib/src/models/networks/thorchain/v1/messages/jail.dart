import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainJail extends CosmosMessage {
  final List<int>? nodeAddress;
  final BigInt? releaseHeight;
  final String? reason;
  ThorchainJail({List<int>? nodeAddress, this.releaseHeight, this.reason})
      : nodeAddress = BytesUtils.tryToBytes(nodeAddress, unmodifiable: true);
  factory ThorchainJail.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainJail(
        nodeAddress: decode.getField(1),
        releaseHeight: decode.getField(2),
        reason: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "node_address": BytesUtils.tryToHexString(nodeAddress),
      "release_height": releaseHeight?.toString(),
      "reason": reason
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.jail;

  @override
  List get values => [nodeAddress, releaseHeight, reason];
}
