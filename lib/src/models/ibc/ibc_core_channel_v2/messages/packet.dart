import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v2/ibc_core_channel_v2.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// Packet defines a type that carries data across different chains through IBC
class IbcChannelV2Packet extends CosmosMessage {
  /// number corresponds to the order of sends and receives, where a Packet
  /// with an earlier sequence number must be sent and received before a Packet
  /// with a later sequence number.
  final BigInt? sequence;

  /// identifies the sending client on the sending chain.
  final String? sourceClient;

  /// identifies the receiving client on the receiving chain.
  final String? destinationClient;

  /// timeout timestamp in seconds after which the packet times out.
  final BigInt? timeoutTimestamp;

  /// a list of payloads, each one for a specific application.
  final List<IbcChannelV2Payload>? payloads;

  IbcChannelV2Packet({
    required this.sequence,
    required this.sourceClient,
    required this.destinationClient,
    required this.timeoutTimestamp,
    List<IbcChannelV2Payload>? payloads,
  }) : payloads = payloads?.immutable;
  factory IbcChannelV2Packet.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2Packet(
      sequence: decode.getField(1),
      destinationClient: decode.getField(3),
      sourceClient: decode.getField(2),
      timeoutTimestamp: decode.getField(4),
      payloads:
          decode
              .getFields<List<int>>(5)
              .map((e) => IbcChannelV2Payload.deserialize(e))
              .toList(),
    );
  }
  factory IbcChannelV2Packet.fromJson(Map<String, dynamic> json) {
    return IbcChannelV2Packet(
      sequence: json.asBigInt("sequence"),
      sourceClient: json.as("source_client"),
      destinationClient: json.as("destination_client"),
      timeoutTimestamp: json.asBigInt("timeout_timestamp"),
      payloads:
          json
              .asListOfMap("payloads")
              ?.map(IbcChannelV2Payload.fromJson)
              .toList(),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "sequence": sequence?.toString(),
      "source_client": sourceClient,
      "destination_client": destinationClient,
      "timeout_timestamp": timeoutTimestamp,
      "payloads": payloads?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2Packet;

  @override
  List get values => [
    sequence,
    sourceClient,
    destinationClient,
    timeoutTimestamp,
    payloads,
  ];
}
