import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/query/query_class_by_query_string_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryClassByQueryStringRequest is the request type for the Query/Class RPC method
/// Since: nft v0.1.1
class QueryNFTClassByQueryStringRequest extends CosmosMessage
    with QueryMessage<QueryNFTClassByQueryStringResponse> {
  /// class_id associated with the NFT.
  final String classId;

  const QueryNFTClassByQueryStringRequest({required this.classId});
  factory QueryNFTClassByQueryStringRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTClassByQueryStringRequest(classId: decode.getField(1));
  }

  @override
  Map<String, dynamic> toJson() {
    return {'class_id': classId};
  }

  @override
  List<int> get fieldIds => [1];

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTClassByQueryStringRequest;

  @override
  List get values => [classId];

  @override
  QueryNFTClassByQueryStringResponse onResponse(List<int> bytes) {
    return QueryNFTClassByQueryStringResponse.deserialize(bytes);
  }

  @override
  QueryNFTClassByQueryStringResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryNFTClassByQueryStringResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => {'class_id': classId};
}
