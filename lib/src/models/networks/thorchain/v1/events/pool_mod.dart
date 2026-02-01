import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainPoolMode extends CosmosMessage {
  final ThorchainAsset asset;
  final BigInt runeAmt;
  final bool? runeAdd;
  final BigInt assetAmt;
  final bool? assetAdd;
  const ThorchainPoolMode({
    required this.asset,
    required this.runeAmt,
    this.runeAdd,
    required this.assetAmt,
    this.assetAdd,
  });
  factory ThorchainPoolMode.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainPoolMode(
      asset: ThorchainAsset.deserialize(decode.getField(1)),
      runeAmt: BigintUtils.parse(decode.getField<String>(2)),
      runeAdd: decode.getField(3),
      assetAmt: BigintUtils.parse(decode.getField<String>(4)),
      assetAdd: decode.getField(5),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "asset": asset.toJson(),
      "rune_amt": runeAmt.toString(),
      "rune_add": runeAdd,
      "asset_amt": assetAmt.toString(),
      "asset_add": assetAdd,
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.poolMod;

  @override
  List get values => [
    asset,
    runeAmt.toString(),
    runeAdd,
    assetAmt.toString(),
    assetAdd,
  ];
}
