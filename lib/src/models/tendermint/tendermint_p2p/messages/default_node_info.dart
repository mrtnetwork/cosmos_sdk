import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/tendermint/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_p2p/messages/default_node_info_other.dart';
import 'package:cosmos_sdk/src/models/tendermint/tendermint_p2p/messages/protocol_version.dart';

class DefaultNodeInfo extends CosmosMessage {
  final ProtocolVersion protocolVersion;
  final String? defaultNodeId;
  final String? listenAddress;
  final String? network;
  final String? version;
  final List<int>? channels;
  final String? moniker;
  final DefaultNodeInfoOther other;
  factory DefaultNodeInfo.fromJson(Map<String, dynamic> json) {
    return DefaultNodeInfo(
        protocolVersion: ProtocolVersion.fromJson(json["protocol_version"]),
        channels: StringUtils.tryEncode(json["channels"],
            type: StringEncoding.base64),
        other: DefaultNodeInfoOther.fromJson(json["other"]),
        defaultNodeId: json["default_node_id"],
        listenAddress: json["listen_addr"],
        moniker: json["moniker"],
        network: json["network"],
        version: json["version"]);
  }
  DefaultNodeInfo(
      {required this.protocolVersion,
      this.defaultNodeId,
      this.listenAddress,
      this.network,
      this.version,
      List<int>? channels,
      this.moniker,
      required this.other})
      : channels = BytesUtils.tryToBytes(channels, unmodifiable: true);
  factory DefaultNodeInfo.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return DefaultNodeInfo(
        protocolVersion: ProtocolVersion.deserialize(decode.getField(1)),
        defaultNodeId: decode.getField(2),
        listenAddress: decode.getField(3),
        network: decode.getField(4),
        version: decode.getField(5),
        channels: decode.getField(6),
        moniker: decode.getField(7),
        other: DefaultNodeInfoOther.deserialize(decode.getField(8)));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "protocol_version": protocolVersion.toJson(),
      "default_node_id": defaultNodeId,
      "listen_addr": listenAddress,
      "network": network,
      "version": version,
      "channels": StringUtils.tryDecode(channels, type: StringEncoding.base64),
      "moniker": moniker,
      "other": other.toJson()
    };
  }

  @override
  TypeUrl get typeUrl => TendermintTypes.defaultNodeInfo;

  @override
  List get values => [
        protocolVersion,
        defaultNodeId,
        listenAddress,
        network,
        version,
        channels,
        moniker,
        other
      ];
}
