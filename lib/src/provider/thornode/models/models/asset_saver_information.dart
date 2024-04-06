class AssetSaverPositionResponse {
  final String asset;
  final String assetAddress;
  final int lastAddHeight;
  final int? lastWithdrawHeight;
  final String units;
  final String assetDepositValue;
  final String assetRedeemValue;
  final double growthPct;

  const AssetSaverPositionResponse({
    required this.asset,
    required this.assetAddress,
    required this.lastAddHeight,
    required this.lastWithdrawHeight,
    required this.units,
    required this.assetDepositValue,
    required this.assetRedeemValue,
    required this.growthPct,
  });

  factory AssetSaverPositionResponse.fromJson(Map<String, dynamic> json) {
    return AssetSaverPositionResponse(
      asset: json['asset'],
      assetAddress: json['asset_address'],
      lastAddHeight: json['last_add_height'],
      lastWithdrawHeight: json['last_withdraw_height'],
      units: json['units'],
      assetDepositValue: json['asset_deposit_value'],
      assetRedeemValue: json['asset_redeem_value'],
      growthPct: double.parse(json['growth_pct']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'asset': asset,
      'asset_address': assetAddress,
      'last_add_height': lastAddHeight,
      'last_withdraw_height': lastWithdrawHeight,
      'units': units,
      'asset_deposit_value': assetDepositValue,
      'asset_redeem_value': assetRedeemValue,
      'growth_pct': growthPct.toString(),
    };
  }
}
