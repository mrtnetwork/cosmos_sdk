import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/query/query_supply_by_query_string_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QuerySupplyByQueryStringRequest is the request type for the Query/Supply RPC method
/// Since: nft v0.1.1
class QueryNFTSupplyByQueryStringRequest extends CosmosMessage
    with QueryMessage<QueryNFTSupplyByQueryStringResponse> {
  /// class_id associated with the nft.
  final String classId;

  const QueryNFTSupplyByQueryStringRequest({required this.classId});
  factory QueryNFTSupplyByQueryStringRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTSupplyByQueryStringRequest(classId: decode.getField(1));
  }

  @override
  Map<String, dynamic> toJson() {
    return {'class_id': classId};
  }

  @override
  List<int> get fieldIds => [1];

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTSupplyByQueryStringRequest;

  @override
  List get values => [classId];

  @override
  QueryNFTSupplyByQueryStringResponse onResponse(List<int> bytes) {
    return QueryNFTSupplyByQueryStringResponse.deserialize(bytes);
  }

  @override
  QueryNFTSupplyByQueryStringResponse onJsonResponse(
      Map<String, dynamic> json) {
    return QueryNFTSupplyByQueryStringResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {'class_id': classId};
}
