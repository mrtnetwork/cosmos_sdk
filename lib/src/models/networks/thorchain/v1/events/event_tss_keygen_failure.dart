import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainEventTssKeygenFailure extends CosmosMessage {
  final String? failReason;
  final bool? isUnicast;
  final List<String>? blameNodes;
  final String? round;
  final BigInt? height;
  ThorchainEventTssKeygenFailure(
      {this.failReason,
      this.isUnicast,
      List<String>? blameNodes,
      this.round,
      this.height})
      : blameNodes = blameNodes?.nullOnEmpy;
  factory ThorchainEventTssKeygenFailure.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventTssKeygenFailure(
        failReason: decode.getField(1),
        isUnicast: decode.getField(2),
        blameNodes: decode.getFields(3),
        round: decode.getField(4),
        height: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "fail_reason": failReason,
      "is_unicast": isUnicast,
      "blame_nodes": blameNodes,
      "round": round,
      "height": height?.toString()
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.eventTssKeygenFailure.typeUrl;

  @override
  List get values => [failReason, isUnicast, blameNodes, round, height];
}
