import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventSlashPoint extends CosmosMessage {
  final List<int>? nodeAddress;
  final BigInt? slashPoints;
  final String? reason;
  ThorchainEventSlashPoint({
    List<int>? nodeAddress,
    this.slashPoints,
    this.reason,
  }) : nodeAddress = BytesUtils.tryToBytes(nodeAddress, unmodifiable: true);
  factory ThorchainEventSlashPoint.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventSlashPoint(
      nodeAddress: decode.getField(1),
      slashPoints: decode.getField(2),
      reason: decode.getField(3),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "node_address": BytesUtils.tryToHexString(nodeAddress),
      "slash_points": slashPoints?.toString(),
      "reason": reason,
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventSlashPoint;

  @override
  List get values => [nodeAddress, slashPoints, reason];
}
