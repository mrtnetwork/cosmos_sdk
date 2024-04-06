import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/asset.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/tx.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgAddLiquidity extends CosmosMessage {
  final ThorchainTx tx;
  final ThorchainAsset asset;
  final BigInt assetAmount;
  final BigInt runeAmount;
  final String? runeAddress;
  final String? assetAddress;
  final String? affiliateAddress;
  final String affiliateBasisPoints;
  final List<int>? signer;
  ThorchainMsgAddLiquidity(
      {required this.tx,
      required this.asset,
      required this.assetAmount,
      required this.runeAmount,
      this.runeAddress,
      this.assetAddress,
      this.affiliateAddress,
      required this.affiliateBasisPoints,
      List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer);
  factory ThorchainMsgAddLiquidity.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgAddLiquidity(
        tx: ThorchainTx.deserialize(decode.getField(1)),
        asset: ThorchainAsset.deserialize(decode.getField(2)),
        assetAmount: BigintUtils.parse(decode.getField<String>(3)),
        runeAmount: BigintUtils.parse(decode.getField<String>(4)),
        runeAddress: decode.getField(5),
        assetAddress: decode.getField(6),
        affiliateAddress: decode.getField(7),
        affiliateBasisPoints: decode.getField(8),
        signer: decode.getField(9));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx": tx.toJson(),
      "asset": asset.toJson(),
      "asset_amount": assetAmount.toString(),
      "rune_amount": runeAmount.toString(),
      "rune_address": runeAddress,
      "asset_address": assetAddress,
      "affiliate_address": affiliateAddress,
      "affiliate_basis_points": affiliateBasisPoints,
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgAddLiquidity.typeUrl;

  @override
  List get values => [
        tx,
        asset,
        assetAmount.toString(),
        runeAmount.toString(),
        runeAddress,
        assetAddress,
        affiliateAddress,
        affiliateBasisPoints,
        signer
      ];
}
