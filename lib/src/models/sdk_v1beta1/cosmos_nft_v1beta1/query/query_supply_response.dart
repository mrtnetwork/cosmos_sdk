import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QuerySupplyResponse is the response type for the Query/Supply RPC method
class QueryNFTSupplyResponse extends CosmosMessage {
  /// amount is the number of all NFTs from the given class
  final BigInt? amount;
  const QueryNFTSupplyResponse({this.amount});
  factory QueryNFTSupplyResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTSupplyResponse(amount: decode.getField(1));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amount": amount?.toString()};
  }

  @override
  String get typeUrl => NFTV1beta1Types.queryNFTSupplyResponse.typeUrl;

  @override
  List get values => [amount];
}
