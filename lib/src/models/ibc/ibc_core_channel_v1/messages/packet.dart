import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_client_v1/messages/height.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// Packet defines a type that carries data across different chains through IBC
class IbcChannelPacket extends CosmosMessage {
  /// number corresponds to the order of sends and receives, where a Packet
  /// with an earlier sequence number must be sent and received before a Packet
  /// with a later sequence number.
  final BigInt? sequence;

  /// identifies the port on the sending chain.
  final String? sourcePort;

  /// identifies the channel end on the sending chain.
  final String? sourceChannel;

  ///  identifies the port on the receiving chain
  final String? destinationPort;

  /// identifies the channel end on the receiving chain.
  final String? destinationChannel;

  /// actual opaque bytes transferred directly to the application module
  final List<int>? data;

  /// block height after which the packet times out
  final IbcClientHeight timeoutHeight;

  /// block timestamp (in nanoseconds) after which the packet times out
  final BigInt? timeoutTimestamp;
  IbcChannelPacket({
    this.sequence,
    this.sourcePort,
    this.sourceChannel,
    this.destinationPort,
    this.destinationChannel,
    List<int>? data,
    required this.timeoutHeight,
    this.timeoutTimestamp,
  }) : data = BytesUtils.tryToBytes(data, unmodifiable: true);
  factory IbcChannelPacket.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelPacket(
      sequence: decode.getField(1),
      sourcePort: decode.getField(2),
      sourceChannel: decode.getField(3),
      destinationPort: decode.getField(4),
      destinationChannel: decode.getField(5),
      data: decode.getField(6),
      timeoutHeight: IbcClientHeight.deserialize(decode.getField(7)),
      timeoutTimestamp: decode.getField(8),
    );
  }
  factory IbcChannelPacket.fromJson(Map<String, dynamic> json) {
    return IbcChannelPacket(
      sequence: json.asBigInt("sequence"),
      sourcePort: json.as("source_port"),
      sourceChannel: json.as("source_channel"),
      destinationPort: json.as("destination_port"),
      destinationChannel: json.as("destination_channel"),
      data: json.asBytes("data"),
      timeoutHeight: IbcClientHeight.fromJson(json.asMap("timeout_height")),
      timeoutTimestamp: json.asBigInt("timeout_timestamp"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sequence": sequence,
      "source_port": sourcePort,
      "source_channel": sourceChannel,
      "destination_port": destinationPort,
      "destination_channel": destinationChannel,
      "data": BytesUtils.tryToHexString(data),
      "timeout_height": timeoutHeight.toJson(),
      "timeout_timestamp": timeoutTimestamp?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.packet;

  @override
  List get values => [
    sequence,
    sourcePort,
    sourceChannel,
    destinationPort,
    destinationChannel,
    data,
    timeoutHeight,
    timeoutTimestamp,
  ];
}
