import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgChannelOpenTryResponse defines the Msg/ChannelOpenTry response type.
class MsgChannelOpenTryResponse extends CosmosMessage {
  final String? version;
  final String? channelId;
  const MsgChannelOpenTryResponse({this.version, this.channelId});
  factory MsgChannelOpenTryResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelOpenTryResponse(
        version: decode.getField(1), channelId: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"version": version, "channel_id": channelId};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgChannelOpenTryResponse;

  @override
  List get values => [version, channelId];
}
