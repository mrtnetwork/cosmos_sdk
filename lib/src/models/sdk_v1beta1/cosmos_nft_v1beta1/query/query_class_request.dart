import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/query/query_class_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryClassRequest is the request type for the Query/Class RPC method
class QueryNFTClassRequest extends CosmosMessage
    with QueryMessage<QueryNFTClassResponse> {
  /// class_id associated with the NFT.
  final String classId;

  const QueryNFTClassRequest({required this.classId});
  factory QueryNFTClassRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTClassRequest(classId: decode.getField(1));
  }

  @override
  Map<String, dynamic> toJson() {
    return {'class_id': classId};
  }

  @override
  List<int> get fieldIds => [1];

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTClassRequest;

  @override
  List get values => [classId];
  @override
  QueryNFTClassResponse onResponse(List<int> bytes) {
    return QueryNFTClassResponse.deserialize(bytes);
  }

  @override
  QueryNFTClassResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryNFTClassResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [classId];
}
