import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/query/query_balance_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryBalanceRequest is the request type for the Query/Balance RPC method
class QueryNFTBalanceRequest extends CosmosMessage
    with QueryMessage<QueryNFTBalanceResponse> {
  /// class_id associated with the nft.
  final String classId;

  /// owner is the owner address of the nft.
  final String owner;

  QueryNFTBalanceRequest({required this.classId, required this.owner});

  factory QueryNFTBalanceRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTBalanceRequest(
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
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTBalanceRequest;

  @override
  List get values => [classId, owner];
  @override
  QueryNFTBalanceResponse onResponse(List<int> bytes) {
    return QueryNFTBalanceResponse.deserialize(bytes);
  }

  @override
  QueryNFTBalanceResponse onJsonResponse(Map<String, dynamic> json) {
    return QueryNFTBalanceResponse.fromRpc(json);
  }

  @override
  List<String> get pathParameters => [owner, classId];
}
