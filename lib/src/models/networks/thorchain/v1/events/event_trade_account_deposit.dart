import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventTradeAccountDeposit extends CosmosMessage {
  final BigInt amount;
  final ThorchainAsset asset;
  final String? assetAddress;
  final String? runeAddress;
  final String? txId;
  const ThorchainEventTradeAccountDeposit(
      {required this.amount,
      required this.asset,
      this.assetAddress,
      this.runeAddress,
      this.txId});
  factory ThorchainEventTradeAccountDeposit.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventTradeAccountDeposit(
        amount: BigInt.parse(decode.getField(1)),
        asset: ThorchainAsset.deserialize(decode.getField(2)),
        assetAddress: decode.getField(3),
        runeAddress: decode.getField(4),
        txId: decode.getField(5));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5];

  @override
  Map<String, dynamic> toJson() {
    return {
      "amount": amount.toString(),
      "asset": asset.toJson(),
      "asset_address": assetAddress,
      "rune_address": runeAddress,
      "tx_id": txId
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventTradeAccountDeposit;

  @override
  List get values =>
      [amount.toString(), asset, assetAddress, runeAddress, txId];
}
