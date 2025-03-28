import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// PacketState defines the generic type necessary to retrieve and store packet commitments,
/// acknowledgements, and receipts. Caller is responsible for knowing the context necessary
/// to interpret this state as a commitment, acknowledgement, or a receipt.
class IbcChannelPacketState extends CosmosMessage {
  /// channel port identifier.
  final String? portId;

  /// channel unique identifier.
  final String? channelId;

  /// packet sequence.
  final BigInt? sequence;

  /// embedded data that represents packet state.
  final List<int>? data;
  factory IbcChannelPacketState.fromJson(Map<String, dynamic> json) {
    return IbcChannelPacketState(
        portId: json["port_id"],
        data: CosmosUtils.tryToBytes(json["data"]),
        sequence: json["sequence"],
        channelId: json["channel_id"]);
  }
  IbcChannelPacketState(
      {this.portId, this.channelId, this.sequence, List<int>? data})
      : data = BytesUtils.tryToBytes(data, unmodifiable: true);
  factory IbcChannelPacketState.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelPacketState(
        portId: decode.getField(1),
        channelId: decode.getField(2),
        data: decode.getField(4),
        sequence: decode.getField(3));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "port_id": portId,
      "channel_id": channelId,
      "sequence": sequence?.toString(),
      "data": BytesUtils.tryToHexString(data)
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.packetState;

  @override
  List get values => [portId, channelId, sequence, data];
}
