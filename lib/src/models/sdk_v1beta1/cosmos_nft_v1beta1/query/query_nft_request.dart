import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/query/query_nft_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryNFTRequest is the request type for the Query/NFT RPC method
class QueryNFTRequest extends CosmosMessage
    with QueryMessage<QueryNFTResponse> {
  /// class_id associated with the NFT.
  final String classId;

  /// id is a unique identifier of the NFT.
  final String id;

  /// Constructs a new instance of [QueryNFTRequest].
  const QueryNFTRequest({required this.classId, required this.id});
  factory QueryNFTRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTRequest(classId: decode.getField(1), id: decode.getField(2));
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
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTRequest;

  @override
  List get values => [classId, id];

  @override
  QueryNFTResponse onResponse(List<int> bytes) {
    return QueryNFTResponse.deserialize(bytes);
  }

  @override
  QueryNFTResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryNFTResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [classId, id];
}
