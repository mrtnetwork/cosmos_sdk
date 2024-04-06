import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventAddLiquidity extends CosmosMessage {
  final ThorchainAsset pool;
  final BigInt providerUnits;
  final String? runeAddress;
  final BigInt runeAmount;
  final BigInt assetAmount;
  final String? runeTxId;
  final String? assetTxId;
  final String? assetAddress;
  const ThorchainEventAddLiquidity(
      {required this.pool,
      required this.providerUnits,
      this.runeAddress,
      required this.runeAmount,
      required this.assetAmount,
      this.runeTxId,
      this.assetTxId,
      this.assetAddress});
  factory ThorchainEventAddLiquidity.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventAddLiquidity(
        pool: ThorchainAsset.deserialize(decode.getField(1)),
        providerUnits: BigInt.parse(decode.getField(2)),
        runeAddress: decode.getField(3),
        runeAmount: BigInt.parse(decode.getField(4)),
        assetAmount: BigInt.parse(decode.getField(5)),
        runeTxId: decode.getField(6),
        assetTxId: decode.getField(7),
        assetAddress: decode.getField(8));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool": pool.toJson(),
      "provider_units": providerUnits.toString(),
      "rune_address": runeAddress,
      "rune_amount": runeAmount.toString(),
      "asset_amount": assetAmount.toString(),
      "rune_tx_id": runeTxId,
      "asset_tx_id": assetTxId,
      "asset_address": assetAddress
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.eventAddLiquidity.typeUrl;

  @override
  List get values => [
        pool,
        providerUnits.toString(),
        runeAddress,
        runeAmount.toString(),
        assetAmount.toString(),
        runeTxId,
        assetTxId,
        assetAddress
      ];
}
