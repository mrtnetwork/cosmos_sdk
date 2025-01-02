import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// PacketSequence defines the genesis type necessary to retrieve and store next send and receive sequences.
class IbcChannelPacketSequence extends CosmosMessage {
  /// channel port identifier
  final String? portId;

  /// channel unique identifier
  final String? channelId;

  /// packet sequence
  final BigInt? sequence;
  const IbcChannelPacketSequence({this.portId, this.channelId, this.sequence});
  factory IbcChannelPacketSequence.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelPacketSequence(
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
      "sequence": sequence?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.packetSequence;

  @override
  List get values => [portId, channelId, sequence];
}
