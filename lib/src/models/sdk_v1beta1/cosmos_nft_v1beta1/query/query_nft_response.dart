import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/messages/nft.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryNFTResponse is the response type for the Query/NFT RPC method
class QueryNFTResponse extends CosmosMessage {
  /// owner is the owner address of the nft
  final NFT? nft;

  const QueryNFTResponse({this.nft});
  factory QueryNFTResponse.fromJson(Map<String, dynamic> json) {
    return QueryNFTResponse(
      nft: json["nft"] == null ? null : NFT.fromJson(json["nft"]),
    );
  }
  factory QueryNFTResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTResponse(
      nft: decode.getResult(1)?.to<NFT, List<int>>((e) => NFT.deserialize(e)),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'owner': nft?.toJson()};
  }

  @override
  List<int> get fieldIds => [1];

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTResponse;

  @override
  List get values => [nft];
}
