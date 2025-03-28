import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_request.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/query/query_classes_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryClassesRequest is the request type for the Query/Classes RPC method
class QueryClassesRequest extends CosmosMessage
    with QueryMessage<QueryClassesResponse> {
  /// pagination defines an optional pagination for the request
  final PageRequest? pagination;
  const QueryClassesRequest({this.pagination});
  factory QueryClassesRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryClassesRequest(
        pagination: decode
            .getResult(1)
            ?.to<PageRequest, List<int>>((e) => PageRequest.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"pagination": pagination?.toJson()};
  }

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTClassesRequest;

  @override
  List get values => [pagination];
  @override
  QueryClassesResponse onResponse(List<int> bytes) {
    return QueryClassesResponse.deserialize(bytes);
  }

  @override
  QueryClassesResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryClassesResponse.fromJson(json);
  }

  @override
  Map<String, String?> get queryParameters => pagination?.queryParameters ?? {};
}
