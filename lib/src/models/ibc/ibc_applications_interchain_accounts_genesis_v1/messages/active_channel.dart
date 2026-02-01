import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// ActiveChannel contains a connection ID, port ID and associated active channel ID,
/// as well as a boolean flag to indicate if the channel is middleware enabled
class ActiveChannel extends CosmosMessage {
  final String? connectionId;
  final String? portId;
  final String? channelId;
  final bool? isMiddlewareEnabled;
  const ActiveChannel({
    this.connectionId,
    this.portId,
    this.channelId,
    this.isMiddlewareEnabled,
  });
  factory ActiveChannel.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ActiveChannel(
      connectionId: decode.getField(1),
      portId: decode.getField(2),
      channelId: decode.getField(3),
      isMiddlewareEnabled: decode.getField(4),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "connection_id": connectionId,
      "port_id": portId,
      "channel_id": channelId,
      "is_middleware_enabled": isMiddlewareEnabled,
    };
  }

  @override
  TypeUrl get typeUrl => IbcTypes.activeChannel;

  @override
  List get values => [channelId, portId, channelId, isMiddlewareEnabled];
}
