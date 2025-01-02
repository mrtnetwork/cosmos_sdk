import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/messages/class.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryClassResponse is the response type for the Query/Class RPC method
class QueryNFTClassResponse extends CosmosMessage {
  /// class defines the class of the nft type.
  final NFTClass? nftClass;
  const QueryNFTClassResponse({this.nftClass});
  factory QueryNFTClassResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTClassResponse(
        nftClass: decode
            .getResult(1)
            ?.to<NFTClass, List<int>>((e) => NFTClass.deserialize(e)));
  }
  factory QueryNFTClassResponse.fromRpc(Map<String, dynamic> json) {
    return QueryNFTClassResponse(
        nftClass:
            json["class"] == null ? null : NFTClass.fromRpc(json["class"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"class": nftClass?.toJson()};
  }

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTClassResponse;

  @override
  List get values => [nftClass];
}
