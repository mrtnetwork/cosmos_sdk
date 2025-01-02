import 'package:cosmos_sdk/src/models/ibc/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// MsgTransferResponse defines the Msg/Transfer response type.
class MsgTransferResponse extends CosmosMessage {
  /// sequence number of the transfer packet sent
  final BigInt? sequence;
  const MsgTransferResponse({this.sequence});
  factory MsgTransferResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgTransferResponse(sequence: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"sequence": sequence?.toString()};
  }

  @override
  TypeUrl get typeUrl => IbcTypes.msgTransferResponse;

  @override
  List get values => [sequence];
}
