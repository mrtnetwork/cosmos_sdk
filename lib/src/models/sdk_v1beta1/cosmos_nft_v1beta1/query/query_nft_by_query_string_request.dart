import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/query/query_nft_by_query_string_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryNFTByQueryStringRequest is the request type for the Query/NFT RPC method
/// Since: nft v0.1.1
class QueryNFTByQueryStringRequest extends CosmosMessage
    with QueryMessage<QueryNFTByQueryStringResponse> {
  /// class_id associated with the NFT.
  final String? classId;

  /// id is a unique identifier of the NFT.
  final String id;

  /// Constructs a new instance of [QueryNFTByQueryStringRequest].
  const QueryNFTByQueryStringRequest({required this.classId, required this.id});
  factory QueryNFTByQueryStringRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTByQueryStringRequest(
        classId: decode.getField(1), id: decode.getField(2));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'class_id': classId,
      'id': id,
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTByQueryStringRequest;

  @override
  List get values => [classId, id];

  @override
  QueryNFTByQueryStringResponse onResponse(List<int> bytes) {
    return QueryNFTByQueryStringResponse.deserialize(bytes);
  }

  @override
  QueryNFTByQueryStringResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryNFTByQueryStringResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {
        'class_id': classId,
        'id': id,
      };
}
