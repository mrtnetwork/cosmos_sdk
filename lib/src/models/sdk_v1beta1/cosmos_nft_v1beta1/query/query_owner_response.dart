import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryOwnerResponse is the response type for the Query/Owner RPC method
class QueryNFTOwnerResponse extends CosmosMessage {
  /// owner is the owner address of the nft
  final String? owner;
  const QueryNFTOwnerResponse({this.owner});
  factory QueryNFTOwnerResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTOwnerResponse(owner: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"owner": owner};
  }

  @override
  String get typeUrl => NFTV1beta1Types.queryNFTOwnerResponse.typeUrl;

  @override
  List get values => [owner];
}
