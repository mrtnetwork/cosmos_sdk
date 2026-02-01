import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/messages/nft.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryNFTsResponse is the response type for the Query/NFTs RPC methods
class QueryNFTsResponse extends CosmosMessage {
  /// NFTs defines the list of NFTs.
  final List<NFT> nfts;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  factory QueryNFTsResponse.fromJson(Map<String, dynamic> json) {
    return QueryNFTsResponse(
      nfts: (json["nfts"] as List?)?.map((e) => NFT.fromJson(e)).toList() ?? [],
      pagination:
          json["pagination"] == null
              ? null
              : PageResponse.fromJson(json["pagination"]),
    );
  }
  QueryNFTsResponse({required this.nfts, this.pagination});
  factory QueryNFTsResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTsResponse(
      nfts:
          decode
              .getFields<List<int>>(1)
              .map((e) => NFT.deserialize(e))
              .toList(),
      pagination: decode
          .getResult(2)
          ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'nfts': nfts.map((nft) => nft.toJson()).toList(),
      'pagination': pagination?.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTsResponse;

  @override
  List get values => [nfts, pagination];
}
