import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';
import 'package:cosmos_sdk/src/utils/utils.dart';

/// Payload contains the source and destination ports and payload for the application (version, encoding, raw bytes)
class IbcChannelV2Payload extends CosmosMessage {
  /// specifies the source port of the packet.
  final String? sourcePort;

  /// specifies the destination port of the packet
  final String? destinationPort;

  /// version of the specified application.
  final String? version;

  /// the encoding used for the provided value.
  final String? encoding;

  /// the encoding used for the provided value.
  final List<int>? value;
  IbcChannelV2Payload({
    required this.sourcePort,
    required this.destinationPort,
    required this.version,
    required this.encoding,
    List<int>? value,
  }) : value = value?.asImmutableBytes;
  factory IbcChannelV2Payload.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcChannelV2Payload(
      sourcePort: decode.getField(1),
      destinationPort: decode.getField(2),
      encoding: decode.getField(4),
      version: decode.getField(3),
      value: decode.getField(5),
    );
  }
  factory IbcChannelV2Payload.fromJson(Map<String, dynamic> json) {
    return IbcChannelV2Payload(
      sourcePort: json.as("source_port"),
      destinationPort: json.as("destination_port"),
      encoding: json.as("encoding"),
      version: json.as("version"),
      value: json.asBytes("value"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "source_port": sourcePort,
      "destination_port": destinationPort,
      "encoding": encoding,
      "version": version,
      "value": CosmosUtils.tryToBase64(value),
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.channelV2Payload;

  @override
  List get values => [sourcePort, destinationPort, version, encoding, value];
}
