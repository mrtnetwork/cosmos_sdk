import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

import 'query_owner_by_query_string_response.dart';

/// QueryOwnerByQueryStringRequest is the request type for the Query/Owner RPC method
/// Since: nft v0.1.1
class QueryOwnerByQueryStringRequest extends CosmosMessage
    with QueryMessage<QueryOwnerByQueryStringResponse> {
  /// class_id associated with the nft.
  final String? classId;

  /// id is a unique identifier of the NFT.
  final String? id;

  QueryOwnerByQueryStringRequest({this.classId, this.id});

  factory QueryOwnerByQueryStringRequest.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryOwnerByQueryStringRequest(
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
  String get queryPath => NFTV1beta1Types.nftOwnerByQueryString.typeUrl;

  @override
  String get typeUrl =>
      NFTV1beta1Types.queryNFTOwnerByQueryStringRequest.typeUrl;

  @override
  List get values => [classId, id];
  @override
  QueryOwnerByQueryStringResponse onResponse(List<int> bytes) {
    return QueryOwnerByQueryStringResponse.deserialize(bytes);
  }
}
