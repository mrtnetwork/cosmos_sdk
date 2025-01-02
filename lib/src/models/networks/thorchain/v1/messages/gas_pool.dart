import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainGasPool extends CosmosMessage {
  final ThorchainAsset asset;
  final BigInt runeAmt;
  final BigInt assetAmt;
  final BigInt? count;
  const ThorchainGasPool(
      {required this.asset,
      required this.runeAmt,
      required this.assetAmt,
      this.count});
  factory ThorchainGasPool.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainGasPool(
        asset: ThorchainAsset.deserialize(decode.getField(1)),
        runeAmt: BigInt.parse(decode.getField(2)),
        assetAmt: BigInt.parse(decode.getField(3)),
        count: decode.getField(4));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4];

  @override
  Map<String, dynamic> toJson() {
    return {
      "asset": asset.toJson(),
      "rune_amt": runeAmt.toString(),
      "asset_amt": assetAmt.toString(),
      "count": count?.toString()
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.gasPool;

  @override
  List get values => [asset, runeAmt.toString(), assetAmt.toString(), count];
}
