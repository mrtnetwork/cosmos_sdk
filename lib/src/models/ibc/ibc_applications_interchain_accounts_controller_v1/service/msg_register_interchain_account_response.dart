import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgRegisterInterchainAccountResponse defines the response for Msg/RegisterAccount
class MsgRegisterInterchainAccountResponse extends CosmosMessage {
  final String? channelId;
  final String? portId;
  const MsgRegisterInterchainAccountResponse({this.channelId, this.portId});
  factory MsgRegisterInterchainAccountResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgRegisterInterchainAccountResponse(
        channelId: decode.getField(1), portId: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"channel_id": channelId, "port_id": portId};
  }

  @override
  String get typeUrl => IbcTypes.msgRegisterInterchainAccountResponse.typeUrl;

  @override
  List get values => [channelId, portId];
}
