import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainEventPendingLiquidity extends CosmosMessage {
  final ThorchainAsset pool;
  final ThorchainPendingLiquidityType? pendingType;
  final String? runeAddress;
  final BigInt runeAmount;
  final String? assetAddress;
  final BigInt assetAmount;
  final String? runeTxId;
  final String? assetTxId;
  ThorchainEventPendingLiquidity(
      {required this.pool,
      this.pendingType,
      this.runeAddress,
      required this.runeAmount,
      this.assetAddress,
      required this.assetAmount,
      this.runeTxId,
      this.assetTxId});
  factory ThorchainEventPendingLiquidity.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainEventPendingLiquidity(
        pool: ThorchainAsset.deserialize(decode.getField(1)),
        pendingType: decode
            .getResult(2)
            ?.to<ThorchainPendingLiquidityType, int>(
                (e) => ThorchainPendingLiquidityType.fromValue(e)),
        runeAddress: decode.getField(3),
        runeAmount: BigInt.parse(decode.getField(4)),
        assetAddress: decode.getField(5),
        assetAmount: BigInt.parse(decode.getField(6)),
        runeTxId: decode.getField(7),
        assetTxId: decode.getField(8));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Map<String, dynamic> toJson() {
    return {
      "pool": pool.toJson(),
      "pending_type": pendingType?.value,
      "rune_address": runeAddress,
      "rune_amount": runeAmount.toString(),
      "asset_address": assetAddress,
      "asset_amount": assetAmount.toString(),
      "rune_tx_id": runeTxId,
      "asset_tx_id": assetTxId
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.eventPendingLiquidity;

  @override
  List get values => [
        pool,
        pendingType?.value,
        runeAddress,
        runeAmount.toString(),
        assetAddress,
        assetAmount.toString(),
        runeTxId,
        assetTxId
      ];
}
