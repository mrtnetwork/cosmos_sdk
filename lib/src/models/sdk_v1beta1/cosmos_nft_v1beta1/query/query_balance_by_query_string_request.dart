import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/query/query_balance_by_query_string_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';

import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryBalanceByQueryStringRequest is the request type for the Query/Balance RPC method
/// Since: nft v0.1.1
class QueryNFTBalanceByQueryStringRequest extends CosmosMessage
    with QueryMessage<QueryNFTBalanceByQueryStringResponse> {
  /// class_id associated with the nft.
  final String classId;

  /// owner is the owner address of the nft.
  final String owner;

  const QueryNFTBalanceByQueryStringRequest(
      {required this.classId, required this.owner});
  factory QueryNFTBalanceByQueryStringRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTBalanceByQueryStringRequest(
        classId: decode.getField(1), owner: decode.getField(2));
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'class_id': classId,
      'owner': owner,
    };
  }

  @override
  List<int> get fieldIds => [1, 2];

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTBalanceByQueryStringRequest;

  @override
  List get values => [classId, owner];
  @override
  QueryNFTBalanceByQueryStringResponse onResponse(List<int> bytes) {
    return QueryNFTBalanceByQueryStringResponse.deserialize(bytes);
  }

  @override
  QueryNFTBalanceByQueryStringResponse onJsonResponse(
      Map<String, dynamic> json) {
    return QueryNFTBalanceByQueryStringResponse.fromRpc(json);
  }

  @override
  Map<String, String?> get queryParameters => {
        'class_id': classId,
        'owner': owner,
      };
}
