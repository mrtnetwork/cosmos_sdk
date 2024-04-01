import 'package:cosmos_sdk/src/models/ibc/ibc_core_channel_v1/messages/response_result_type.dart';
import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgChannelUpgradeAckResponse defines MsgChannelUpgradeAck response type.
class MsgChannelUpgradeAckResponse extends CosmosMessage {
  final IbcChannelResponseResultType? result;
  const MsgChannelUpgradeAckResponse({this.result});
  factory MsgChannelUpgradeAckResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgChannelUpgradeAckResponse(
        result: decode.getResult(1)?.to<IbcChannelResponseResultType, int>(
            (e) => IbcChannelResponseResultType.fromValue(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"result": result?.value};
  }

  @override
  String get typeUrl => IbcTypes.msgChannelUpgradeAckResponse.typeUrl;

  @override
  List get values => [1];
}
