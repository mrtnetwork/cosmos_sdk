class AssetLiquidityProviderInformationResponse {
  final String asset;
  final String runeAddress;
  final String? assetAddress;
  final int? lastAddHeight;
  final int? lastWithdrawHeight;
  final String units;
  final String pendingRune;
  final String pendingAsset;
  final String? pendingTxId;
  final String runeDepositValue;
  final String assetDepositValue;
  final String? runeRedeemValue;
  final String? assetRedeemValue;
  final String? luviDepositValue;
  final String? luviRedeemValue;
  final String? luviGrowthPct;

  const AssetLiquidityProviderInformationResponse({
    required this.asset,
    required this.runeAddress,
    required this.assetAddress,
    required this.lastAddHeight,
    required this.lastWithdrawHeight,
    required this.units,
    required this.pendingRune,
    required this.pendingAsset,
    required this.pendingTxId,
    required this.runeDepositValue,
    required this.assetDepositValue,
    required this.runeRedeemValue,
    required this.assetRedeemValue,
    required this.luviDepositValue,
    required this.luviRedeemValue,
    required this.luviGrowthPct,
  });

  factory AssetLiquidityProviderInformationResponse.fromJson(
      Map<String, dynamic> json) {
    return AssetLiquidityProviderInformationResponse(
      asset: json['asset'],
      runeAddress: json['rune_address'],
      assetAddress: json['asset_address'],
      lastAddHeight: json['last_add_height'],
      lastWithdrawHeight: json['last_withdraw_height'],
      units: json['units'],
      pendingRune: json['pending_rune'],
      pendingAsset: json['pending_asset'],
      pendingTxId: json['pending_tx_id'],
      runeDepositValue: json['rune_deposit_value'],
      assetDepositValue: json['asset_deposit_value'],
      runeRedeemValue: json['rune_redeem_value'],
      assetRedeemValue: json['asset_redeem_value'],
      luviDepositValue: json['luvi_deposit_value'],
      luviRedeemValue: json['luvi_redeem_value'],
      luviGrowthPct: json['luvi_growth_pct'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'asset': asset,
      'rune_address': runeAddress,
      'asset_address': assetAddress,
      'last_add_height': lastAddHeight,
      'last_withdraw_height': lastWithdrawHeight,
      'units': units,
      'pending_rune': pendingRune,
      'pending_asset': pendingAsset,
      'pending_tx_id': pendingTxId,
      'rune_deposit_value': runeDepositValue,
      'asset_deposit_value': assetDepositValue,
      'rune_redeem_value': runeRedeemValue,
      'asset_redeem_value': assetRedeemValue,
      'luvi_deposit_value': luviDepositValue,
      'luvi_redeem_value': luviRedeemValue,
      'luvi_growth_pct': luviGrowthPct,
    };
  }
}
