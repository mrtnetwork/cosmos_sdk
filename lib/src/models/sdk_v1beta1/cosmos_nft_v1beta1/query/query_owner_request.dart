import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/query/query_owner_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryOwnerRequest is the request type for the Query/Owner RPC method
class QueryNFTOwnerRequest extends CosmosMessage
    with QueryMessage<QueryNFTOwnerResponse> {
  /// class_id associated with the nft.
  final String classId;

  /// id is a unique identifier of the NFT.
  final String id;

  QueryNFTOwnerRequest({required this.classId, required this.id});

  factory QueryNFTOwnerRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTOwnerRequest(
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
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTOwnerRequest;

  @override
  List get values => [classId, id];

  @override
  QueryNFTOwnerResponse onResponse(List<int> bytes) {
    return QueryNFTOwnerResponse.deserialize(bytes);
  }

  @override
  QueryNFTOwnerResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryNFTOwnerResponse.fromJson(json);
  }

  @override
  List<String> get pathParameters => [classId, id];
}
