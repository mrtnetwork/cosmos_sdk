import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// Send defines a method to send a nft from one account to another account.
class MsgNFTSend extends CosmosMessage
    with ServiceMessage<EmptyServiceRequestResponse> {
  /// class_id defines the unique identifier of the nft classification, similar to the contract address of ERC721
  final String? classId;

  /// id defines the unique identification of nft
  final String? id;

  /// sender is the address of the owner of nft
  final CosmosBaseAddress? sender;

  /// receiver is the receiver address of nft
  final CosmosBaseAddress? receiver;

  const MsgNFTSend({
    this.classId,
    this.id,
    this.sender,
    this.receiver,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'class_id': classId,
      'id': id,
      'sender': sender?.address,
      'receiver': receiver?.address,
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  TypeUrl get service => NFTV1beta1Types.nFTSend;

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.msgNFTSend;

  @override
  List get values => [classId, id, sender?.address, receiver?.address];
  @override
  List<String?> get signers => [sender?.address];

  @override
  EmptyServiceRequestResponse onResponse(List<int> bytes) {
    return EmptyServiceRequestResponse(NFTV1beta1Types.msgNFTSendResponse);
  }
}
