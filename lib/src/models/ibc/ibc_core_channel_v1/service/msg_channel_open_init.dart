import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/channel.dart';

import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

import 'msg_channel_open_init_response.dart';

/// MsgChannelOpenInit defines an sdk.Msg to initialize a channel handshake. It is called by a relayer on Chain A.
class MsgChannelOpenInit extends IbcService<MsgChannelOpenInitResponse> {
  final String? portId;
  final IbcChannelChannel channel;
  final String? signer;
  const MsgChannelOpenInit({this.portId, required this.channel, this.signer});
  factory MsgChannelOpenInit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelOpenInit(
      portId: decode.getField(1),
      channel: IbcChannelChannel.deserialize(decode.getField(2)),
      signer: decode.getField(3),
    );
  }
  factory MsgChannelOpenInit.fromJson(Map<String, dynamic> json) {
    return MsgChannelOpenInit(
      portId: json.as("port_id"),
      channel: IbcChannelChannel.fromJson(json.asMap("channel")),
      signer: json.as("signer"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"port_id": portId, "channel": channel.toJson(), "signer": signer};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgChannelOpenInit;

  @override
  List get values => [portId, channel, signer];
  @override
  List<String?> get signers => [signer];

  @override
  MsgChannelOpenInitResponse onResponse(List<int> bytes) {
    return MsgChannelOpenInitResponse.deserialize(bytes);
  }
}
