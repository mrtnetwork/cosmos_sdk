import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainBlame extends CosmosMessage {
  final String? failReason;
  final bool? isUnicast;
  final List<ThorchainNode> blameNodes;
  final String? round;
  ThorchainBlame({
    this.failReason,
    this.isUnicast,
    required List<ThorchainNode> blameNodes,
    this.round,
  }) : blameNodes = blameNodes.immutable;
  factory ThorchainBlame.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainBlame(
      failReason: decode.getField(1),
      isUnicast: decode.getField(2),
      blameNodes:
          decode
              .getFields<List<int>>(3)
              .map((e) => ThorchainNode.deserialize(e))
              .toList(),
      round: decode.getField(4),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "fail_reason": failReason,
      "is_unicast": isUnicast,
      "blame_nodes": blameNodes.map((e) => e.toJson()).toList(),
      "round": round,
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.blame;

  @override
  List get values => [failReason, isUnicast, blameNodes, round];
}
