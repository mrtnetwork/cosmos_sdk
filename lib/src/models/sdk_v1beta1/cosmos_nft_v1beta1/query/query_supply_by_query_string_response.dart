import 'package:blockchain_utils/utils/numbers/numbers.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QuerySupplyByQueryStringResponse is the response type for the Query/Supply RPC method
class QueryNFTSupplyByQueryStringResponse extends CosmosMessage {
  /// amount is the number of all NFTs from the given class
  final BigInt? amount;
  const QueryNFTSupplyByQueryStringResponse({this.amount});
  factory QueryNFTSupplyByQueryStringResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTSupplyByQueryStringResponse(amount: decode.getField(1));
  }
  factory QueryNFTSupplyByQueryStringResponse.fromJson(
      Map<String, dynamic> json) {
    return QueryNFTSupplyByQueryStringResponse(
        amount: BigintUtils.tryParse(json["amount"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amount": amount?.toString()};
  }

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTSupplyByQueryStringResponse;

  @override
  List get values => [amount];
}
