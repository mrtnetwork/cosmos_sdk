import 'package:cosmos_sdk/src/models/ibc/core/service.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// MsgChannelCloseInit defines a msg sent by a
/// Relayer to Chain A to close a channel with Chain B.
class MsgChannelCloseInit extends IbcService<EmptyServiceRequestResponse> {
  final String? portId;
  final String? channelId;
  final String? signer;
  const MsgChannelCloseInit({this.portId, this.channelId, this.signer});
  factory MsgChannelCloseInit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelCloseInit(
      portId: decode.getField(1),
      channelId: decode.getField(2),
      signer: decode.getField(3),
    );
  }
  factory MsgChannelCloseInit.fromJson(Map<String, dynamic> json) {
    return MsgChannelCloseInit(
      portId: json.as("port_id"),
      channelId: json.as("channel_id"),
      signer: json.as("signer"),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {"port_id": portId, "channel_id": channelId, "signer": signer};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgChannelCloseInit;

  @override
  List get values => [portId, channelId, signer];

  @override
  List<String?> get signers => [signer];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(IbcTypes.msgChannelCloseInitResponse);
  }
}
