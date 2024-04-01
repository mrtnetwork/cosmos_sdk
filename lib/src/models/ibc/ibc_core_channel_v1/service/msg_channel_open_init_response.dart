import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgChannelOpenInitResponse defines the Msg/ChannelOpenInit response type.
class MsgChannelOpenInitResponse extends CosmosMessage {
  final String? channelId;
  final String? version;
  const MsgChannelOpenInitResponse({this.channelId, this.version});
  factory MsgChannelOpenInitResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelOpenInitResponse(
        channelId: decode.getField(1), version: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"channel_id": channelId, "version": version};
  }

  @override
  String get typeUrl => IbcTypes.msgChannelOpenInitResponse.typeUrl;

  @override
  List get values => [channelId, version];
}
