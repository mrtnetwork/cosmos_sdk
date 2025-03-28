import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// FeeEnabledChannel contains the PortID & ChannelID for a fee enabled channel
class IbcFeeFeeEnabledChannel extends CosmosMessage {
  /// unique port identifier
  final String? portId;

  /// unique channel identifier
  final String? channelId;
  const IbcFeeFeeEnabledChannel({this.portId, this.channelId});
  factory IbcFeeFeeEnabledChannel.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return IbcFeeFeeEnabledChannel(
        portId: decode.getField(1), channelId: decode.getField(2));
  }

  factory IbcFeeFeeEnabledChannel.fromJson(Map<String, dynamic> json) {
    return IbcFeeFeeEnabledChannel(
        portId: json["port_id"], channelId: json["channel_id"]);
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"port_id": portId, "channel_id": channelId};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.feeEnabledChannel;

  @override
  List get values => [portId, channelId];
}
