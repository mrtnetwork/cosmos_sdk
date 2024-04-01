import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// EventBurn is emitted on Burn.
class EventBurn extends CosmosMessage {
  /// Class ID associated with the NFT.
  final String? classId;

  /// Unique identifier of the NFT.
  final String? id;

  /// Owner address of the NFT.
  final String? owner;

  const EventBurn({this.classId, this.id, this.owner});
  factory EventBurn.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return EventBurn(
        classId: decode.getField(1),
        id: decode.getField(2),
        owner: decode.getField(3));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'class_id': classId,
      'id': id,
      'owner': owner,
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  String get typeUrl => NFTV1beta1Types.eventBurn.typeUrl;

  @override
  List get values => [classId, id, owner];
}
