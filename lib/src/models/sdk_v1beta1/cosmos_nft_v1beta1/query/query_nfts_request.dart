import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/query/query_nfts_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryNFTstRequest is the request type for the Query/NFTs RPC method.
class QueryNFTsRequest extends CosmosMessage
    with QueryMessage<QueryNFTsResponse> {
  /// class_id associated with the nft.
  final String? classId;

  /// owner is the owner address of the nft.
  final String? owner;

  /// pagination defines an optional pagination for the request.
  final PageRequest? pagination;

  /// Constructs a new instance of [QueryNFTsRequest].
  const QueryNFTsRequest({this.classId, this.owner, this.pagination});
  factory QueryNFTsRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTsRequest(
        classId: decode.getField(1),
        owner: decode.getField(2),
        pagination: decode
            .getResult(3)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'class_id': classId,
      'owner': owner,
      'pagination': pagination?.toJson(),
    };
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTsRequest;

  @override
  List get values => [classId, owner, pagination];

  @override
  QueryNFTsResponse onResponse(List<int> bytes) {
    return QueryNFTsResponse.deserialize(bytes);
  }

  @override
  QueryNFTsResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryNFTsResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {
        ...pagination?.queryParameters ?? {},
        'class_id': classId,
        'owner': owner,
      };
}
