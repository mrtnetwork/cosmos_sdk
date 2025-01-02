import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryBalanceByQueryStringResponse is the response type for the Query/Balance RPC method
class QueryNFTBalanceByQueryStringResponse extends CosmosMessage {
  /// amount is the number of all NFTs of a given class owned by the owner
  final BigInt? amount;
  const QueryNFTBalanceByQueryStringResponse({this.amount});
  factory QueryNFTBalanceByQueryStringResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTBalanceByQueryStringResponse(amount: decode.getField(1));
  }
  factory QueryNFTBalanceByQueryStringResponse.fromRpc(
      Map<String, dynamic> json) {
    return QueryNFTBalanceByQueryStringResponse(
        amount: BigintUtils.tryParse(json["amount"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amount": amount?.toString()};
  }

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTBalanceByQueryStringResponse;

  @override
  List get values => [amount];
}
