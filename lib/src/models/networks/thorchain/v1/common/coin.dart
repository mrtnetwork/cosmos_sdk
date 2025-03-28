import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/asset.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick.dart';

class ThorchainCoin extends CosmosMessage {
  final ThorchainAsset asset;
  final BigInt amount;
  final BigInt? decimals;
  const ThorchainCoin(
      {required this.asset, required this.amount, this.decimals});
  factory ThorchainCoin.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainCoin(
        asset: ThorchainAsset.deserialize(decode.getField(1)),
        amount: BigintUtils.parse(decode.getField<String>(2)),
        decimals: decode.getField(3));
  }
  factory ThorchainCoin.fromJson(Map<String, dynamic> json) {
    return ThorchainCoin(
        asset: ThorchainAsset.fromJson(json.asMap("asset")),
        amount: json.asBigInt("amount"),
        decimals: json.asBigInt("decimals"));
  }

  @override
  List<int> get fieldIds => [1, 2, 3];

  @override
  Map<String, dynamic> toJson() {
    return {
      "asset": asset.toJson(),
      "amount": amount.toString(),
      "decimals": decimals?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.coin;

  @override
  List get values => [asset, amount.toString(), decimals];
}
