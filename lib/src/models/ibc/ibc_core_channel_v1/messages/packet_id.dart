import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// PacketId is an identifier for a unique Packet Source chains refer to packets by source
/// port/channel Destination chains refer to packets by destination port/channel
class IbcChannelPacketId extends CosmosMessage {
  /// channel port identifier
  final String portId;

  /// channel unique identifier
  final String channelId;

  /// packet sequence
  final BigInt sequence;
  const IbcChannelPacketId(
      {required this.portId, required this.channelId, required this.sequence});
  factory IbcChannelPacketId.fromRpc(Map<String, dynamic> json) {
    return IbcChannelPacketId(
      portId: json["port_id"],
      channelId: json["channel_id"],
      sequence: BigintUtils.parse(json["sequence"]),
    );
  }
  factory IbcChannelPacketId.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelPacketId(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        sequence: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "sequence": sequence.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.packetId;

  @override
  List get values => [portId, channelId, sequence];
}
