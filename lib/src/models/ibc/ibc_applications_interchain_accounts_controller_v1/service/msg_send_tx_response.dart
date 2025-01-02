import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgSendTxResponse defines the response for MsgSendTx
class MsgSendTxResponse extends CosmosMessage {
  final BigInt? sequence;
  const MsgSendTxResponse({this.sequence});
  factory MsgSendTxResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgSendTxResponse(sequence: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"sequence": sequence?.toString()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgSendTxResponse;

  @override
  List get values => [sequence];
}
