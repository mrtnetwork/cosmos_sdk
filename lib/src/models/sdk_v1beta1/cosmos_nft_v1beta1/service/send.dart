import 'package:cosmos_sdk/src/address/address.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/core/service.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/models/global_messages/service_empty_response.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

/// Send defines a method to send a nft from one account to another account.
class MsgNFTSend extends NFTV1Beta1Service<EmptyServiceRequestResponse> {
  /// class_id defines the unique identifier of the nft classification, similar to the contract address of ERC721
  final String? classId;

  /// id defines the unique identification of nft
  final String? id;

  /// sender is the address of the owner of nft
  final CosmosBaseAddress? sender;

  /// receiver is the receiver address of nft
  final CosmosBaseAddress? receiver;

  const MsgNFTSend({this.classId, this.id, this.sender, this.receiver});
  factory MsgNFTSend.fromJson(Map<String, dynamic> json) {
    return MsgNFTSend(
        classId: json.as("class_id"),
        id: json.as("id"),
        receiver: json.asAddress("receiver"),
        sender: json.asAddress("sender"));
  }
  factory MsgNFTSend.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return MsgNFTSend(
        classId: decode.getField(1),
        id: decode.getField(2),
        receiver: decode
            .getResult(3)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)),
        sender: decode
            .getResult(4)
            ?.to<CosmosBaseAddress, String>((e) => CosmosBaseAddress(e)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'class_id': classId,
      'id': id,
      'sender': sender?.address,
      'receiver': receiver?.address
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

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
