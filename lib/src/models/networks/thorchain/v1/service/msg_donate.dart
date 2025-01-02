import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/asset.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/tx.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgDonate extends CosmosMessage {
  final ThorchainAsset asset;
  final BigInt assetAmount;
  final BigInt runeAmount;
  final ThorchainTx tx;
  final List<int>? signer;
  ThorchainMsgDonate(
      {required this.asset,
      required this.assetAmount,
      required this.runeAmount,
      required this.tx,
      List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgDonate.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgDonate(
        asset: ThorchainAsset.deserialize(decode.getField(1)),
        assetAmount: BigintUtils.parse(decode.getField<String>(2)),
        runeAmount: BigintUtils.parse(decode.getField<String>(3)),
        tx: ThorchainTx.deserialize(decode.getField(4)),
        signer: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "asset": asset.toJson(),
      "asset_amount": assetAmount.toString(),
      "rune_amount": runeAmount.toString(),
      "tx": tx.toJson(),
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.msgDonate;

  @override
  List get values =>
      [asset, assetAmount.toString(), runeAmount.toString(), tx, signer];
}
