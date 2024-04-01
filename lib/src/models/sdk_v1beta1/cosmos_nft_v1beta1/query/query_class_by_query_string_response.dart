import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/messages/class.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryClassByQueryStringResponse is the response type for the Query/Class RPC method
/// Since: nft v0.1.1
class QueryNFTClassByQueryStringResponse extends CosmosMessage {
  /// class defines the class of the nft type.
  final NFTClass? nftClass;
  const QueryNFTClassByQueryStringResponse({this.nftClass});
  factory QueryNFTClassByQueryStringResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTClassByQueryStringResponse(
        nftClass: decode
            .getResult(1)
            ?.to<NFTClass, List<int>>((e) => NFTClass.deserialize(e)));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"class": nftClass?.toJson()};
  }

  @override
  String get typeUrl =>
      NFTV1beta1Types.queryNFTClassByQueryStringResponse.typeUrl;

  @override
  List get values => [nftClass];
}
