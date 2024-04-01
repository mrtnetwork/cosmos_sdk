import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/messages/msg_data.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// TxMsgData defines a list of MsgData. A transaction will have a MsgData object for each message.
class TxMsgData extends CosmosMessage {
  /// data field is deprecated and not populated.
  final MsgData? data;

  /// msg_responses contains the Msg handler responses packed into Anys.
  ///
  /// Since: cosmos-sdk 0.46
  final Any msgResponses;
  const TxMsgData({this.data, required this.msgResponses});
  factory TxMsgData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return TxMsgData(
      data: decode
          .getResult(1)
          ?.to<MsgData, List<int>>((e) => MsgData.deserialize(e)),
      msgResponses: Any.deserialize(decode.getField(2)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"data": data?.toJson(), "msg_responses": msgResponses.toJson()};
  }

  @override
  String get typeUrl => BaseAbciV1beta1.txMsgData.typeUrl;

  @override
  List get values => [data, msgResponses];
}
