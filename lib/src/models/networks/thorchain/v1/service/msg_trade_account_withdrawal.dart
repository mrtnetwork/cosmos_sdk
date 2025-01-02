import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainMsgTradeAccountWithdrawal extends CosmosMessage {
  final ThorchainTx tx;
  final ThorchainAsset asset;
  final BigInt amount;
  final String? assetAddress;
  final List<int>? signer;
  ThorchainMsgTradeAccountWithdrawal(
      {required this.tx,
      required this.asset,
      required this.amount,
      this.assetAddress,
      List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgTradeAccountWithdrawal.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgTradeAccountWithdrawal(
        tx: ThorchainTx.deserialize(decode.getField(1)),
        asset: ThorchainAsset.deserialize(decode.getField(2)),
        amount: BigintUtils.parse(decode.getField<String>(3)),
        assetAddress: decode.getField(4),
        signer: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx": tx.toJson(),
      "asset": asset.toJson(),
      "amount": amount.toString(),
      "asset_address": assetAddress,
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.msgTradeAccountWithdrawal;
  @override
  List get values => [tx, asset, amount.toString(), assetAddress, signer];
}
