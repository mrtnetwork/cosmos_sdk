import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';

class ThorchainLiquidityProvider extends CosmosMessage {
  final ThorchainAsset asset;
  final String? runeAddress;
  final String? assetAddress;
  final BigInt? lastAddHeight;
  final BigInt? lastWithdrawHeight;
  final BigInt units;
  final BigInt pendingRune;
  final BigInt pendingAsset;
  final String? pendingTxId;
  final BigInt? runeDepositValue;
  final BigInt? assetDepositValue;
  ThorchainLiquidityProvider({
    required this.asset,
    this.runeAddress,
    this.assetAddress,
    this.lastAddHeight,
    this.lastWithdrawHeight,
    required this.units,
    required this.pendingRune,
    required this.pendingAsset,
    this.pendingTxId,
    this.runeDepositValue,
    this.assetDepositValue,
  });
  factory ThorchainLiquidityProvider.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainLiquidityProvider(
      asset: ThorchainAsset.deserialize(decode.getField(1)),
      runeAddress: decode.getField(2),
      assetAddress: decode.getField(3),
      lastAddHeight: decode.getField(4),
      lastWithdrawHeight: decode.getField(5),
      units: BigInt.parse(decode.getField(6)),
      pendingRune: BigInt.parse(decode.getField(7)),
      pendingAsset: BigInt.parse(decode.getField(8)),
      pendingTxId: decode.getField(9),
      runeDepositValue: BigInt.parse(decode.getField(10)),
      assetDepositValue: BigInt.parse(decode.getField(11)),
    );
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

  @override
  Map<String, dynamic> toJson() {
    return {
      "asset": asset.toJson(),
      "rune_address": runeAddress,
      "asset_address": assetAddress,
      "last_add_height": lastAddHeight?.toString(),
      "last_withdraw_height": lastWithdrawHeight?.toString(),
      "units": units.toString(),
      "pending_rune": pendingRune.toString(),
      "pending_asset": pendingAsset.toString(),
      "pending_tx_Id": pendingTxId,
      "rune_deposit_value": runeDepositValue?.toString(),
      "asset_deposit_value": assetDepositValue?.toString(),
    };
  }

  @override
  TypeUrl get typeUrl => ThorchainV1Types.liquidityProvider;

  @override
  List get values => [
    asset,
    runeAddress,
    assetAddress,
    lastAddHeight,
    lastWithdrawHeight,
    units.toString(),
    pendingRune.toString(),
    pendingAsset.toString(),
    pendingTxId,
    runeDepositValue?.toString(),
    assetDepositValue?.toString(),
  ];
}
