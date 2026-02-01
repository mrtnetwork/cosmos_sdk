import 'package:cosmos_sdk/src/models/ibc/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Hop defines a port ID, channel ID pair specifying where tokens must be forwarded
/// next in a multihop transfer.
class IbcTransferV1Hop extends CosmosMessage {
  final String portId;
  final String channelId;

  const IbcTransferV1Hop({required this.portId, required this.channelId});
  factory IbcTransferV1Hop.fromJson(Map<String, dynamic> json) {
    return IbcTransferV1Hop(
      portId: json["port_id"],
      channelId: json["channel_id"],
    );
  }
  factory IbcTransferV1Hop.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcTransferV1Hop(
      portId: decode.getField(1),
      channelId: decode.getField(2),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"port_id": portId, "channel_id": channelId};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.hop;

  @override
  List get values => [portId, channelId];
}
