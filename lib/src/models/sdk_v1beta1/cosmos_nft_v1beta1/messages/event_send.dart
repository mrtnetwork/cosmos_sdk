import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventSend is emitted on Msg/Send
class EventSend extends CosmosMessage {
  /// Class ID associated with the NFT.
  final String? classId;

  /// Unique identifier of the NFT.
  final String? id;

  /// sender is the address of the owner of nft
  final String? sender;

  /// receiver is the receiver address of nft
  final String? receiver;

  const EventSend({this.classId, this.id, this.sender, this.receiver});
  factory EventSend.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EventSend(
        classId: decode.getField(1),
        id: decode.getField(2),
        sender: decode.getField(3),
        receiver: decode.getField(4));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'class_id': classId,
      'id': id,
      'sender': sender,
      'receiver': receiver
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  String get typeUrl => NFTV1beta1Types.eventSend.typeUrl;

  @override
  List get values => [classId, id, sender, receiver];
}
