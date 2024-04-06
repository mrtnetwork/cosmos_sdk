import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_base_query_v1beta1/messages/page_response.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/messages/class.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryClassesResponse is the response type for the Query/Classes RPC method
class QueryClassesResponse extends CosmosMessage {
  /// class defines the class of the nft type.
  final List<NFTClass> classes;

  /// pagination defines the pagination in the response.
  final PageResponse? pagination;
  const QueryClassesResponse({required this.classes, this.pagination});
  factory QueryClassesResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryClassesResponse(
        classes:
            decode.getFields(1).map((e) => NFTClass.deserialize(e)).toList(),
        pagination: decode
            .getResult(2)
            ?.to<PageResponse, List<int>>((e) => PageResponse.deserialize(e)));
  }
  @override
  List<int> get fieldIds => [1, 2];

  @override
  Map<String, dynamic> toJson() {
    return {
      "classes": classes.map((e) => e.toJson()).toList(),
      "pagination": pagination.toString()
    };
  }

  @override
  String get typeUrl => NFTV1beta1Types.queryNFTClassesResponse.typeUrl;

  @override
  List get values => [classes, pagination];
}
