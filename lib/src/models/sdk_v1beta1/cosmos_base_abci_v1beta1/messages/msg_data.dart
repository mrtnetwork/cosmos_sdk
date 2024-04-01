import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_abci_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgData defines the data returned in a Result object during message execution.
/// deprecated
class MsgData extends CosmosMessage {
  final String msgType;
  final List<int> data;
  MsgData({required this.msgType, required List<int> data})
      : data = BytesUtils.toBytes(data, unmodifiable: true);
  factory MsgData.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgData(msgType: decode.getField(1), data: decode.getField(2));
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {"msg_type": msgType, "data": BytesUtils.toHexString(data)};
  }

  @override
  String get typeUrl => BaseAbciV1beta1.msgData.typeUrl;

  @override
  List get values => [msgType, data];
}
