import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/messages/nft.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryNFTResponse is the response type for the Query/NFT RPC method
/// Since: nft v0.1.1
class QueryNFTByQueryStringResponse extends CosmosMessage {
  //. owner is the owner address of the nft
  final NFT? nft;

  const QueryNFTByQueryStringResponse({this.nft});
  factory QueryNFTByQueryStringResponse.fromJson(Map<String, dynamic> json) {
    return QueryNFTByQueryStringResponse(
      nft: json["nft"] == null ? null : NFT.fromJson(json["nft"]),
    );
  }
  factory QueryNFTByQueryStringResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTByQueryStringResponse(
      nft: decode.getResult(1)?.to<NFT, List<int>>((e) => NFT.deserialize(e)),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'nft': nft?.toJson()};
  }

  @override
  List<int> get fieldIds => [1];

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTByQueryStringResponse;

  @override
  List get values => [nft];
}
