import 'package:blockchain_utils/utils/numbers/utils/bigint_utils.dart';
import 'package:cosmos_sdk/src/models/sdk_v1beta1/cosmos_nft_v1beta1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

/// QueryBalanceResponse is the response type for the Query/Balance RPC method
class QueryNFTBalanceResponse extends CosmosMessage {
  /// amount is the number of all NFTs of a given class owned by the owner
  final BigInt? amount;
  const QueryNFTBalanceResponse({this.amount});
  factory QueryNFTBalanceResponse.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return QueryNFTBalanceResponse(amount: decode.getField(1));
  }

  factory QueryNFTBalanceResponse.fromJson(Map<String, dynamic> json) {
    return QueryNFTBalanceResponse(
        amount: BigintUtils.tryParse(json["amount"]));
  }

  @override
  List<int> get fieldIds => [1];

  @override
  Map<String, dynamic> toJson() {
    return {"amount": amount?.toString()};
  }

  @override
  TypeUrl get typeUrl => NFTV1beta1Types.queryNFTBalanceResponse;

  @override
  List get values => [amount];
}
