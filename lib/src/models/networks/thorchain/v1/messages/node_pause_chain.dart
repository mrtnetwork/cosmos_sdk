import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainNodePauseChain extends CosmosMessage {
  final List<int>? nodeAddress;
  final BigInt? blockHeight;
  ThorchainNodePauseChain({List<int>? nodeAddress, this.blockHeight})
      : nodeAddress = BytesUtils.tryToBytes(nodeAddress);
  factory ThorchainNodePauseChain.deserialized(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainNodePauseChain(
        nodeAddress: decode.getField(1), blockHeight: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "node_address": BytesUtils.tryToHexString(nodeAddress),
      "block_height": blockHeight?.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.nodePauseChain.typeUrl;

  @override
  List get values => [nodeAddress, blockHeight];
}
